package com.one.sugarcane.userlogin.service;

import java.util.Set;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.one.sugarcane.userlogin.dao.UserLoginDaoImpl;
import com.one.sugarcane.entity.UserInfo;
import com.one.sugarcane.entity.UserLogin;
import com.one.sugarcane.entity.UserLoginLog;
import com.one.sugarcane.MD5Util.MD5Util;

/**
 * 
 * @author 张梦洲
 * @throws IOException 
 * @date 2018/4/30
 */
@Service
@Transactional(readOnly=false)
public class UserLoginServiceImpl {
	@Resource
	private UserLoginDaoImpl userLoginDaoImpl;
	
	/*
	 * 用户登录
	 *  @author 张梦洲
	 * @date 2018/4/30
	 */
	public UserLogin Login(String email,String password){
		UserLogin userLogin = this.userLoginDaoImpl.findByEmail(email);
		MD5Util md5 = new MD5Util();
		if(userLogin != null){
			if(md5.verify(password,userLogin.getPassword())){
				return userLogin;
			}else{
				return null;
			}
		}
		return null;
	}
	/*
	 * 更新登录日志
	 */
	public void updateUserLogin(UserLoginLog userLoginLog) {
		this.userLoginDaoImpl.updateUserLogin(userLoginLog);
	}
	public UserInfo getpass(String email) {
		
		UserInfo u = new UserInfo();
		
		u = userLoginDaoImpl.findByEmail2(email);
		return u;
	}
	public void updateuserInfo(UserInfo u) {
		 userLoginDaoImpl.updateUser(u);
		
	}
	
}