package com.kingtone.jw.platform.bs.impl;

import java.util.List;

import com.kingtone.jw.platform.bs.MenuBS;
import com.kingtone.jw.platform.dao.MenuDAO;
import com.kingtone.jw.platform.dao.ResourceDAO;
import com.kingtone.jw.platform.domain.Menu;
import com.kingtone.jw.platform.domain.Resource;
import com.kingtone.jw.platform.domain.UserMenu;
import com.kingtone.ssi.bizservice.SSIBizService;
import com.kingtone.ssi.util.IDUtil;

public class MenuBSImpl extends SSIBizService implements MenuBS {
	private MenuDAO MenuDAO;

	private ResourceDAO resourceDAO;

	public void addMenu(Menu menu) throws Exception {
		// TODO Auto-generated method stub

		menu.setMenu_id(IDUtil.newID());

		Resource resource = new Resource();
		resource.setResource_id(IDUtil.newID());
		resource.setUrl(menu.getResource());
		resource.setTitle(menu.getName());
		resource.setParent_id(menu.getMenu_id());
		menu.setResource_id(resource.getResource_id());
		MenuDAO.addMenu(menu);
		resourceDAO.addResource(resource);
	}

	public void delMenu(String unitIds) throws Exception {
		// TODO Auto-generated method stub
		MenuDAO.delMenu(unitIds);
	}

	public void editMenu(Menu menu) throws Exception {
		Resource resource = new Resource();
		resource.setResource_id(menu.getResource_id());

		resource.setUrl(menu.getResource());
		resource.setTitle(menu.getName());
		//更新：资源、菜单

		MenuDAO.editMenu(menu);
		resourceDAO.editResource(resource);
	}

	public Menu findMenuById(String id) throws Exception {
		// TODO Auto-generated method stub
		Menu menu_bak = MenuDAO.findMenuById(id);
		menu_bak.setResource(resourceDAO.findResourceById(
				menu_bak.getResource_id()).getUrl());
		return menu_bak;

	}

	public List findMenuList(Menu menu, int skipindex, int maxindex)
			throws Exception {
		// TODO Auto-generated method stub
		return MenuDAO.findMenuList(menu, skipindex, maxindex);
	}

	public int findMenuListCount(Menu menu) throws Exception {
		// TODO Auto-generated method stub
		return MenuDAO.findMenuListCount(menu);
	}

	public void setMenuDAO(MenuDAO menuDAO) {
		MenuDAO = menuDAO;
	}

	public void setResourceDAO(ResourceDAO resourceDAO) {
		this.resourceDAO = resourceDAO;
	}

	public void delMenu(String delResource, String delMenus) throws Exception {
		//		 TODO Auto-generated method stub
		String[] MenuIdArray = delMenus.split("split");
		for (int i = 0; i < MenuIdArray.length; i++) {
			MenuDAO.delMenu(MenuIdArray[i]);
		}
		String[] ResIdArray = delResource.split("split");
		for (int i = 0; i < ResIdArray.length; i++) {
			resourceDAO.delResource(ResIdArray[i]);

		}

	}

	public List findMenuListTree(Menu menu) throws Exception {
		// TODO Auto-generated method stub
		return MenuDAO.findMenuListTree(menu);
	}

	public List queryAccessibleMenuListOfUser(String userid) throws Exception {

		return MenuDAO.queryAccessibleMenuListOfUser(userid);
	}

	public List queryMenuList(String menuId) throws Exception {
		return MenuDAO.queryMenuList(menuId);
	}
}
