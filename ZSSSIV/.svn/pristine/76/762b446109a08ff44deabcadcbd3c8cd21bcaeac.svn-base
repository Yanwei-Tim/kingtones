package com.kingtone.jw.biz.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.kingtone.jw.biz.service.bs.ServiceBS;
import com.kingtone.jw.biz.service.bs.SysCodeListBS;
import com.kingtone.jw.biz.service.domain.Business;
import com.kingtone.jw.biz.service.domain.ColMapping;
import com.kingtone.jw.biz.service.domain.ImageInfo;
import com.kingtone.jw.biz.service.domain.SystemMap;
import com.kingtone.jw.biz.service.domain.SystemRes;
import com.kingtone.jw.biz.service.domain.TableInfo;
import com.kingtone.jw.biz.xajw.bs.JwRoleBS;
import com.kingtone.jw.biz.xajw.domain.JwRole;
import com.kingtone.jw.platform.domain.TreeNode;
import com.kingtone.ssi.action.SSIAction;

/*选择标签处理类*/
public class SysCodeListAC extends SSIAction {
	// serviceBS
	public ServiceBS serviceBS;
	// sysCodeListBS
	public SysCodeListBS sysCodeListBS;
	// 查询字段映射树
	private ColMapping colMapping;
	// bizId
	private String bizId;

	// 返回到前台的select标签字符串
	private String codeListHtml = "";
	// 前台传来的代码类型
	private String selectType = null;
	// 前台传来的select标签id
	private String selectId = null;
	// 前台的select标签
	private String selectName = null;
	// 前台的select标签
	private String selectWidth = null;
	// 前台的select标签
	private String selvalue = null;
	//业务流程
	private String operationType;
	private JwRoleBS jwRoleBS;

	// 前台的select标签 systemMap
	public String findSysCodeListByType() throws Exception {
		//System.out.println("selectType:"+selectType);
		SystemMap systemMap = new SystemMap();
		systemMap.setType(selectType);
		StringBuffer sb = new StringBuffer();
		sb.append("<select id=\"" + selectId + "\" name=\"" + selectName
				+ "\" style=\"width:" + selectWidth + "%\">");
		
		if(selectType.equals("condition")){
			sb.append("<option value=\"" +"" + "\" ");
			sb.append(">" + "" + "</option>");
		}
		
		List codeList = null;
		if(selectType!=null){
		codeList = sysCodeListBS.findSysCodeListByType(systemMap);
		for (Object o : codeList) {
			SystemMap c = (SystemMap) o;
			if(selectType.equals("condition")){
				sb.append("<option value=\"" + c.getValue() + "\">" + c.getValue()
						+ "</option>");
			}else
			sb.append("<option value=\"" + c.getKey() + "\">" + c.getValue()
					+ "</option>");
		}}
		sb.append("</select>");
		codeListHtml = sb.toString();
		return JSON;
	}

	// 前台的select标签 systemMap
	public String findSysCodeValueListByType() throws Exception {
		//System.out.println("selectType:"+selectType);
		SystemMap systemMap = new SystemMap();
		systemMap.setType(selectType);
		StringBuffer sb = new StringBuffer();
		sb.append("<select id=\"" + selectId + "\" name=\"" + selectName
				+ "\" style=\"width:" + selectWidth + "%\">");				
		List codeList = null;
		if(selectType!=null){
		codeList = sysCodeListBS.findSysCodeListByType(systemMap);
		for (Object o : codeList) {
			SystemMap c = (SystemMap) o;
				sb.append("<option value=\"" + c.getValue() + "\">" + c.getValue()
						+ "</option>");			
		}}
		sb.append("</select>");
		codeListHtml = sb.toString();
		return JSON;
	}
	
	// 前台的select标签 Img
	public String findImgCodeList() throws Exception {
		StringBuffer sb = new StringBuffer();
		sb.append("<select id=\"" + selectId + "\" name=\"" + selectName
				+ "\" style=\"width:" + selectWidth + "%\">");
		List codeList = serviceBS.queryAllImageInfoList();
		for (Object o : codeList) {
			ImageInfo c = (ImageInfo) o;
			sb.append("<option value=\"" + c.getImg_name() + "\" ");
			sb.append(">" + c.getImg_name() + "</option>");
		}
		sb.append("</select>");
		codeListHtml = sb.toString();
		// System.out.println("codeListHtml:"+codeListHtml);
		return JSON;
	}
	
