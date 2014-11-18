package com.kingtone.jw.platform.dao.impl;

import java.util.List;

import com.kingtone.jw.platform.dao.RoleDAO;
import com.kingtone.jw.platform.domain.Menu;
import com.kingtone.jw.platform.domain.Resource;
import com.kingtone.jw.platform.domain.Role;
import com.kingtone.jw.platform.domain.User;
import com.kingtone.ssi.dao.SSIOrmDao;

public class RoleDAOImpl extends SSIOrmDao implements RoleDAO {

	

	public void addRole(Role role_bak) throws Exception {
		this.getSqlMapClientTemplate().insert("roleAdd", role_bak);

	}

	public void delRole(String roleIds) throws Exception {
		this.getSqlMapClientTemplate().delete("roleDelete", roleIds);

	}

	public void editRole(Role role_bak) throws Exception {
		this.getSqlMapClientTemplate().update("roleUpdate", role_bak);

	}

	public Role findRoleById(String id) throws Exception {
		return (Role) this.getSqlMapClientTemplate().queryForObject(
				"findRolByID", id);
	}

	public List findRoleList(Role role_bak, int skipindex, int maxindex)
			throws Exception {
		List list = this.getSqlMapClientTemplate().queryForList(
				"findAllRolPage", role_bak, skipindex, maxindex);
		return list;
	}

	public int findRoleListCount(Role role_bak) throws Exception {
		int n = Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"findRolPageCount", role_bak).toString());
		return n;
	}

	public Role findRoleListOfUser(String userId) throws Exception {
		return (Role) this.getSqlMapClientTemplate().queryForObject(
				"findRolByID", userId);
	}

	public List findRoleListOfUser(User user_bak) throws Exception {
		List list = this.getSqlMapClientTemplate().queryForList(
				"findRoleListOfUser", user_bak);
		return list;
	}

	public List<Role> queryRoleList2(Role role_bak) throws Exception {
		List list = this.getSqlMapClientTemplate().queryForList(
				"queryRoleList2", role_bak);
		return list;
	}

	public List queryRoleListOfUser(User uer_bak) throws Exception {
		List list = this.getSqlMapClientTemplate().queryForList(
				"queryRoleListOfUser", uer_bak);
		return list;
	}

	public List queryRoleListOfResource(Resource resource_bak) throws Exception {
		List list = this.getSqlMapClientTemplate().queryForList(
				"queryRoleListOfResource", resource_bak);
		return list;
	}

	public void deleteRoleResourceMapping(String roleIds) throws Exception {
		this.getSqlMapClientTemplate().delete("deleteRoleResourceMapping",
				roleIds);

	}

	public void deleteRoleUserMapping(String roleIds) throws Exception {
		this.getSqlMapClientTemplate().delete("deleteRoleUserMapping", roleIds);

	}

}
