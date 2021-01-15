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
@Table(name="QUESTIONBANK")
public class QuestionBank {
	private Integer questionID;
	private String questionStem;
	private String option1;
	private String option2;
	private String option3;
	private String option4;
	private String answer;
	private Set<GradeCondition>gradeConditon = new HashSet<GradeCondition>();
	private PublicCourseType publicCourseType;
	@Id
	@GeneratedValue(generator="a")
	@GenericGenerator(name="a",strategy="identity")
	public Integer getQuestionID() {
		return questionID;
	}
	public void setQuestionID(Integer questionID) {
		this.questionID = questionID;
	}
	public String getQuestionStem() {
		return questionStem;
	}
	public void setQuestionStem(String questionStem) {
		this.questionStem = questionStem;
	}
	public String getOption1() {
		return option1;
	}
	public void setOption1(String option1) {
		this.option1 = option1;
	}
	public String getOption2() {
		return option2;
	}
	public void setOption2(String option2) {
		this.option2 = option2;
	}
	public String getOption3() {
		return option3;
	}
	public void setOption3(String option3) {
		this.option3 = option3;
	}
	public String getOption4() {
		return option4;
	}
	public void setOption4(String option4) {
		this.option4 = option4;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	@OneToMany(mappedBy="questionBank",targetEntity=GradeCondition.class,cascade=CascadeType.MERGE)
	public Set<GradeCondition> getGradeConditon() {
		return gradeConditon;
	}
	public void setGradeConditon(Set<GradeCondition> gradeConditon) {
		this.gradeConditon = gradeConditon;
	}
	@ManyToOne 	
	@JoinColumn(name="publicCourseTypeID")
	public PublicCourseType getPublicCourseType() {
		return publicCourseType;
	}
	public void setPublicCourseType(PublicCourseType publicCourseType) {
		this.publicCourseType = publicCourseType;
	}
	public QuestionBank() {}
	public QuestionBank(String questionStem, String option4,String option1,String option2,String option3, String answer, Set<GradeCondition> gradeConditon,
			PublicCourseType publicCourseType) {
		super();
		this.questionStem = questionStem;
		this.option1 = option1;
		this.option2 = option2;
		this.option3 = option3;
		this.option4 = option4;
		this.answer = answer;
		this.gradeConditon = gradeConditon;
		this.publicCourseType = publicCourseType;
	}
	
}
