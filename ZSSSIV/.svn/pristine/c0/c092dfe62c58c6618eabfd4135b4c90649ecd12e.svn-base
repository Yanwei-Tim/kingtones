package com.kingtone.jw.platform.org;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.rmi.server.UID;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.kingtone.jw.platform.bs.PsUserBS;
import com.kingtone.jw.platform.domain.JqUser;
import com.kingtone.jw.platform.domain.Organization;
import com.kingtone.jw.platform.domain.TreeNode;
import com.kingtone.jw.platform.util.OrgUtils;
import com.kingtone.ssi.action.SSIAction;
/**
 * Title:警员维护警情action
 * Description:增删改查
 * Author: yulipeng于李鹏
 * Date: 2014-9-4
 */
public class PsUserAC extends SSIAction{

	private JqUser jquser_bak;

    private PsUserBS psUserBS;
    
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
	
	/**
     * Description:查询用户单元
     * Author: yulpeng - yulpeng@kingtoneinfo.com
     * Date: 2014-9-11
     * @throws Exception
     */
	public String queryJqGridData() throws Exception{
		
		rows.clear();
    	JqUser jquser = new JqUser();
    	JqUser jquserCnt = new JqUser();
    	
    	if ("name".equals(qtype)) {
    		jquser.setName(query);
    		jquserCnt.setName(query);
 		} else if ("code".equals(qtype)) {
 			jquser.setCode(query);
 			jquserCnt.setCode(query);
 		}else if ("account".equals(qtype)) {
 			jquser.setAccount(query);
 			jquserCnt.setAccount(query);
 		}
    	
    	jquser.setOrg_id(treeNodeID);
    	jquserCnt.setOrg_id(treeNodeID);
    	
    	List ulist = psUserBS.findJqUser(jquser,(Integer.parseInt(page)-1)*Integer.parseInt(rp),Integer.parseInt(rp));   	
        
    	Map m1 = new HashMap();
		m1.put(0, "<font color=red>关闭</font>");
		m1.put(1, "<font color=green>接受</font>");
    	for(Object o :  ulist) {
    	    JqUser jquser1 = (JqUser) o;
			Map map = new HashMap();
			map.put("id", jquser1.getId());
			map.put("cell", new Object[] { jquser1.getId(),jquser1.getCode(),jquser1.getName(),
					jquser1.getAccount(),jquser1.getOrg_name(),m1.get(jquser1.getStatus()),jquser1.getSort() });
			rows.add(map);
		}
        total = psUserBS.findJqListCount(jquserCnt)+"";
		treeNodeID = null;
		return JSON;

    }

	 /**
     * Description:新增用户单元
     * Author: yulpeng - yulpeng@kingtoneinfo.com
     * Date: 2014-9-11
     * @throws Exception
     */
    public String addJqUser() throws Exception{
    	jquser_bak.setId(new UID().toString());
    	
    	int count=psUserBS.findJqByCandA(jquser_bak);
    	if(count>0){
        	xzinfo="1";
        }else{
        	psUserBS.addUserJq(jquser_bak);
        }       
        return JSON;
    }

    /**
     * Description:查询指定id用户
     * Author: yulipeng - yulipeng@kingtoneinfo.com
     * Date: 2014-9-11
     * @throws Exception
     */
    public String queryJqUserByID()throws Exception{
    	String jqID1=jqID;
    	jquser_bak = psUserBS.findJqUserByID(jqID1);
    	
        return JSON;
    }
    
    /**
     * Description:修改用户单元
     * Author: yulipeng - yulipeng@kingtoneinfo.com
     * Date: 2014-9-11
     * @throws Exception
     */
    public String editUser() throws Exception{
    	int count = psUserBS.findJqByUserxg(jquser_bak);
    	if(count>0){
    		xzinfo="1";
    	}else{
    		psUserBS.editUser(jquser_bak);
    	}
    	 return "jsonResult";

    }
    
