/**
 * 
 * @auther 杜凯玲
 * @date 2018.5.31
 */
package com.one.sugarcane.course.service;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.query.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.one.sugarcane.course.dao.CourseDaoImpl;
import com.one.sugarcane.entity.Course;
import com.one.sugarcane.entity.CourseType;
import com.one.sugarcane.entity.Evaluate;
import com.one.sugarcane.entity.PublicCourseType;
import com.one.sugarcane.entity.SellerCourseType;
import com.one.sugarcane.entity.SellerInfo;
import com.one.sugarcane.entity.SellerLogin;
import com.one.sugarcane.entity.UserClickCourse;
import com.one.sugarcane.entity.UserCollections;
import com.one.sugarcane.entity.UserLogin;

@Service
@Transactional(readOnly=false)

public class CourseServiceImpl {
	@Resource
	private CourseDaoImpl courseDaoImpl;
	public UserCollections findCollectionByID(int ID) {
		return this.courseDaoImpl.findCollectionByID(ID);
	}

	public List<UserCollections> findUserCollectionsByUserID(int userID,int page){
		return this.courseDaoImpl.findUserCollectionsByUserID(userID,page);
	}
	public List<UserCollections> findUserCollectionsByUserID(int userID){
		return this.courseDaoImpl.findUserCollectionsByUserID(userID);
	}
	public int getcollectionsPageCountByUserID(int userID) {
        if((this.courseDaoImpl.findCollectionsRowsCountByUserID(userID))%6==0) {
		    return (int)(this.courseDaoImpl.findCollectionsRowsCountByUserID(userID)/6);
		}else {
		    return (int)(this.courseDaoImpl.findCollectionsRowsCountByUserID(userID)/6+1);	
		}	
	}
	public void saveUserCollections(UserCollections userCollection) {
		this.courseDaoImpl.saveUserCollections(userCollection);
	}
	
