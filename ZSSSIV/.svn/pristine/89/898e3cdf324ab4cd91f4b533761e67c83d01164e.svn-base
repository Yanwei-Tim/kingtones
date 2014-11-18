package com.kingtone.jw.platform.org;

import java.io.File;
import java.rmi.server.UID;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kingtone.jw.platform.bs.PsUnitCountBS;
import com.kingtone.jw.platform.bs.PsUserBS;
import com.kingtone.jw.platform.bs.PsUserCountBS;
import com.kingtone.jw.platform.domain.Dispatch;
import com.kingtone.jw.platform.domain.JqCount;
import com.kingtone.jw.platform.domain.Organization;
import com.kingtone.jw.platform.domain.TreeNode;
/**
 * Title:警员维护警情action
 * Description:增删改查
 * Author: yulipeng于李鹏
 * Date: 2014-9-4
 */
public class PsUnitCountAC{

	private Dispatch dispatch_bak;//接受前台的数据对象，（接口留用）  dispatch_bak.name...

	private PsUnitCountBS psUnitCBS;
    private PsUserBS psUserBS;
    private PsUserCountBS psUCBS;
	public void setPsUserBS(PsUserBS psUserBS) {
		this.psUserBS = psUserBS;
	}
	//每页/最大记录数
    protected String rp;
    //当前页码
    protected String page;
    //总记录数
    protected String total = "1500";
    //单元列表显示对象-变量名固定
    private List rows = new ArrayList();
    //单元树显示对象-变量名固定
    private List<TreeNode> treeNodes = new ArrayList<TreeNode>();
    //单击tree节点ID
    private String treeNodeID;
    //展开tree节点ID
    private String id ;
    //修改or新增单元 对象
    private Organization organ_bak;
    //删除提示信息
    private String delInfo;
    //删除单元id字符串-IN
    private String delOrgans;
    //修改organ机构Id   
    private String jqID;
    
    private String userIds;
    private String query;
    
    private String qtype;
    private String xzinfo;
    private static final String UP_LOAD_FILE = "uploadfile";

	private String uploadFileName = "用户信息导入.xls"; // 上传文件名
	private String upload;// 实际上传文件
	
	private String delInfo1;
	private String delInfo2;
	private String delInfo3;
	private File test;
	private String testFileName;
	private String testContentType;
	private String stime;
	private String etime;
	
	/**
     * Description:查询处警统计
     * Author: yulpeng - yulpeng@kingtoneinfo.com
     * Date: 2014-9-17
     * @throws Exception
     */
	public String findJqUnitCount() throws Exception{
		rows.clear();
		JqCount jqcount = new JqCount();
		jqcount.setParent_id(treeNodeID);
		System.out.println("--------treeid++++++"+treeNodeID);
		List ulist = null;
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		if(null!=stime && !("").equals(stime)){
			jqcount.setStime(formatter.parse(stime));
			jqcount.setEtime(formatter.parse(etime));
		}	 			
		ulist = psUnitCBS.findJqUnitCount(jqcount,(Integer.parseInt(page)-1)*Integer.parseInt(rp),Integer.parseInt(rp));
		
		for(Object o :  ulist) {
        	JqCount jqcount1 = (JqCount) o;    

			Map map = new HashMap();
			map.put("id", jqcount1.getId());
			map.put("cell", new Object[] { jqcount1.getId(),jqcount1.getName(), jqcount1.getAccept()==0?0:"<b><font color=red>"+jqcount1.getAccept()+"</font></b>",
					jqcount1.getReach()==0?0:"<b><font color=orange>"+jqcount1.getReach()+"</font></b>",jqcount1.getFinish()==0?0:"<b><font color=blue>"+jqcount1.getFinish()+"</font></b>",
							formatter.format(jqcount1.getStime()),formatter.format(jqcount1.getEtime())});
			rows.add(map);
		}
        total = psUnitCBS.findJqUnitCountye(jqcount)+"";
		treeNodeID = null;
		return "jsonResult";		
	}

	public Dispatch getDispatch_bak() {
		return dispatch_bak;
	}

	public void setDispatch_bak(Dispatch dispatchBak) {
		dispatch_bak = dispatchBak;
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

	public void setRows(List rows) {
		this.rows = rows;
	}

	public List<TreeNode> getTreeNodes() {
		return treeNodes;
	}

	public void setTreeNodes(List<TreeNode> treeNodes) {
		this.treeNodes = treeNodes;
	}

	public String getTreeNodeID() {
		return treeNodeID;
	}

	public void setTreeNodeID(String treeNodeID) {
		this.treeNodeID = treeNodeID;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Organization getOrgan_bak() {
		return organ_bak;
	}

	public void setOrgan_bak(Organization organBak) {
		organ_bak = organBak;
	}

	public String getDelInfo() {
		return delInfo;
	}

	public void setDelInfo(String delInfo) {
		this.delInfo = delInfo;
	}

	public String getDelOrgans() {
		return delOrgans;
	}

	public void setDelOrgans(String delOrgans) {
		this.delOrgans = delOrgans;
	}

	public String getJqID() {
		return jqID;
	}

	public void setJqID(String jqID) {
		this.jqID = jqID;
	}

	public String getQuery() {
		return query;
	}

	public void setQuery(String query) {
		this.query = query;
	}

	public String getQtype() {
		return qtype;
	}

	public void setQtype(String qtype) {
		this.qtype = qtype;
	}

	public String getXzinfo() {
		return xzinfo;
	}

	public void setXzinfo(String xzinfo) {
		this.xzinfo = xzinfo;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getUpload() {
		return upload;
	}

	public void setUpload(String upload) {
		this.upload = upload;
	}

	public String getDelInfo1() {
		return delInfo1;
	}

	public void setDelInfo1(String delInfo1) {
		this.delInfo1 = delInfo1;
	}

	public String getDelInfo2() {
		return delInfo2;
	}

	public void setDelInfo2(String delInfo2) {
		this.delInfo2 = delInfo2;
	}

	public String getDelInfo3() {
		return delInfo3;
	}

	public void setDelInfo3(String delInfo3) {
		this.delInfo3 = delInfo3;
	}

	public File getTest() {
		return test;
	}

	public void setTest(File test) {
		this.test = test;
	}

	public String getTestFileName() {
		return testFileName;
	}

	public void setTestFileName(String testFileName) {
		this.testFileName = testFileName;
	}

	public String getTestContentType() {
		return testContentType;
	}

	public void setTestContentType(String testContentType) {
		this.testContentType = testContentType;
	}

	public static String getUpLoadFile() {
		return UP_LOAD_FILE;
	}

	public String getUserIds() {
		return userIds;
	}

	public void setUserIds(String userIds) {
		this.userIds = userIds;
	}

	public void setPsUCBS(PsUserCountBS psUCBS) {
		this.psUCBS = psUCBS;
	}
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	public String getEtime() {
		return etime;
	}
	public void setEtime(String etime) {
		this.etime = etime;
	}

	public void setPsUnitCBS(PsUnitCountBS psUnitCBS) {
		this.psUnitCBS = psUnitCBS;
	}
	
}
