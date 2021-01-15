package com.one.sugarcane.sellerinfo.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.UUID;

import javax.annotation.Resource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.portlet.ModelAndView;

import com.one.sugarcane.MD5Util.MD5Util;
import com.one.sugarcane.entity.Course;
import com.one.sugarcane.entity.PublicCourseType;
import com.one.sugarcane.entity.SellerCourseType;
import com.one.sugarcane.entity.SellerInfo;
import com.one.sugarcane.entity.SellerLogin;
import com.one.sugarcane.mailUtil.SendmailUtil;
import com.one.sugarcane.sellerinfo.service.SellerInfoServiceImpl;
import com.one.sugarcane.sellerinfo.service.SellerInfoTypeServiceImpl;



@Controller
@RequestMapping("sellerInfo")
public class SellerInfoController {
	@Resource
	private SellerInfoServiceImpl sellerInfoServiceImpl;
	@Resource
	private SellerInfoTypeServiceImpl sellerInfoTypeServiceImpl;

	/**
	 * 培训机构注册
	 * 
	 * @author 张梦洲，狗晟儿，傻崔
	 * @throws IOException
	 * @date 2018/4/30
	 */
	@RequestMapping("/save")
	public String save(HttpServletRequest request, @RequestParam String name, @RequestParam String mail,
			@RequestParam String password, @RequestParam String phone, @RequestParam String cmbProvince,
			@RequestParam String cmbCity, @RequestParam String cmbArea, @RequestParam(required = false) String brief,
			@RequestParam MultipartFile educationBureauApproved, @RequestParam MultipartFile proofOfHouse,
			@RequestParam MultipartFile fireSafetyCertificate, @RequestParam MultipartFile businessLisense)
			throws IOException {
		SellerInfo sellerInfo = new SellerInfo();
		SellerLogin sellerLogin = new SellerLogin();
		sellerInfo.setSellerName(name);
		sellerInfo.setSellerEmail(mail);
		sellerInfo.setSellerPhoneNumber(phone);
		sellerInfo.setAddress_province(cmbProvince);
		sellerInfo.setAddress_city(cmbCity);
		sellerInfo.setAddress_area(cmbArea);
		sellerInfo.setBrief(brief);
		// 存储证书
		ServletContext context = request.getServletContext();
		String realPath = context.getRealPath("/static/images");
		if (educationBureauApproved != null) {
			String filename = educationBureauApproved.getOriginalFilename();
			String suffix = filename.substring(filename.lastIndexOf("."));
			filename = name + "eba" + suffix;
			File file = new File(realPath + "/" + filename);
			sellerInfo.setEducationBureauApproved(filename);
			byte[] bytes = educationBureauApproved.getBytes();
			FileOutputStream fos = new FileOutputStream(file);
			fos.write(bytes);
			fos.flush();
			fos.close();
		}
		if (proofOfHouse != null) {
			String filename = proofOfHouse.getOriginalFilename();
			String suffix = filename.substring(filename.lastIndexOf("."));
			filename = name + "poh" + suffix;
			File file = new File(realPath + "/" + filename);
			sellerInfo.setProofOfHouse(filename);
			byte[] bytes = proofOfHouse.getBytes();
			FileOutputStream fos = new FileOutputStream(file);
			fos.write(bytes);
			fos.flush();
			fos.close();
		}
		if (fireSafetyCertificate != null) {
			String filename = fireSafetyCertificate.getOriginalFilename();
			String suffix = filename.substring(filename.lastIndexOf("."));
			filename = name + "fsc" + suffix;
			File file = new File(realPath + "/" + filename);
			sellerInfo.setFireSafetyCertificate(filename);
			byte[] bytes = fireSafetyCertificate.getBytes();
			FileOutputStream fos = new FileOutputStream(file);
			fos.write(bytes);
			fos.flush();
			fos.close();
		}
		if (businessLisense != null) {
			String filename = businessLisense.getOriginalFilename();
			String suffix = filename.substring(filename.lastIndexOf("."));
			filename = name + "bl" + suffix;
			File file = new File(realPath + "/" + filename);
			sellerInfo.setBusinessLisense(filename);
			byte[] bytes = businessLisense.getBytes();
			FileOutputStream fos = new FileOutputStream(file);
			fos.write(bytes);
			fos.flush();
			fos.close();
		}
		sellerLogin.setSellerInfo(sellerInfo);
		MD5Util md5 = new MD5Util();
		String md5PWD = md5.generate(password);
		sellerLogin.setPassword(md5PWD);
		sellerLogin.setSellerLoginName(name);
		sellerInfo.setSellerLogin(sellerLogin);
		sellerInfoServiceImpl.saveSellerInfo(sellerInfo);
		request.getSession().setAttribute("brief", sellerInfo.getBrief());
		return "organization/orgLogin";
	}

