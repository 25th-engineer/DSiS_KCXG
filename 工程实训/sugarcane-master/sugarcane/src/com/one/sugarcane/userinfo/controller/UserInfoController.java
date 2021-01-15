package com.one.sugarcane.userinfo.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.one.sugarcane.userinfo.service.UserInfoServiceImpl;
import com.one.sugarcane.entity.PublicCourseType;
import com.one.sugarcane.entity.UserHobby;
import com.one.sugarcane.entity.UserInfo;
import com.one.sugarcane.entity.UserLogin;
import com.one.sugarcane.MD5Util.MD5Util;;

/**
 * 
 * @author 张梦洲
 * @throws IOException 
 * @date 2018/4/30
 */

@Controller
@RequestMapping("userInfo")
public class UserInfoController {
	@Resource
	private UserInfoServiceImpl userInfoServiceImpl;
	
	/**
	 * 用户注册
	 * @author 张梦洲
	 * @throws IOException 
	 * @date 2018/5/10
	 */
	@RequestMapping("/save")
	public String save(@RequestParam String username,@RequestParam String email,@RequestParam String password,@RequestParam String phone) {
		UserInfo userInfo = new UserInfo();
		UserLogin userLogin = new UserLogin();
		userInfo.setUserName(username);
		userInfo.setUserEmail(email);
		userInfo.setUserPhoneNumber(phone);
		userLogin.setUserInfo(userInfo);
		MD5Util md5 = new MD5Util();
		String md5PWD = md5.generate(password);
		userLogin.setPassword(md5PWD);
		userLogin.setUserEmail(email);
		userInfo.setUserLogin(userLogin);
		userInfoServiceImpl.saveUserInfo(userInfo);
		return "front/home";
	}
	/**
	 * 用户完善个人信息
	 * @author 冯海晴
	 * @date 2018.5.24
	 */
	@RequestMapping("complete")
	public String completeUserInfo(@RequestParam int userGender, @RequestParam String birthday, @RequestParam String userEducation, 
			@RequestParam String userWork, @RequestParam String address_province, @RequestParam String address_city, 
			@RequestParam String address_area, @RequestParam String publicTypeName, HttpServletRequest request) {
		System.out.println(userGender+birthday+userEducation+userWork+address_province+address_city+address_area+publicTypeName);
		HttpSession session = request.getSession();
		UserInfo userInfo = (UserInfo) session.getAttribute("user");
		//添加用户兴趣爱好userHobby
		Set<UserHobby> userHobbys = new HashSet<>();
		String[] publicTypeNames = publicTypeName.split(",");
		for(int i = 0; i<publicTypeNames.length; ++i) {
			PublicCourseType publicType = this.userInfoServiceImpl.findPublicTypeByName(publicTypeNames[i]);
			UserHobby userHobby = new UserHobby();
			userHobby.setUserInfo(userInfo);
			userHobby.setPublicType(publicType);
			this.userInfoServiceImpl.saveUserHobby(userHobby);
			userHobbys.add(userHobby);
		}
		//完善用户信息
		userInfo.setUserGender(userGender);
		userInfo.setBirthday(birthday);
		userInfo.setUserEducation(userEducation);
		userInfo.setUserWork(userWork);
		userInfo.setAddress_province(address_province);
		userInfo.setAddress_city(address_city);
		userInfo.setAddress_area(address_area);
		userInfo.setUserHobby(userHobbys);
		this.userInfoServiceImpl.updateUserInfo(userInfo);
		//return "redirect:/front/personinfor.jsp";
		return "redirect:/front/index.jsp";
	}
	/**
	 * 修改个人信息
	 * @author 冯海晴
	 * @date 2018.5.24
	 */
	@RequestMapping("userpic")
	public String ceshi(HttpServletRequest request, @RequestParam(value="main_img",required=false) MultipartFile file) {
		HttpSession session = request.getSession();
		UserInfo userInfo = (UserInfo) session.getAttribute("user");
		//插入头像
		String docBase = "D:/Sugarcane/user/img/";
		//getOriginalFilename : 获取上传文件的原名
		String imgName=new Date().getTime()+file.getOriginalFilename();
		System.out.println(imgName);
		String path=docBase+imgName;
		File newFile=new File(path);
		//通过CommonsMultipartFile的方法直接写文件（注意这个时候）
		try {
			file.transferTo(newFile);
		} catch (IllegalStateException | IOException e) {
			System.out.println("写文件错误");
		}
		//将路径存入数据库代码
		userInfo.setUserPicture(path);
		this.userInfoServiceImpl.updateUserInfo(userInfo);
		return "redirect:/publicCourseType/list1.do";
	}
	@RequestMapping("edit")
	public String editUserInfo(@RequestParam(value="userGender",required=false) Integer userGender, @RequestParam String birthday, @RequestParam String userEducation, 
			@RequestParam String userWork, @RequestParam String address_province, @RequestParam String address_city, 
			@RequestParam String address_area, HttpServletRequest request, @RequestParam(value="publicTypeName",required=false) String publicTypeName,
			@RequestParam String userName, @RequestParam String userEmail, @RequestParam String userPhoneNumber){
		System.out.println(userGender+birthday+userEducation+userWork+address_province+address_city+address_area+userName+userEmail+userPhoneNumber+publicTypeName);
		HttpSession session = request.getSession();
		UserInfo userInfo = (UserInfo) session.getAttribute("user");
		//删除之前的hobby（测试成功）
		System.out.println(publicTypeName);
		int num = this.userInfoServiceImpl.deleteUserHobby(userInfo);
		System.out.println("删除的用户兴趣爱好个数:"+num);
		//判断用户是否重新选择兴趣爱好，若重新选择，则重新添加
		if(publicTypeName != null && publicTypeName.length() != 0) {
			//添加用户兴趣爱好userHobby（测试成功）
			Set<UserHobby> userHobbys = new HashSet<>();
			String[] publicTypeNames = publicTypeName.split(",");
			for(int i = 0; i<publicTypeNames.length; ++i) {
				PublicCourseType publicType = this.userInfoServiceImpl.findPublicTypeByName(publicTypeNames[i]);
				UserHobby userHobby = new UserHobby();
				userHobby.setUserInfo(userInfo);
				userHobby.setPublicType(publicType);
				this.userInfoServiceImpl.saveUserHobby(userHobby);
				userHobbys.add(userHobby);
			}
			userInfo.setUserHobby(userHobbys);			
		}
		//更新用户信息
		//若昵称未填，则使用原来数据，不修改。
		if(userName != null && userName.length() != 0) {
			userInfo.setUserName(userName);
		}
		//若邮箱未填，则使用原来数据，不修改。
		if(userEmail != null && userEmail.length() != 0) {
			userInfo.setUserEmail(userEmail);
			UserLogin userLogin = userInfo.getUserLogin();
			userLogin.setUserEmail(userEmail);
			this.userInfoServiceImpl.updateUserLogin(userLogin);
		}
		//若性别未选，则使用原来数据，不修改。
		if(userGender != null) {
			userInfo.setUserGender(userGender);
		}
		//若电话号码未填，则使用原来数据，不修改。
		if(userPhoneNumber != null && userPhoneNumber.length() != 0) {
			userInfo.setUserPhoneNumber(userPhoneNumber);
		}
		userInfo.setBirthday(birthday);
		userInfo.setUserEducation(userEducation);
		userInfo.setUserWork(userWork);
		userInfo.setAddress_province(address_province);
		userInfo.setAddress_city(address_city);
		userInfo.setAddress_area(address_area);
		this.userInfoServiceImpl.updateUserInfo(userInfo);
		return "redirect:/front/home.jsp";
	}
}