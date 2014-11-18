package com.kingtone.jw.biz.xajw.dao;

import java.util.List;

import com.kingtone.jw.biz.xajw.domain.JwJz;
import com.kingtone.jw.biz.xajw.domain.JwUser;
import com.kingtone.jw.platform.domain.User;

public interface JwUserDAO {

	public List findJwUserList(JwUser user, int skipindex, int maxindex)
			throws Exception;
	public int findJwOnlineUserListCount(JwUser user) throws Exception;
	public List findJwOnlineUserList(JwUser user, int skipindex, int maxindex)
	throws Exception;
	public List findJwList(JwUser user)throws Exception;
	public List findJwJzList(JwJz user, int skipindex, int maxindex)
			throws Exception;

	public List findJwJzList(JwJz user) throws Exception;

	public int findJwUserListCount(JwUser user) throws Exception;

	public int findJwJzListCount(JwJz user) throws Exception;

	public void addJwUser(JwUser user) throws Exception;

	public void addJwJz(JwJz user) throws Exception;

	public void editJwUser(JwUser user) throws Exception;

	public void editJwJz(JwJz user) throws Exception;

	public void delJwUser(String userIds) throws Exception;
	
	public void lockJwUser(JwUser jwUser) throws Exception;
	
	public void delJwJz(String userIds) throws Exception;

	public JwUser findJwUserById(String id) throws Exception;

	public int findJwJzByJwid(String id) throws Exception;

	public int findJwJzByJwJz(JwJz JwJz) throws Exception;

	public JwJz findJwJzById(String id) throws Exception;
	public int findUserByAccount(String account) throws Exception;
	public int findJwUserByJwUser(JwUser user) throws Exception;
	
	public List findJwListStruct(JwUser user)throws Exception;
	public List getUnitJwUser(JwUser user,List allSubUnits) throws Exception;
	public int findByJwUserAccunt(String account) throws Exception;
	public void importJwUser(JwUser jwuser) throws Exception;
	public List getAllJwUser() throws Exception;
	public int isJwPwdChange(JwUser jwuser)throws Exception;
	//根据deviceID查询JwUser ADD BY 韩立强
	public JwUser findJwUserByDeviceID(String sjcm)throws Exception;
}
