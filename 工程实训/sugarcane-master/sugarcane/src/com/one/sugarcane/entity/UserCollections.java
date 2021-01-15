package com.one.sugarcane.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
@Entity
@Table(name="USERCOLLECTIONS")
public class UserCollections {
	private Integer ID;
	private String collectTime;
	private int collecting;
	private int collected;
	private int collectionCount;
	private UserLogin userLogin;
	private Course course;
	@Id
	@GeneratedValue(generator="a")
	@GenericGenerator(name="a",strategy="identity")
	public Integer getID() {
		return ID;
	}
	public void setID(Integer iD) {
		ID = iD;
	}
	public String getCollectTime() {
		return collectTime;
	}
	public void setCollectTime(String collectTime) {
		this.collectTime = collectTime;
	}
	public int getCollecting() {
		return collecting;
	}
	public void setCollecting(int collecting) {
		this.collecting = collecting;
	}
	public int getCollected() {
		return collected;
	}
	public void setCollected(int collected) {
		this.collected = collected;
	}
	public int getCollectionCount() {
		return collectionCount;
	}
	public void setCollectionCount(int collectionCount) {
		this.collectionCount = collectionCount;
	}
	@ManyToOne
	@JoinColumn(name="userID")
	public UserLogin getUserLogin() {
		return userLogin;
	}
	public void setUserLogin(UserLogin userLogin) {
		this.userLogin = userLogin;
	}
	@ManyToOne
	@JoinColumn(name="courseID")
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public UserCollections() {}
	public UserCollections(String collectTime, int collecting, int collected, int collectionCount, UserLogin userLogin,
			Course course) {
		super();
		this.collectTime = collectTime;
		this.collecting = collecting;
		this.collected = collected;
		this.collectionCount = collectionCount;
		this.userLogin = userLogin;
		this.course = course;
	}
	
}
