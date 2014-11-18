package com.kingtone.androidpn.server.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.kingtone.androidpn.server.bs.UserNotFoundException;
import com.kingtone.androidpn.server.dao.UserPNDAO;
import com.kingtone.androidpn.server.domain.User;
import com.kingtone.jw.biz.xajw.domain.JwVideo;
import com.kingtone.ssi.dao.SSIOrmDao;

public class UserPNDAOImpl extends SSIOrmDao implements UserPNDAO{

	public boolean findByID(String id) throws Exception {
		// TODO Auto-generated method stub
		User user = (User)this.getSqlMapClientTemplate().queryForObject("existeUserPN", id);
		return user != null;
	}

	public User findUserByID(String id) throws Exception {
		// TODO Auto-generated method stub
		return (User)this.getSqlMapClientTemplate().queryForObject("findUserPNByID", id);
	}

	public List<User> findUserList(User user,int skipindex, int maxindex) throws Exception {
		// TODO Auto-generated method stub
		List list = new ArrayList();
		list = this.getSqlMapClientTemplate().queryForList("findUserPNList",user, skipindex, maxindex);
		return list;
	}

	public User findUserByUsername(String userName) throws UserNotFoundException {
		// TODO Auto-generated method stub
		return (User)this.getSqlMapClientTemplate().queryForObject("findUserPNByUsername" , userName);
	}

	public void deleteUser(String id) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().delete("deleteUserPN", id);
	}

	public void addUser(User user) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().insert("addUserPN", user);
	}

	public void editUser(User user) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().update("editUserPN", user);
	}

	public int findUserPNCount(User user) throws Exception {
		// TODO Auto-generated method stub
		int i = 0;
		i = (Integer)this.getSqlMapClientTemplate().queryForList("findUserPNCount", user).get(0);
		return i;
	}
	
}
