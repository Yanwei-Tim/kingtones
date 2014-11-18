package com.kingtone.jw.platform.dao.impl;

import com.kingtone.jw.platform.dao.PrivilegeDAO;
import com.kingtone.jw.platform.domain.RoleRescource;
import com.kingtone.jw.platform.domain.Role;
import com.kingtone.ssi.dao.SSIOrmDao;

public class PrivilegeDAOImpl extends SSIOrmDao implements PrivilegeDAO {

	public void deletePrivilege(Role role_bak) throws Exception {
		// TODO Auto-generated method stub

	}

	public void deletePrivilegeOfResource(String resourceId) throws Exception {
		// TODO Auto-generated method stub

	}

	public void deletePrivilegeOfResource(String[] resourceIds)
			throws Exception {
		// TODO Auto-generated method stub

	}

	public void deletePrivilegeOfRole(String roleIds) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().delete("deletePrivilegeOfRole", roleIds);
	}

	public void deletePrivilegeOfRole(String[] roleIds) throws Exception {
		// TODO Auto-generated method stub

	}

	public void insertPrivilege(Role role_bak) throws Exception {
		this.getSqlMapClientTemplate().insert("insertPrivilege", role_bak);

	}

	public void updatePrivilege(String roleId, String[] resourceIds)
			throws Exception {
		// TODO Auto-generated method stub

	}

	public void insertPrivilege(RoleRescource roleRescource_bak)
			throws Exception {
		this.getSqlMapClientTemplate().insert("insertPrivilege1111",
				roleRescource_bak);

	}

	public void deletePrivilege(RoleRescource roleRescource_bak) {
		this.getSqlMapClientTemplate().delete("deletePrivilege",
				roleRescource_bak);

	}

}
