/**
 * 文件名：PrivilegeDAO.java
 * 
 * 创建人：邹甲乐 - zoujiale@kingtoneinfo.com
 * 
 * 创建时间：Apr 2, 2011
 * 
 * 版权所有：西安联合信息技术股份有限公司
 */
package com.kingtone.jw.platform.dao;

import com.kingtone.jw.platform.domain.RoleRescource;
import com.kingtone.jw.platform.domain.Role;


public interface PrivilegeDAO {

	
	public void deletePrivilege(Role role_bak) throws Exception;

	
	public void deletePrivilegeOfResource(String resourceId) throws Exception;

	
	public void deletePrivilegeOfResource(String[] resourceIds) throws Exception;

	
	public void deletePrivilegeOfRole(String roleIds) throws Exception;

	public void deletePrivilege( RoleRescource  roleRescource_bak); 

	public void deletePrivilegeOfRole(String[] roleIds) throws Exception;

	
	public void insertPrivilege(Role role_bak) throws Exception;

	
	public void updatePrivilege(String roleId, String[] resourceIds) throws Exception;
	
	public void insertPrivilege(RoleRescource roleRescource_bak)throws Exception;
}
