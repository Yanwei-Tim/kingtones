package com.kingtone.jw.platform.bs.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.kingtone.jw.platform.bs.UserBS;

import com.kingtone.jw.platform.dao.AccountDAO;
import com.kingtone.jw.platform.dao.RoleDAO;
import com.kingtone.jw.platform.dao.UnitDAO;
import com.kingtone.jw.platform.dao.UserDAO;
import com.kingtone.jw.platform.domain.Account;
import com.kingtone.jw.platform.domain.Role;
import com.kingtone.jw.platform.domain.Unit;
import com.kingtone.jw.platform.domain.User;
import com.kingtone.ssi.bizservice.SSIBizService;
import com.kingtone.ssi.util.IDUtil;

public class UserBSImpl extends SSIBizService implements UserBS {
	private UserDAO userDAO;

	private UnitDAO UnitDAO;

	private RoleDAO RoleDAO;

	private AccountDAO AccountDAO;

	public void setUserDAO(UserDAO userDAO) {

		this.userDAO = userDAO;
	}

	public void addUser(User user) throws Exception {
//		 添加用户
		String[] roleIDS = user.getRoleID().split("split");
		
		user.setUserID(IDUtil.newID());
		for (int i = 0; i < roleIDS.length; i++) {
			user.setRoleID(roleIDS[i]);
			userDAO.editUserRoleMapping(user);
		}
		userDAO.addUser(user);
		

		Account account = new Account();
		account.setUser_id(user.getUserID());
		account.setUsername(user.getUsername());
		account.setPassword(user.getPassword());
		account.setDescription("");
		account.setRegister_date(new Date());

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		account.setExpired_date(dateFormat.parse(user.getExpired_date()));
		account.setAccount_id(IDUtil.newID());
		if (user.getLocked().equals("1")) {

			account.setLocked(true);
		} else {
			account.setLocked(false);
		}
		// 添加账户
		AccountDAO.addAccount(account);

		// 添加用户单元映射
		userDAO.edittUserUnitMapping(user);

	}

	public void delUser(String userIds) throws Exception {
		String[] userIdArray = userIds.split("split");
		for (int i = 0; i < userIdArray.length; i++) {
			userDAO.delUser(userIdArray[i]);
			AccountDAO.delAccount(userIdArray[i]);
			userDAO.deleteUserUnitMapping(userIdArray[i]);
			userDAO.deleteUserRoleMapping(userIdArray[i]);
		}

	}

	public void editUser(User user_bak) throws Exception {

		String[] unitIDS = user_bak.getUnitID().split("split");
		String[] roleIDS = user_bak.getRoleID().split("split");
		String[] userIDS = user_bak.getUserID().split("split");
		for (int i = 0; i < userIDS.length; i++) {
			userDAO.deleteUserRoleMapping(userIDS[i]);
			userDAO.deleteUserUnitMapping(userIDS[i]);

		}
		userDAO.editUser(user_bak);
		Account account_bak = new Account();
		account_bak.setAccount_id(user_bak.getAccount_id());
		account_bak.setUser_id(user_bak.getUserID());
		account_bak.setUsername(user_bak.getUsername());
		account_bak.setPassword(user_bak.getPassword());
		if(user_bak.getLocked().equals("1")){
			user_bak.setLocked("true");
		}else{
			user_bak.setLocked("false");
		}
		 boolean b2 = Boolean.parseBoolean(user_bak.getLocked());
		  
		account_bak.setLocked(b2);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		account_bak.setExpired_date(dateFormat.parse(user_bak.getExpired_date()));
		account_bak.setDescription("");
		AccountDAO.editAccount(account_bak);
		for (int i = 0; i < unitIDS.length; i++) {
			user_bak.setUnitID(unitIDS[i]);
			userDAO.edittUserUnitMapping(user_bak);
		}
		for (int i = 0; i < roleIDS.length; i++) {
			user_bak.setRoleID(roleIDS[i]);
			userDAO.editUserRoleMapping(user_bak);
		}

	}