    /**
	 * Description:删除用户单元 Author: yulipeng - yulipeng@kingtoneinfo.com 
	 * Date: 2014-9-12
	 * 
	 * @throws Exception
	 */
    public String delJqUser() throws Exception{
    	delInfo = "1";
    	String [] delUserIDs =userIds.split("split");
    	for(int i=0;i<delUserIDs.length;i++){
    		JqUser jquser = new JqUser();
    		jquser.setId(delUserIDs[i]);
    		int count=psUserBS.findJqDispatchCount(jquser);
    		if(count>0){
                delInfo="2"; //子节点
                return JSON;
            }
    	}
    	psUserBS.delUser(userIds);
        return JSON;
        
    }
    
    /**
	 * excel导出
	 * 
	 * @return
	 */
	public String excelDoOut() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String fileName = "警情用户信息导出.xls";
		String dirpath = request.getRealPath(UP_LOAD_FILE) + "\\";
		File path = new File(dirpath);
		if (path.exists()) {
			path.mkdirs();
		}
		String filepath = dirpath + fileName;
		File file = new File(filepath);
		if (file.exists()) {
			file.delete();
		}
		try {
			file.createNewFile();
			WritableWorkbook workbook = Workbook.createWorkbook(file);
			WritableSheet sheet = workbook.createSheet("用户信息", 0);
			// 设置表格的样式
			WritableFont wfTitle = new jxl.write.WritableFont(
					WritableFont.COURIER, 10, WritableFont.BOLD, false);
			WritableCellFormat wcfTitle = new WritableCellFormat(wfTitle);
			wcfTitle.setAlignment(Alignment.CENTRE);
			wcfTitle.setBorder(Border.ALL, BorderLineStyle.THIN);

			sheet.addCell(new Label(0, 0, "警员ID", wcfTitle));
			sheet.addCell(new Label(1, 0, "警员编码", wcfTitle));
			sheet.addCell(new Label(2, 0, "警员姓名", wcfTitle));
			sheet.addCell(new Label(3, 0, "警员账号", wcfTitle));
			sheet.addCell(new Label(4, 0, "所属机构名称", wcfTitle));
			sheet.addCell(new Label(5, 0, "所属机构编码", wcfTitle));
			sheet.addCell(new Label(6, 0, "通讯状态(0:关闭 1:接收)", wcfTitle));			
			sheet.addCell(new Label(7, 0, "排列顺序", wcfTitle));
			// 设置边框
			WritableFont wfTitle2 = new jxl.write.WritableFont(
					WritableFont.COURIER, 10, WritableFont.NO_BOLD, false);
			WritableCellFormat wcfTitle2 = new WritableCellFormat(wfTitle2);
			wcfTitle2.setBorder(Border.ALL, BorderLineStyle.THIN);
			
			List userList = new ArrayList();
			if("0001".equals(treeNodeID)){
				userList = psUserBS.getOrganAll();				
			}else if(treeNodeID.equals("null")){
				userList = psUserBS.getOrganAll();
			}else{
				userList = psUserBS.getOrganAllbyId(treeNodeID);
			}

			for (int i = 0; i < userList.size(); i++) {
				JqUser jquser = (JqUser) userList.get(i);
				sheet.addCell(new Label(0, i + 1,jquser.getId(),wcfTitle2));				
				sheet.addCell(new Label(1, i + 1,jquser.getCode(), wcfTitle2));
				sheet.addCell(new Label(2, i + 1,jquser.getName(), wcfTitle2));
				sheet.addCell(new Label(3, i + 1,jquser.getAccount(), wcfTitle2));
				sheet.addCell(new Label(4, i + 1,jquser.getOrg_name(), wcfTitle2));
				sheet.addCell(new Label(5, i + 1,jquser.getOrg_id(),wcfTitle2));
				sheet.addCell(new Label(6, i + 1,String.valueOf( jquser.getStatus()),wcfTitle2));
				sheet.addCell(new Label(7, i + 1,String.valueOf( jquser.getSort()),wcfTitle2));
			}
			workbook.write();
			workbook.close();

			TempleteByPath(filepath);
			file.delete();
		} catch (Exception e) {
			e.printStackTrace();
			return JSON;

		}

