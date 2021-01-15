/**
 * 
 * @auther 杜凯玲
 * @date 2018.5.31
 */
package com.one.sugarcane.course.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

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
@Repository
public class CourseDaoImpl{
	@Resource
	private SessionFactory sessionFactory;
	public UserCollections findCollectionByID(int ID) {
		return this.sessionFactory.getCurrentSession().get(UserCollections.class,ID);
	}

	public List<UserCollections> findUserCollectionsByUserID(int userID,int page){
		Query query=this.sessionFactory.getCurrentSession().createQuery("from UserCollections where userLogin.userID="+userID+"and collecting=1");
		query.setFirstResult((page-1)*6);
		query.setMaxResults(6);	
		return query.list();
		
	}
	public List<UserCollections> findUserCollectionsByUserID(int userID){
		Query query=this.sessionFactory.getCurrentSession().createQuery("from UserCollections where userLogin.userID="+userID+"and collecting=1");
		return query.list();
		
	}
	public int findCollectionsRowsCountByUserID(int userID){
		Query qc=this.sessionFactory.getCurrentSession().createQuery("select COUNT(id) from UserCollections where userLogin.userID="+userID);
		Number number = (Number)qc.uniqueResult();
		int count = number.intValue();
		return count;
		}
	
	/**
	 * 保存一条收藏信息
	 * @param userCollection
	 */
	public void saveUserCollections(UserCollections userCollection) {
		this.sessionFactory.getCurrentSession().saveOrUpdate(userCollection);
	}
	/**
	 * 通过userID查找用户登录信息
	 * @param userID
	 * @return
	 */
	public UserLogin findUserLoginByuserID(int userID){
		Query query = this.sessionFactory.getCurrentSession().createQuery("from UserLogin where userID="+userID);
		return (UserLogin) query.uniqueResult();
	}
	/**
	 * 保存一条评价
	 * @param evaluate
	 */
	public void saveEvaluate(Evaluate evaluate) {
		this.sessionFactory.getCurrentSession().saveOrUpdate(evaluate);
	}
	/**
	 * 通过课程ID查找所有评价
	 * @param courseID
	 * @param page
	 * @return
	 */
	public List<Evaluate> findEvaluateByCourseID(int courseID,int page){
		Query q=this.sessionFactory.getCurrentSession().createQuery("from Evaluate where course.courseID="+courseID);
		q.setFirstResult((page-1)*3);
		q.setMaxResults(3);	
		return q.list();
	}
	/**
	 * 通过课程ID和render查找评价
	 * @param courseID
	 * @param render
	 * @param page
	 * @return
	 */
	public List<Evaluate> findEvaluateByCourseIDAndRender(int courseID,int render,int page){
		Query q=this.sessionFactory.getCurrentSession().createQuery("from Evaluate where course.courseID="+courseID+"and render="+render);
		q.setFirstResult((page-1)*3);
		q.setMaxResults(3);	
		return q.list();
	}
	/**
	 * 通过课程ID计算评价条数
	 * @param courseID
	 * @return
	 */
	public int findEvaluateRowsCountByCourseID(int courseID){
		Query qc=this.sessionFactory.getCurrentSession().createQuery("select COUNT(id) from Evaluate where course.courseID="+courseID);
		Number number = (Number)qc.uniqueResult();
		int count = number.intValue();
		return count;
		}
	/**
	 * 通过课程ID和render计算评价条数
	 * @param courseID
	 * @param render
	 * @return
	 */
	public int findEvaluateRowsCountByCourseIDAndRender(int courseID,int render){
		Query qc=this.sessionFactory.getCurrentSession().createQuery("select COUNT(id) from Evaluate where course.courseID="+courseID+"and render="+render);
		Number number = (Number)qc.uniqueResult();
		int count = number.intValue();
		return count;
		}
///////////////////////////////////////////////////////////////////////////////////////////////
	/**
	 * 查询所有课程
	 * @return
	 */
	public List<Course> findAll(){
		Query q=this.sessionFactory.getCurrentSession().createQuery("from Course");
		return q.list();
	}	
	/**
	 * 分页查询所有课程
	 * @param page
	 * @return
	 */
	public List<Course> findAll(int page){
		Query q=this.sessionFactory.getCurrentSession().createQuery("from Course");
		q.setFirstResult((page-1)*6);
		q.setMaxResults(6);	
		return q.list();
	}	
	/**
	 * 分页查询机构所有课程
	 * @param page
	 * @param sellerID
	 * @return
	 */
	public List<Course>findAll(int page,int sellerID){
		Query q=this.sessionFactory.getCurrentSession().createQuery("from Course where sellerID="+sellerID);
		q.setFirstResult((page-1)*6);
		q.setMaxResults(6);	
		return q.list();
		
	}
	/**
	 * 通过ID查询课程
	 * @param id
	 * @return
	 */
	public Course selectByCourseID(int id) {
		return this.sessionFactory.getCurrentSession().get(Course.class,id);
	}
	/**
	 * 通过公共分类ID查询课程
	 * @param publicTypeID
	 * @return
	 */
	public List<Course> selectByPublicCourseTypeID(int publicTypeID,int page) {
		Query q=this.sessionFactory.getCurrentSession().createQuery("from Course where pub_publicTypeId="+publicTypeID);
		q.setFirstResult((page-1)*6);
		q.setMaxResults(6);	
		return q.list();
	}
	/**
	 * 通过大分类ID查找public分类list
	 * @param courseTypeID
	 * @return
	 */
	public List<PublicCourseType> selectPublicTypeByCourseTypeID(int courseTypeID) {
		Query q=this.sessionFactory.getCurrentSession().createQuery("from PublicCourseType where courseTypeID="+courseTypeID);
		return q.list();
	}
	/**
	 * 查询商家所有分类
	 * @param sellerID
	 * @return
	 */
	public List<SellerCourseType> findSellerCourseType(int sellerID) {
		Query q= this.sessionFactory.getCurrentSession().createQuery("from SellerCourseType where sellerID="+sellerID);
		return q.list();
	}
	/**
	 * 查询所有公共分类
	 * @return
	 */
	public List<PublicCourseType> findPublicCourseType() {
		Query q= this.sessionFactory.getCurrentSession().createQuery("from PublicCourseType");
		return q.list();
	}
	/**
	 * 查询所有公共分类
	 * @return
	 */
	public List<PublicCourseType> findPublicCourseType(int courseTypeID) {
		Query q= this.sessionFactory.getCurrentSession().createQuery("from PublicCourseType where courseTypeID="+courseTypeID);
		return q.list();
	}
	/**
	 * 查询所有分类
	 * @return
	 */
	public List<CourseType> findCourseType() {
		Query q= this.sessionFactory.getCurrentSession().createQuery("from CourseType");
		return q.list();
	}
	/**
	 * 通过ID查询所有分类
	 * @param courseTypeID
	 * @return
	 */
	public CourseType findCourseTypeByID(int courseTypeID) {
		Query q=this.sessionFactory.getCurrentSession().createQuery("from CourseType where courseTypeID="+courseTypeID);
	    return (CourseType) q.uniqueResult();
	}
	/**
	 * 通过ID查询课程商家分类
	 * @param id
	 * @return
	 */
	public SellerCourseType selectSellerCourseTypeByID(int id) {
		return this.sessionFactory.getCurrentSession().get(SellerCourseType.class,id);
	}
	/**
	 * 通过ID查询课程公共分类
	 * @param id
	 * @return
	 */
	public PublicCourseType selectPublicCourseTypeByID(int id) {
		return this.sessionFactory.getCurrentSession().get(PublicCourseType.class,id);
	}
	/**
	 * 通过ID查询商家
	 * @param id
	 * @return
	 */
	public SellerLogin selectSellerByID(int id) {
		return this.sessionFactory.getCurrentSession().get(SellerLogin.class,id);
	}
	/**
	 * 通过ID查询商家信息
	 * @param id
	 * @return
	 */
	public SellerInfo selectSellerInfoByID(int id) {
		return this.sessionFactory.getCurrentSession().get(SellerInfo.class,id);
	}
	
