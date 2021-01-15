package com.one.sugarcane.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
@Entity
@Table(name="SELLERLOGINLOG")
public class SellerLoginLog {

	private Integer ID;
	private String time;
	private String IP;
	private SellerLogin sellerLogin;
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
	@JoinColumn(name="sellerID")
	public SellerLogin getSellerLogin() {
		return sellerLogin;
	}
	public void setSellerLogin(SellerLogin sellerLogin) {
		this.sellerLogin = sellerLogin;
	}
	public SellerLoginLog() {}
	public SellerLoginLog(String time, String iP, SellerLogin sellerLogin) {
		super();
		this.time = time;
		IP = iP;
		this.sellerLogin = sellerLogin;
	}
	
}
