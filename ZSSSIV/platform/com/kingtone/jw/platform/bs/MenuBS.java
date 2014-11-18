package com.kingtone.jw.platform.bs;

import java.util.List;

import com.kingtone.jw.platform.domain.Menu;

public interface MenuBS {
	public List findMenuList(Menu menu, int skipindex, int maxindex)
			throws Exception;

	public List findMenuListTree(Menu menu) throws Exception;

	public int findMenuListCount(Menu menu) throws Exception;

	public void addMenu(Menu menu) throws Exception;

	public void editMenu(Menu menu) throws Exception;

	public void delMenu(String unitIds) throws Exception;

	public void delMenu(String delResource, String delMenus) throws Exception;

	public Menu findMenuById(String id) throws Exception;

	public List queryAccessibleMenuListOfUser(String userid) throws Exception;

	public List queryMenuList(String menuId) throws Exception;
}