	/**
	 * 通过商家分类分页查询课程
	 * @param page
	 * @param sellerCourseTypeID
	 * @return
	 */
	public List<Course> findCourseBySellerCourseType(int page,int sellerCourseTypeID,int sellerID){
		Query q=this.sessionFactory.getCurrentSession().createQuery("from Course where sellerCourseTypeID="
					+sellerCourseTypeID+"and sellerID="+sellerID);
		q.setFirstResult((page-1)*6);
		q.setMaxResults(6);	
		return q.list();
	}
	/**
	 * 通过大分类查询课程
	 * @param courseTypeID
	 * @param page
	 * @return
	 */
	public List<Course> findCourseByCourseTypeID(int courseTypeID,int page){
		Query q=this.sessionFactory.getCurrentSession().createQuery("from Course where publicCourseType.courseType.courseTypeID="+courseTypeID);
		q.setFirstResult((page-1)*6);
		q.setMaxResults(6);	
		return q.list();
	}
	
	/**
	 * 查询课程总数
	 * @return
	 */
	public int findRowsCount(){
		Query qc=this.sessionFactory.getCurrentSession().createQuery("select COUNT(id) from Course");
		Number number = (Number)qc.uniqueResult();
		int count = number.intValue();
		return count;
		}
	/**
	 * 通过公共分类ID查询课程总数
	 * @param publicTypeID
	 * @return
	 */
	public int findRowsCountByPublicTypeID(int publicTypeID){
		Query qc=this.sessionFactory.getCurrentSession().createQuery("select COUNT(id) from Course where pub_publicTypeID="+publicTypeID);
		Number number = (Number)qc.uniqueResult();
		int count = number.intValue();
		return count;
		}
	/**
	 * 通过SellerID查询课程总数
	 * @param sellerID
	 * @return
	 */
	public int findRowsCountBySellerID(int sellerID){
		Query qc=this.sessionFactory.getCurrentSession().createQuery("select COUNT(id) from Course where sellerID="+sellerID);
		Number number = (Number)qc.uniqueResult();
		int count = number.intValue();
		return count;
		}
	/**
	 * 通过机构课程分类查询课程总数
	 * @param sellerCourseTypeID
	 * @return
	 */
	public int findRowsCountBySellerCourseType(int sellerCourseTypeID){
		Query qc=this.sessionFactory.getCurrentSession().createQuery("select COUNT(id) from Course where sellerCourseTypeID="+sellerCourseTypeID);
		Number number = (Number)qc.uniqueResult();
		int count = number.intValue();
		return count;
		}
	/**
	 * 通过大分类查询课程总数
	 * @param sellerCourseTypeID
	 * @return
	 */
	public int findRowsCountByCourseType(int courseTypeID){
		Query qc=this.sessionFactory.getCurrentSession().createQuery("select COUNT(id) from Course where publicCourseType.courseType.courseTypeID="+courseTypeID);
		Number number = (Number)qc.uniqueResult();
		int count = number.intValue();
		return count;
		}
	
	
	/**
	 * 通过ID删除一门课程
	 * @param id
	 */
	public void deleteCourse(int id) {
		Query q=this.sessionFactory.getCurrentSession().createQuery("delete from Course where id="+id);
		q.executeUpdate();
	}
	/**
	 * 更新一门课程信息
	 * @param course
	 */
	public void updateCourse(Course course) {
		this.sessionFactory.getCurrentSession().saveOrUpdate(course);
	}
	/**
	 * 增加一门课程
	 * @param course
	 */
	public void saveCourse(Course course) {
		this.sessionFactory.getCurrentSession().saveOrUpdate(course);
	}
	/**
	 * 添加用户点击的课程
	 * @param userClickCourse
	 * @author QIN
	 */
	public void saveUserClickCourse(UserClickCourse userClickCourse) {
		this.sessionFactory.getCurrentSession().saveOrUpdate(userClickCourse);
	}
	/**
	 * 查询前四条课程数据
	 * @author qin
	 */
	public List<Course> findFour() {
		Query q = this.sessionFactory.getCurrentSession().createQuery("From Course");
		q.setFirstResult(1);	
		q.setMaxResults(4);
		return q.list();
	}
	/**
	 * 根据用户id查询浏览次数最多的课程
	 * @author qin
	 */
	public int findUserMostLookforById(int a) {
		Query q = this.sessionFactory.getCurrentSession().createQuery("select u.courseId ,count(u.courseId) from UserClickCourse u where u.uid = "+ a +"group by u.courseId");
		List<Object[]> rq = q.list();
		int max = 0;
		int courseId = 0;
		for (Object[] objects : rq) {
			Number c = (Number) objects[1];
			if(c.intValue() >= max) {
				max = c.intValue() ;
			}
		}
		for (Object[] objects : rq) {
			if(max == ((Number)objects[1]).intValue()) {
				courseId = ((Number)objects[0]).intValue();
				break;
			}
		}
		return courseId;
	}
	/**
	 * 查询推荐的课程
	 * @author qin 
	 */
	public List<Course>findCourseForRecommend(int [] b) {
		List<Course> course = new ArrayList<Course>();
		for (int i : b) {
			course.add(this.selectByCourseID(i));
		}
		return course;
	}
	/**
	 * 查询点击数前6的课程
	 * @author qin 
	 */
	public List<Course>formerSixRecommend(){
		Query q = this.sessionFactory.getCurrentSession().createQuery("from UserClickCourse u group by u.courseId order by count(u.courseId) desc");
		List<UserClickCourse> course1 = new ArrayList<UserClickCourse>();
		q.setMaxResults(6);
		course1 = q.list();
		List<Course> course2 = new ArrayList<Course>();
		for (UserClickCourse course : course1) {
			course2.add(this.selectByCourseID(course.getCourseId()));
		}
		return course2;
	}
}
