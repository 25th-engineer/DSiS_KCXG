package com.one.sugarcane.sellerlogin.service;

import java.util.Set;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.one.sugarcane.sellerlogin.dao.SellerLoginDaoImpl;
import com.one.sugarcane.entity.SellerLogin;
import com.one.sugarcane.entity.SellerLoginLog;
import com.one.sugarcane.MD5Util.MD5Util;

/**
 * 培训机构注册
 * @author 张梦洲，王晟宇，崔允松
 * @throws IOException 
 * @date 2018/4/30
 */
@Service
@Transactional(readOnly=false)
public class SellerLoginServiceImpl {
	@Resource
	private SellerLoginDaoImpl sellerLoginDaoImpl;
	public SellerLogin Login(String name,String password){
		SellerLogin sellerLogin = this.sellerLoginDaoImpl.findByName(name);
		MD5Util md5 = new MD5Util();
		if(sellerLogin != null){
			if(md5.verify(password,sellerLogin.getPassword())){
				return sellerLogin;
			}else{
				return null;
			}
		}
		return null;
	}
	public void saveSellerLogin(SellerLogin sellerLogin) {
		this.sellerLoginDaoImpl.saveSellerLogin(sellerLogin);
	}
	public void saveSellerLoginLog(SellerLoginLog sellerLoginLog) {
		this.sellerLoginDaoImpl.saveSellerLoginLog(sellerLoginLog);
	}

	
}
