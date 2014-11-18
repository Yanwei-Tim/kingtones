package com.kingtone.jw.platform.bs.impl;

import java.util.List;

import com.kingtone.jw.platform.bs.RoleBS;
import com.kingtone.jw.platform.dao.ButtonDAO;
import com.kingtone.jw.platform.dao.MenuDAO;
import com.kingtone.jw.platform.dao.PrivilegeDAO;
import com.kingtone.jw.platform.dao.RoleDAO;
import com.kingtone.jw.platform.domain.Button;
import com.kingtone.jw.platform.domain.Menu;
import com.kingtone.jw.platform.domain.Role;
import com.kingtone.jw.platform.domain.RoleMenu;
import com.kingtone.jw.platform.domain.RoleRescource;
import com.kingtone.ssi.bizservice.SSIBizService;
import com.kingtone.ssi.util.IDUtil;

public class RoleBSImpl extends SSIBizService implements RoleBS {
	private RoleDAO roleDAO;

	private MenuDAO menuDAO;
	
	private ButtonDAO buttonDAO;

	public void setButtonDAO(ButtonDAO buttonDAO) {
		this.buttonDAO = buttonDAO;
	}

	private PrivilegeDAO privilegeDAO;

	
	public List queryButtonListChecked(Button btn) throws Exception {
		// TODO Auto-generated method stub
		return buttonDAO.queryButtonListChecked(btn);
	}

	public void addRole(Role role_bak) throws Exception {
		role_bak.setRole_id(IDUtil.newID());
		roleDAO.addRole(role_bak);

		// 插入 角色享有的基本资源权限！！！
		RoleRescource roleRescource_bak = new RoleRescource();
		roleRescource_bak.setRole_id(role_bak.getRole_id());
		roleRescource_bak.setRescource_id("base");
		privilegeDAO.insertPrivilege(roleRescource_bak);

	}

	public void delRole(String roleIds) throws Exception {
		roleDAO.delRole(roleIds);
		roleDAO.deleteRoleResourceMapping(roleIds);
		roleDAO.deleteRoleUserMapping(roleIds);
		privilegeDAO.deletePrivilegeOfRole(roleIds);

	}

	public void editMenu(Role role_bak) throws Exception {
		// TODO Auto-generated method stub

	}

	public Role findMenuById(String id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public List findMenuList(Role role_bak, int skipindex, int maxindex)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public int findMenuListCount(Role role_bak) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public void setRoleDAO(RoleDAO roleDAO) {
		this.roleDAO = roleDAO;
	}

	public void setMenuDAO(MenuDAO menuDAO) {
		this.menuDAO = menuDAO;
	}

	public List<Role> queryRoleList2(Role role_bak) throws Exception {

		return roleDAO.queryRoleList2(role_bak);
	}

	public List queryMenuListChecked(Role role_bak) throws Exception {
		// TODO Auto-generated method stub
		return menuDAO.queryMenuListChecked(role_bak);
	}

	public void setPrivilegeDAO(PrivilegeDAO privilegeDAO) {
		this.privilegeDAO = privilegeDAO;
	}

	public void updataRoleMenuMaping(String menuCheckedIDstr,
			String menuUncheckedIDstr, String menuCheckedRestr,
			String menuUncheckedRestr, String roleID,String buttonIDs,String buttonRes) throws Exception {
		String[] menuIDs = menuCheckedIDstr.split("split");
		String[] menuIDs2 = menuUncheckedIDstr.split("split");
		
		String[] menuRes = menuCheckedRestr.split("split");
		String[] menuRes2 = menuUncheckedRestr.split("split");
		String[] button = buttonIDs.split("split");
		String[] unButton = buttonRes.split("split");
		RoleMenu roleMenu_bak = new RoleMenu();
		RoleRescource roleRescource_bak = new RoleRescource();
		Button btn = new Button();
		btn.setRole_id(roleID);
		roleMenu_bak.setRole_id(roleID);
		roleRescource_bak.setRole_id(roleID);
		//	      取消选中变更处理：删除:角色菜单映射、角色资源映射
		for (int i = 0; i < menuIDs2.length; i++) {
			roleMenu_bak.setMenu_id(menuIDs2[i]);
			menuDAO.deleteRoleMenuMapping(roleMenu_bak);
		}
		for (int i = 0; i < menuRes2.length; i++) {
			roleRescource_bak.setRescource_id(menuRes2[i]);

			privilegeDAO.deletePrivilege(roleRescource_bak);
		}
		for(int i=0;i<unButton.length;i++){
			btn.setButton_view_id(unButton[i]);
			buttonDAO.deleteRoleButton(btn);
		}
		if (menuIDs.length > 0 && !("".equals(menuIDs[0]))) {
			for (int i = 0; i < menuIDs.length; i++) {

				roleMenu_bak.setMenu_id(menuIDs[i]);

				menuDAO.insertRoleMenuMapping(roleMenu_bak);
			}
		}
		if (menuIDs.length > 0 && !("".equals(menuIDs[0]))) {
			for (int i = 0; i < menuRes.length; i++) {

				roleRescource_bak.setRescource_id(menuRes[i]);

				privilegeDAO.insertPrivilege(roleRescource_bak);
			}
		}
		if(button.length>0 && !("").equals(button[0])){
			for(int i=0;i<button.length;i++){
				btn.setButton_view_id(button[i]);
				buttonDAO.insertRoleButton(btn);
			}
		}
		
	}

	public List queryMenuListChecked(RoleMenu role_bak) throws Exception {
		// TODO Auto-generated method stub
		return menuDAO.queryMenuListChecked(role_bak);
	}

}
