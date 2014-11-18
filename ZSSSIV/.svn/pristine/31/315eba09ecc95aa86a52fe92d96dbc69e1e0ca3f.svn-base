/**
 * 文件名：RoleDAO.java
 * 
 * 创建人：邹甲乐 - zoujiale@kingtoneinfo.com
 * 
 * 创建时间：Apr 2, 2011
 * 
 * 版权所有：西安联合信息技术股份有限公司
 */
package com.kingtone.jw.platform.dao;

import java.util.List;

import com.kingtone.jw.platform.domain.Menu;
import com.kingtone.jw.platform.domain.Resource;
import com.kingtone.jw.platform.domain.Role;
import com.kingtone.jw.platform.domain.User;

/**
 * <p>
 * [描述信息：说明类的基本功能]
 * </p>
 * 
 * @author 邹甲乐 - zoujiale@kingtoneinfo.com
 * @version 1.0 Created on Aug 20, 2008 1:34:18 PM
 */
public interface RoleDAO {
	public List<Role> queryRoleList2(Role role_bak) throws Exception;

	public List findRoleList(Role role_bak, int skipindex, int maxindex)
			throws Exception;

	public int findRoleListCount(Role role_bak) throws Exception;

	public void addRole(Role role_bak) throws Exception;

	public void editRole(Role role_bak) throws Exception;

	public void delRole(String roleIds) throws Exception;

	public void deleteRoleUserMapping(String roleIds) throws Exception;

	public void deleteRoleResourceMapping(String roleIds) throws Exception;

	public Role findRoleById(String id) throws Exception;

	public Role findRoleListOfUser(String userId) throws Exception;

	public List findRoleListOfUser(User user_bak) throws Exception;

	public List queryRoleListOfUser(User uer_bak) throws Exception;

	public List queryRoleListOfResource(Resource resource_bak)
			throws Exception;
	
}
