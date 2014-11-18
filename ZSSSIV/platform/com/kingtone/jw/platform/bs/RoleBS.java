package com.kingtone.jw.platform.bs;

import java.util.List;

import com.kingtone.jw.platform.domain.Button;
import com.kingtone.jw.platform.domain.Role;
import com.kingtone.jw.platform.domain.RoleMenu;

public interface RoleBS {
	public List<Role> queryRoleList2(Role role_bak) throws Exception;

	public List findMenuList(Role role_bak, int skipindex, int maxindex)
			throws Exception;

	public int findMenuListCount(Role role_bak) throws Exception;

	public void addRole(Role role_bak) throws Exception;

	public void editMenu(Role role_bak) throws Exception;

	public void delRole(String roleIds) throws Exception;

	public Role findMenuById(String id) throws Exception;

	public List queryMenuListChecked(Role role_bak) throws Exception;

	public void updataRoleMenuMaping(String menuIDs, String menuIDs2,
			String menuRes, String menuRes2, String roleID,
			String buttonIDs,String buttonRes) throws Exception;

	public List queryMenuListChecked(RoleMenu role_bak) throws Exception;
	public List queryButtonListChecked(Button btn) throws Exception;

}
