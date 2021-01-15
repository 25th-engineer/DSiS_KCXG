package com.one.sugarcane.test.dao;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.one.sugarcane.entity.SuperAdmin;

@Repository
public class TestDao {

	@Resource
	private SessionFactory sessionFactory;
	
	public void test() {
		Session session = this.sessionFactory.getCurrentSession();
		SuperAdmin a = new SuperAdmin("asdf","123");
		session.save(a);
		//session.close();
	}
}
