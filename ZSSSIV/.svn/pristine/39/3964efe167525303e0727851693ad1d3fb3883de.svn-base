package com.kingtone.jw.biz.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.kingtone.jw.biz.common.bs.TztgBS;
import com.kingtone.jw.biz.common.domain.Notice;
import com.kingtone.jw.biz.common.domain.NoticeUser;
import com.kingtone.jw.biz.common.util.Utils;
import com.kingtone.jw.biz.service.util.Tools;
import com.kingtone.jw.biz.xajw.bs.JwUserBS;
import com.kingtone.jw.biz.xajw.domain.JwUser;
import com.kingtone.jw.platform.bs.UnitBS;
import com.kingtone.jw.platform.bs.UserBS;
import com.kingtone.jw.platform.domain.TreeNode;
import com.kingtone.jw.platform.domain.Unit;
import com.kingtone.jw.platform.domain.User;
import com.kingtone.jw.platform.util.OrgUtils;
import com.kingtone.ssi.action.SSIAction;
import com.kingtone.ssi.log.LogTools;
@SuppressWarnings("unchecked")
public class TztgAC extends SSIAction{
	public TztgBS tztgBS;
	private UnitBS unitBS;
    private UserBS userBS;
    private JwUserBS jwUserBS;
   

	public void setTztgBS(TztgBS tztgBS) {
		this.tztgBS = tztgBS;
	}
	
	private List rows = new ArrayList();
	protected String rp;
	protected String page;
	protected String total = "0";
	private String id;
	private String ids;
	private Notice tztg;
	private NoticeUser noticeUser;
	private String  info;
	private String uploadFileName;
	private String path;
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	private String sendDeptid = null;
	private String type = null;
	private String sendStatus = null;
	private String startdate = null;
	private String enddate = null;
//	private String upload;
	private String tpcjInfo;
	private String picstrpath1=Utils.GetConfigByKey("pic_path1");
	
	private List<TreeNode> treeNodes = new ArrayList<TreeNode>();
	
	private String optype = null;
	private File test;
	private String testFileName;
	private String testContentType;
	
	
	//	public String queryUnitTreeNodes() throws Exception {
//		treeNodes.clear();
//		Unit unit = new Unit();
//		String currentUnitID = getCurrentUnit().getUnit_id();
//		if (id == null)
//			id = currentUnitID;
//		unit.setParent_id(id);
//		List unitList = unitBS.findUnitListTree(unit);
//
//		for (Object o : unitList) {
//			unit = (Unit) o;
//			TreeNode treeNode = new TreeNode(unit.getUnit_id(), unit
//					.getUnit_name(), unit.getParent_id(), unit.getXzqh(),
//					false, true, false, false);
//			treeNodes.add(treeNode);
//		}
//		id = null;// 复位
//		return JSON;
//	}
	public String queryUnitTreeNodes() throws Exception {
		treeNodes.clear();
		Unit unit = new Unit();		
		String currentUnitID = getCurrentUnit().getUnit_id();
		if (id == null)
			id = currentUnitID;
		unit.setParent_id(id);
		
		treeNodes=getDataFromNode(treeNodes,unit);
		id = null;// 复位
		return JSON;
	}
	/**
	 * 获取节点信息
	 * @param treeList
	 * @param unit
	 * @return
	 * @throws Exception
	 */
	public List getDataFromNode(List treeList,Unit unit) throws Exception{
		Unit unitTmp =unit;
		Unit unitSon =unit;
		List list =treeList;
		List unitList = unitBS.findUnitListTree(unitTmp); 
		for (Iterator it= unitList.iterator();it.hasNext();){
			Unit unitNode =(Unit) it.next();
			TreeNode treeNode =new TreeNode(unitNode.getUnit_id(), unitNode
					.getUnit_name(), unitNode.getParent_id(), unitNode.getXzqh(),
					false, true, false, false);
			unitSon.setParent_id(unitNode.getUnit_id());
			List subNodeList =new ArrayList();
			subNodeList =getDataFromNode(subNodeList,unitSon);
			treeNode.setNodes(subNodeList);
			list.add(treeNode);
		}
		return list;
	}
	
