package com.kingtone.jw.platform.auth;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;

import com.kingtone.jw.biz.common.util.Utils;
import com.kingtone.jw.platform.bs.MenuBS;
import com.kingtone.jw.platform.domain.Menu;
import com.kingtone.jw.platform.domain.Role;
import com.kingtone.jw.platform.domain.TreeNode;
import com.kingtone.jw.platform.domain.User;
import com.kingtone.jw.platform.util.OrgUtils;
import com.kingtone.ssi.action.SSIAction;
import com.kingtone.ssi.log.LogTools;
import com.kingtone.ssi.util.SSISecurityUtil;

public class MenuAC extends SSIAction {

	private static final long serialVersionUID = 1L;

	private MenuBS menuBS;

	// 每页/最大记录数
	protected String rp;

	// 当前页码
	protected String page;

	// 总记录数
	protected String total = "1500";

	// 菜单列表显示对象- 变量名称固定
	private List rows = new ArrayList();

	// 菜单树显示对象- 变量名称固定
	private List<TreeNode> treeNodes = new ArrayList<TreeNode>();

	// 菜单
	private String menuListStr;

	// 展开菜单树节点id
	private String id;

	// 单击菜单树节点id
	private String treeNodeID;

	// 删除后提示信息-OUT
	private String delInfo;

	// 删除单元id字符串-IN
	private String delMenus;

	// 删除资源id字符串
	private String delResource;

	// 添加or修改菜单对象
  // 添加or修改菜单对象
	private Menu menu_bak;

	// 修改菜单id
	private String menuID;

	private String query;

	private String qtype;

	public void setQtype(String qtype) {
		this.qtype = qtype;
	}

	public void setQuery(String query) {
		this.query = query;
	}

	/**
	 * Description:查询可见菜单（left frame显示内容） Author: 邹甲乐 -
	 * zoujiale@kingtoneinfo.com Date: May 9, 2011
	 * 
	 * @throws Exception
	 */
	
public String queryAccessibleMenus() throws Exception {
		User user_bak = OrgUtils.getInstance().getCurrentUser();
		List menuList=menuBS.queryAccessibleMenuListOfUser(user_bak.getUserID());
		
		menuListStr = queryTreeStrByList(menuList, menuBS);
		return JSON;
	}

	/**
	 * Description:获取菜单树节点集 Author: 邹甲乐 - zoujiale@kingtoneinfo.com Date: May 9,
	 * 2011
	 * 
	 * @throws Exception
	 */
	public String queryMenuTreeNodes() throws Exception {
		treeNodes.clear();
		Menu menu_bak=new Menu();
		menu_bak.setParent_id(id);
		 List<Menu> menuList = menuBS.findMenuListTree(menu_bak);
	
		Iterator it = menuList.iterator();
		while (it.hasNext()) {
			 menu_bak = (Menu) it.next();
			TreeNode treeNode = new TreeNode(menu_bak.getMenu_id(), menu_bak.getName(), menu_bak.getParent_id(), false, false, false);
			treeNodes.add(treeNode);
		}
		id = null;// 复位
		return JSON;
	
	}

	/**
	 * Description:获取菜单列表数据集 Author: 邹甲乐 - zoujiale@kingtoneinfo.com Date: May
	 * 9, 2011
	 * 
	 * @throws Exception
	 */
	public String queryMenuGridList() throws Exception {
		LogTools.debug(getCurrentAccount().getUsername(),
				getCurrentUnit().getUnit_name(), "菜单管理", 
				"进入【菜单管理】维护页面");
		rows.clear();
		Menu menu = new Menu();
		
		  if("menu_name".equals(qtype)){
	        	menu.setName(query);
	        }else if("URL".equals(qtype)){
	        	menu.setUrl(query);
	        }else if("menu_resid".equals(qtype)){
	        	menu.setResource_id(query);
	        	
	        	
	        }
		 if ("null".equals(treeNodeID))
	            treeNodeID = null;//注：前台js中的return null传到action中 值被装成了"null"
		menu.setParent_id(treeNodeID);
		List menuList = menuBS.findMenuList(menu,
				(Integer.parseInt(page) - 1) * Integer.parseInt(rp), Integer
						.parseInt(rp));
		
		for (Object o :menuList) {
			Menu menu1 = (Menu) o;
			Map map = new HashMap();
			map.put("id", menu1.getMenu_id());
			map.put("cell", new Object[] { menu1.getMenu_id(), menu1.getName(),
					menu1.getUrl(), menu1.getResource_id() });
			rows.add(map);
		}
		
		total =menuBS.findMenuListCount(menu)+ "";
		
		return JSON;
	}

	/**
	 * Description:添加菜单 Author: 邹甲乐 - zoujiale@kingtoneinfo.com Date: May 9,
	 * 2011
	 * 
	 * @throws Exception
	 */
	public String addMenu() throws Exception {
		//menuBS.addMenu(menu);
		SSISecurityUtil.reLoadResRoleList = true;
		menuBS.addMenu(menu_bak);
		return JSON;
	}

