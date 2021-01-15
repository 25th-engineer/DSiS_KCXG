package com.one.sugarcane.sellerinfo.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.one.sugarcane.entity.Course;
import com.one.sugarcane.entity.CourseType;
import com.one.sugarcane.entity.SellerCourseType;
import com.one.sugarcane.sellerinfo.dao.SellerInfoTypeDaoImpl;

@Service
public class SellerInfoTypeServiceImpl {
	@Resource
	private SellerInfoTypeDaoImpl sellerInfoTypeDaoImpl;
	
	public List<CourseType> listCourseType(){
		return this.sellerInfoTypeDaoImpl.findAll();
	}
	
	public List<SellerCourseType> listCType(){
		return this.sellerInfoTypeDaoImpl.findType();
	}
	/**
	 * 按类别查找
	 */
	public List<Course> listCourseByType(int sellerCourseTypeID){
		return this.sellerInfoTypeDaoImpl.findByType(sellerCourseTypeID);		
	}

}
