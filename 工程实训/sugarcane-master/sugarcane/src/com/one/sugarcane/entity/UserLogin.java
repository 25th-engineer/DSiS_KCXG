package com.one.sugarcane.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
@Entity
@Table(name="USERLOGIN")
public class UserLogin {
	private Integer userID;
	private String userEmail;
	private String password;
	private String lastTime;
	private String lastIP;
	private Integer forbid=0;
	private Set<UserCollections>userCollections = new HashSet<UserCollections>();
	private UserInfo userInfo;
	private Set<UserLoginLog>userLoginLog = new HashSet<UserLoginLog>();
	@Id
	@GeneratedValue(generator="a")
	@GenericGenerator(name="a",strategy="identity")
	public Integer getUserID() {
		return userID;
	}
	public void setUserID(Integer userID) {
		this.userID = userID;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getLastTime() {
		return lastTime;
	}
	public void setLastTime(String lastTime) {
		this.lastTime = lastTime;
	}
	public String getLastIP() {
		return lastIP;
	}
	public void setLastIP(String lastIP) {
		this.lastIP = lastIP;
	}
	@OneToMany(mappedBy="userLogin",targetEntity=UserCollections.class,cascade=CascadeType.MERGE)
	public Set<UserCollections> getUserCollections() {
		return userCollections;
	}
	public void setUserCollections(Set<UserCollections> userCollections) {
		this.userCollections = userCollections;
	}
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="id")
	public UserInfo getUserInfo() {
		return userInfo;
	}
	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}
	@OneToMany(mappedBy="userLogin",targetEntity=UserLoginLog.class,cascade=CascadeType.MERGE)
	public Set<UserLoginLog> getUserLoginLog() {
		return userLoginLog;
	}
	public void setUserLoginLog(Set<UserLoginLog> userLoginLog) {
		this.userLoginLog = userLoginLog;
	}
	public UserLogin() {}
	public UserLogin(String userEmail, String password, String lastTime, String lastIP,
			Set<UserCollections> userCollections, UserInfo userInfo, Set<UserLoginLog> userLoginLog) {
		super();
		this.userEmail = userEmail;
		this.password = password;
		this.lastTime = lastTime;
		this.lastIP = lastIP;
		this.userCollections = userCollections;
		this.userInfo = userInfo;
		this.userLoginLog = userLoginLog;
	}
	public Integer getForbid() {
		return forbid;
	}
	public void setForbid(Integer forbid) {
		this.forbid = forbid;
	}
	
}
