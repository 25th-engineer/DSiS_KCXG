package com.one.sugarcane.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="GEADECONDITION")
public class GradeCondition {

	private Integer id;
	private String answer;
	private String correctAnswer;
	private int questionGrade;
	private QuestionBank questionBank;
	@Id
	@GeneratedValue(generator="a")
	@GenericGenerator(name="a",strategy="identity")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getCorrectAnswer() {
		return correctAnswer;
	}
	public void setCorrectAnswer(String correctAnswer) {
		this.correctAnswer = correctAnswer;
	}
	public int getQuestionGrade() {
		return questionGrade;
	}
	public void setQuestionGrade(int questionGrade) {
		this.questionGrade = questionGrade;
	}
	@ManyToOne
	@JoinColumn(name="questionID")
	public QuestionBank getQuestionBank() {
		return questionBank;
	}
	public void setQuestionBank(QuestionBank questionBank) {
		this.questionBank = questionBank;
	}
	public GradeCondition() {}
	public GradeCondition(String answer, String correctAnswer, int questionGrade, QuestionBank questionBank) {
		super();
		this.answer = answer;
		this.correctAnswer = correctAnswer;
		this.questionGrade = questionGrade;
		this.questionBank = questionBank;
	}
	
	
}
