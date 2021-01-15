package com.one.sugarcane.userinfo.service;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.one.sugarcane.userinfo.dao.UserInfoDaoImpl;
import com.one.sugarcane.entity.PublicCourseType;
import com.one.sugarcane.entity.UserHobby;
import com.one.sugarcane.entity.UserInfo;
import com.one.sugarcane.entity.UserLogin;

/**
 * 
 * @author 张梦洲
 * @throws IOException 
 * @date 2018/5/10
 */

@Service
@Transactional(readOnly=false)
public class UserInfoServiceImpl {
	@Resource
	private UserInfoDaoImpl userInfoDaoImpl;
	
	/**
	 * 用户注册
	 * @author 张梦洲
	 * @date 2018/5/10
	 */
	public void saveUserInfo(UserInfo userInfo) {
		userInfoDaoImpl.saveUserInfo(userInfo);
	}
	/**
	 * 查询publicCourseType
	 * @author 冯海晴
	 * @date 2018.5.24
	 */
	public PublicCourseType findPublicTypeByName(String publicTypeName){
		return this.userInfoDaoImpl.findPublicTypeByName(publicTypeName);
	}
	/**
	 * save用户兴趣爱好userHobby
	 * @author 冯海晴
	 * @date 2018.5.24
	 */
	public void saveUserHobby(UserHobby userHobby) {
		this.userInfoDaoImpl.saveUserHobby(userHobby);
	}
	/**
	 * 用户完善个人信息
	 * @author 冯海晴
	 * @date 2018.5.24
	 */
	public void updateUserInfo(UserInfo userInfo) {
		this.userInfoDaoImpl.updateUserInfo(userInfo);
	}
	/**
	 * 删除兴趣爱好userHobby
	 * @author 冯海晴
	 * @return 
	 * @date 2018.5.24
	 */
	public int deleteUserHobby(UserInfo userInfo) {
		return this.userInfoDaoImpl.deleteUserHobby(userInfo);
	}
	/**
	 * 更新UserLogin
	 * 修改userEmail时，同步修改userLogin中的userEmail
	 * @author 冯海晴
	 * @date 2018.5.28
	 */
	public void updateUserLogin(UserLogin userLogin) {
		this.userInfoDaoImpl.updateUserLogin(userLogin);
	}
}
