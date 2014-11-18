package com.kingtone.jw.platform.bs;

import java.util.List;


import com.kingtone.jw.platform.domain.Account;
import com.kingtone.jw.platform.domain.User;


public interface UserBS {

	public List findUserList(User loginUser,User user, int skipindex, int maxindex)
			throws Exception;
	public List findUserListByUnitId(User user)throws Exception;
	/**
	 * @param loginUser 登录用户的初始化信息
	 * @param user      操作用户的信息
	 * @return
	 * @throws Exception
	 */
	public int findUserListCount( User loginUser,User user) throws Exception;
	public int findUserListCount1(String userName) throws Exception;
	public int findUserXzqh(String xzqh) throws Exception;
	public int findUserListCountUnit(User user) throws Exception;

	public void addUser(User user) throws Exception;
	

	public void editUser(User user) throws Exception;

	public void delUser(String userIds) throws Exception;

	public List getUnitUser(User user) throws Exception;
	public User findUserById(String id) throws Exception;
	public List getAllTuser() throws Exception;
	public void importUser(User user,Account account) throws Exception;
	public int findUserByFullName(String fullName) throws Exception;
	public int findUserByUserName(String UserName) throws Exception;
	public int findUserByUser(User user) throws Exception;
	public String findUserCzList(String id) throws Exception;
	public String findUserXbList(String id) throws Exception;
	
	public boolean isPwdChange(User user)throws Exception;
	
}