	public UserLogin findUserLoginByuserID(int userID) {
		return this.courseDaoImpl.findUserLoginByuserID(userID);
	}
	public void saveEvaluate(Evaluate evaluate) {
		this.courseDaoImpl.saveEvaluate(evaluate);
	}
	/**
	 * 通过课程ID查询评价
	 * @param courseID
	 * @param page
	 * @return
	 */
	public List<Evaluate> listEvaluateByCourseID(int courseID,int page){
		return this.courseDaoImpl.findEvaluateByCourseID(courseID, page);
	}
	/**
	 * 通过课程ID和render查询评价
	 * @param courseID
	 * @param render
	 * @param page
	 * @return
	 */
	public List<Evaluate> listEvaluateByCourseIDAndRender(int courseID,int render,int page){
		return this.courseDaoImpl.findEvaluateByCourseIDAndRender(courseID,render, page);
	}
	/**
	 * 通过课程ID确定评价页数
	 * @param courseID
	 * @return
	 */
	public int getEvaluatePageCountByCourse(int courseID) {
        if((this.courseDaoImpl.findEvaluateRowsCountByCourseID(courseID))%3==0) {
		    return (int)(this.courseDaoImpl.findEvaluateRowsCountByCourseID(courseID)/3);
		}else {
		    return (int)(this.courseDaoImpl.findEvaluateRowsCountByCourseID(courseID)/3+1);	
		}	
	}
	/**
	 * 通过课程ID和render确定评价页数
	 * @param courseID
	 * @param render
	 * @return
	 */
	public int getEvaluatePageCountByCourseAndRender(int courseID,int render) {
        if((this.courseDaoImpl.findEvaluateRowsCountByCourseIDAndRender(courseID,render))%3==0) {
		    return (int)(this.courseDaoImpl.findEvaluateRowsCountByCourseIDAndRender(courseID,render)/3);
		}else {
		    return (int)(this.courseDaoImpl.findEvaluateRowsCountByCourseIDAndRender(courseID,render)/3+1);	
		}	
	}
///////////////////////////////////////////////////////////////////////////////////////////////
	/**
	 * 查询所有课程
	 * @return
	 */
	public List<Course> listAll(){
		return this.courseDaoImpl.findAll();
	}
	/**
	 * 分页查找所有课程
	 * @param page
	 * @return
	 */
	public List<Course> listAll(int page){
		return this.courseDaoImpl.findAll(page);
	}
	/**
	 * 分页查询所有该机构课程
	 * @param page
	 * @param sellerID
	 * @return
	 */
	public List<Course> listAll(int page,int sellerID){
		return this.courseDaoImpl.findAll(page,sellerID);
	}
	public List<SellerCourseType> listSellerCourseType(int sellerID){
		return this.courseDaoImpl.findSellerCourseType(sellerID);
	}
	/**
	 *  通过商家分类分页查询课程
	 * @param page
	 * @param sellerCourseTypeID
	 * @return
	 */
	public List<Course> listCourseBySellerCourseType(int page,int sellerCourseTypeID,int sellerID){
		return this.courseDaoImpl.findCourseBySellerCourseType(page,sellerCourseTypeID,sellerID);
	}
	/**
	 * 通过公共分类ID查询课程
	 * @param page
	 * @param publicTypeID
	 * @return
	 */
	public List<Course> listCourseByPublicCourseType(int page,int publicTypeID){
		return this.courseDaoImpl.selectByPublicCourseTypeID(publicTypeID, page);
	}
	/**
	 * 通过ID查询课程商家分类
	 * @param id
	 * @return
	 */
	public SellerCourseType selectSellerCourseTypeByID(int id) {
		return this.courseDaoImpl.selectSellerCourseTypeByID(id);
	}
	/**
	 * 通过ID查询课程公共分类
	 * @param id
	 * @return
	 */
	public PublicCourseType selectPublicCourseTypeByID(int id) {
		return this.courseDaoImpl.selectPublicCourseTypeByID(id);
	}
	/**
	 * 查询所有公共分类
	 * @return
	 */
	public List<PublicCourseType> selectPublicCourseType() {
		return this.courseDaoImpl.findPublicCourseType();
	}
	/**
	 * 查询所有公共分类
	 * @return
	 */
	public List<PublicCourseType> selectPublicCourseType(int courseTypeID) {
		return this.courseDaoImpl.findPublicCourseType(courseTypeID);
	}
	
	/**
	 * 查询所有分类
	 * @return
	 */
	public List<CourseType> selectCourseType() {
		return this.courseDaoImpl.findCourseType();
	}
	/**
	 * 通过ID查询所有分类
	 * @param courseTypeID
	 * @return
	 */
	public CourseType selectCourseTypeByID(int courseTypeID) {
		return this.courseDaoImpl.findCourseTypeByID(courseTypeID);
	}
	/**
	 * 通过大分类ID查找public分类list
	 * @param courseTypeID
	 * @return
	 */
	public List<PublicCourseType> findPublicTypeByCourseTypeID(int courseTypeID) {
		return this.courseDaoImpl.selectPublicTypeByCourseTypeID(courseTypeID);
	}
	/**
	 * 通过ID查询商家
	 * @param id
	 * @return
	 */
	public SellerLogin selectSellerByID(int id) {
		return this.courseDaoImpl.selectSellerByID(id);
	}
	