	// 前台的select标签 资源
	public String findResCodeList() throws Exception {
		StringBuffer sb = new StringBuffer();
		sb.append("<select id=\"" + selectId + "\" name=\"" + selectName
				+ "\" style=\"width:" + selectWidth + "%\">");
		sb.append("<option value=\"" +"" + "\" ");
		sb.append(">" + "" + "</option>");
		List codeList = serviceBS.queryAllResInfoList();
		for (Object o : codeList) {
			SystemRes c = (SystemRes) o;
			sb.append("<option value=\"" + c.getRes_id() + "\" ");
			sb.append(">" + c.getRes_name() + "</option>");
		}
		sb.append("</select>");
		codeListHtml = sb.toString();
		// System.out.println("codeListHtml:"+codeListHtml);
		return JSON;
	}

	// 前台的select标签 选项卡
	public String findTabInfoList() throws Exception {
		StringBuffer sb = new StringBuffer();
		sb.append("<select id=\"" + selectId + "\" name=\"" + selectName
				+ "\" style=\"width:" + selectWidth + "%\">");
		sb.append("<option value=\"" +"0" + "\" ");
		sb.append(">" + "" + "</option>");
		TableInfo tabInfo=new TableInfo();
		tabInfo.setB_id(bizId);
		List<TableInfo> codeList = sysCodeListBS.queryTabInfoListSel(tabInfo);
		for (Object o : codeList) {
			TableInfo c = (TableInfo) o;
			sb.append("<option value=\"" + c.getTab_id() + "\" ");
			sb.append(">" + c.getTab_name() + "</option>");
		}
		sb.append("</select>");
		codeListHtml = sb.toString();
		// System.out.println("codeListHtml:"+codeListHtml);
		return JSON;
	}
	
	// 前台的select标签 ColMapping
	public String findColMappingCodeList() throws Exception {
		StringBuffer sb = new StringBuffer();
		sb.append("<select id=\"" + selectId + "\" name=\"" + selectName
				+ "\" style=\"width:" + selectWidth + "%\">");
		colMapping = new ColMapping();
		colMapping.setB_id(bizId);
		List codeList = serviceBS.queryAllColMappingList(colMapping);
		for (Object o : codeList) {
			ColMapping c = (ColMapping) o;
			sb.append("<option value=\"" + c.getColumns() + "\" ");
			sb.append(">" + c.getColumns() + "</option>");
		}
		sb.append("</select>");
		codeListHtml = sb.toString();
		return JSON;
	}

	// 前台的select标签 SystemMap type
	public String findSystemMapTypeCodeList() throws Exception {
		StringBuffer sb = new StringBuffer();
		sb.append("<select id=\"" + selectId + "\" name=\"" + selectName
				+ "\" style=\"width:" + selectWidth + "%\">");	
		sb.append("<option value=\"" + "" + "\" ");
		sb.append(">" + "" + "</option>");
		List codeList = this.sysCodeListBS.querySystemMapListType();
		for (Object o : codeList) {
			SystemMap c = (SystemMap) o;
			sb.append("<option value=\"" + c.getType() + "\" ");
			sb.append(">" + c.getType() + "</option>");
		}
		sb.append("</select>");
		codeListHtml = sb.toString();
		return JSON;
	}
	
	// 前台的select标签 jwrole type
	public String findJwRoleTypeCodeList() throws Exception {
		StringBuffer sb = new StringBuffer();
		sb.append("<select id=\"" + selectId + "\" name=\"" + selectName
				+ "\" style=\"width:" + selectWidth + "%\">");	
		sb.append("<option value=\"" + "" + "\" ");
		sb.append(">" + "" + "</option>");
		List<JwRole> codeList = this.jwRoleBS.queryJwRoleList(new JwRole());
		for (Object o : codeList) {
			JwRole c = (JwRole) o;
			sb.append("<option value=\"" + c.getRole_id() + "\" ");
			sb.append(">" + c.getRole_name() + "</option>");
		}
		sb.append("</select>");
		codeListHtml = sb.toString();
		return JSON;
	}
	