	@RequestMapping("/pass")
	public String pass(@RequestParam String name, @RequestParam String email) {

		SellerInfo sellerinfo = this.sellerInfoServiceImpl.getpass(name, email);

		String phone = sellerinfo.getSellerPhoneNumber();

		if (phone != null) {
			return "organization/dopass";
		} else {
			return "organization/passfail";
		}

	}

	@RequestMapping("/successpass")
	public String dopass() {

		return "organization/orgLogin";

	}

	@RequestMapping("/failpass")
	public String undopass() {

		return "organization/orgLogin";

	}

	@RequestMapping("/updatebrief")
	public String upbrief(@RequestParam String brief, HttpServletRequest request) throws IOException {

		SellerInfo sellerinfo = (SellerInfo) request.getSession(true).getAttribute("seller");

		System.out.println(brief);

		sellerinfo.setBrief(brief);

		sellerInfoServiceImpl.updateSellerInfo(sellerinfo);

		return "organization/manageClassify";

	}

	@RequestMapping("/forget")
	public String forget(@RequestParam String email, HttpServletRequest request) {

		String hrefString = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort()
				+ request.getServletContext().getContextPath() + "/sellerInfo/getpsd?email=" + email;
		System.out.println(hrefString);
		String href = "<a href='" + hrefString + "'>点击重置密码</a>如果链接不可用，拷贝" + hrefString + "到地址栏";
		String title = "你好，请重置密码";

		System.out.print(hrefString);
		SendmailUtil.doSendHtmlEmail(email, title, href);

		return "organization/forgetSuccess";
	}

	@RequestMapping("/getpsd")
	public String getpassword(@RequestParam String email, HttpSession session) {

		Random random = new Random();
		String randomPasswordString = random.nextInt(900000) + 100000 + "";
		session.setAttribute("newpassword", randomPasswordString);
		MD5Util md5 = new MD5Util();
		String md5PWD = md5.generate(randomPasswordString);
		sellerInfoServiceImpl.resetPassword(email, md5PWD);
		System.out.print(email + randomPasswordString);
		return "organization/getpassword";

	}

	/**
	 * temp 获取所有培训机构
	 * 
	 * @author 王孜润
	 * @date 2018/5/21
	 */
	@RequestMapping("/showOrg")
	public String showOrg(Model model) {
		List<SellerInfo> list = sellerInfoServiceImpl.showOrg();
		model.addAttribute("showOrg", list);
		return "front/home";
	}

	/**
	 * 首页获取所有培训机构
	 * 
	 * @author 王孜润
	 * @date 2018/6/11
	 */
	@RequestMapping("/findOrg")
	public String findOrg(Model model) {
		List<SellerInfo> list = sellerInfoServiceImpl.findOrg();
		model.addAttribute("findOrg", list);
		return "front/show";
	}

	/**
	 * 前台：通过id查找seller
	 * 
	 * @param page
	 * @name 王孜润
	 */
	@RequestMapping("/findSeller")
	public String findSeller(HttpSession session, Model model, SellerInfo sellerInfo, HttpServletRequest request,
			@RequestParam(value = "pageNum", defaultValue = "1") Integer page) {
		// Integer sellerId1=(Integer) session.getAttribute("sellerID");
		String id = request.getParameter("sellerInfoId");
		int sellerId1 = Integer.valueOf(id);
		System.out.println("--------" + sellerId1 + "--------");
		sellerInfo = sellerInfoServiceImpl.selectById(sellerId1);
		List<SellerCourseType> seller = sellerInfoServiceImpl.findSellerById(sellerId1);
		List<Course> list = sellerInfoServiceImpl.findBySellerId(sellerId1, page);
		model.addAttribute("seller", seller);
		model.addAttribute("sellerInfo", sellerInfo);
		model.addAttribute("courselist", list);

		// 分页
		int pageCount = this.sellerInfoServiceImpl.getPageCount(sellerId1);
		model.addAttribute("pageCount", pageCount);
		int pageN = Integer.valueOf(page);
		model.addAttribute("pageNum", pageN);
		if (pageN < 1) {
			pageN = 1;
		} else if (pageN > pageCount) {
			pageN = pageCount;
		} else {
			pageN = pageN;
		}
		model.addAttribute("page", pageN);
		// 分类
		List<SellerCourseType> courseTypeList = this.sellerInfoTypeServiceImpl.listCType();
		model.addAttribute("courseTypeList", courseTypeList);
		return "front/education";
	}

