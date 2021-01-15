package com.one.sugarcane.question.service;

import java.util.List;

import javax.annotation.Resource;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.one.sugarcane.entity.QuestionBank;
import com.one.sugarcane.question.dao.QuestionDaoImpl;

@Service
@Transactional(readOnly=false)
public class QuestionServiceImpl {
	@Resource
	private  QuestionDaoImpl questionDaoImpl;

	public List<QuestionBank> findQuesByType(String courseType) {
				
		return questionDaoImpl.finQuesByType(courseType);
		
	}
	

}
