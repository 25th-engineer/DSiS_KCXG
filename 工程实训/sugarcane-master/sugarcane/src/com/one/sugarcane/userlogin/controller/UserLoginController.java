package com.one.sugarcane.userlogin.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.one.sugarcane.userlogin.service.UserLoginServiceImpl;
import com.one.sugarcane.MD5Util.MD5Util;
import com.one.sugarcane.entity.UserInfo;
import com.one.sugarcane.entity.UserLogin;
import com.one.sugarcane.entity.UserLoginLog;
import com.one.sugarcane.mailUtil.SendmailUtil;

/**
 * 培训机构登录
 * @author 张梦洲
 * @throws IOException 
 * @date 2018/5/10
 */
@Controller
@RequestMapping("userLogin")
public class UserLoginController {
	@Resource
	private UserLoginServiceImpl userLoginServiceImpl;
	
	/**
	 * user登录
	 * @param email
	 * @param password
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "login")
	public String login(@RequestParam String email,@RequestParam String password,
			Model model,HttpServletRequest request,HttpSession session)throws IOException{
		UserLogin userLogin = this.userLoginServiceImpl.Login(email,password);
		session.setAttribute("userId", userLogin.getUserID());
		if(null!=userLogin){
			UserLoginLog userLoginlog = new UserLoginLog();
			//获取ip
			String ip = request.getHeader("x-forwarded-for"); 
		       if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
		           ip = request.getHeader("Proxy-Client-IP"); 
		       } 
		       if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
		           ip = request.getHeader("WL-Proxy-Client-IP"); 
		       } 
		       if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
		           ip = request.getRemoteAddr(); 
		       } 
		     //获取时间
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = df.format(new Date());
			userLoginlog.setIP(ip);
			userLoginlog.setTime(date);
			userLogin.setLastTime(date);
			userLogin.setLastIP(ip);
			userLoginlog.setUserLogin(userLogin);
			this.userLoginServiceImpl.updateUserLogin(userLoginlog);
			request.getSession().setAttribute("user", userLogin.getUserInfo());
			
			System.out.println("开始测试");
			//查询登陆次数，若是第一次登陆，则跳转到完善个人信息页。
			Set<UserLoginLog> userLoginLogs = userLogin.getUserLoginLog();
			int num = userLoginLogs.size();
			System.out.println("登录次数："+num);
			if(num == 1) {
				return "redirect:/publicCourseType/list.do";
			}else {
				return "front/index";
			}
		}else{
			model.addAttribute("information", "邮箱或密码错误");
			return "front/index";
		}
	}
	@RequestMapping("/forget")
	public String forget(@RequestParam String email,HttpServletRequest request) {
		
			
			String hrefString = request.getScheme() + "://" +request.getServerName()
			+":"+request.getLocalPort()
			+request.getServletContext().getContextPath()
			+"/front/resetpwd.jsp?email=" + email;
			System.out.println(hrefString);
			String href = "<a href='" + hrefString + "'>点击重置密码</a>如果链接不可用，拷贝" + hrefString +"到地址栏";
			String title = "你好，请重置密码";
			
			System.out.print(hrefString);
			SendmailUtil.doSendHtmlEmail(email, title, href);
		
		return "organization/forgetSuccess";
	}
	
	@RequestMapping("/respsd")
	public String resetPassword(@RequestParam String email,@RequestParam String password,@RequestParam String checkPWD,HttpServletRequest request) {
	
		if(password.equals(checkPWD)){
			UserInfo u = (UserInfo)this.userLoginServiceImpl.getpass(email);
			MD5Util md5 = new MD5Util();
			String md5PWD = md5.generate(password);
			u.getUserLogin().setPassword(md5PWD);
			userLoginServiceImpl.updateuserInfo(u);;
			return "front/reset1";
	         }else {
	        	 return"front/reset0";
	         }	
	}
	
	@RequestMapping("/outLogin")
	public String outlogin(HttpServletRequest req) {
	
		HttpSession ht=req.getSession(true);
		ht.removeAttribute("username");
		
		return "front/home";
	}
	
}
