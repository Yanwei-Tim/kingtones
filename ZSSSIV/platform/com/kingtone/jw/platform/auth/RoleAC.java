package com.kingtone.jw.platform.auth;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.kingtone.jw.platform.bs.RoleBS;
import com.kingtone.jw.platform.domain.Button;
import com.kingtone.jw.platform.domain.Menu;
import com.kingtone.jw.platform.domain.Role;
import com.kingtone.jw.platform.domain.RoleMenu;
import com.kingtone.jw.platform.domain.TreeNode;
import com.kingtone.jw.platform.domain.Unit;
import com.kingtone.jw.platform.util.OrgUtils;
import com.kingtone.ssi.action.SSIAction;
import com.kingtone.ssi.log.LogTools;
import com.kingtone.ssi.util.SSISecurityUtil;

public class RoleAC extends SSIAction {
   // private RoleBS roleBS;
    private RoleBS roleBS;
    
    //角色or菜单 树节点集- 变量名固定
    private List<TreeNode> treeNodes = new ArrayList<TreeNode>();
    
    //展开 菜单树父级节点id
    private String id ;
    //选中的角色树节点id 用于：｛删除，查询对应菜单树｝
    private String roleID ;
    //选中变更-菜单id
    private String menuCheckedIDstr;
    //选中变更-资源id
    private String menuUncheckedIDstr;
    //取消选中变更-菜单id
    private String menuCheckedRestr;
    //取消选中变更-资源id
    private String menuUncheckedRestr;
    
    private String buttonCheckedIDstr;
    
    private String buttonUnCheckedIDstr;
    //角色 增加 or 修改
    private Role role_bak;
    