	public User findUserById(String id) throws Exception {

		User user_bak = userDAO.findUserById(id);
		user_bak.setUserID(id);
		List roleList = RoleDAO.findRoleListOfUser(user_bak);
		List unitList = UnitDAO.findUnitListOfUser(user_bak);
		String roleIDS = "";
		String unitIDS = "";
		String roleNames = "";
		String unitNames = "";
		Account account_bak = AccountDAO.findAccountByuserid(id);
		user_bak.setUsername(account_bak.getUsername());
		user_bak.setPassword(account_bak.getPassword());
		user_bak.setAccount_id(account_bak.getAccount_id());
		java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
		user_bak.setExpired_date(df.format(account_bak.getExpired_date()));
		user_bak.setLocked(String.valueOf(account_bak.isLocked()));
		for (int i = 0; i < roleList.size(); i++) {
			Role role_bak = (Role) roleList.get(i);
			roleIDS += role_bak.getRole_id() + "split";
			roleNames += role_bak.getRole_name() + ",";
		}
		for (int i = 0; i < unitList.size(); i++) {
			Unit unit_bak = (Unit) unitList.get(i);
			unitIDS += unit_bak.getUnit_id() + "split";
			unitNames += unit_bak.getUnit_name() + ",";
		}
		user_bak.setRoleID(roleIDS);
		user_bak.setRoleName(roleNames);
		user_bak.setUnitID(unitIDS);
		user_bak.setUnitName(unitNames);

		return user_bak;
	}

	public List findUserList(User loginUser,User user, int skipindex, int maxindex)
			throws Exception {
		// TODO Auto-generated method stub
		return userDAO.findUserList(loginUser,user, skipindex, maxindex);
	}
	
	public List findUserListByUnitId(User user)throws Exception {
	// TODO Auto-generated method stub
	return userDAO.findUserListByUnitId(user);
	}

	
	public List getUnitUser(User user) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.getUnitUser(user);
	}
	/**
	 * @param loginUser 登录用户的初始化信息
	 * @param user      操作用户的信息
	 * @return
	 * @throws Exception
	 */
	public int findUserListCount(User loginUser,User user) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.findUserListCount(loginUser,user);
	}

	public void setAccountDAO(AccountDAO accountDAO) {
		AccountDAO = accountDAO;
	}

	public void setRoleDAO(RoleDAO roleDAO) {
		RoleDAO = roleDAO;
	}

	public void setUnitDAO(UnitDAO unitDAO) {
		UnitDAO = unitDAO;
	}

	public List getAllTuser() throws Exception {
		// TODO Auto-generated method stub
		return userDAO.getAllTuser();
	}

	public int findUserListCountUnit(User user) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.findUserListCountUnit(user);
	}

	public void importUser(User user, Account account) throws Exception {
		Unit unit=this.UnitDAO.findUnitByXzqh1(user.getXzqh());
		user.setUnitID(unit.getUnit_id());
		userDAO.importUser(user);
		userDAO.importaccount(account);
		userDAO.edittUserUnitMapping(user);

	}

	public int findUserListCount1(String userName) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.findUserListCount1(userName);
	}

	public int findUserByFullName(String fullName) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.findUserByFullName(fullName);
	}

	public int findUserByUserName(String UserName) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.findUserByUserName(UserName);
	}

	public int findUserByUser(User user) throws Exception {
		// TODO Auto-generated method stub
		return this.userDAO.findUserByUser(user);
	}

	public String findUserXbList(String id) throws Exception {
		// TODO Auto-generated method stub
		return this.userDAO.findUserXbList(id);
	}

	public String findUserCzList(String id) throws Exception {
		// TODO Auto-generated method stub
		return this.userDAO.findUserCzList(id);
	}

	public int findUserXzqh(String xzqh) throws Exception {
		// TODO Auto-generated method stub
		return this.UnitDAO.findUnitByXzqh(xzqh);
	}

	
	public boolean isPwdChange(User user) throws Exception {
		int n = userDAO.isPswChange(user);
		if(n>=1){
			return false;	
		}else{
			return true;
		}
		
	}



}
