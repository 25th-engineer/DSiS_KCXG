package com.one.sugarcane.adminlogin.dao;
import java.util.List;

/**
 * 管理员登录
 * @author 冯海晴
 * @date 2018.6.7
 */
import javax.annotation.Resource;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import com.one.sugarcane.entity.AdminLogin;
import com.one.sugarcane.entity.SellerInfo;
import com.one.sugarcane.entity.SellerLogin;
import com.one.sugarcane.entity.UserInfo;
import com.one.sugarcane.entity.UserLogin;
@Repository
public class AdminLoginDaoImpl {
	@Resource
	private SessionFactory sessionFactory;
	/**
	 * 管理员登录
	 * @author 冯海晴
	 * @date 2018.6.7
	 * @return
	 */
	public AdminLogin login(String adminName) {
		Query query = this.sessionFactory.getCurrentSession().createQuery("from AdminLogin a where a.adminName=?").setParameter(0, adminName);
		List<AdminLogin> lista = query.list();
		if(lista.size()!=0) {
			AdminLogin adminLogin = lista.get(0);
			System.out.println("dao层:"+adminLogin.getAdminName());
			return adminLogin;
		}
		return null;
	}
	/**
	 * 遍历用户
	 * @author 冯海晴
	 * @date 2018.6.7
	 */
	public List<UserInfo> listUser(){
		String hql = "from UserInfo";
		List<UserInfo> listUser = this.sessionFactory.getCurrentSession().createQuery(hql).list();
		return listUser;
	}
	/**
	 * 分页遍历用户
	 * @author 冯海晴
	 * @date 2018.6.7
	 */
	public List<UserInfo> listUserPage(int pageIndex,int pageSize){
		int first = (pageIndex-1)*pageSize;
		String hql = "from UserInfo u order by u.userID asc";
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);
		query.setFirstResult(first);
		query.setMaxResults(pageSize);
		return query.list();
	}
	/**
	 * 遍历机构
	 * @author 冯海晴
	 * @date 2018.6.7
	 */
	public List<SellerInfo> listSeller(){
		String hql = "from SellerInfo";
		List<SellerInfo> listSeller = this.sessionFactory.getCurrentSession().createQuery(hql).list();
		return listSeller;
	}
	/**
	 * 分页遍历机构
	 * @author 冯海晴
	 * @date 2018.6.7
	 */
	public List<SellerInfo> listSellerPage(int pageIndex,int pageSize){
		int first = (pageIndex-1)*pageSize;
		String hql = "from SellerInfo s order by s.sellerID asc";
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);
		query.setFirstResult(first);
		query.setMaxResults(pageSize);
		return query.list();
	}
	/**
	 * 通过用户名搜索
	 * @author 冯海晴
	 * @date 2018.6.12
	 */
	public List<UserInfo> listUserName(String userName){
		String hql="from UserInfo u where u.userName like '%"+userName+"%'";
		List<UserInfo> listUser = this.sessionFactory.getCurrentSession().createQuery(hql).list();
		return listUser;
	}
	/**
	 * 通过机构名搜索
	 * @author 冯海晴
	 * @date 2018.6.12
	 */
	public List<SellerInfo> listSellerName(String sellerName){
		String hql="from SellerInfo s where s.sellerName like '%"+sellerName+"%'";
		List<SellerInfo> listSeller = this.sessionFactory.getCurrentSession().createQuery(hql).list();
		return listSeller;
	}
	/**
	 * 通过id查找用户
	 * @author feng
	 * @date 2018.6.15
	 */
	public UserInfo findUserById(int userID) {
		return this.sessionFactory.getCurrentSession().get(UserInfo.class, userID);
	}
	/**
	 * 通过id查找机构
	 * @author feng
	 * @date 2018.6.15
	 */
	public SellerInfo findSellerById(int sellerID) {
		return this.sessionFactory.getCurrentSession().get(SellerInfo.class, sellerID);
	}
	/**
	 * 更新用户禁用属性
	 * @author feng
	 * @date 2018.6.15
	 */
	public void updateUserForbid(UserLogin ul, UserInfo user) {
		this.sessionFactory.getCurrentSession().update(ul);
		this.sessionFactory.getCurrentSession().update(user);
	}
	/**
	 * 更新机构禁用属性
	 * @author feng
	 * @date 2018.6.15
	 */
	public void updateSellerForbid(SellerLogin sl, SellerInfo seller) {
		this.sessionFactory.getCurrentSession().update(sl);
		this.sessionFactory.getCurrentSession().update(seller);
	}
	/**
	 * 查找禁用用户/遍历禁用用户
	 * @author feng
	 * @date 2018.6.15
	 */
	public String listUserforbid(){
		String hql = "from UserLogin ul where ul.forbid = 1";
		List<UserLogin> listUL = this.sessionFactory.getCurrentSession().createQuery(hql).list();
		StringBuffer userforbid = new StringBuffer();
		for(UserLogin ul : listUL){
			userforbid.append(ul.getUserID());
			userforbid.append(",");
		}
		String usersforbids = userforbid.toString();
		return usersforbids;
	}
	/**
	 * 查找禁用机构/遍历禁用机构
	 * @author feng
	 * @date 2018.6.15
	 */
	public String listsellerforbid(){
		String hql = "from SellerLogin sl where sl.forbid = 1";
		List<SellerLogin> listSL = this.sessionFactory.getCurrentSession().createQuery(hql).list();
		StringBuffer sellerforbid = new StringBuffer();
		for(SellerLogin sl : listSL){
			sellerforbid.append(sl.getSellerID());
			sellerforbid.append(",");
		}
		String sellerforbids = sellerforbid.toString();
		return sellerforbids;
	}
	/**
	 * 退出登录
	 * @author feng
	 * @date 2018.6.17
	 */
	public void logoff(){
		Session session = this.sessionFactory.getCurrentSession();
		session.close();
	}
}
