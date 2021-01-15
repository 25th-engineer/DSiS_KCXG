package com.one.sugarcane.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
@Entity
@Table(name="COURSETYPE")
public class CourseType {
	private int courseTypeID;
	private String courseTypeName;
	private Set<PublicCourseType>publicCourseType = new HashSet<PublicCourseType>();
	@Id
	@GeneratedValue(generator="a")
	@GenericGenerator(name="a",strategy="identity")
	public int getCourseTypeID() {
		return courseTypeID;
	}
	public void setCourseTypeID(int courseTypeID) {
		this.courseTypeID = courseTypeID;
	}
	public String getCourseTypeName() {
		return courseTypeName;
	}
	public void setCourseTypeName(String courseTypeName) {
		this.courseTypeName = courseTypeName;
	}
	@OneToMany(mappedBy="courseType",targetEntity=PublicCourseType.class,cascade=CascadeType.MERGE)
	public Set<PublicCourseType> getPublicCourseType() {
		return publicCourseType;
	}
	public void setPublicCourseType(Set<PublicCourseType> publicCourseType) {
		this.publicCourseType = publicCourseType;
	}
	
	
}
