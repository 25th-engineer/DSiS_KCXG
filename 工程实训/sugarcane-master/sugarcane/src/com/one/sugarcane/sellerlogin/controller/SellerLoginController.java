package com.one.sugarcane.sellerlogin.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.logging.LogManager;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.sugarcane.sellerlogin.service.SellerLoginServiceImpl;
import com.one.sugarcane.entity.SellerLogin;
import com.one.sugarcane.entity.SellerLoginLog;

/**
 * 培训机构登录
 * @author 张梦洲，王晟宇，崔允松
 * @throws IOException 
 * @date 2018/4/30
 */
@Controller
@RequestMapping("sellerLogin")
public class SellerLoginController {
	@Resource
	private SellerLoginServiceImpl sellerLoginServiceImpl;
	
	@RequestMapping(value = "login")
	/**
	 * seller登录
	 * 登录日志
	 * @param name
	 * @param pwd
	 * @param model
	 * @param request
	 * @return
	 */
	public String login(@RequestParam("username") String name,@RequestParam("password")String pwd,
			Model model,HttpServletRequest request,
			HttpSession session)throws IOException{
		SellerLogin sellerLogin = this.sellerLoginServiceImpl.Login(name,pwd);
		//杜凯玲    添加sessionAttribut：sellerID,sellerLogin  5.14
		session.setAttribute("sellerID", sellerLogin.getSellerID());
		session.setAttribute("sellerLogin", sellerLogin);
		if(null!=sellerLogin){
			SellerLoginLog sellerLoginlog = new SellerLoginLog();
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
			sellerLoginlog.setIP(ip);
			sellerLoginlog.setTime(date);
			sellerLogin.setLastTime(date);
			sellerLogin.setLastIP(ip);
			sellerLoginlog.setSellerLogin(sellerLogin);
			sellerLoginServiceImpl.saveSellerLoginLog(sellerLoginlog);
			sellerLoginServiceImpl.saveSellerLogin(sellerLogin);
			request.getSession().setAttribute("seller", sellerLogin.getSellerInfo());
			return "organization/manageIntro";
		}else{
			model.addAttribute("information", "账号或密码错误");
			return "organization/orgLogin";
		
		}
	}
	
	
	
	
	
	
	
}
