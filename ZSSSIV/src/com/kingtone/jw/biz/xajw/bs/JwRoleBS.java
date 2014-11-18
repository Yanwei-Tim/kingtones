package com.kingtone.jw.biz.xajw.bs;

import java.util.List;

import com.kingtone.jw.biz.xajw.domain.JwMRoleBiz;
import com.kingtone.jw.biz.xajw.domain.JwMRoleRes;
import com.kingtone.jw.biz.xajw.domain.JwRole;
import com.kingtone.jw.platform.domain.Menu;

public interface JwRoleBS {
	public void addJwRole(JwRole jwRole) throws Exception;
	public void updateJwRole(JwRole jwRole) throws Exception;
	public void delJwRole(String jwRoleId) throws Exception;
	public List queryJwRoleList(JwRole jwRole)throws Exception;
	/*根据父节点和角色ID来查BIZ树*/
	public List<Menu> findBizListByParentAndRoleId(JwMRoleBiz jwMRoleBiz)throws Exception;	
	/*根据父节点和角色ID来查RES树*/
	public List<Menu> findResListByBizAndRoleId(JwMRoleRes jwMRoleRes)throws Exception;
	/*权限分配*/
	public void updateJwRoleBizRes(String jwRoleId,String menuCheckedIDstr,String menuUncheckedIDstr,String menuCheckedRestr,String menuUncheckedRestr) throws Exception;
}
