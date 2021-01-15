package com.one.sugarcane.entity;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="SELLERINFO")
public class SellerInfo {
	private Integer sellerID;
	private String sellerName;
	private String sellerEmail;
	private String sellerPhoneNumber;
	private String brief;
	private String numberOfEmployees;
	private String educationBureauApproved;
	private String proofOfHouse;
	private String fireSafetyCertificate;
	private String businessLisense;
	private String address_province;
	private String address_city;
	private String address_area;
	private String address_detail;
	private int qualified;
	private SellerLogin sellerLogin;
	private Set<Course>course = new HashSet<Course>();
	private Set<SellerCourseType> courseType = new HashSet<SellerCourseType>();
 
	@Id
	@GeneratedValue(generator="a")
	@GenericGenerator(name="a",strategy="identity")
	public Integer getSellerID() {
		return sellerID;
	}
	public void setSellerID(Integer sellerID) {
		this.sellerID = sellerID;
	}
	public String getSellerName() {
		return sellerName;
	}
	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}
	public String getSellerEmail() {
		return sellerEmail;
	}
	public void setSellerEmail(String sellerEmail) {
		this.sellerEmail= sellerEmail;
	}
	public String getSellerPhoneNumber() {
		return sellerPhoneNumber;
	}
	public void setSellerPhoneNumber(String sellerPhoneNumber) {
		this.sellerPhoneNumber = sellerPhoneNumber;
	}
	
	public String getBrief() {
		return brief;
	}
	public void setBrief(String brief) {
		this.brief = brief;
	}

	public String getNumberOfEmployees() {
		return numberOfEmployees;
	}
	public void setNumberOfEmployees(String numberOfEmployees) {
		this.numberOfEmployees = numberOfEmployees;
	}
	public String getEducationBureauApproved() {
		return educationBureauApproved;
	}
	public void setEducationBureauApproved(String educationBureauApproved) {
		this.educationBureauApproved = educationBureauApproved;
	}
	public String getProofOfHouse() {
		return proofOfHouse;
	}
	public void setProofOfHouse(String proofOfHouse) {
		this.proofOfHouse = proofOfHouse;
	}
	public String getFireSafetyCertificate() {
		return fireSafetyCertificate;
	}
	public void setFireSafetyCertificate(String fireSafetyCertificate) {
		this.fireSafetyCertificate = fireSafetyCertificate;
	}
	public String getBusinessLisense() {
		return businessLisense;
	}
	public void setBusinessLisense(String businessLisense) {
		this.businessLisense = businessLisense;
	}
	public String getAddress_province() {
		return address_province;
	}
	public void setAddress_province(String address_province) {
		this.address_province = address_province;
	}
	public String getAddress_city() {
		return address_city;
	}
	public void setAddress_city(String address_city) {
		this.address_city = address_city;
	}
	public String getAddress_area() {
		return address_area;
	}
	public void setAddress_area(String address_area) {
		this.address_area = address_area;
	}
	public String getAddress_detail() {
		return address_detail;
	}
	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}
	public int getQualified() {
		return qualified;
	}
	public void setQualified(int qualified) {
		this.qualified = qualified;
	}
	@OneToOne(mappedBy="sellerInfo")
	public SellerLogin getSellerLogin() {
		return sellerLogin;
	}
	public void setSellerLogin(SellerLogin sellerLogin) {
		this.sellerLogin = sellerLogin;
	}
	@OneToMany(mappedBy="sellerInfo",targetEntity=Course.class,cascade=CascadeType.MERGE)
	public Set<Course> getCourse() {
		return course;
	}
	public void setCourse(Set<Course> course) {
		this.course = course;
	}
	@OneToMany(mappedBy="sellerInfo",targetEntity=SellerCourseType.class,cascade=CascadeType.MERGE)
	public Set<SellerCourseType> getCourseType() {
		return courseType;
	}
	public void setCourseType(Set<SellerCourseType> courseType) {
		this.courseType = courseType;
	}
	public SellerInfo() {}
	public SellerInfo(String sellerName, String sellerEmail, String sellerPhoneNumber, String brief,
			String numberOfEmployees, String educationBureauApproved, String proofOfHouse, String fireSafetyCertificate,
			String businessLisense, String address_province, String address_city, String address_area,
			String address_detail, int qualified, SellerLogin sellerLogin,Set<Course> course,Set<SellerCourseType>courseType,Date validatacode,Date outdate) {
		super();
		this.sellerName = sellerName;
		this.sellerEmail = sellerEmail;
		this.sellerPhoneNumber = sellerPhoneNumber;
		this.brief = brief;
		this.numberOfEmployees = numberOfEmployees;
		this.educationBureauApproved = educationBureauApproved;
		this.proofOfHouse = proofOfHouse;
		this.fireSafetyCertificate = fireSafetyCertificate;
		this.businessLisense = businessLisense;
		this.address_province = address_province;
		this.address_city = address_city;
		this.address_area = address_area;
		this.address_detail = address_detail;
		this.qualified = qualified;
		this.sellerLogin = sellerLogin;
		this.course = course;
		this.courseType = courseType;
	}

}