    public Role getRole_bak() {
		return role_bak;
	}
	public void setRole_bak(Role role_bak) {
		this.role_bak = role_bak;
	}
	/**
     * Description:查询角色树
     * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
     * Date: May 9, 2011
     * @throws Exception
     */
    public String queryRoleTreeNodes() throws Exception {
    	LogTools.debug(getCurrentAccount().getUsername(),
				getCurrentUnit().getUnit_name(), "角色管理", 
				"进入【角色管理】维护页面");
        treeNodes.clear();
        List unitList=OrgUtils.getInstance().getUnitlistOfUser();
      
        String unitID = ((Unit)unitList.get(0)).getUnit_id();
       
        Role role_bak =new Role();
         role_bak.setUnit_id(unitID);
        List roleList =roleBS.queryRoleList2(role_bak);
        
        for (Object o : roleList) {
        	 role_bak = (Role) o;
        	 TreeNode treeNode = new TreeNode(role_bak.getRole_id(), role_bak.getRole_name(), role_bak.getParent_id(), false, false, false);
             treeNodes.add(treeNode);
		}
        return JSON;
    }
    /**
     * Description:查询菜单树节点集-带check状态--一次性加载整个树所有节点
     * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
     * Date: May 9, 2011
     * @throws Exception
     */
   
    
    @SuppressWarnings("unchecked")
	public String queryMenusByRoleID() throws Exception{
  	  treeNodes.clear();
     
  	  RoleMenu role_bak=new  RoleMenu();
  	  role_bak.setRole_id(roleID);
   	  role_bak.setMenu_id(id);
   	  
   	  String inparas = " ";
   	  List currentRoles = this.getCurrentRoles();
   	  for(Object o :currentRoles){
   		  Role r = (Role) o;
   		  inparas+="'"+r.getRole_id()+"',";
   	  }
   	role_bak.setRole_id_bak(inparas.substring(0, inparas.length()-1));
//   	this.getCurrentRoles().get(0).getRole_id()
  	  List menuList=roleBS.queryMenuListChecked(role_bak);
  	
        Iterator it = menuList.iterator();
        while (it.hasNext()) {
            Menu menu = (Menu) it.next();
            TreeNode treeNode = new TreeNode(menu.getMenu_id(), menu.getName(), menu.getResource_id(), !(menu.isLeaf()), false, menu.isChecked());
            role_bak.setMenu_id(menu.getMenu_id());
            List subMenuList=roleBS.queryMenuListChecked(role_bak);
            Iterator subit = subMenuList.iterator();
            List<TreeNode> subTreeNodes = new ArrayList();
            while (subit.hasNext()) {
                Menu subMenu = (Menu) subit.next();
                Button btn = new Button();
                btn.setMenu_id(subMenu.getMenu_id());
                btn.setRole_id(roleID);
                TreeNode menuNode = new TreeNode(subMenu.getMenu_id(), subMenu.getName(), subMenu.getResource_id(), !(subMenu.isLeaf()), false, subMenu.isChecked());
                subTreeNodes.add(menuNode);
                List buttonList = roleBS.queryButtonListChecked(btn);
                Iterator button = buttonList.iterator();
                List<TreeNode> buttonTreeNodes = new ArrayList();
                while(button.hasNext()){
                	Button bnt = (Button)button.next();
                	buttonTreeNodes.add(new TreeNode(bnt.getButton_view_id(), bnt.getButton_name(), bnt.getMenu_id(), !(subMenu.isLeaf()), false, bnt.isChecked()));
                }
                menuNode.setNodes(buttonTreeNodes);
            }
            treeNode.setNodes(subTreeNodes);
            treeNodes.add(treeNode);
        }
        id = null;//复位
        return JSON;
  }
    /**
     * Description:添加角色
     * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
     * Date: May 9, 2011
     * @throws Exception
     */
    public String addRole()throws Exception{
    	SSISecurityUtil.reLoadResRoleList = true;
    	 List unitList = OrgUtils.getInstance().getUnitlistOfUser();
        String unitID = ((Unit)unitList.get(0)).getUnit_id();
        role_bak.setUnit_id(unitID);
        roleBS.addRole(role_bak);
        return JSON;
    }
    /**
     * Description:删除角色
     * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
     * Date: May 9, 2011
     * @throws Exception
     */
    public String delRole()throws Exception{
    	SSISecurityUtil.reLoadResRoleList = true;
        String [] roleIds = new String[]{roleID};
        roleBS.delRole(roleID);
        return JSON;
    }
    /**
     * Description:更新角色菜单映射
     * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
     * Date: May 9, 2011
     * @throws Exception
     */
    public String updataRoleMenuMaping() throws Exception{
    	SSISecurityUtil.reLoadResRoleList = true;
        roleBS.updataRoleMenuMaping(menuCheckedIDstr, menuUncheckedIDstr, menuCheckedRestr, menuUncheckedRestr, roleID
        		,buttonCheckedIDstr,buttonUnCheckedIDstr);
       List<Role> currentRoles =(List<Role>)getSession().getAttribute(CURRENT_SESSION_ROLES);
    	String button = "";
    	for(int i=0;i<currentRoles.size();i++){
    		Role role = currentRoles.get(i);
    		String role_id = role.getRole_id();
    		if(button.equals("")){
    			button = OrgUtils.getInstance().getRoleButton(role_id);
    		}else{
    			button += "," + OrgUtils.getInstance().getRoleButton(role_id);
    		}
    		
    	}
    	getSession().setAttribute("ROLE_BUTTON", button);
        return JSON;
    }
    


    public String getButtonCheckedIDstr() {
		return buttonCheckedIDstr;
	}
	public void setButtonCheckedIDstr(String buttonCheckedIDstr) {
		this.buttonCheckedIDstr = buttonCheckedIDstr;
	}
	public String getButtonUnCheckedIDstr() {
		return buttonUnCheckedIDstr;
	}
	public void setButtonUnCheckedIDstr(String buttonUnCheckedIDstr) {
		this.buttonUnCheckedIDstr = buttonUnCheckedIDstr;
	}
	public void setId(String id) {
        this.id = id;
    }
   

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public void setMenuCheckedIDstr(String menuCheckedIDstr) {
        this.menuCheckedIDstr = menuCheckedIDstr;
    }

    public void setMenuUncheckedIDstr(String menuUncheckedIDstr) {
        this.menuUncheckedIDstr = menuUncheckedIDstr;
    }

    public void setMenuCheckedRestr(String menuCheckedRestr) {
        this.menuCheckedRestr = menuCheckedRestr;
    }

    public void setMenuUncheckedRestr(String menuUncheckedRestr) {
        this.menuUncheckedRestr = menuUncheckedRestr;
    }
 
	public void setRoleBS(RoleBS roleBS) {
		this.roleBS = roleBS;
	}
	public List<TreeNode> getTreeNodes() {
		return treeNodes;
	}
}