	public String queryUserTreeNodes() throws Exception {
		treeNodes.clear();
		Unit unit = new Unit();
		String currentUnitID = getCurrentUnit().getUnit_id();
		if (id == null)
			id = currentUnitID;
		unit.setParent_id(id);
		List unitList = unitBS.findUnitListTree(unit);
		for (Object o : unitList) {
			unit = (Unit) o;
			TreeNode treeNode = new TreeNode(unit.getUnit_id(), unit
					.getUnit_name(), unit.getParent_id(), unit.getXzqh(), true,
					true, false, false);
			treeNodes.add(treeNode);
		}
		Unit u = unitBS.findUnitById(id);
		JwUser jwUser = new JwUser();
		if (u.getXzqh() != null) {
			jwUser.setXzqh(u.getXzqh());
			List jwUserList = jwUserBS.findJwList(jwUser);
			for (Object o : jwUserList) {
				JwUser obj = (JwUser) o;
				TreeNode treeNode = new TreeNode(obj.getSjcm() + "", obj.getName(),
						"", "", false, false, false, false);
				treeNodes.add(treeNode);
			}
		}
		id = null;// 复位
		return JSON;
	}
	public String queryTztgList() throws Exception{
		LogTools.debug(getCurrentAccount().getUsername(),
				getCurrentUnit().getUnit_name(), "通知通告", 
				"进入【通知通告】维护页面");
		tztg = new Notice();
		Notice tztgCnt =new Notice();
		if(!"-1".equals(type)){
			tztg.setType(type);
			tztgCnt.setType(type);
		}
			
		if("".equals(sendDeptid)||null==sendDeptid){
			tztg.setSendDeptid(getCurrentUnit().getUnit_id());
		}else{
			tztg.setSendDeptid(sendDeptid);
			tztgCnt.setSendDeptid(sendDeptid);
		}
		if(!"-1".equals(sendStatus)){
			tztg.setSendStatus(sendStatus);
			tztgCnt.setSendStatus(sendStatus);
		}
			
		tztg.setStartdate(startdate);
		tztgCnt.setStartdate(startdate);
		tztg.setEnddate(enddate);
		tztgCnt.setEnddate(enddate);
		//登录用户信息
		User user =new User();
		if(null==sendDeptid||"".equals(sendDeptid)){
			user.setUnitID(getCurrentUnit().getUnit_id());
		}else{
			user.setUnitID(sendDeptid);
		}
		
		List tpcjList = tztgBS.findAllNoticePage(user,tztg, (Integer.parseInt(page) - 1)
				* Integer.parseInt(rp), Integer.parseInt(rp));
		
		Map statusMap = (Map) Utils.getTztgCodeList().get("sendstatus");
		Map typeMap =  (Map)Utils.getTztgCodeList().get("noticetype");
		for (Object o : tpcjList) {
			Notice obj = (Notice) o;
			Map map = new HashMap();
			map.put("id",obj.getId() );
			map.put("cell", new Object[] {obj.getId(),
					obj.getTitle(), 
					typeMap.get(obj.getType()),
					obj.getSendUsername(),
					obj.getSendDeptname(),
					statusMap.get(obj.getSendStatus()),
					!"".equals(obj.getSendTime())&&obj.getSendTime() != null?Tools.formatDate(obj.getSendTime()):"",
					obj.getUploadFileName()
					 });
			rows.add(map);
		}
		total =tztgBS.findAllNoticePageCount(user,tztgCnt) + "";
		
		
		return JSON;
	}
	public String queryTztgUserList() throws Exception{
		 noticeUser = new NoticeUser();
		 noticeUser.setId(Integer.parseInt(id));
		 
		List tpcjList = tztgBS.findAllNoticePage(noticeUser, (Integer.parseInt(page) - 1)
				* Integer.parseInt(rp), Integer.parseInt(rp));
		if(tpcjList.size()==0){
			tpcjInfo="1";
			return JSON;
		}else{
		Map m = new HashMap();
		m.put("0", "否");
		m.put("1", "是");
		for (Object o : tpcjList) {
			NoticeUser obj = (NoticeUser) o;
			Map map = new HashMap();
			map.put("id",obj.getId() );
			map.put("cell", new Object[] {obj.getId(),
					obj.getXm(),
//					obj.getJh(),
					obj.getDw(),
//					obj.getBm(),
					m.get(String.valueOf(obj.getReadstatus())),					
					obj.getReceiveTime()
					 });
			rows.add(map);
		}
		total =tztgBS.findAllNoticeUserPageCount(noticeUser) + "";
		return JSON;}
	}
	public String addNotice() throws Exception{
//		System.out.println("xzqu--------->"+tztg.getReqDeptName());
//		System.out.println("userName--------->"+tztg.getRequsername());
	    try {
			tztgBS.saveNotice(tztg, optype);
//			NotificationManager notificationManager = new NotificationManager();
//			notificationManager.sendBroadcast("1234567890", "11111",
//                    "1212", "");
//			notificationManager.sendNotifcationToUser("1234567890", "123456", "11111",
//                    "1212", "");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return JSON;
		}
	    if(optype.equals("send")){
	    	tztgBS.sendPNMessage(tztg);
	    }
		return JSON;
	}
	
