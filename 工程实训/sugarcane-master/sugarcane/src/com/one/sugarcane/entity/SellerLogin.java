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
@Table(name="SELLERLOGIN")
public class SellerLogin {

	private Integer sellerID;
	private String sellerLoginName;
	private String password;
	private String lastTime;
	private String lastIP;
	private Integer forbid=0;
	private Set<Course>course = new HashSet<Course>();
	private SellerInfo sellerInfo;
	private Set<SellerLoginLog>sellerLoginLog = new HashSet<SellerLoginLog>();
	@Id
	@GeneratedValue(generator="a")
	@GenericGenerator(name="a",strategy="identity")
	public Integer getSellerID() {
		return sellerID;
	}
	public void setSellerID(Integer sellerID) {
		this.sellerID = sellerID;
	}
	public String getSellerLoginName() {
		return sellerLoginName;
	}
	public void setSellerLoginName(String sellerLoginName) {
		this.sellerLoginName = sellerLoginName;
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
	@OneToMany(mappedBy="sellerLogin",targetEntity=Course.class,cascade=CascadeType.MERGE)
	public Set<Course> getCourse() {
		return course;
	}
	public void setCourse(Set<Course> course) {
		this.course = course;
	}
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="id")
	public SellerInfo getSellerInfo() {
		return sellerInfo;
	}
	public void setSellerInfo(SellerInfo sellerInfo) {
		this.sellerInfo = sellerInfo;
	}
	@OneToMany(mappedBy="sellerLogin",targetEntity=SellerLoginLog.class,cascade=CascadeType.MERGE)
	public Set<SellerLoginLog> getSellerLoginLog() {
		return sellerLoginLog;
	}

	public void setSellerLoginLog(Set<SellerLoginLog> sellerLoginLog) {
		this.sellerLoginLog = sellerLoginLog;
	}
	public SellerLogin() {}
	public SellerLogin(String sellerLoginName, String password, String lastTime, String lastIP, Set<Course> course,
			SellerInfo sellerInfo, Set<SellerLoginLog> sellerLoginLog) {
		super();
		this.sellerLoginName = sellerLoginName;
		this.password = password;
		this.lastTime = lastTime;
		this.lastIP = lastIP;
		this.course = course;
		this.sellerInfo = sellerInfo;
		this.sellerLoginLog = sellerLoginLog;
	}
	public Integer getForbid() {
		return forbid;
	}
	public void setForbid(Integer forbid) {
		this.forbid = forbid;
	}
	
	
}
