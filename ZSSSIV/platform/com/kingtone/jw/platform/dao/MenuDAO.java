/**
 * 文件名：UnitDAO.java
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
import com.kingtone.jw.platform.domain.RoleMenu;
import com.kingtone.jw.platform.domain.Role;

/**
 * <p>
 * 组织单元数据访问对象。
 * </p>
 * 
 * @author 张战博 - ｚｈａｎｇｚｈａｎｂｏ@kingtoneinfo.com
 * @version 1.0 Created on ｊｕｌｙ 2０, 20１１ 8:43:20 PM
 */
public interface MenuDAO {

	public List findMenuList(Menu menu, int skipindex, int maxindex)
			throws Exception;

	public List findMenuListTree(Menu menu) throws Exception;

	public int findMenuListCount(Menu menu) throws Exception;

	public void addMenu(Menu menu) throws Exception;

	public void editMenu(Menu menu) throws Exception;

	public void delMenu(String unitIds) throws Exception;

	public void deleteRoleMenuMapping(RoleMenu roleMenu_bak) throws Exception;

	public Menu findMenuById(String id) throws Exception;

	public List queryMenuListChecked(Role role_bak) throws Exception;

	public void insertRoleMenuMapping(RoleMenu roleMenu_bak) throws Exception;

	public List queryAccessibleMenuListOfUser(String UserID) throws Exception;

	public List queryMenuList(String menuId) throws Exception;

	public List queryMenuListChecked(RoleMenu role_bak) throws Exception;
}
