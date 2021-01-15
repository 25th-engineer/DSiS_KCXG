package com.one.sugarcane.publiccoursetype.dao;

import java.util.List;
import javax.annotation.Resource;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import com.one.sugarcane.entity.PublicCourseType;
import com.one.sugarcane.entity.UserInfo;

/**
 * 公共课程类别
 * @author 冯海晴
 * @date 2018.5.24
 */
@Repository
public class PublicCourseTypeDaoImpl {
	@Resource
	private SessionFactory sessionFactory;
	/**
	 * 查询
	 * @author 冯海晴
	 * @date 2018.5.24
	 */
	public List<PublicCourseType> listAll(){
		//课程默认不隐藏，为0
		String hql = "FROM PublicCourseType WHERE hidden=0";
		List<PublicCourseType> listAll = this.sessionFactory.getCurrentSession().createQuery(hql).list();
		return listAll;
	}
	/**
	 * 查询userHobby
	 * @author 冯海晴
	 * @date 2018.5.30
	 */
	public String listHobby(UserInfo userInfo){
 		StringBuffer checkbox = new StringBuffer();
		String hql = "select uh.publicType from UserHobby uh where uh.userInfo = ?";
		List<PublicCourseType> publicTypes = this.sessionFactory.getCurrentSession().createQuery(hql).setParameter(0, userInfo).list();
		for(PublicCourseType publicType : publicTypes){
			String name = publicType.getPublicTypeName();
			checkbox.append(name);
			checkbox.append(",");
		}
		String checkboxs = checkbox.toString();
		return checkboxs;
	}
}
