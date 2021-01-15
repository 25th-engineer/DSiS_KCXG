package com.one.sugarcane.sellerlogin.dao;

import javax.annotation.Resource;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import com.one.sugarcane.entity.SellerLogin;
import com.one.sugarcane.entity.SellerLoginLog;

/**
 * 培训机构注册
 * @author 张梦洲，王晟宇，崔允松
 * @throws IOException 
 * @date 2018/4/30
 */
@Repository
public class SellerLoginDaoImpl {
	@Resource
	private SessionFactory sessionFactory;
	/**
	 * 根据用户名查找登录
	 * @param name
	 * @return
	 */
	public SellerLogin findByName(String name){
		Query query = this.sessionFactory.getCurrentSession().createQuery("from SellerLogin where sellerLoginName='"+name+"'");
		return (SellerLogin) query.uniqueResult();
	}
	/**
	 * 更新用户最后一次登录ip、时间
	 * @param sellerLogin
	 */
	public void saveSellerLogin(SellerLogin sellerLogin) {
		 this.sessionFactory.getCurrentSession().save(sellerLogin);
	}
	/**
	 * 保存登录日志
	 * @param sellerLoginLog
	 */
	public void saveSellerLoginLog(SellerLoginLog sellerLoginLog) {
		this.sessionFactory.getCurrentSession().save(sellerLoginLog);
	}



}