	public String queryNoticeByID()throws Exception{
	 
		tztg =tztgBS.findNoticeById(Integer.parseInt(id));
	     
    	
        return JSON;
    }
	public String editNotice()throws Exception{
//		  	File upload1 = new File(upload);
//	     	String file1=picstrpath1+upload1.getName();
//	     	tztg.setUploadFileName(file1);
	     	String currentUserID = ((User) OrgUtils.getInstance().getCurrentUser()).getUserID();
			String currentUnitID = ((Unit) OrgUtils.getInstance().getUnitlistOfUser().get(0)).getUnit_id();
			String currentUserName = ((User) OrgUtils.getInstance().getCurrentUser()).getFullName();
			String currentUnitName = ((Unit) OrgUtils.getInstance().getUnitlistOfUser().get(0)).getUnit_name();
//			tztg =tztgBS.findNoticeById(tztg.getId());
			tztg.setSendUserid(currentUserID);
			tztg.setSendDeptid(currentUnitID);
			tztg.setSendUsername(currentUserName);
			tztg.setSendDeptname(currentUnitName);
		    tztgBS.updateNotice(tztg , optype);
		    if(optype.equals("send")){
		    	tztgBS.sendPNMessage(tztg);
		    }
		    
//		    if(!(upload.equals(""))){
//		    Notice tztg1 =tztgBS.findNoticeById(tztg.getId());
//			File file=new File(tztg1.getUploadFileName());
//			  file.delete();
//		   importExcel(upload);}
		   return JSON;
	}
	
