package com.one.sugarcane.publiccoursetype.service;
import java.util.List;

/**
 * 公共课程类别
 * @author 冯海晴
 * @date 2018.5.24
 */
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.one.sugarcane.entity.PublicCourseType;
import com.one.sugarcane.entity.UserInfo;
import com.one.sugarcane.publiccoursetype.dao.PublicCourseTypeDaoImpl;

@Service
@Transactional(readOnly=false)
public class PublicCourseTypeServiceImpl {
	@Resource
	private PublicCourseTypeDaoImpl publicCourseTypeDaoImpl;
	/**
	 * 查询
	 * @author 冯海晴
	 * @date 2018.5.24
	 */
	public List<PublicCourseType> listAll(){
		return this.publicCourseTypeDaoImpl.listAll();
	}
	/**
	 * 查询userHobby
	 * @author 冯海晴
	 * @date 2018.5.30
	 */
	public String listHobby(UserInfo userInfo){
		return this.publicCourseTypeDaoImpl.listHobby(userInfo);
	}
}
