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
@Table(name="PUBLICCOURSETYPE")
public class PublicCourseType {
	private Integer publicTypeId;
	private String publicTypeName;
	private int hidden;
	private CourseType courseType;
	private Set<Course>course = new HashSet<Course>();
	private Set<QuestionBank>questionBank = new HashSet<QuestionBank>();
	
	@Id
	@GeneratedValue(generator="a")
	@GenericGenerator(name="a",strategy="identity")
	public Integer getPublicTypeId() {
		return publicTypeId;
	}
	public void setPublicTypeId(Integer publicTypeId) {
		this.publicTypeId = publicTypeId;
	}
	public String getPublicTypeName() {
		return publicTypeName;
	}
	public void setPublicTypeName(String publicTypeName) {
		this.publicTypeName = publicTypeName;
	}
	public int getHidden() {
		return hidden;
	}
	public void setHidden(int hidden) {
		this.hidden = hidden;
	}
	@OneToMany(mappedBy="publicCourseType",targetEntity=Course.class,cascade=CascadeType.MERGE)
	public Set<Course> getCourse() {
		return course;
	}
	public void setCourse(Set<Course> course) {
		this.course = course;
	}
	@OneToMany(mappedBy="publicCourseType",targetEntity=QuestionBank.class,cascade=CascadeType.MERGE)
	public Set<QuestionBank> getQuestionBank() {
		return questionBank;
	}
	public void setQuestionBank(Set<QuestionBank> questionBank) {
		this.questionBank = questionBank;
	}
	public PublicCourseType() {}
	public PublicCourseType(String publicTypeName, int hidden, Set<Course> course, Set<QuestionBank> questionBank) {
		super();
		this.publicTypeName = publicTypeName;
		this.hidden = hidden;
		this.course = course;
		this.questionBank = questionBank;
	}
	@ManyToOne
	@JoinColumn(name="courseTypeID")
	public CourseType getCourseType() {
		return courseType;
	}
	public void setCourseType(CourseType courseType) {
		this.courseType = courseType;
	}
	
	
}
