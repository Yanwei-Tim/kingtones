package com.kingtone.androidpn.server.bs.impl;

import java.util.List;

import com.kingtone.androidpn.server.bs.UserNotFoundException;
import com.kingtone.androidpn.server.bs.UserPNBS;
import com.kingtone.androidpn.server.dao.UserPNDAO;
import com.kingtone.androidpn.server.domain.User;


public class UserPNBSImpl implements UserPNBS{
	private UserPNDAO userPNDAO;
	

	public void setUserPNDAO(UserPNDAO userPNDAO) {
		this.userPNDAO = userPNDAO;
	}

	public void addUser(User user) throws Exception {
		// TODO Auto-generated method stub
		this.userPNDAO.addUser(user);
	}

	public void deleteUser(String id) throws Exception {
		// TODO Auto-generated method stub
		this.userPNDAO.deleteUser(id);
	}

	public void editUser(User user) throws Exception {
		// TODO Auto-generated method stub
		this.userPNDAO.editUser(user);
	}

	public boolean findByID(String id) throws Exception {
		// TODO Auto-generated method stub
		return this.userPNDAO.findByID(id);
	}

	public User findUserByID(String id) throws Exception {
		// TODO Auto-generated method stub
		return this.userPNDAO.findUserByID(id);
	}

	public User findUserByUsername(String username) throws UserNotFoundException {
		// TODO Auto-generated method stub
		return this.userPNDAO.findUserByUsername(username);
	}

	public List<User> findUserList(User user,int skipindex, int maxindex) throws Exception {
		// TODO Auto-generated method stub
		return this.userPNDAO.findUserList(user, skipindex, maxindex);
	}

	public int findUserPNCount(User user) throws Exception {
		// TODO Auto-generated method stub
		return this.userPNDAO.findUserPNCount(user);
	}
	
}
