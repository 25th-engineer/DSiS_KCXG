/**
 * 
 * @auther 王孜润
 * @date 2018.4.26
 */
package com.one.sugarcane.sellercoursetype.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.one.sugarcane.course.service.CourseServiceImpl;
import com.one.sugarcane.entity.Course;
import com.one.sugarcane.entity.PublicCourseType;
import com.one.sugarcane.entity.SellerCourseType;
import com.one.sugarcane.sellercoursetype.service.SellerCourseTypeServiceImpl;
import com.one.sugarcane.test.service.TestService;
@Controller
@RequestMapping("sellerCourseType")
public class SellerCourseTypeController {
	@Resource
	private SellerCourseTypeServiceImpl sellerCourseTypeServiceImpl;
	private CourseServiceImpl courseServiceImpl;
	private int pageNum;

	/**
	 * 列表查询
	 * @author 王孜润
	 * @date 2018/5/1
	 * **/
	@RequestMapping("/sellerCourseType")
	private String sellerCourseType(Model model,HttpServletResponse response,@RequestParam(value="pageNum",defaultValue="1")Integer page,HttpServletRequest request) {
		List<SellerCourseType> list = this.sellerCourseTypeServiceImpl.findAll(page);
		model.addAttribute("sellerCourseType",list);
		List<PublicCourseType> list1 = sellerCourseTypeServiceImpl.findTypeAll();
		model.addAttribute("publicCourseType",list1);
		for(int i=0;i<list1.size();i++) {
			System.out.println(list1.get(i).getPublicTypeName());
		}
		//分页
		int pageCount = this.sellerCourseTypeServiceImpl.getPageCount();
		model.addAttribute("pageCount",pageCount);
		int pageNum = 1;
		model.addAttribute("pageNum",pageNum);
		if(pageNum==0 || pageNum<0) {
			model.addAttribute("pageNum",1);
		}else {
			model.addAttribute("pageNum",pageNum);
		}
		return "organization/manageClassify";
	}
	/**
	 * 添加
	 * @author 王孜润
	 * @date 2018/5/7
	 * **/
	@RequestMapping("/addCourseType")
	private String addCourseType(Model model,HttpServletRequest request,HttpServletResponse response) {
		Course course = new Course();
		String newCourseName = request.getParameter("courseName");
		String newCTypeName = request.getParameter("publicTypeName");
		List<PublicCourseType> pList = sellerCourseTypeServiceImpl.findByName(newCTypeName);
		PublicCourseType pcype = pList.get(0);
//		Integer pctId = pcype.getPublicTypeId();
		course.setCourseName(newCourseName);
		course.setPublicCourseType(pcype);
		boolean result = sellerCourseTypeServiceImpl.addNewCourseType(course);
		System.out.println("走到这里了");
		System.out.println(result);
		if(result) {
			System.out.println("成功的走到这里了");
			return "redirect:sellerCourseType";
		}else {
			model.addAttribute("errormsg", "添加失败");
			return "organization/manageClassify";
		}
	}
	/**
	 * 删除
	 * @author 王孜润
	 * @date 2018/5/1
	 * **/
	@RequestMapping("/deleteCourseType")
	private String deleteCourseType(Model model,HttpServletRequest request) {
		String id = request.getParameter("id");
		int cId = Integer.valueOf(id);
		boolean result = sellerCourseTypeServiceImpl.deleteCourseType(cId);
		if(result) {
			return "redirect:sellerCourseType";
		}else {
			model.addAttribute("errormsg","添加失败");
			return "redirect:sellerCourseType";
		}
	}
	/**
	 * 更新课程
	 * @author 王孜润
	 * @date 2018/5/15
	 * **/
//	@RequestMapping("/updateCourseType")
//	private String updateCourseType(Model model) {
//		
//	}
//	/**
//	 * 登录后根据id查询培训机构课程
//	 * @author 王孜润
//	 * @param session 
//	 * @param sellerCourseType 
//	 * @date 2018/5/16
//	 */
//	@RequestMapping("/sellerCourse")
//	private String sellerCourse(Model model,HttpServletResponse response,@RequestParam(value="pageNum",defaultValue="1")Integer page,HttpServletRequest request, ServletRequest session, Object sellerCourseType) {
//		Integer sellerID=(Integer) session.getAttribute("sellerID");
//		List<SellerCourseType> list = this.sellerCourseTypeServiceImpl.findAll(page,sellerID);
//		model.addAttribute("sellerCourseType",list);
//		List<PublicCourseType> list1 = sellerCourseTypeServiceImpl.findTypeAll(sellerID);
//		model.addAttribute("publicCourseType",list1);
//		//分页
//				int pageCount = this.sellerCourseTypeServiceImpl.getPageCount();
//				model.addAttribute("pageCount",pageCount);
//				int pageNum = 1;
//				model.addAttribute("pageNum",pageNum);
//				if(pageNum==0 || pageNum<0) {
//					model.addAttribute("pageNum",1);
//				}else {
//					model.addAttribute("pageNum",pageNum);
//				}
//				return "organization/manageClassify";
//	}
}
