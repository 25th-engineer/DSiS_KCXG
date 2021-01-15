package com.one.sugarcane.sellerinfo.service;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.one.sugarcane.sellerinfo.dao.SellerInfoDaoImpl;
import com.one.sugarcane.entity.Course;
import com.one.sugarcane.entity.PublicCourseType;
import com.one.sugarcane.entity.SellerCourseType;
import com.one.sugarcane.entity.SellerInfo;
import com.one.sugarcane.entity.SellerLogin;

@Service
@Transactional(readOnly=false)
public class SellerInfoServiceImpl {
	@Resource
	private  SellerInfoDaoImpl sellerInfoDaoImpl;
	
	/**
	 * 培训机构注册
	 * @author 张梦洲，狗晟儿，傻崔
	 * @date 2018/4/30
	 */
	public void saveSellerInfo(SellerInfo sellerInfo) {
		sellerInfoDaoImpl.saveSellerInfo(sellerInfo);
	}

	public SellerInfo getpass(String name, String email) {
		
		return sellerInfoDaoImpl.fineByName(name,email);
	}

	public  void updateSellerInfo(SellerInfo sellerinfo) {
		
		sellerInfoDaoImpl.updateSellerInfo(sellerinfo);
	}

public  void resetPassword(String email, String randomPasswordString) {
	
	SellerInfo s = new SellerInfo();
	s = sellerInfoDaoImpl.findByEmail(email);
	
	SellerLogin sl = s.getSellerLogin();
	
	sl.setPassword(randomPasswordString);
	
	sellerInfoDaoImpl.updateSellerInfo(s);
	
}
/**
 * temp 获取所有培训机构
 * @author 王孜润	 
 * @date 2018/5/21
 */
public List<SellerInfo> showOrg() {
	return this.sellerInfoDaoImpl.getOrg();
}

/**
 * 首页获取所有培训机构
 * @author 王孜润	 
 * @date 2018/6/11
 */
public List<SellerInfo> findOrg() {
	return this.sellerInfoDaoImpl.selectOrg();
}
/**
 * 通过id查找seller
 * @name 王孜润
 */
public SellerInfo selectById(int id) {
	return sellerInfoDaoImpl.findById(id);
}
public List<SellerCourseType> findSellerById(int id) {
	return sellerInfoDaoImpl.selectSellerCourseTypeById(id);
	
}
/**
 * 通过SellerId查找course
 * @name 王孜润
 */
public List<Course> findBySellerId(int sellerId1,int page){
	List<Course> list = sellerInfoDaoImpl.findBySellerId(sellerId1,page);

	return list;
}
/**
 * 查询所有课程publicCourseType
 * @author 王孜润
 * @date 2018/5/22
 * **/
public List<PublicCourseType> findTypeAll(){
	List<PublicCourseType> list = sellerInfoDaoImpl.selectAll();	
	return list;
}

/**
 * 删除
 * @author 王孜润
 * @date 2018/5/22
 * **/
public boolean deleteCourseType(int id) {
	return sellerInfoDaoImpl.delete(id);
}
/**
 * 得到页码数
 * @return
 */
	public int getPageCount(int sellerId) {
		if((this.sellerInfoDaoImpl.findRowsCountBySellerID(sellerId))%4==0) {
		    return (int)(this.sellerInfoDaoImpl.findRowsCountBySellerID(sellerId)/4);
		}else {
		    return (int)(this.sellerInfoDaoImpl.findRowsCountBySellerID(sellerId)/4+1);	
		}	
//		 return (int) Math.ceil((this.sellerInfoDaoImpl.findCount(sellerId)/6));		
	}
	/**
	 * 培训机构详情分类列表查询
	 * @author 王孜润
	 * @date 2018/5/30
	 * @param model
	 * @return
	 */
	public List<Course> listByType(int sellerCourseTypeID,int page){
		return sellerInfoDaoImpl.selectType(sellerCourseTypeID,page);	
	}
	/**
	 * 课程分类
	 * @author 王孜润
	 * @date 2018/5/31
	 */
	public List<Course> findTypeId(int sellerCourseTypeID,int sellerId){
		return sellerInfoDaoImpl.findTypeId(sellerCourseTypeID,sellerId);
	}
	/**
	 * 分类查询页码数
	 */
	public int getTypeCoursePageCount(int sellerCourseTypeID) {
		return (int) Math.ceil((this.sellerInfoDaoImpl.findTypeCourseCount(sellerCourseTypeID))/3);
	}	
}
