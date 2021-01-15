package com.one.sugarcane.adminlogin.controller;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.one.sugarcane.adminlogin.service.AdminLoginServiceImpl;
import com.one.sugarcane.entity.AdminLogin;
import com.one.sugarcane.entity.SellerInfo;
import com.one.sugarcane.entity.SellerLogin;
import com.one.sugarcane.entity.UserInfo;
import com.one.sugarcane.entity.UserLogin;

/**
 * 管理员
 * @author 冯海晴
 * @date 2018.6.7
 *
 */
@Controller
@RequestMapping("admin")
public class AdminLoginController {
	@Resource
	private AdminLoginServiceImpl adminLoginServiceImpl;
	/**
	 * 管理员登录
	 * @author 冯海晴
	 * @date 2018.6.7
	 */
	@RequestMapping("/login")
	public String login(@RequestParam(value="adminName") String adminName, @RequestParam(value="password") String password,
			HttpServletRequest request) {
		System.out.println(adminName + password);
		AdminLogin adminLogin = this.adminLoginServiceImpl.login(adminName, password);
		if(adminLogin != null) {
			HttpSession session = request.getSession();
			session.setAttribute("adminLogin", adminLogin);
			System.out.println(adminLogin.getAdminName());
			int userRows = this.adminLoginServiceImpl.listUser().size();
			session.setAttribute("userRows", userRows);
			int sellerRows = this.adminLoginServiceImpl.listSeller().size();
			session.setAttribute("sellerRows", sellerRows);
			return "redirect:/manager/background.jsp";
		}else {
			return "redirect:/manager/bgLogin.jsp";
		}
	}
	/**
	 * 遍历用户+通过用户名搜索
	 * @author 冯海晴
	 * @date 2018.6.7
	 */
	@RequestMapping("/listUser")
	public String listUser(HttpServletRequest request,@RequestParam(value="pageIndex",required=false) Integer pageIndex1,
			@RequestParam(value="page",required=false) Integer page, @RequestParam(value="userName",required=false) String userName){
		HttpSession session = request.getSession();
		//总记录条数userRows
		int userRows = (int) session.getAttribute("userRows");
		//每页放6条记录
		int rowsPerPage = 6;
		int pageIndex = this.pageInd(session, userRows, page, pageIndex1,rowsPerPage);
		session.setAttribute("pageIndex",pageIndex);
		List<UserInfo> listUser = null;
		//遍历和搜索查询判断
		if(userName != null && userName.length() > 0) {
			listUser = this.adminLoginServiceImpl.listUserName(userName);
		}else {
			listUser = this.adminLoginServiceImpl.listUserPage(pageIndex, rowsPerPage);
		}
		session.setAttribute("listUser", listUser);
		return "redirect:/manager/bgUser.jsp";
	}
	/**
	 * 遍历机构+搜索查询
	 * @author 冯海晴
	 * @date 2018.6.7
	 */
	@RequestMapping("/listSeller")
	public String listSeller(HttpServletRequest request,@RequestParam(value="pageIndex",required=false) Integer pageIndex1,
			@RequestParam(value="page",required=false) Integer page, @RequestParam(value="sellerName",required=false) String sellerName){
		HttpSession session = request.getSession();
		int sellerRows = (int) session.getAttribute("sellerRows");
		//每页放6条记录
		int rowsPerPage = 6;
		int pageIndex = this.pageInd(session, sellerRows, page, pageIndex1,rowsPerPage);
		session.setAttribute("pageIndex",pageIndex);
		List<SellerInfo> listSeller = null;
		//遍历和搜索判断
		if(sellerName != null && sellerName.length() > 0) {
			listSeller = this.adminLoginServiceImpl.listSellerName(sellerName);
		}else {
			listSeller = this.adminLoginServiceImpl.listSellerPage(pageIndex, rowsPerPage);
		}
		session.setAttribute("listSeller", listSeller);
		return "redirect:/manager/bgCompany.jsp";
	}
	/**
	 * forbid禁用操作
	 * @author feng
	 * @date 2018.6.13
	 */
	@RequestMapping("/forbidUser")
	public String forbidUser(HttpServletRequest request, @RequestParam(value="userID",required=false) String userIDString) {
		String listUserIDforbid = this.adminLoginServiceImpl.listUserforbid();
		HttpSession session = request.getSession();
		List<UserInfo> listUser = (List<UserInfo>) session.getAttribute("listUser");
		if(userIDString != null) {
			String delforbid = listUserIDforbid;
			String[] listuserforbid = listUserIDforbid.split(",");
			String[] userIDs = userIDString.split(",");
			for(String userforbid :listuserforbid) {
				for(String userIDStr : userIDs) {
					if(userforbid.equals(userIDStr)) {
						delforbid = delforbid.replace(userIDStr, "");
					}
					Integer userID = Integer.valueOf(userIDStr);
					UserInfo user = this.adminLoginServiceImpl.findUserById(userID);
					UserLogin ul = user.getUserLogin();
					Integer forbid = ul.getForbid();
					if(forbid == null || forbid == 0) {
						ul.setForbid(1);
						user.setUserLogin(ul);
						this.adminLoginServiceImpl.updateUserForbid(ul, user);
						System.out.println("禁用"+userID);
					}
				}
			}
			String[] delfor = delforbid.split(",");
			for(String del :delfor) {
				if(!del.isEmpty()) {
					this.deluserforbid(del, listUser);
				}
			}
		}else {
			String[] listuserforbid = listUserIDforbid.split(",");
			for(String del:listuserforbid) {
				this.deluserforbid(del, listUser);
			}
		}
		return "redirect:/admin/listUser.do";
	}
	/**
	 * forbid禁用操作
	 * @author feng
	 * @date 2018.6.13
	 */
	@RequestMapping("/forbidSeller")
	public String forbidSeller(HttpServletRequest request, @RequestParam(value="sellerID",required=false) String sellerIDString) {
		String listSellerIDforbid = this.adminLoginServiceImpl.listsellerforbid();
		HttpSession session = request.getSession();
		List<SellerInfo> listSeller = (List<SellerInfo>) session.getAttribute("listSeller");
		if(sellerIDString != null) {
			String delforbid = listSellerIDforbid;
			String[] listuserforbid = listSellerIDforbid.split(",");
			String[] sellerIDs = sellerIDString.split(",");
			for(String sellerforbid :listuserforbid) {
				for(String sellerIDStr : sellerIDs) {
					if(sellerforbid.equals(sellerIDStr)) {
						delforbid = delforbid.replace(sellerIDStr, "");
					}
					Integer sellerID = Integer.valueOf(sellerIDStr);
					SellerInfo seller = this.adminLoginServiceImpl.findSellerById(sellerID);
					SellerLogin sl = seller.getSellerLogin();
					Integer forbid = sl.getForbid();
					if(forbid == null || forbid == 0) {
						sl.setForbid(1);
						seller.setSellerLogin(sl);
						this.adminLoginServiceImpl.updateSellerForbid(sl, seller);
						System.out.println("禁用"+sellerID);
					}
				}
			}
			String[] delfor = delforbid.split(",");
			for(String del :delfor) {
				if(!del.isEmpty()) {
					this.delsellerforbid(del, listSeller);
				}
			}
		}else {
			String[] listuserforbid = listSellerIDforbid.split(",");
			for(String del:listuserforbid) {
				this.delsellerforbid(del, listSeller);
			}
		}
		return "redirect:/manager/bgCompany.jsp";
	}
	/**
	 * 退出登录
	 * @author feng
	 * @date 2018.6.17
	 */
	@RequestMapping("/logoff")
	public String logoff(HttpServletRequest request) {
		HttpSession session = request.getSession();
		AdminLogin admin = (AdminLogin) session.getAttribute("adminLogin");
		if(null != admin) {
			session.removeAttribute("adminLogin");
		}
		return "redirect:/manager/bgLogin.jsp";
	}
	/**
	 * 分页方法
	 * @author feng
	 * @date 2018.6.20
	 */
	public int pageInd(HttpSession session,Integer rows,Integer page,Integer pageIndex1,int rowsPerPage) {
		Integer pageIndex = null;
		//计算有多少页记录
		int pageCount = (int) Math.ceil((double)rows/(double)rowsPerPage);
		session.setAttribute("pageCount", pageCount);
		if(page != null) {
			if(page <= pageCount) {
				pageIndex = page;
			}
		}else {
			pageIndex = pageIndex1;
		}
		//分页计算
		if(null == pageIndex || pageIndex < 1){
			pageIndex = 1;
		}
		return pageIndex;
	}
	/**
	 * 解除用户禁用方法
	 * @author feng
	 * @date 2018.6.20
	 */
	public void deluserforbid(String del,List<UserInfo> listUser) {
		for(UserInfo u:listUser) {
			if(u.getUserID() == Integer.valueOf(del)) {
				Integer delID = Integer.valueOf(del);
				UserInfo user = this.adminLoginServiceImpl.findUserById(delID);
				UserLogin ul = user.getUserLogin();
				ul.setForbid(0);
				user.setUserLogin(ul);
				this.adminLoginServiceImpl.updateUserForbid(ul, user);
				System.out.println("解除禁用"+delID);
			}
		}
	}
	/**
	 * 解除培训机构禁用方法
	 * @author feng
	 * @date 2018.6.20
	 */
	public void delsellerforbid(String del,List<SellerInfo> listSeller) {
		for(SellerInfo s:listSeller) {
			if(s.getSellerID() == Integer.valueOf(del)) {
				Integer delID = Integer.valueOf(del);
				SellerInfo seller = this.adminLoginServiceImpl.findSellerById(delID);
				SellerLogin sl = seller.getSellerLogin();
				sl.setForbid(0);
				seller.setSellerLogin(sl);
				this.adminLoginServiceImpl.updateSellerForbid(sl, seller);
				System.out.println("解除禁用"+delID);
			}
		}
	}
}
