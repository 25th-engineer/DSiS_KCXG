package com.one.sugarcane.question.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import com.one.sugarcane.entity.QuestionBank;


@Repository
public class QuestionDaoImpl {
	
	@Resource
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public List<QuestionBank> finQuesByType(String courseType) {
		System.out.println("why!!!!!");      		
		Query qlist =  this.sessionFactory.getCurrentSession().createQuery("from QuestionBank q where q.publicCourseType.publicTypeName='"+courseType+"'");
		System.out.println("why?????");                                   
		List<QuestionBank> list = qlist.list();
		
		return list;
	}

}
