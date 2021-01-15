package com.one.sugarcane.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;


@Entity
@Table(name="USERCLICKCOURSE")
public class UserClickCourse {
	private Integer id;
	private int uid;
	private int courseId;
	private Integer courseTypeId;
	@Id
	@GeneratedValue(generator="a")
	@GenericGenerator(name="a",strategy="identity")
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) { 
		this.id = id;
	}

	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	public Integer getCourseTypeId() {
		return courseTypeId;
	}
	public void setCourseTypeId(Integer courseTypeId) {
		this.courseTypeId = courseTypeId;
	}

	public UserClickCourse(int uid, int courseId, int courseTypeId) {
		super();
		this.uid = uid;
		this.courseId = courseId;
		this.courseTypeId = courseTypeId;
	}

	public UserClickCourse() {
		super();
	}
	
	
}