	public String addTztgUpdate() throws Exception {
		if(test == null || !checkFileSize(test,10)){
			return "tztgupdate_file_too_large";
		}
		File upload;
		String temp=String.valueOf(System.currentTimeMillis());
		try {
			String folderPath = getRequest().getRealPath("/")+"tztguploadfile"; 
//	 		upload = new File(ResourceBundle.getBundle("config").getString("upload_path")
//					+ "/" + testFileName.substring(0, testFileName.indexOf("."))
//					+"_"+temp + testFileName.substring(testFileName.lastIndexOf("."),
//									testFileName.length()));
	 		upload = new File(folderPath + "/" + testFileName.substring(0, testFileName.indexOf("."))
					+"_"+temp + testFileName.substring(testFileName.lastIndexOf("."),
									testFileName.length()));
	 		File file = new File(uploadFileName);
	 		if(file.exists()){
				FileUtils.forceDelete(file);
			} 
			FileUtils.copyFile(test, upload);
		}catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "tztgupdate_fail";
		}catch (NullPointerException e){
			e.printStackTrace();
			return "tztgupdate_fail";
		}
		try{
			tztg = new Notice();
			tztg.setUploadFileName(upload.getName());
			tztg.setId(Integer.parseInt(id));
			tztgBS.updateNoticeAttach(tztg);
			return "tztgupdate_success";
		}catch (Exception e) {
			// TODO: handle exception
			FileUtils.forceDelete(upload);
			return "tztgupdate_fail";	
		}
//			return "tztgupdate_fail";	
			
	}
	public String delNotice()throws Exception{
		String [] idsArray = ids.split("split");
		for(int i=0;i<idsArray.length;i++){
			tztgBS.deleteNotice(Integer.parseInt(idsArray[i]));
			
		}
		return JSON;
	}
	
	public String checkFileSiez(){
		File file = new File(path);
		tztg = new Notice();
		if (file.exists() && file.isFile()) {
			boolean checkFileSize = checkFileSize(file,10);
			if(!checkFileSize){
				tztg.setTitle("1");
			}else{
				tztg.setTitle("0");
			}
		}
		return JSON;
	}
	
	public boolean checkFileSize(File file, int mSize){
		boolean isOk = true;
		if (file.exists() && file.isFile()) {
			long length = file.length()/1024/1024;
			if(length > mSize){
				isOk = false;
			}
		}
		return isOk;
	}
	/**
	 * excel导入
	 * 
	 * @return
	 */
	public String importExcel(String upload) {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String targetDirectory = picstrpath1;
		
		File target;
		File upload1 = new File(upload);
		String targetFileName= upload1.getName();
			target = new File(targetDirectory, targetFileName);

			

			try {
				FileUtils.copyFile(upload1, target);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return JSON;
			}
	
	/**
	 * 
	 * 文件下载
	 * 
	 * @return
	 * @throws Exception
	 * 
	 * @author: 陈萧如(chenxiaoru@kingtoneinfo.com)
	 * @date: Feb 14, 2012
	 */
	public String checkFile()throws Exception{
		Notice findNoticeById = tztgBS.findNoticeById(Integer.parseInt(id));
		String folderPath = getRequest().getRealPath("/")+"tztguploadfile"; 
//		String fileName = java.net.URLDecoder.decode(uploadFileName,"utf-8");
		String fileName = findNoticeById.getUploadFileName();
		String fileUrl = folderPath + "/" +fileName;
		File f = new File(fileUrl);
 		if(!f.exists()){
			info="1";
		}
		return JSON;
	}
	
	/**
	 * 
	 * 文件下载
	 * 
	 * @return
	 * @throws Exception
	 * 
	 * @author: 陈萧如(chenxiaoru@kingtoneinfo.com)
	 * @date: Feb 14, 2012
	 */
	public String downloadFile()throws Exception{
		Notice findNoticeById = tztgBS.findNoticeById(Integer.parseInt(id));
		String folderPath = getRequest().getRealPath("/")+"tztguploadfile"; 
//		String fileName = java.net.URLDecoder.decode(uploadFileName,"utf-8");
		String fileName = findNoticeById.getUploadFileName();
		String fileUrl = folderPath + "/" +fileName;
		File f = new File(fileUrl);
		templeteByPath(fileUrl);
		return JSON;
	}
	
	/**
	 * 下载到指定路径
	 * @return
	 */
	private void templeteByPath(String filePath) {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			File file = new File(filePath);
			if(file.exists()){
			String fileName = file.getName();
			//response.setContentType("application/vnd.ms-excel"); // 设置头，浏览器不认识就提示下载
			response.setHeader("Content-Disposition", "attachment;filename="
					+ new String(fileName.getBytes("GB2312"), "ISO8859-1"));
			// 以流的形式写出文件
			FileInputStream bis = new FileInputStream(file);// 以流的形式写出文件
			OutputStream bos = response.getOutputStream();
			byte[] buff = new byte[1024];
			int readCount = 0;
			readCount = bis.read(buff);
			while (readCount != -1) {
				bos.write(buff, 0, readCount);
				readCount = bis.read(buff);
			}
			if (bis != null)
				bis.close();
			if (bos != null)
				bos.close();
			// 下载完毕，给浏览器发给完毕的头
			if(response!=null){
				response.setStatus(HttpServletResponse.SC_OK);
				response.flushBuffer();
			}
		}} catch (Exception e) {
			e.toString();
		} 
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

	public Notice getTztg() {
		return tztg;
	}

	public void setTztg(Notice tztg) {
		this.tztg = tztg;
	}

	public List getRows() {
		return rows;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setSendStatus(String sendStatus) {
		this.sendStatus = sendStatus;
	}

	public void setOptype(String optype) {
		this.optype = optype;
	}

	public void setUnitBS(UnitBS unitBS) {
		this.unitBS = unitBS;
	}

	public void setUserBS(UserBS userBS) {
		this.userBS = userBS;
	}

	public List<TreeNode> getTreeNodes() {
		return treeNodes;
	}

	public void setSendDeptid(String sendDeptid) {
		this.sendDeptid = sendDeptid;
	}

	public String getId() {
		return id;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public NoticeUser getNoticeUser() {
		return noticeUser;
	}

	public void setNoticeUser(NoticeUser noticeUser) {
		this.noticeUser = noticeUser;
	}

//	public String getUpload() {
//		return upload;
//	}
//
//	public void setUpload(String upload) {
//		this.upload = upload;
//	}

	public String getTpcjInfo() {
		return tpcjInfo;
	}

	public void setTpcjInfo(String tpcjInfo) {
		this.tpcjInfo = tpcjInfo;
	}
	public void setJwUserBS(JwUserBS jwUserBS) {
		this.jwUserBS = jwUserBS;
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
	
}