		return JSON;
	}
    
	/**author：yulipeng
	 * excel导入
	 * 
	 * @return
	 */
	public String importExcel(){
		HttpServletRequest request = ServletActionContext.getRequest();
		File upload1 = null;
		int count3=0;
		try {
			upload1 = new File(ServletActionContext.getServletContext().getRealPath("/uploadfile")
					+ "/" + System.currentTimeMillis() + ".xls");
			if(test != null)
				FileUtils.copyFile(test, upload1);

			if (upload1.exists() || upload1.length() > 0) {

				FileInputStream inputSteam = new FileInputStream(upload1);

				Workbook book = Workbook.getWorkbook(inputSteam);
				Sheet sheet = book.getSheet(0);
				int rows = sheet.getRows();

				JqUser jquser= new JqUser();
				
				for (int i = 1; i < rows; i++) {
					// 警员ID
					Cell useridColumn = sheet.getCell(0, i);
					String user_id = useridColumn.getContents();
					user_id = OrgUtils.delBlankChar(user_id);
					// 警员编码
					Cell codeColumn = sheet.getCell(1, i);
					String code = codeColumn.getContents();
					code = OrgUtils.delBlankChar(code);
					// 警员姓名
					Cell usernameColumn = sheet.getCell(2, i);
					String user_name = usernameColumn.getContents();
					user_name = OrgUtils.delBlankChar(user_name);
					// 警员账号
					Cell accountColumn = sheet.getCell(3, i);
					String account = accountColumn.getContents();
					account = OrgUtils.delBlankChar(account);
					// 所属机构ID
					Cell policeidColumn = sheet.getCell(4, i);
					String parent_id = policeidColumn.getContents();
					parent_id = OrgUtils.delBlankChar(parent_id);
					
					// 状态
					Cell usertypeColumn = sheet.getCell(5, i);
					String status = usertypeColumn.getContents();
					status = OrgUtils.delBlankChar(status);
					
					// 排序
					Cell mobileColumn = sheet.getCell(6, i);
					String orderid = mobileColumn.getContents();
					orderid = OrgUtils.delBlankChar(orderid);
							
					jquser.setId(user_id);
					jquser.setCode(code);
					jquser.setName(user_name);
					jquser.setAccount(account);
					jquser.setOrg_id(parent_id);
					jquser.setStatus(Integer.parseInt(status));
					jquser.setSort(Integer.parseInt(orderid));
					psUserBS.importOrgan(jquser);
					count3=count3+1;				 
				}
			}
		
		} catch (NumberFormatException e) {//异常无法处理
			e.printStackTrace();
			upload1.delete();
		    String count4=count3+"";
		    request.getSession().setAttribute("count4",count4);
		    return "success";
		}catch (Exception e) {

			e.printStackTrace();
			delInfo = "导入失败！";			
			return "error";
		}
		upload1.delete();
	    String count4=count3+"";
	    request.getSession().setAttribute("count4",count4);
		return "success";
	}
	
	/**
	 * excel模板下载
	 * 
	 * @return
	 */
	public String ExcelTemp() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String fileName = "警情用户模板.xls";//request.getRealPath
		String temppath = request.getSession().getServletContext().getRealPath(UP_LOAD_FILE) + "\\" + fileName;
		TempleteByPath(temppath);
		return JSON;
	}

	
	/**
	 * 将模板 下载到指定路径
	 */
	private void TempleteByPath(String filePath) {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			File file = new File(filePath);
			String fileName = file.getName();
			response.setContentType("application/vnd.ms-excel"); // 设置头，浏览器不认识就提示下载
			response.setHeader("Content-Disposition", "attachment;filename="
					+ new String(fileName.getBytes("gbk"), "ISO8859-1"));//fileName.getBytes("GB2312")
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
			response.setStatus(HttpServletResponse.SC_OK);
			response.flushBuffer();
		} catch (Exception e) {
			e.printStackTrace();
			e.toString();
		}
	}
	
	public JqUser getJquser_bak() {
		return jquser_bak;
	}

	public void setJquser_bak(JqUser jquserBak) {
		jquser_bak = jquserBak;
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
	
}