	/**
	 * Description:编辑菜单 Author: 邹甲乐 - zoujiale@kingtoneinfo.com Date: May 9,
	 * 2011
	 * 
	 * @throws Exception
	 */
	public String editMenu() throws Exception {

		//menuBS.editMenu(menu);
		SSISecurityUtil.reLoadResRoleList = true;
		menuBS.editMenu(menu_bak);
		return JSON;
	}

	/**
	 * Description:删除菜单 Author: 邹甲乐 - zoujiale@kingtoneinfo.com Date: May 9,
	 * 2011
	 * 
	 * @throws Exception
	 */
	public String delMenuList() throws Exception {
		SSISecurityUtil.reLoadResRoleList = true;
		delInfo = "1";
		String[] delMenuIDs = delMenus.split("split");
		String[] delResIDs = delResource.split("split");
		 for(int i=0;i<delMenuIDs.length;i++){
        	 Menu menu= new Menu();
        	 menu.setParent_id(delMenuIDs[i]);
        	 int count=menuBS.findMenuListCount(menu);
           
            if(count>0){
                delInfo="2";
                return JSON;
            }
        }
		 
		 menuBS.delMenu(delResource, delMenus);
		
		return JSON;
		
	}

	/**
	 * Description:根据菜单id查询菜单对象 Author: 邹甲乐 - zoujiale@kingtoneinfo.com Date:
	 * May 9, 2011
	 * 
	 * @throws Exception
	 */
	public String queryMenuByID() throws Exception {
		//menu = menuBS.queryMenuById(menuID);
		menu_bak=menuBS.findMenuById(menuID);
		return JSON;
	}

	/**
	 * Description:获取当前用户可见菜单-转换成jsp标签 Author: 邹甲乐 - zoujiale@kingtoneinfo.com
	 * Date: May 9, 2011
	 * 
	 * @throws Exception
	 */
	
	public String queryTreeStrByList(List listTree, MenuBS menuBS)
			throws Exception {
		List<Role> currentRoles = OrgUtils.getInstance().getRolelistOfUser();
		String button = "";
    	for(int i=0;i<currentRoles.size();i++){
    		Role role = currentRoles.get(i);
    		String role_id = role.getRole_id();
    		if(button.equals("")){
    			button = OrgUtils.getInstance().getRoleButton(role_id);
    		}else{
    			button += "|" + OrgUtils.getInstance().getRoleButton(role_id);
    		}
    		
    	}
		String webRoot = Utils.GetConfigByKey("webRoot");
		Menu module = null;
		StringBuffer strb = new StringBuffer(
				"<div id=\"PARENT\" style=\"width: 187px\">    <ul id=\"nav\">");

		if (listTree != null && listTree.size() > 0) {
			for (int n1 = 0; n1 < listTree.size(); n1++) {
				List treeList2 = null;
				module = (Menu)listTree.get(n1);
				// 获取第二层子目录
				
				treeList2 =menuBS.queryMenuList(module.getMenu_id());
				// 得到一级目录的拼接字符
				strb.append("<div id=\"div15\"> <li id=\"rptMenus_ctl" + n1
						+ "_dvA\"> <a href=\"#Menu=M_" + module.getMenu_id()
						+ "\" onclick=\"DoMenu('M_" + module.getMenu_id() + "')\">"
						+ module.getName() + "</a>");
				if (treeList2 != null && treeList2.size() > 0) {
					Menu module2 = null;
					strb.append(" <ul id=\"M_" + module.getMenu_id()
							+ "\" class=\"collapsed\">");
					for (int n2 = 0; n2 < treeList2.size(); n2++) {
						// 拼接二级目录字符
						module2 = (Menu)treeList2.get(n2);
						strb.append("<li id=\"rptMenus_ctl" + n1
								+ "_rptMenuItems_ctl" + n2
								+ "_dvA1\"><a href=\"/"+webRoot+"/" + module2.getUrl()
								+ "\" target='right' >" + module2.getName()
								+ "</a></li>");
					}
					strb.append(" </ul>");
				}
				strb.append("</li>  </div>");
			}
			strb.append(" </ul> </div>");
			return strb.toString();
		}

		return null;
	}

	public String getMenuListStr() {
		return menuListStr;
	}

	

	public List<TreeNode> getTreeNodes() {
		return treeNodes;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRp() {
		return rp;
	}

	public void setRp(String rp) {
		this.rp = rp;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public List getRows() {
		return rows;
	}

	public String getDelInfo() {
		return delInfo;
	}

	public void setTreeNodeID(String treeNodeID) {
		this.treeNodeID = treeNodeID;
	}

	public void setDelMenus(String delMenus) {
		this.delMenus = delMenus;
	}

	public void setMenuID(String menuID) {
		this.menuID = menuID;
	}

	public void setDelResource(String delResource) {
		this.delResource = delResource;
	}

	/*public void setMenuBS(MenuBS menuBS) {
		this.menuBS = menuBS;
	}*/

	public void setMenuBS(MenuBS menuBS) {
		this.menuBS = menuBS;
	}

	public Menu getMenu_bak() {
		return menu_bak;
	}

	public void setMenu_bak(Menu menu_bak) {
		this.menu_bak = menu_bak;
	}
}
