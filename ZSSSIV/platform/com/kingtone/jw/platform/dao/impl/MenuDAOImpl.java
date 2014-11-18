package com.kingtone.jw.platform.dao.impl;

import java.util.List;

import com.kingtone.jw.platform.dao.MenuDAO;
import com.kingtone.jw.platform.domain.Menu;
import com.kingtone.jw.platform.domain.RoleMenu;
import com.kingtone.jw.platform.domain.Role;
import com.kingtone.jw.platform.util.OrgUtils;
import com.kingtone.ssi.dao.SSIOrmDao;

public class MenuDAOImpl extends SSIOrmDao implements MenuDAO {

	public void addMenu(Menu menu) throws Exception {
		 this.getSqlMapClientTemplate().insert("menuAdd", menu);
	}

	public void delMenu(String unitIds) throws Exception {
		this.getSqlMapClientTemplate().delete("menuDelete", unitIds);

	}

	public void editMenu(Menu menu) throws Exception {
		int num =this.getSqlMapClientTemplate().update("menuUpdate",menu);
		System.out.println(num);

	}

	public Menu findMenuById(String id) throws Exception {
		return (Menu)this.getSqlMapClientTemplate().queryForObject("findMenuByID",id);
	}

	public List findMenuList(Menu menu, int skipindex, int maxindex)
			throws Exception {
		List list;
		if(menu.getParent_id()==null){
		list = this.getSqlMapClientTemplate().queryForList("findAllMenuPage",menu, skipindex, maxindex);}
		else{
			 list = this.getSqlMapClientTemplate().queryForList("findAllMenuPage1",menu, skipindex, maxindex);}
		
        return list;
	}

	public int findMenuListCount(Menu menu) throws Exception {
		 int n;
		 if(menu.getParent_id()==null){
		n = Integer.parseInt(this.getSqlMapClientTemplate().queryForObject("findMenuPageCount1",menu).toString());}
		 else{
			 n = Integer.parseInt(this.getSqlMapClientTemplate().queryForObject("findMenuPageCount",menu).toString());
		 }
	        return n;
	}

	public List findMenuListTree(Menu menu) throws Exception {
		List list = this.getSqlMapClientTemplate().queryForList("findAllMenuPagetree",menu);
        return list;
	}

	public List queryMenuListChecked(Role role_bak) throws Exception {
		List list = this.getSqlMapClientTemplate().queryForList("queryMenuListChecked",role_bak);
        return list;
	}

	public void insertRoleMenuMapping(RoleMenu roleMenu_bak) throws Exception {
		 this.getSqlMapClientTemplate().insert("insertRoleMenuMapping",roleMenu_bak);
		
		
	}
	public void deleteRoleMenuMapping(RoleMenu roleMenu_bak) throws Exception {
		this.getSqlMapClientTemplate().delete("deleteRoleMenuMapping", roleMenu_bak);
		
	}

	public List queryAccessibleMenuListOfUser(String UserID) {
		List list = this.getSqlMapClientTemplate().queryForList("queryAccessibleMenuListOfUser",UserID);
        return list;
	}

	@SuppressWarnings("unchecked")
	public List queryMenuList(String menuId) throws Exception {
		String roleSql = "(";
		List roleList = OrgUtils.getInstance().getRolelistOfUser();
		for(Object o: roleList){
			Role role = (Role) o;
			roleSql+="'"+role.getRole_id()+"',";
		}
		roleSql = roleSql.substring(0, roleSql.length()-1);
		roleSql+=")";
		
		String sql =null;
		
		if (menuId != null) {
			sql = "select distinct T.MENU_ID, T.RESOURCE_ID, T.NAME, T.DESCRIPTION, T.POSITION, T.PARENT_ID,T.URL , CASE WHEN (SELECT COUNT(1) from SSI_AUTH_MENU TT WHERE TT.PARENT_ID = T.MENU_ID )>0 THEN 0 ELSE 1 END  LEAF  from ssi_auth_resource R,ssi_auth_menu T ,SSI_AUTH_M_MENU_ROLE S where R.RESOURCE_ID=T.RESOURCE_ID AND T.MENU_ID=S.MENU_ID AND S.ROLE_ID in "+roleSql+"AND T.PARENT_ID ='" + menuId +"' ORDER BY T.POSITION ASC";
			
		}else {
			
			sql="select T.MENU_ID, T.RESOURCE_ID, T.NAME, T.DESCRIPTION, T.POSITION, T.PARENT_ID,T.URL ,CASE WHEN (SELECT COUNT(1) from SSI_AUTH_MENU TT WHERE TT.PARENT_ID = T.MENU_ID )>0 THEN 0 ELSE 1 END  LEAF from ssi_auth_menu T where  T.PARENT_ID is null ORDER BY T.POSITION ASC";
		}
		List list = this.getSqlMapClientTemplate().queryForList("queryMenuList",sql);
        return list;
	}

	public List queryMenuListChecked(RoleMenu role_bak) throws Exception {
		String sql=null;
		  if(role_bak.getMenu_id()==null){
			  System.out.println(role_bak.getRole_id_bak());
			  if(" 'adminRole'".equals(role_bak.getRole_id_bak())){
				  sql="CASE WHEN (SELECT COUNT(1) FROM SSI_AUTH_M_MENU_ROLE a WHERE a.menu_id =c.menu_id and a.role_id='"+role_bak.getRole_id()+"')>0 then 1 else 0 end checked from ssi_auth_menu c where  c.parent_id is null ORDER BY c.POSITION ASC" ;
			  }else{
				  sql="CASE WHEN (SELECT COUNT(1) FROM SSI_AUTH_M_MENU_ROLE a WHERE a.menu_id =c.menu_id and a.role_id='"+role_bak.getRole_id()+"')>0 then 1 else 0 end checked from ssi_auth_menu c,ssi_auth_m_menu_role r where c.menu_id=r.menu_id and r.role_id in ("+role_bak.getRole_id_bak()+") and c.parent_id is null ORDER BY c.POSITION ASC" ;
			  }
			                                                                                       
		  }else{
			 sql= "CASE WHEN (SELECT COUNT(1) FROM SSI_AUTH_M_MENU_ROLE a WHERE a.menu_id =c.menu_id and a.role_id='"+role_bak.getRole_id()+"')>0 then 1 else 0 end checked from ssi_auth_menu c where parent_id ='"+role_bak.getMenu_id()+"' ORDER BY c.POSITION ASC" ;
		  }
		List list = this.getSqlMapClientTemplate().queryForList("queryMenuListChecked1",sql);
		
		return list;
		
	}

}
