package com.kingtone.jw.biz.xajw.dao.impl;

import java.util.List;

import com.kingtone.jw.biz.xajw.dao.JwRoleDAO;
import com.kingtone.jw.biz.xajw.domain.JwMRoleBiz;
import com.kingtone.jw.biz.xajw.domain.JwMRoleRes;
import com.kingtone.jw.biz.xajw.domain.JwRole;
import com.kingtone.jw.platform.domain.Menu;
import com.kingtone.ssi.dao.SSIOrmDao;

public class JwRoleDAOImpl extends SSIOrmDao implements JwRoleDAO{

	
	public void addJwRole(JwRole jwRole) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().insert("addJwRole", jwRole);
	}

	
	public void delJwRole(String jwRoleId) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().delete("delJwRole", jwRoleId);
	}

	
	public void editJwRole(JwRole jwRole) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().update("editJwRole", jwRole);
	}
	/*根据角色更新时间*/
	public void editJwRoleCDate(JwRole jwRole) throws Exception{
		this.getSqlMapClientTemplate().update("editJwRoleCDate", jwRole);
	}
	
	/*根据业务更新角色的更新时间*/
	public void editJwRoleCDateByBiz(JwRole jwRole) throws Exception{
		this.getSqlMapClientTemplate().update("editJwRoleCDateByBiz", jwRole);
	}
	
	
	public List findJwRoleList(JwRole jwRole) throws Exception {
		// TODO Auto-generated method stub
		List list=this.getSqlMapClientTemplate().queryForList(
				"findJwRoleList", jwRole);
		return list;
	}
	/*根据父节点和角色ID来查BIZ树*/
	public List<Menu> findBizListByParentAndRoleId(JwMRoleBiz jwMRoleBiz)throws Exception{
		return this.getSqlMapClientTemplate().queryForList("findBizListByParentAndRoleId", jwMRoleBiz);
	}
	/*根据父节点和角色ID来查RES树*/
	public List<Menu> findResListByBizAndRoleId(JwMRoleRes jwMRoleRes)throws Exception{
		return this.getSqlMapClientTemplate().queryForList("findResListByBizAndRoleId", jwMRoleRes);
	}
	/*增加关系*/
	public void addJwMRoleBiz(JwMRoleBiz jwMRoleBiz) throws Exception{
		this.getSqlMapClientTemplate().insert("addJwMRoleBiz", jwMRoleBiz);
	}
	/*增加关系*/
	public void addJwMRoleRes(JwMRoleRes jwMRoleRes) throws Exception{
		this.getSqlMapClientTemplate().insert("addJwMRoleRes", jwMRoleRes);
	}
	/*删除关系*/
	public void delJwMRoleBiz(JwMRoleBiz jwMRoleBiz) throws Exception{
		this.getSqlMapClientTemplate().delete("delJwMRoleBiz", jwMRoleBiz);
	}
	/*删除关系*/
	public void delJwMRoleRes(JwMRoleRes jwMRoleRes) throws Exception{
		this.getSqlMapClientTemplate().delete("delJwMRoleRes", jwMRoleRes);
	}
	/*删除关系*/
	public void delJwMRoleBizByBid(String b_id) throws Exception{
		this.getSqlMapClientTemplate().delete("delJwMRoleBizByBid", b_id);
	}
	/*删除关系*/
	public void delJwMRoleResByRidBid(JwMRoleRes jwMRoleRes) throws Exception{
		this.getSqlMapClientTemplate().delete("delJwMRoleResByRidBid", jwMRoleRes);
	}
	/*删除关系*/
	public void delJwMRoleResByBid(String b_id) throws Exception{
		this.getSqlMapClientTemplate().delete("delJwMRoleResByBid", b_id);
	}
}
