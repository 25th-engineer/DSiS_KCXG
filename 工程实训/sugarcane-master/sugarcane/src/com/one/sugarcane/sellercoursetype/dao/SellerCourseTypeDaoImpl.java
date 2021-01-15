/**
 * 
 * @auther 王孜润
 * @date 2018.4.26
 */
package com.one.sugarcane.sellercoursetype.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import com.one.sugarcane.entity.Course;
import com.one.sugarcane.entity.PublicCourseType;
import com.one.sugarcane.entity.SellerCourseType;
@Repository
public class SellerCourseTypeDaoImpl {
	@Resource
	private SessionFactory sessionFactory;
	/**
	 * 查询方法
	 * @author 王孜润
	 * @date 2018/5/1
	 * **/
	public List<SellerCourseType> select(int page){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Course");
		query.setFirstResult((page-1)*6);
		query.setMaxResults(6);
		return query.list();
//		List<SellerCourseType> list = query.list();
//		return list;
	}
	/**
	 * 查询课程数
	 * @return
	 */
	public int findCount() {
		Query fc=this.sessionFactory.getCurrentSession().createQuery("select COUNT(courseID) from Course");	
		Number number = (Number)fc.uniqueResult();
		int count = number.intValue();
		return count;		 
	}
	/**
	 * 插入方法
	 * @author 王孜润
	 * @date 2018/5/7
	 * **/
	public boolean insert(Course course) {
		
		Session session = sessionFactory.getCurrentSession();
		session.save(course);
		return true;
	}
	/**
	 * 删除方法
	 * @author 王孜润
	 * @date 2018/5/1
	 * **/
	public boolean delete(int id) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Query query = session.createQuery("delete from Course where courseID=?");
		query.setParameter(0, id);
		query.executeUpdate();
		
		tx.commit();
		session.close();
		return true;
	}
	/**
	 * 修改方法
	 * @author 王孜润
	 * @date 2018/5/15
	 * **/
	public boolean update(SellerCourseType sellerCourseType) {
		Session session = sessionFactory.getCurrentSession();
		session.update(sellerCourseType);
		return true;
	}
	/**
	 * 
	 * @param id
	 * @return
	 */
	public SellerCourseType selectById(int id) {
		Session session = sessionFactory.getCurrentSession();
		SellerCourseType sellerCourseType = (SellerCourseType)session.get(SellerCourseType.class,id);
		return sellerCourseType;
	}
	/**
	 * 查询所有课程publicCourseType
	 * @author 王孜润
	 * @date 2018/5/6
	 * **/
	public List<PublicCourseType> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from PublicCourseType");
		List<PublicCourseType> list = query.list();
		return list;
	}
	/**
	 * 查询该企业的课程publicCourseType
	 * @author 王孜润
	 * @date 2018/5/6
	 * **/
//	public List<PublicCourseType> findBySellerId(int sellerId) {
//		Session session = sessionFactory.getCurrentSession();
//		Query query = session.createQuery("from Course where sellerInfo.sellerID=?");
//		query.setParameter(0, sellerId);
//		List<PublicCourseType> list = query.list();
//		return list;
//	}
	
	/**
	 * 查询课程类型
	 * @author 王孜润
	 * @date 2018/5/10
	 * **/
	public List<PublicCourseType> selectByName(String name){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from PublicCourseType where publicTypeName=?");
		query.setParameter(0, name);
		List<PublicCourseType> list = query.list();
		return list;
	}
	/**
	 * 登录后根据id查询培训机构课程
	 * @author 王孜润
	 * @param sellerCourseTypeID 
	 * @date 2018/5/16
	 */
	public List<SellerCourseType> selectBySellerId(int page,int sellerID, int sellerCourseTypeID){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Course where sellerCourseeTypeID="+sellerCourseTypeID+"and sellerID="+sellerID);
		query.setFirstResult((page-1)*6);
		query.setMaxResults(6);
		return query.list();
	}
	/**
	 * 分页查询机构所有课程
	 * @param page
	 * @param sellerID
	 * @return
	 */
	public List<SellerCourseType>findAll(int page,int sellerID){
		Query q=this.sessionFactory.getCurrentSession().createQuery("from Course where sellerID="+sellerID);
		q.setFirstResult((page-1)*6);
		q.setMaxResults(6);	
		return q.list();
	}
	/**
	 * 查询商家所有分类
	 * @param sellerID
	 * @return
	 */
	public List<Course> findSellerCourseType(int sellerID) {
		Query q= this.sessionFactory.getCurrentSession().createQuery("from SellerCourseType where sellerID="+sellerID);
		return q.list();
	}
}
