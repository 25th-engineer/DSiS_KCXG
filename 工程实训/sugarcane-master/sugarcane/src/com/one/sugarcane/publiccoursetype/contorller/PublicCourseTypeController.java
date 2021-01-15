package com.one.sugarcane.publiccoursetype.contorller;
/**
 * 公共课程类别
 * @author 冯海晴
 * @date 2018.5.24
 */

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.one.sugarcane.entity.PublicCourseType;
import com.one.sugarcane.entity.UserInfo;
import com.one.sugarcane.publiccoursetype.service.PublicCourseTypeServiceImpl;

@Controller
@RequestMapping("/publicCourseType")
public class PublicCourseTypeController {
	@Resource
	private PublicCourseTypeServiceImpl publicCourseTypeServiceImpl;
	/**
	 * 查询
	 * @author 冯海晴
	 * @date 2018.5.24
	 */
	@RequestMapping("/list")
	public String listAll(HttpServletRequest request){
		HttpSession session = request.getSession();
		List<PublicCourseType> listPublicType = this.publicCourseTypeServiceImpl.listAll();
		session.setAttribute("listPublicType", listPublicType);
		return "redirect:/front/complete.jsp";
	}
	/**
	 * 查询1
	 * @author 冯海晴
	 * @date 2018.5.28
	 */
	@RequestMapping("/list1")
	public String listAll1(HttpServletRequest request){
		HttpSession session = request.getSession();
		List<PublicCourseType> listPublicTypeP = this.publicCourseTypeServiceImpl.listAll();
		session.setAttribute("listPublicTypeP", listPublicTypeP);
		UserInfo userInfo = (UserInfo) session.getAttribute("user");
		//头像显示
		String imgName = userInfo.getUserPicture();
		if(imgName != null) {
			System.out.println("图片名："+imgName);
			session.setAttribute("userPicture", imgName);
		}
		String birthday = userInfo.getBirthday();
		String[] bir = birthday.split(",");
		session.setAttribute("bir", bir);
		String checkboxs = this.publicCourseTypeServiceImpl.listHobby(userInfo);
		session.setAttribute("checkboxs", checkboxs);
		return "redirect:/front/personinfor.jsp";
	}
}
