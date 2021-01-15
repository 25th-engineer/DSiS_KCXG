package com.one.sugarcane.sellerinfo.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.one.sugarcane.entity.Course;
import com.one.sugarcane.entity.CourseType;
import com.one.sugarcane.entity.SellerCourseType;


@Repository
public class SellerInfoTypeDaoImpl {
	@Resource
	private SessionFactory sessionFactory;
	public List<CourseType> findAll(){
		Query q=this.sessionFactory.getCurrentSession().createQuery("from CourseType");
		return q.list();
	}
	public List<SellerCourseType> findType(){
		Query q=this.sessionFactory.getCurrentSession().createQuery("from SellerCourseType");
		return q.list();
	}
	/**
	 * 按类别查找
	 */
	public List<Course> findByType(int sellerCourseTypeID){
		Query q=this.sessionFactory.getCurrentSession().createQuery("select t.CourseList from CourseType t where t.sellerCourseTypeID="+sellerCourseTypeID);
		return q.list();
	}
	
}