	/**
	 * 后台：培训机构根据id查找
	 * 
	 * @name 王孜润
	 * @param model
	 * @param sellerInfo
	 * @param request
	 * @return
	 */
	@RequestMapping("/sellerFindCourse")
	public String findSellerCourse(HttpSession session, Model model, SellerInfo sellerInfo, HttpServletRequest request,
			@RequestParam(value = "pageNum", defaultValue = "1") Integer page) {
		Integer sellerId = (Integer) session.getAttribute("sellerID");
		List<Course> list = sellerInfoServiceImpl.findBySellerId(sellerId, page);
		List<PublicCourseType> list1 = sellerInfoServiceImpl.findTypeAll();
		model.addAttribute("sellerCourselist", list);
		model.addAttribute("publicCourseType", list1);
		// 分页
		int pageCount = this.sellerInfoServiceImpl.getPageCount(sellerId);
		model.addAttribute("pageCount", pageCount);
		int pageN = Integer.valueOf(page);
		model.addAttribute("pageNum", pageN);
		if (pageN < 1) {
			pageN = 1;
		} else if (pageN > pageCount) {
			pageN = pageCount;
		} else {
			pageN = pageN;
		}
		model.addAttribute("page", pageN);
		return "organization/manageClassify";
	}

	/**
	 * 删除
	 * 
	 * @author 王孜润
	 * @date 2018/5/22
	 **/
	@RequestMapping("/deleteCourseType")
	private String deleteCourseType(Model model, HttpServletRequest request) {
		String id = request.getParameter("id");
		String uid = request.getParameter("uid");
		int cId = Integer.valueOf(id);
		boolean result = sellerInfoServiceImpl.deleteCourseType(cId);
		if (result) {
			return "redirect:sellerFindCourse?sellerID=" + uid;
		} else {
			model.addAttribute("errormsg", "添加失败");
			return "redirect:sellerFindCourse?sellerID=" + uid;
		}
	}

	/**
	 * 培训机构详情分类列表查询
	 * 
	 * @author 王孜润
	 * @date 2018/5/30
	 * @param model
	 * @return
	 */
	@RequestMapping("/selectByType")
	private String selectByType(HttpServletRequest request, Model model,
			@RequestParam(value = "pageNum", defaultValue = "1") Integer page, int sellerID,
			@RequestParam("sellerCourseTypeID") String sellerCourseTypeID, HttpSession session,
			HttpServletResponse response) {
		Integer sellerId = (Integer) session.getAttribute("sellerID");
		List<Course> CourseByTypeList = this.sellerInfoServiceImpl.listByType(Integer.parseInt(sellerCourseTypeID),
				page);
		session.setAttribute("typeList", CourseByTypeList);
		// 分页
		int pageCount = this.sellerInfoServiceImpl.getPageCount(sellerId);
		model.addAttribute("pageCount", pageCount);
		int pageN = Integer.valueOf(page);
		model.addAttribute("pageNum", pageN);
		if (pageN < 1) {
			pageN = 1;
		}
		if (pageN > pageCount) {
			pageN = pageCount;
		}
		model.addAttribute("page", pageN);
		return sellerCourseTypeID;
	}

	/**
	 * 课程分类
	 * 
	 * @author 王孜润
	 * @param sellerID
	 * @date 2018/5/31
	 */
	@RequestMapping("/type")
	public String Type(HttpSession session, Course course, Model model, HttpServletRequest request,
			SellerInfo sellerInfo) {
		// Integer sellerId=(Integer) session.getAttribute("sellerID");
		String id1 = request.getParameter("sellerId");
		int sellerId = Integer.valueOf(id1);
		System.out.println("----" + sellerId);

		String id = request.getParameter("sellerCourseTypeID");
		int sellerCourseTypeID = Integer.valueOf(id);
		sellerInfo = sellerInfoServiceImpl.selectById(sellerId);
		List<SellerCourseType> seller = sellerInfoServiceImpl.findSellerById(sellerId);
		List<Course> list = sellerInfoServiceImpl.findTypeId(sellerId, sellerCourseTypeID);
		model.addAttribute("list", list);
		model.addAttribute("seller", seller);
		model.addAttribute("sellerInfo", sellerInfo);
		int pageCount = this.sellerInfoServiceImpl.getTypeCoursePageCount(sellerCourseTypeID);
		session.setAttribute("pageCount", pageCount);
		int pageNum = 1;
		session.setAttribute("pageNum", pageNum);
		if (0 == pageNum || pageNum < 0) {
			session.setAttribute("pageNum", 1);
		} else {
			session.setAttribute("pageNum", pageNum);
		}
		return "front/educationType";
	}
}