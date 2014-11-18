package com.kingtone.jw.biz.xajw.dao;

import java.util.List;

import com.kingtone.jw.biz.xajw.domain.JwMRoleBiz;
import com.kingtone.jw.biz.xajw.domain.JwMRoleRes;
import com.kingtone.jw.biz.xajw.domain.JwRole;
import com.kingtone.jw.platform.domain.Menu;

public interface JwRoleDAO {
	public void addJwRole(JwRole jwRole) throws Exception;
	public void editJwRole(JwRole jwRole) throws Exception;
	public void delJwRole(String jwRoleId) throws Exception;
	public List findJwRoleList(JwRole jwRole)throws Exception;
	/*根据角色更新时间*/
	public void editJwRoleCDate(JwRole jwRole) throws Exception;	
	/*根据业务更新角色的更新时间*/
	public void editJwRoleCDateByBiz(JwRole jwRole) throws Exception;
	/*根据父节点和角色ID来查BIZ树*/
	public List<Menu> findBizListByParentAndRoleId(JwMRoleBiz jwMRoleBiz)throws Exception;
	/*根据父节点和角色ID来查RES树*/
	public List<Menu> findResListByBizAndRoleId(JwMRoleRes jwMRoleRes)throws Exception;
	/*增加关系*/
	public void addJwMRoleBiz(JwMRoleBiz jwMRoleBiz) throws Exception;
	/*增加关系*/
	public void addJwMRoleRes(JwMRoleRes jwMRoleRes) throws Exception;
	/*删除关系*/
	public void delJwMRoleBiz(JwMRoleBiz jwMRoleBiz) throws Exception;
	/*删除关系*/
	public void delJwMRoleRes(JwMRoleRes jwMRoleRes) throws Exception;
	/*删除关系*/
	public void delJwMRoleBizByBid(String b_id) throws Exception;
	/*删除关系*/
	public void delJwMRoleResByRidBid(JwMRoleRes jwMRoleRes) throws Exception;
	/*删除关系*/
	public void delJwMRoleResByBid(String b_id) throws Exception;

}
