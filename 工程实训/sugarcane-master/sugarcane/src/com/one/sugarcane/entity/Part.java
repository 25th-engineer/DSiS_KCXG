package com.one.sugarcane.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
@Entity
@Table(name="PART")
public class Part {
	private Integer partID;
	private String roleName;
	private int have;
	private AdminLogin adminLogin;
	private Set<Power> power = new HashSet<Power>();
	@Id
	@GeneratedValue(generator="a")
	@GenericGenerator(name="a",strategy="identity")
	public Integer getPartID() {
		return partID;
	}
	public void setPartID(Integer partID) {
		this.partID = partID;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public int getHave() {
		return have;
	}
	public void setHave(int have) {
		this.have = have;
	}
	@ManyToOne
	@JoinColumn(name="adminID")
	public AdminLogin getAdminLogin() {
		return adminLogin;
	}
	public void setAdminLogin(AdminLogin adminLogin) {
		this.adminLogin = adminLogin;
	}
	@ManyToMany
	@JoinTable(name="RELATIONSHIP",joinColumns=@JoinColumn(name="partID"),
			inverseJoinColumns=@JoinColumn(name="powerID"))
	public Set<Power> getPower() {
		return power;
	}
	public void setPower(Set<Power> power) {
		this.power = power;
	}
	public Part() {}
	public Part(String roleName, int have, AdminLogin adminLogin, Set<Power> power) {
		super();
		this.roleName = roleName;
		this.have = have;
		this.adminLogin = adminLogin;
		this.power = power;
	}
	
}
