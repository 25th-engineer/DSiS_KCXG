package com.one.sugarcane.sellerloginlog.dao;

import javax.annotation.Resource;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import com.one.sugarcane.entity.SellerLoginLog;
@Repository
public class SellerLoginLogDaoImpl {
	@Resource
	private SessionFactory sessionFactory;
}
