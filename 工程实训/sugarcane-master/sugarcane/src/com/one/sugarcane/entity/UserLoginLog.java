package com.one.sugarcane.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
@Entity
@Table(name="USERLOGINLOG")
public class UserLoginLog {
	private Integer ID;
	private String time;
	private String IP;
	private UserLogin userLogin;
	@Id
	@GeneratedValue(generator="a")
	@GenericGenerator(name="a",strategy="identity")
	public Integer getID() {
		return ID;
	}
	public void setID(Integer iD) {
		ID = iD;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getIP() {
		return IP;
	}
	public void setIP(String iP) {
		IP = iP;
	}
	@ManyToOne
	@JoinColumn(name="userID")
	public UserLogin getUserLogin() {
		return userLogin;
	}
	public void setUserLogin(UserLogin userLogin) {
		this.userLogin = userLogin;
	}
	public UserLoginLog() {}
	public UserLoginLog(String time, String iP, UserLogin userLogin) {
		super();
		this.time = time;
		IP = iP;
		this.userLogin = userLogin;
	}
	
}
