/**
 * 文件名：UserDAO.java
 * 
 * 创建人：邹甲乐 - zoujiale@kingtoneinfo.com
 * 
 * 创建时间：Apr 2, 2011
 * 
 * 版权所有：西安联合信息技术股份有限公司
 */
package com.kingtone.jw.platform.dao;

import java.util.List;

import com.kingtone.jw.platform.domain.Account;
import com.kingtone.jw.platform.domain.User;

/**
 * <p>
 * [描述信息：说明类的基本功能]
 * </p>
 * 
 * @author ｚｈａｎｇｚｈａｎｂｏ - ｚｈａｎｇｚｈａｎｂｏ@kingtoneinfo.com
 * @version 1.0 Created on ｊｕｌｙ 20, 20１１ 1:34:18 PM
 */
public interface UserDAO {

	public List findUserList(User loginUser,User user, int skipindex, int maxindex)
			throws Exception;
	public List findUserListByUnitId(User user)throws Exception;

	public int findUserListCount(User loginUser,User user) throws Exception;

	public int findUserListCountUnit(User user) throws Exception;

	public void addUser(User user) throws Exception;

	public void editUser(User user) throws Exception;

	public void editUserRoleMapping(User user) throws Exception;

	public void edittUserUnitMapping(User users) throws Exception;

	public void delUser(String userIds) throws Exception;

	public void deleteUserUnitMapping(String userIds) throws Exception;

	public void deleteUserRoleMapping(String userIds) throws Exception;

	public User findUserById(String id) throws Exception;

	public User queryUserByuserId(String userid);

	public List getAllTuser() throws Exception;
	public List getUnitUser(User user) throws Exception;
	public void importUser(User user) throws Exception;

	public void importaccount(Account account) throws Exception;

	public int findUserListCount1(String userName) throws Exception;
	public int findUserByFullName(String fullName) throws Exception;
	public int findUserByUserName(String UserName) throws Exception;
	public int findUserByUser(User user) throws Exception;
	public String findUserXbList(String id) throws Exception;
	public String findUserCzList(String id) throws Exception;
	public int isPswChange(User user) throws Exception;
	
	
}  
