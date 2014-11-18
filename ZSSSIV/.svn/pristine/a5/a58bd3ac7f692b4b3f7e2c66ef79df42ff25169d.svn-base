package com.kingtone.jw.biz.xajw.bs.impl;

import java.util.List;

import com.kingtone.jw.biz.xajw.bs.JwUserBS;
import com.kingtone.jw.biz.xajw.dao.JwUserDAO;
import com.kingtone.jw.biz.xajw.domain.JwJz;
import com.kingtone.jw.biz.xajw.domain.JwUser;
import com.kingtone.jw.platform.dao.UnitDAO;
import com.kingtone.jw.platform.domain.User;


import com.kingtone.ssi.bizservice.SSIBizService;
import com.kingtone.ssi.util.IDUtil;

public class JwUserBSImpl extends SSIBizService implements JwUserBS {
	public JwUserDAO jwUserDAO;
	public UnitDAO unitDAO;
	public void setJwUserDAO(JwUserDAO jwUserDAO) {
		this.jwUserDAO = jwUserDAO;
	}

	public void addJwUser(JwUser user) throws Exception {
		user.setId(IDUtil.newID());
		this.jwUserDAO.addJwUser(user);

	}

	public void addJwJz(JwJz user) throws Exception {
		//user.setId(IDUtil.newID());
		this.jwUserDAO.addJwJz(user);

	}

	public void delJwUser(String userIds) throws Exception {
		this.jwUserDAO.delJwUser(userIds);

	}
	
	public void lockJwUser(JwUser jwUser) throws Exception {
		this.jwUserDAO.lockJwUser(jwUser);

	}

	public void delJwJz(String userIds) throws Exception {
		this.jwUserDAO.delJwJz(userIds);

	}

	public void editJwUser(JwUser user) throws Exception {
		this.jwUserDAO.editJwUser(user);

	}

	public void editJwJz(JwJz user) throws Exception {
		this.jwUserDAO.editJwJz(user);

	}
	public List findJwOnlineUserList(JwUser user, int skipindex, int maxindex)
	throws Exception {
// TODO Auto-generated method stub
return jwUserDAO.findJwOnlineUserList(user, skipindex, maxindex);
}
	public int findJwOnlineUserListCount(JwUser user) throws Exception {
		// TODO Auto-generated method stub
		return jwUserDAO.findJwOnlineUserListCount(user);
	}
	public List findJwUserList(JwUser user, int skipindex, int maxindex)
			throws Exception {
		// TODO Auto-generated method stub
		return jwUserDAO.findJwUserList(user, skipindex, maxindex);
	}

	public List findJwJzList(JwJz user, int skipindex, int maxindex)
			throws Exception {
		// TODO Auto-generated method stub
		return jwUserDAO.findJwJzList(user, skipindex, maxindex);
	}

	public List findJwJzList(JwJz user) throws Exception {
		// TODO Auto-generated method stub
		return jwUserDAO.findJwJzList(user);
	}

	public int findJwUserListCount(JwUser user) throws Exception {
		// TODO Auto-generated method stub
		return jwUserDAO.findJwUserListCount(user);
	}

	public int findJwJzListCount(JwJz user) throws Exception {
		// TODO Auto-generated method stub
		return jwUserDAO.findJwJzListCount(user);
	}

	public JwUser findJwUserById(String id) throws Exception {
		// TODO Auto-generated method stub
		return this.jwUserDAO.findJwUserById(id);
	}

	public int findJwJzByJwid(String id) throws Exception {
		// TODO Auto-generated method stub
		return this.jwUserDAO.findJwJzByJwid(id);
	}

	public int findJwJzByJwJz(JwJz jwjz) throws Exception {
		// TODO Auto-generated method stub
		return this.jwUserDAO.findJwJzByJwJz(jwjz);
	}

	public JwJz findJwJzById(String id) throws Exception {
		// TODO Auto-generated method stub
		return this.jwUserDAO.findJwJzById(id);
	}

	public int findUserByAccount(String account) throws Exception {
		// TODO Auto-generated method stub
		return this.jwUserDAO.findUserByAccount(account);
	}

	public int findJwUserByJwUser(JwUser user) throws Exception {
		// TODO Auto-generated method stub
		return this.jwUserDAO.findJwUserByJwUser(user);
	}

	public List findJwList(JwUser user) throws Exception {
		// TODO Auto-generated method stub
		return this.jwUserDAO.findJwList(user);
	}

	public List findJwListStrut(JwUser user) throws Exception {
		// TODO Auto-generated method stub
		return this.jwUserDAO.findJwListStruct(user);
	}

	public int findByJwUserAccunt(String account) throws Exception {
		
		return this.jwUserDAO.findByJwUserAccunt(account);
	}

	public List getAllJwUser() throws Exception {
		// TODO Auto-generated method stub
		return this.jwUserDAO.getAllJwUser();
	}

	public void importJwUser(JwUser jwuser) throws Exception {
		this.jwUserDAO.importJwUser(jwuser);
		
	}

	
	public boolean isJwPwdChange(JwUser jwuser) throws Exception {
		int n = jwUserDAO.isJwPwdChange(jwuser);
		if(n>=1){
			return false;	
		}else{
			return true;
		}
	}

	
	public List getUnitJwUser(User user,JwUser jwUser) throws Exception {
		List allSubUnits = unitDAO.findAllSubUnitsByParentId(user.getUnitID());
		return jwUserDAO.getUnitJwUser(jwUser, allSubUnits);
	}

	public void setUnitDAO(UnitDAO unitDAO) {
		this.unitDAO = unitDAO;
	}
	
}
