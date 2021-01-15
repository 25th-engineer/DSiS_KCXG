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
@Table(name="ADMINLOGIN")
public class AdminLogin {
	private Integer adminID;
	private String adminName;
	private String password;
	private Set<Part>set = new HashSet<Part>();
	@Id
	@GeneratedValue(generator="a")
	@GenericGenerator(name="a",strategy="identity")
	public Integer getAdminID() {
		return adminID;
	}
	public void setAdminID(Integer adminID) {
		this.adminID = adminID;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@OneToMany(mappedBy="adminLogin",targetEntity=Part.class,cascade=CascadeType.MERGE)
	public Set<Part> getSet() {
		return set;
	}
	public void setSet(Set<Part> set) {
		this.set = set;
	}
	public AdminLogin() {}
	public AdminLogin(String adminName, String password, Set<Part> set) {
		super();
		this.adminName = adminName;
		this.password = password;
		this.set = set;
	}
	
	
}