	public void setSelectType(String selectType) {
		this.selectType = selectType;
	}

	public void setSelectId(String selectId) {
		this.selectId = selectId;
	}

	public void setSelectName(String selectName) {
		this.selectName = selectName;
	}

	public void setSelectWidth(String selectWidth) {
		this.selectWidth = selectWidth;
	}

	public String getCodeListHtml() {
		return codeListHtml;
	}

	public void setSelvalue(String selvalue) {
		this.selvalue = selvalue;
	}
	/* 查询字段映射树 */
	private List<TreeNode> treeNodes = new ArrayList<TreeNode>();

	/* 查询字段映射树 */
	public String queryAllColTreeNodes() throws Exception {
		treeNodes.clear();
		colMapping = new ColMapping();
		colMapping.setB_id(bizId);
		List list = serviceBS.queryAllColMappingList(colMapping);
		TreeNode ptreeNode = new TreeNode("-1", "目录", null, null, false, true,
				true, false);
		List ctreeNodes = new ArrayList<TreeNode>();

		for (Object o : list) {
			ColMapping c = (ColMapping) o;
			TreeNode treeNode = new TreeNode(c.getColumns(), c.getCname(),
					"-1", null, false, false, true, false);
			ctreeNodes.add(treeNode);

		}
		ptreeNode.setNodes(ctreeNodes);
		if(list!=null&&list.size()!=0)treeNodes.add(ptreeNode);

		return JSON;
	}
	
	/* 查询字段映射树 one */
	public String queryAllColTreeNodesSelOne() throws Exception {
		treeNodes.clear();
		colMapping = new ColMapping();
		colMapping.setB_id(bizId);
		List list = serviceBS.queryAllColMappingList(colMapping);

		for (Object o : list) {
			ColMapping c = (ColMapping) o;
			TreeNode treeNode = new TreeNode(c.getColumns(), c.getCname(),
					"-1", null, false, false, true, false);
			treeNodes.add(treeNode);

		}

		return JSON;
	}

	/* 组件资源树 不用*/
	public String querySystemMapTypeTreeNodes() throws Exception {
		treeNodes.clear();
		List list = this.sysCodeListBS.querySystemMapListType();
		for (Object o : list) {
			SystemMap c = (SystemMap) o;
			TreeNode treeNode = new TreeNode(c.getType(), c.getType(),
					null, null, false, false, false, false);
			treeNodes.add(treeNode);
		}
		return JSON;
	}
	/* 组件资源树 */
	public String querySystemResTreeNodes() throws Exception {
		treeNodes.clear();
		List list = this.sysCodeListBS.querySysResListTree();
		for (Object o : list) {
			SystemRes c = (SystemRes) o;
			TreeNode treeNode = new TreeNode(c.getRes_id(), c.getRes_name(),
					null, null, false, false, false, false);
			treeNodes.add(treeNode);
		}
		return JSON;
	}
	
	/**
	 * add by hanliqiang
	 * 查询操作流程映射树 
	 * */
	public String queryAllOperationTreeNodes() throws Exception {
		treeNodes.clear();
		SystemMap systemMap = new SystemMap();
		systemMap.setType(operationType);//operation业务流程
		List list = sysCodeListBS.findSysCodeListByType(systemMap);
		TreeNode ptreeNode = new TreeNode("-1", "目录", null, null, false, true,
				true, false);
		List ctreeNodes = new ArrayList<TreeNode>();

		for (Object o : list) {
			SystemMap c = (SystemMap) o;
			TreeNode treeNode = new TreeNode(c.getKey(), c.getValue(),
					"-1", null, false, false, true, false);
			ctreeNodes.add(treeNode);

		}
		ptreeNode.setNodes(ctreeNodes);
		if(list!=null&&list.size()!=0)
			treeNodes.add(ptreeNode);
		return JSON;
	}
	
