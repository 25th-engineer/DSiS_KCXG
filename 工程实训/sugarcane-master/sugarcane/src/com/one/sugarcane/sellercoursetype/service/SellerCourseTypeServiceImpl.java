/**
 * 
 * @auther 王孜润
 * @date 2018.4.26
 */
package com.one.sugarcane.sellercoursetype.service;

import java.util.List;
import javax.annotation.Resource;

import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.one.sugarcane.entity.Course;
import com.one.sugarcane.entity.PublicCourseType;
import com.one.sugarcane.entity.SellerCourseType;
import com.one.sugarcane.sellercoursetype.dao.SellerCourseTypeDaoImpl;
import com.one.sugarcane.test.service.TestService;

@Service
@Transactional(readOnly=false)
public class SellerCourseTypeServiceImpl {
	@Resource
	private SellerCourseTypeDaoImpl sellerCourseTypeDaoImpl; 
	
	/**
	 * 查询所有
	 * @author 王孜润
	 * @date 2018/5/1
	 * **/
	public List<SellerCourseType> findAll(int page){
//		List<SellerCourseType> list = sellerCourseTypeDaoImpl.select();	
//		return list;
		return this.sellerCourseTypeDaoImpl.select(page);
	}
	/**
	 * 通过Name查询type
	 * @author 王孜润
	 * @date 2018/5/10
	 * **/
	public List<PublicCourseType> findByName(String name){
		return this.sellerCourseTypeDaoImpl.selectByName(name);
	}
	
	
	/**
	 * 得到页码数
	 * @return
	 */
		public int getPageCount() {
			 return (int) Math.ceil((this.sellerCourseTypeDaoImpl.findCount()/6));		
		}
	/**
	 * 增加 
	 * @author 王孜润
	 * @date 2018/5/7
	 * **/
	public boolean addNewCourseType(Course course) {
		return sellerCourseTypeDaoImpl.insert(course);
	}
	/**
	 * 删除
	 * @author 王孜润
	 * @date 2018/5/1
	 * **/
	public boolean deleteCourseType(int id) {
		return sellerCourseTypeDaoImpl.delete(id);
	}
	/**
	 * 修改 
	 * @author 王孜润
	 * @date 2018/5/15
	 * **/
	public boolean updateCourseType(SellerCourseType sellerCourseType) {
		return sellerCourseTypeDaoImpl.update(sellerCourseType);
	}
	public SellerCourseType selectById(int id) {
		return sellerCourseTypeDaoImpl.selectById(id);
	}
	/**
	 * 查询所有课程publicCourseType
	 * @author 王孜润
	 * @date 2018/5/6
	 * **/
	public List<PublicCourseType> findTypeAll(){
		List<PublicCourseType> list = sellerCourseTypeDaoImpl.selectAll();	
		return list;
	}
	/**
	 * 登录后根据id查询培训机构课程
	 * @author 王孜润
	 * @date 2018/5/16
	 */
	public List<SellerCourseType> findBySellerId(int page,int sellerID,int sellerCourseTypeID){
		return this.sellerCourseTypeDaoImpl.selectBySellerId(page,sellerID,sellerCourseTypeID);
	}
	/**
	 * 分页查询培训机构课程
	 * @param page
	 * @param sellerID
	 * @return
	 */
	public List<SellerCourseType> listAll(int page,int sellerID){
		return this.sellerCourseTypeDaoImpl.findAll(page,sellerID);
	}
	public List<Course> listSellerCourseType(int sellerID){
		return this.sellerCourseTypeDaoImpl.findSellerCourseType(sellerID);
	}
}
