package com.one.sugarcane.entity;
/**
 * 添加用户爱好表
 * @author 冯海晴
 * @date 2018.5.24
 */
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="USERHOBBY")
public class UserHobby {
	private Integer hobbyID;
	private UserInfo userInfo;
	private PublicCourseType publicType;
	@Id
	@GeneratedValue(generator="a")
	@GenericGenerator(name="a",strategy="identity")
	public Integer getHobbyID() {
		return hobbyID;
	}
	public void setHobbyID(Integer hobbyID) {
		this.hobbyID = hobbyID;
	}
	@ManyToOne
	@JoinColumn(name="userID")
	public UserInfo getUserInfo() {
		return userInfo;
	}
	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}
	@ManyToOne
	@JoinColumn(name="publicTypeID")
	public PublicCourseType getPublicType() {
		return publicType;
	}
	public void setPublicType(PublicCourseType publicType) {
		this.publicType = publicType;
	}
	
	public UserHobby() {};
	public UserHobby(Integer hobbyID, UserInfo userInfo, PublicCourseType publicType) {
		super();
		this.hobbyID = hobbyID;
		this.userInfo = userInfo;
		this.publicType = publicType;
	};
}