	/**
	 * add by hangliqiang
	 * 业务操作流程 关联业务加载树
	 * @return JSON
	 */
	public String queryRaleteOperationTree()throws Exception{
		treeNodes.clear();
		//id = "9999999999";
		List list = serviceBS.queryRelateOperation();
		TreeNode ptreeNode = new TreeNode("-1", "目录", null, null, false, true,
				true, false);
		List ctreeNodes = new ArrayList<TreeNode>();

		for (Object o : list) {
			Business c = (Business) o;
//			String b_type = c.getB_type();
//			String resultB_id = "";
//			if(!"".equals(b_type) || b_type != null){
//				if("2".equals(b_type)|| b_type == "2")
//					 resultB_id = c.getB_id()+"_query";
//				else if("3".equals(b_type) || "5".equals(b_type) || b_type == "3" || b_type == "5")
//					resultB_id = c.getB_id()+"_add";
//			}
			TreeNode treeNode = new TreeNode(c.getB_id(), c.getB_name(),
					"-1", null, false, false, true, false);
			ctreeNodes.add(treeNode);
		}
		ptreeNode.setNodes(ctreeNodes);
		if(list!=null&&list.size()!=0)
			treeNodes.add(ptreeNode);
		return JSON;
	}
	
	public List<TreeNode> getTreeNodes() {
		return treeNodes;
	}
	/* 根据父类ID查子类列表 id*/
	private String id;

	/* 根据父类ID查子类列表 */
	public String queryBizTreeNodes() throws Exception {
		treeNodes.clear();
		if (id == null)
			id = "0";
		
		treeNodes=getDataFromNode(treeNodes,id);
//		List list = sysCodeListBS.findBizListByParent(id);
//		for (Object o : list) {
//			Business c = (Business) o;
//			TreeNode treeNode = new TreeNode(c.getB_id(), c.getB_name(), c
//					.getFather_id(), null, false, true, false, false);
//			treeNodes.add(treeNode);
//		}
		return JSON;
	}
	
	/**
	 * 获取节点信息
	 * @param treeList
	 * @param unit
	 * @return
	 * @throws Exception
	 */
	public List getDataFromNode(List treeList,String id) throws Exception{
		
		List list =treeList;
		List unitList = sysCodeListBS.findBizListByParent(id);
		for (Iterator it= unitList.iterator();it.hasNext();){
			Business c = (Business) it.next();
			TreeNode treeNode = new TreeNode(c.getB_id(), c.getB_name(), c
					.getFather_id(), null, false, true, false, false);
			
			List subNodeList =new ArrayList();
			subNodeList =getDataFromNode(subNodeList,c.getB_id());
			treeNode.setNodes(subNodeList);
			list.add(treeNode);
		}
		return list;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getId() {
		return id;
	}

	/* 根据父类ID查子类checkbox列表 */
	public String queryAllColMappingList() throws Exception {
		colMapping = new ColMapping();
		colMapping.setB_id(bizId);
		List list = serviceBS.queryAllColMappingList(colMapping);
		StringBuffer sb = new StringBuffer();
		for (Object o : list) {
			ColMapping b = (ColMapping) o;
			sb
					.append("<input id=\"checkbox\" type=\"checkbox\" name=\"checkbox\" value=\""
							+ b.getColumns()
							+ "\" /><label>"
							+ b.getColumns()
							+ "</label><br>");
		}
		codeListHtml = sb.toString();
		return JSON;
	}

	public String getBizId() {
		return bizId;
	}

	public void setBizId(String bizId) {
		this.bizId = bizId;
	}

	public void setServiceBS(ServiceBS serviceBS) {
		this.serviceBS = serviceBS;
	}

	public void setSysCodeListBS(SysCodeListBS sysCodeListBS) {
		this.sysCodeListBS = sysCodeListBS;
	}
	/*创建SQLite数据库*/
	public String addCreatePoliceDB() throws Exception{
		sysCodeListBS.addCreatePoliceDB();
		return JSON;
	}

	public void setJwRoleBS(JwRoleBS jwRoleBS) {
		this.jwRoleBS = jwRoleBS;
	}

	public String getOperationType() {
		return operationType;
	}

	public void setOperationType(String operationType) {
		this.operationType = operationType;
	}
}
