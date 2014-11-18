package com.kingtone.jw.biz.xajw.dao.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.kingtone.jw.biz.common.domain.Spcj;
import com.kingtone.jw.biz.xajw.dao.JwUserDAO;
import com.kingtone.jw.biz.xajw.domain.JwJz;
import com.kingtone.jw.biz.xajw.domain.JwUser;
import com.kingtone.jw.platform.domain.Unit;
import com.kingtone.ssi.dao.SSIOrmDao;

public class JwUserDAOImpl extends SSIOrmDao implements JwUserDAO {

	public void addJwUser(JwUser user) throws Exception {
		this.getSqlMapClientTemplate().insert("addJwUser", user);

	}

	public void addJwJz(JwJz user) throws Exception {
		this.getSqlMapClientTemplate().insert("addJwJz", user);

	}

	public void delJwUser(String userIds) throws Exception {
		this.getSqlMapClientTemplate().delete("delJwUser", userIds);

	}
	
	public void lockJwUser(JwUser jwUser) throws Exception {
		this.getSqlMapClientTemplate().update("updateJwUserLockState", jwUser);
	}

	public void delJwJz(String userIds) throws Exception {
		this.getSqlMapClientTemplate().delete("delJwJz", userIds);

	}

	public void editJwUser(JwUser user) throws Exception {
		this.getSqlMapClientTemplate().update("editJwUser", user);

	}

	public void editJwJz(JwJz jwJz) throws Exception {
		this.getSqlMapClientTemplate().update("editJwJz", jwJz);

	}

	public JwUser findJwUserById(String id) throws Exception {
		// TODO Auto-generated method stub
		return (JwUser) this.getSqlMapClientTemplate().queryForObject(
				"findJwUserById", id);
	}

	public int findJwJzByJwid(String id) throws Exception {
		// TODO Auto-generated method stub
		return Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"findJwJzByJwid", id).toString());
	}

	public int findJwJzByJwJz(JwJz jwjz) throws Exception {
		// TODO Auto-generated method stub
		return Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"findJwJzByJwJz", jwjz).toString());
	}

	public JwJz findJwJzById(String id) throws Exception {
		// TODO Auto-generated method stub
		return (JwJz) this.getSqlMapClientTemplate().queryForObject(
				"findJwJzById", id);
	}

	public List findJwUserList(JwUser jwUser, int skipindex, int maxindex)
			throws Exception {
		
		List list =new ArrayList();
//		list=this.getSqlMapClientTemplate().queryForList("findJwUserList",jwUser,skipindex,maxindex);  //2012.2.10权限修改
		list=this.getSqlMapClientTemplate().queryForList("findJwUserList",jwUser);
		return list;

	}
	public List findJwOnlineUserList(JwUser jwUser, int skipindex, int maxindex)
	throws Exception {

		List list;


		list = this.getSqlMapClientTemplate().queryForList("findJwOnlineUserList",jwUser, skipindex, maxindex);


		return list;
}
	public int findJwOnlineUserListCount(JwUser jwUser) throws Exception {
		int n = Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"findJwOnlineUserListCount", jwUser).toString());
		return n;
	}
	public List findJwJzList(JwJz jwUser, int skipindex, int maxindex)
			throws Exception {
		List list;

		list = this.getSqlMapClientTemplate().queryForList("findJwJzList",
				jwUser, skipindex, maxindex);
		return list;
	}

	public List findJwJzList(JwJz jwUser) throws Exception {
		List list = this.getSqlMapClientTemplate().queryForList("findJwJzList",
				jwUser);
		return list;
	}

	public int findJwUserListCount(JwUser jwUser) throws Exception {
		int n=0;
		n = (Integer)this.getSqlMapClientTemplate().queryForList("findJwUserListCount",jwUser).get(0);
		return n;
	}

	public int findJwJzListCount(JwJz jwUser) throws Exception {
		int n = Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"findJwJzListCount", jwUser).toString());
		return n;
	}

	public int findUserByAccount(String account) throws Exception {
		return Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"findUserByAccount", account).toString());
	}

	public int findJwUserByJwUser(JwUser user) throws Exception {
//		 TODO Auto-generated method stub
		return Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"findJwUserByJwUser", user).toString());
	}

	public List findJwList(JwUser user) throws Exception {
		List list =new ArrayList();
		list=this.getSqlMapClientTemplate().queryForList(
				"findJwUserList", user);
		return list;
	}

	public List findJwListStruct(JwUser user) throws Exception {
		List list =new ArrayList();
		list=this.getSqlMapClientTemplate().queryForList(
				"findJwUserListStruct", user);
		return list;
	}

	public int findByJwUserAccunt(String account) throws Exception {
		return Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"findByJwUserAccunt", account).toString());
	}

	public List getAllJwUser() throws Exception {
		return this.getSqlMapClientTemplate().queryForList("getAllJwUser");
	}

	public void importJwUser(JwUser jwuser) throws Exception {
		this.getSqlMapClientTemplate().insert("importJwUser", jwuser);
		
	}

	public int isJwPwdChange(JwUser jwuser) throws Exception {
		int n = Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"isJwPswChange", jwuser).toString());
		return n;
	}

	
	public List getUnitJwUser(JwUser user,List allSubUnits) throws Exception {
		List list =new ArrayList();
		list=this.getSqlMapClientTemplate().queryForList("getUnitJwUser",user);
		StringBuffer condtion =new StringBuffer();
		List nodeAll=allSubUnits;
		int num = 1;
		for(Object o:nodeAll){
			Unit subUnit =(Unit) o;
			if(num==999){
				condtion.append("'"+subUnit.getXzqh()+"')");
				condtion.append(" or s.xzqh in(");
				num=1;
			}else{
				condtion.append("'"+subUnit.getXzqh()+"',");
				num++;
			}
		}
		String tmpCondtion=condtion.toString();
		tmpCondtion=tmpCondtion.substring(0,tmpCondtion.length()-1);
		user.setXzqh(tmpCondtion);
		List subList = this.getSqlMapClientTemplate().queryForList("getAllJwUser",user);
		for(Iterator subIt=subList.iterator();subIt.hasNext();){
			list.add((JwUser)subIt.next());
		}
		return list;
	}
	//根据deviceID查询JwUser ADD BY 韩立强
	public JwUser findJwUserByDeviceID(String sjcm) throws Exception {
		// TODO Auto-generated method stub
		return (JwUser)this.getSqlMapClientTemplate().queryForObject("findJwUserByDeviceID", sjcm);
	}

}
