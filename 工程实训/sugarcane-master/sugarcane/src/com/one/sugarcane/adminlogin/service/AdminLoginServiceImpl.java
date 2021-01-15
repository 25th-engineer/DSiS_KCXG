package com.one.sugarcane.adminlogin.service;
/**
 * 管理员登录
 * @author 冯海晴
 * @date 2018.6.7
 *
 */

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.one.sugarcane.adminlogin.dao.AdminLoginDaoImpl;
import com.one.sugarcane.entity.AdminLogin;
import com.one.sugarcane.entity.SellerInfo;
import com.one.sugarcane.entity.SellerLogin;
import com.one.sugarcane.entity.UserInfo;
import com.one.sugarcane.entity.UserLogin;

@Service
@Transactional(readOnly=false)
public class AdminLoginServiceImpl {
	@Resource
	private AdminLoginDaoImpl adminLoginDaoImpl;
	/**
	 * 管理员登录
	 * @author 冯海晴
	 * @date 2018.6.7
	 * @return
	 */
	public AdminLogin login(String adminName,String password) {
		AdminLogin adminLogin = this.adminLoginDaoImpl.login(adminName);
		if(adminLogin != null){
			if(adminLogin.getPassword().equals(password)) {
				return adminLogin;
			}else {
				return null;
			}
		}
		return null;
	}
	/**
	 * 遍历用户
	 * @author 冯海晴
	 * @date 2018.6.7
	 */
	public List<UserInfo> listUser(){
		return this.adminLoginDaoImpl.listUser();
	}
	/**
	 * 分页遍历用户
	 * @author 冯海晴
	 * @date 2018.6.7
	 */
	public List<UserInfo> listUserPage(int pageIndex,int pageSize){
		return this.adminLoginDaoImpl.listUserPage(pageIndex, pageSize);
	}
	/**
	 * 遍历机构
	 * @author 冯海晴
	 * @date 2018.6.7
	 */
	public List<SellerInfo> listSeller(){
		return this.adminLoginDaoImpl.listSeller();
	}
	/**
	 * 分页遍历机构
	 * @author 冯海晴
	 * @date 2018.6.7
	 */
	public List<SellerInfo> listSellerPage(int pageIndex,int pageSize){
		return this.adminLoginDaoImpl.listSellerPage(pageIndex, pageSize);
	}
	/**
	 * 通过用户名搜索
	 * @author 冯海晴
	 * @date 2018.6.12
	 */
	public List<UserInfo> listUserName(String userName){
		return this.adminLoginDaoImpl.listUserName(userName);
	}
	/**
	 * 通过机构名搜索
	 * @author 冯海晴
	 * @date 2018.6.12
	 */
	public List<SellerInfo> listSellerName(String sellerName){
		return this.adminLoginDaoImpl.listSeller();
	}
	/**
	 * 通过id查找用户
	 * @author feng
	 * @date 2018.6.15
	 */
	public UserInfo findUserById(int userID) {
		return this.adminLoginDaoImpl.findUserById(userID);
	}
	/**
	 * 通过id查找机构
	 * @author feng
	 * @date 2018.6.15
	 */
	public SellerInfo findSellerById(int sellerID) {
		return this.adminLoginDaoImpl.findSellerById(sellerID);
	}
	/**
	 * 更新用户禁用属性
	 * @author feng
	 * @date 2018.6.15
	 */
	public void updateUserForbid(UserLogin ul, UserInfo user) {
		this.adminLoginDaoImpl.updateUserForbid(ul, user);
	}
	/**
	 * 更新机构禁用属性
	 * @author feng
	 * @date 2018.6.15
	 */
	public void updateSellerForbid(SellerLogin sl, SellerInfo seller) {
		this.adminLoginDaoImpl.updateSellerForbid(sl, seller);
	}
	/**
	 * 查找禁用用户
	 * @author feng
	 * @date 2018.6.15
	 */
	public String listUserforbid(){
		return this.adminLoginDaoImpl.listUserforbid();
	}
	/**
	 * 查找禁用机构/遍历禁用机构
	 * @author feng
	 * @date 2018.6.15
	 */
	public String listsellerforbid(){
		return this.adminLoginDaoImpl.listsellerforbid();
	}
	/**
	 * 退出登录
	 * @author feng
	 * @date 2018.6.17
	 */
	public void logoff(){
		this.adminLoginDaoImpl.logoff();
	}
}
