package com.one.sugarcane.userinfo.dao;

import javax.annotation.Resource;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

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
@Repository
public class UserInfoDaoImpl {
	@Resource
	private SessionFactory sessionFactory;
	
	/**
	 * 培训机构注册
	 * @author 张梦洲
	 * @date 2018/4/30
	 */
	public void saveUserInfo(UserInfo userInfo) {
		this.sessionFactory.getCurrentSession().save(userInfo);
		this.sessionFactory.getCurrentSession().save(userInfo.getUserLogin());
	}
	/**
	 * 查询publicCourseType
	 * @author 冯海晴
	 * @date 2018.5.24
	 */
	public PublicCourseType findPublicTypeByName(String publicTypeName){
		String hql = "FROM PublicCourseType where publicTypeName = ?";
		return (PublicCourseType) this.sessionFactory.getCurrentSession().createQuery(hql).setParameter(0, publicTypeName).list().get(0);
	}
	/**
	 * save用户兴趣爱好userHobby
	 * @author 冯海晴
	 * @date 2018.5.24
	 */
	public void saveUserHobby(UserHobby userHobby) {
		this.sessionFactory.getCurrentSession().save(userHobby);
	}
	/**
	 * 用户完善个人信息
	 * @author 冯海晴
	 * @date 2018.5.24
	 */
	public void updateUserInfo(UserInfo userInfo) {
		this.sessionFactory.getCurrentSession().update(userInfo);
	}
	/**
	 * 删除兴趣爱好userHobby
	 * @author 冯海晴
	 * @date 2018.5.24
	 */
	public int deleteUserHobby(UserInfo userInfo) {
		String hql = "DELETE FROM UserHobby WHERE userInfo = ?";
		return this.sessionFactory.getCurrentSession().createQuery(hql).setParameter(0, userInfo).executeUpdate();
	}
	/**
	 * 更新userLogin
	 * 修改userEmail时，同步修改userLogin中的userEmail
	 * @author 冯海晴
	 * @date 2018.5.28
	 */
	public void updateUserLogin(UserLogin userLogin) {
		this.sessionFactory.getCurrentSession().update(userLogin);
	}
}
