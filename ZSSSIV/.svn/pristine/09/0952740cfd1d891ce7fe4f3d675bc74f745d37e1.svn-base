package com.kingtone.jw.biz.xajw;

import java.util.ArrayList;
import java.util.List;

import com.kingtone.jw.biz.xajw.bs.JwRoleBS;
import com.kingtone.jw.biz.xajw.domain.JwMRoleBiz;
import com.kingtone.jw.biz.xajw.domain.JwMRoleRes;
import com.kingtone.jw.biz.xajw.domain.JwRole;
import com.kingtone.jw.platform.domain.Menu;
import com.kingtone.jw.platform.domain.TreeNode;
import com.kingtone.ssi.action.SSIAction;
import com.kingtone.ssi.log.LogTools;

@SuppressWarnings("unchecked")
public class JwRoleAC extends SSIAction {
	private JwRoleBS jwRoleBS;
	private JwRole jwRole;
	private String jwRoleId;
	private String bizId;
	//展开 菜单树父级节点id
    private String id ;
	//角色or菜单 树节点集- 变量名固定
    private List<TreeNode> treeNodes = new ArrayList<TreeNode>();
    //选中变更-业务菜单id
    private String menuCheckedIDstr;
    //选中变更-业务资源id
    private String menuUncheckedIDstr;
    //取消选中变更-业务菜单id
    private String menuCheckedRestr;
    //取消选中变更-业务资源id
    private String menuUncheckedRestr;
	public void setJwRoleBS(JwRoleBS jwRoleBS) {
		this.jwRoleBS = jwRoleBS;
	}
	
	/**
     * Description:查询角色树
     * Date: May 9, 2011
     * @throws Exception
     */
    public String queryJwRoleTreeNodes() throws Exception {
    	LogTools.debug(getCurrentAccount().getUsername(),
				getCurrentUnit().getUnit_name(), "警务角色", 
				"进入【警务角色】维护页面");
        treeNodes.clear();     
        jwRole =new JwRole();
        List roleList =jwRoleBS.queryJwRoleList(jwRole);       
        for (Object o : roleList) {
        	jwRole = (JwRole) o;
        	 TreeNode treeNode = new TreeNode(jwRole.getRole_id(), jwRole.getRole_name(),null, null, false, false, false, false);
             treeNodes.add(treeNode);
		}
        return JSON;
    }
    
	
	/* 根据父类ID和角色ID查子类业务列表 */
	public String queryBizRoleTreeNodes() throws Exception {
		treeNodes.clear();
		bizId=id;
		if (bizId == null)
			bizId = "0";
		JwMRoleBiz rolebiz=new JwMRoleBiz();
		rolebiz.setBiz_id(bizId);
		rolebiz.setRole_id(jwRoleId);
		List<Menu> list = jwRoleBS.findBizListByParentAndRoleId(rolebiz);
		for (Object o : list) {
			Menu c = (Menu) o;
			TreeNode treeNode = new TreeNode(c.getMenu_id(), c.getName(), c.getParent_id(),  !(c.isLeaf()), false, c.isChecked());
			treeNodes.add(treeNode);
		}
		return JSON;
	}
    
	/* 根据父类ID和角色ID查子类业务组件列表 */
	public String queryResRoleTreeNodes() throws Exception {
		treeNodes.clear();
		bizId=id;
		if (id == null)
			id = "0";
		JwMRoleRes jwMRoleRes=new JwMRoleRes();
		jwMRoleRes.setRes_id(id);
		jwMRoleRes.setRole_id(jwRoleId);
		List<Menu> list = jwRoleBS.findResListByBizAndRoleId(jwMRoleRes);
		TreeNode ptreeNode = new TreeNode("目录-1", "目录", null, null, false, true,
				true, false);
		List ctreeNodes = new ArrayList<TreeNode>();
		for (Object o : list) {
			Menu c = (Menu) o;
			ptreeNode.setId(c.getParent_id());
			ptreeNode.setName(c.getDescription());
			if(c.isChecked())ptreeNode.setChecked(true);
			TreeNode treeNode = new TreeNode(c.getMenu_id(), c.getName(), c.getParent_id(),  !(c.isLeaf()), false, c.isChecked());
			ctreeNodes.add(treeNode);
		}
		ptreeNode.setNodes(ctreeNodes);
		if(list!=null&&list.size()!=0)treeNodes.add(ptreeNode);
		return JSON;
	}
    /**
     * Description:添加角色
     * Date: May 9, 2011
     * @throws Exception
     */
    public String addJwRole()throws Exception{
    	jwRoleBS.addJwRole(jwRole);
        return JSON;
    }

    /**
     * Description:删除角色
     * Date: May 9, 2011
     * @throws Exception
     */
    public String delJwRole()throws Exception{
        jwRoleBS.delJwRole(jwRoleId);
        return JSON;
    }
    
    /**
     * Description:保存权限分配修改
     * Date: May 9, 2011
     * @throws Exception
     */
    public String updateJwRoleBizRes()throws Exception{
    	jwRoleBS.updateJwRoleBizRes(jwRoleId,menuCheckedIDstr, menuUncheckedIDstr, menuCheckedRestr, menuUncheckedRestr);
        return JSON;
    }   
    
	public void setJwRole(JwRole jwRole) {
		this.jwRole = jwRole;
	}

	public void setJwRoleId(String jwRoleId) {
		this.jwRoleId = jwRoleId;
	}

	public JwRole getJwRole() {
		return jwRole;
	}
	public List<TreeNode> getTreeNodes() {
		return treeNodes;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setBizId(String bizId) {
		this.bizId = bizId;
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
}
