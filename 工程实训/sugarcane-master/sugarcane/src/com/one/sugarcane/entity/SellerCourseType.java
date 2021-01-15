package com.one.sugarcane.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
@Entity
@Table(name="SELLERCOURSETYPE")
public class SellerCourseType {
	
	private Integer sellerCourseTypeID;
	private String courseTypeName2;
	private int hidden;
	private Set<Course>course = new HashSet<Course>();
	private SellerInfo sellerInfo;
	
	@Id
	@GeneratedValue(generator="a")
	@GenericGenerator(name="a",strategy="identity")
	public Integer getSellerCourseTypeID() {
		return sellerCourseTypeID;
	}
	public void setSellerCourseTypeID(Integer sellerCourseTypeID) {
		this.sellerCourseTypeID = sellerCourseTypeID;
	}
	public String getCourseTypeName2() {
		return courseTypeName2;
	}
	public void setCourseTypeName2(String courseTypeName2) {
		this.courseTypeName2 = courseTypeName2;
	}
	public int getHidden() {
		return hidden;
	}
	public void setHidden(int hidden) {
		this.hidden = hidden;
	}
	@OneToMany(mappedBy="sellerCourseType",targetEntity=Course.class,cascade=CascadeType.MERGE)
	public Set<Course> getCourse() {
		return course;
	}
	public void setCourse(Set<Course> course) {
		this.course = course;
	}
	
	@ManyToOne
	@JoinColumn(name="sellerID")
	public SellerInfo getSellerInfo() {
		return sellerInfo;
	}
	public void setSellerInfo(SellerInfo sellerInfo) {
		this.sellerInfo = sellerInfo;
	}
	public SellerCourseType() {}
	public SellerCourseType(String courseTypeName2, int hidden, Set<Course> course,SellerInfo sellerInfo) {
		super();
		this.courseTypeName2 = courseTypeName2;
		this.hidden = hidden;
		this.course = course;
		this.sellerInfo = sellerInfo;
	}
	
	
	
}