	/**
	 * 通过ID查询商家信息
	 * @param id
	 * @return
	 */
	public SellerInfo selectSellerInfoByID(int id) {
		return this.courseDaoImpl.selectSellerInfoByID(id);
	}
	/**
	 * 删除一门课程
	 * @param id
	 */
	public void deleteOneCourse(int id) {
		this.courseDaoImpl.deleteCourse(id);
	}
	/**
	 * 更新一门课程
	 * @param cake
	 */
	public void updateOneCourse(Course course) {
		this.courseDaoImpl.updateCourse(course);
	}
	/**
	 * 增加课程
	 * @param cake
	 */
	public void addOneCourse(Course course) {
		this.courseDaoImpl.saveCourse(course);
	}
	/**
	 * 通过id查询课程
	 * @return
	 */
	public Course getCourseById(int id) {
	return this.courseDaoImpl.selectByCourseID(id);
	}
	/**
	 * 通过大分类查询课程
	 * @param courseTypeID
	 * @param page
	 * @return
	 */
	public List<Course> listCourseByCourseTypeID(int courseTypeID,int page){
		return this.courseDaoImpl.findCourseByCourseTypeID(courseTypeID,page);
	}
	/**
	 * 得到总页码数
	 * @return
	 */
	public int getPageCount() {
        if((this.courseDaoImpl.findRowsCount())%6==0) {
		    return (int)(this.courseDaoImpl.findRowsCount()/6);
		}else {
		    return (int)(this.courseDaoImpl.findRowsCount()/6+1);	
		}	
	}
	/**
	 * 得到商家分类后课程总页码数
	 * @param sellerCourseTypeID
	 * @return
	 */
	public int getPageCountBySellerCourseType(int sellerCourseTypeID) {
        if((this.courseDaoImpl.findRowsCountBySellerCourseType(sellerCourseTypeID))%6==0) {
		    return (int)(this.courseDaoImpl.findRowsCountBySellerCourseType(sellerCourseTypeID)/6);
		}else {
		    return (int)(this.courseDaoImpl.findRowsCountBySellerCourseType(sellerCourseTypeID)/6+1);	
		}	
	}
	/**
	 * 得到商家ID后课程总页码数
	 * @param sellerID
	 * @return
	 */
	public int getPageCountBySeller(int sellerID) {
        if((this.courseDaoImpl.findRowsCountBySellerID(sellerID))%6==0) {
		    return (int)(this.courseDaoImpl.findRowsCountBySellerID(sellerID)/6);
		}else {
		    return (int)(this.courseDaoImpl.findRowsCountBySellerID(sellerID)/6+1);	
		}	
	}
	/**
	 * 得到公共分类后课程总页码数
	 * @param publicTypeID
	 * @return
	 */
	public int getPageCountByPublicCourseType(int publicTypeID) {
        if((this.courseDaoImpl.findRowsCountByPublicTypeID(publicTypeID))%6==0) {
		    return (int)(this.courseDaoImpl.findRowsCountByPublicTypeID(publicTypeID)/6);
		}else {
		    return (int)(this.courseDaoImpl.findRowsCountByPublicTypeID(publicTypeID)/6+1);	
		}	
	}
	/**
	 * 得到公共分类后课程总页码数
	 * @param publicTypeID
	 * @return
	 */
	public int getPageCountByCourseType(int courseTypeID) {
        if((this.courseDaoImpl.findRowsCountByCourseType(courseTypeID))%6==0) {
		    return (int)(this.courseDaoImpl.findRowsCountByCourseType(courseTypeID)/6);
		}else {
		    return (int)(this.courseDaoImpl.findRowsCountByCourseType(courseTypeID)/6+1);	
		}	
	}
	/**
	 * 用户点击某个课程就插入数据库
	 * @author qin
	 */
	public void insert(int userId,int courseId,int a) {
		UserClickCourse c = new UserClickCourse(userId,courseId,a);
		this.courseDaoImpl.saveUserClickCourse(c);
	}
	/**
	 * 显示首页用户点击过数量最多的四门课程作为推荐(没有登录的时候)
	 */
	public List mainfest() {
		return this.courseDaoImpl.findFour();
	}
	/**
	 * 显示首页用户点击过数量最多的课程(登录的时候)
	 */
	public int mainfestMostCourseById(int id) {
		return this.courseDaoImpl.findUserMostLookforById(id);
	}
	/**
	 * 显示首页用户推荐的课程(登录的时候)
	 */
	public List<Course>mainfestCourseByRecommend(int [] b) { 
		return this.courseDaoImpl.findCourseForRecommend(b);
	}
	/**
	 * 点击量前6的课程
	 */
	public List<Course>six(){
		return this.courseDaoImpl.formerSixRecommend();
	}
}
