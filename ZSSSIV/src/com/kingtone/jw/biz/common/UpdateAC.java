package com.kingtone.jw.biz.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.kingtone.jw.biz.common.bs.UpdateBS;
import com.kingtone.jw.biz.common.domain.JwUpdate;
import com.kingtone.jw.biz.service.util.Tools;
import com.kingtone.jw.biz.xajw.bs.JwUserBS;
import com.kingtone.ssi.action.SSIAction;
import com.kingtone.ssi.log.LogTools;

public class UpdateAC extends SSIAction {
	
	public JwUserBS jwUserBS;
	public UpdateBS updateBS;
	

	private List rows = new ArrayList();

	protected String rp;

	protected String page;

	protected String total = "0";

	private String id;

	private String ids;
	private String path;
	
	public String getPath() {
		return path;
	}


	public void setPath(String path) {
		this.path = path;
	}
	private JwUpdate jwUpdate;

	private String flag;

	

	public String getFlag() {
		return flag;
	}


	public void setFlag(String flag) {
		this.flag = flag;
	}
	private String info = null;

	// 修改用户id
	private String userId;

	// 查询关键字
	private String query;

	// 查询关键字类型
	private String qtype;

	// 单击tree节点id
	private String unitID;

	private String userIds;

	private String xzqh;

	private String xzinfo;

	// 返回到前台的select标签字符串
	private String codeListHtml = "";

	// 前台传来的select标签id
	private String selectId = null;

	private String selectName = null;

	private String selectWidth = null;
	private String accountInfo = null;

	private static final String UP_LOAD_FILE = "uploadfile";
	private String delInfo;

	private String delInfo1;

	private String delInfo2;
	private String delInfo3;
	private File test;
	private String testFileName;
	private String testContentType;
	private String description;



	
	


	public String getAccountInfo() {
		return accountInfo;
	}


	public void setAccountInfo(String accountInfo) {
		this.accountInfo = accountInfo;
	}


	public String getCodeListHtml() {
		return codeListHtml;
	}


	public void setCodeListHtml(String codeListHtml) {
		this.codeListHtml = codeListHtml;
	}


	public String getDelInfo() {
		return delInfo;
	}


	public void setDelInfo(String delInfo) {
		this.delInfo = delInfo;
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


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getIds() {
		return ids;
	}


	public void setIds(String ids) {
		this.ids = ids;
	}


	public String getInfo() {
		return info;
	}


	public void setInfo(String info) {
		this.info = info;
	}
	public JwUpdate getJwUpdate() {
		return jwUpdate;
	}


	public void setJwUpdate(JwUpdate jwUpdate) {
		this.jwUpdate = jwUpdate;
	}


	


	public JwUserBS getJwUserBS() {
		return jwUserBS;
	}


	public void setJwUserBS(JwUserBS jwUserBS) {
		this.jwUserBS = jwUserBS;
	}


	public String getPage() {
		return page;
	}


	public void setPage(String page) {
		this.page = page;
	}


	public String getQtype() {
		return qtype;
	}


	public void setQtype(String qtype) {
		this.qtype = qtype;
	}


	public String getQuery() {
		return query;
	}


	public void setQuery(String query) {
		this.query = query;
	}


	public List getRows() {
		return rows;
	}


	public void setRows(List rows) {
		this.rows = rows;
	}


	public String getRp() {
		return rp;
	}


	public void setRp(String rp) {
		this.rp = rp;
	}


	public String getSelectId() {
		return selectId;
	}


	public void setSelectId(String selectId) {
		this.selectId = selectId;
	}


	public String getSelectName() {
		return selectName;
	}


	public void setSelectName(String selectName) {
		this.selectName = selectName;
	}


	public String getSelectWidth() {
		return selectWidth;
	}


	public void setSelectWidth(String selectWidth) {
		this.selectWidth = selectWidth;
	}

	public File getTest() {
		return test;
	}


	public void setTest(File test) {
		this.test = test;
	}


	public String getTestContentType() {
		return testContentType;
	}


	public void setTestContentType(String testContentType) {
		this.testContentType = testContentType;
	}


	public String getTestFileName() {
		return testFileName;
	}


	public void setTestFileName(String testFileName) {
		this.testFileName = testFileName;
	}


	public String getTotal() {
		return total;
	}


	public void setTotal(String total) {
		this.total = total;
	}

	public UpdateBS getUpdateBS() {
		return updateBS;
	}


	public void setUpdateBS(UpdateBS updateBS) {
		this.updateBS = updateBS;
	}


	public String getUnitID() {
		return unitID;
	}


	public void setUnitID(String unitID) {
		this.unitID = unitID;
	}
	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserIds() {
		return userIds;
	}


	public void setUserIds(String userIds) {
		this.userIds = userIds;
	}


	public String getXzinfo() {
		return xzinfo;
	}


	public void setXzinfo(String xzinfo) {
		this.xzinfo = xzinfo;
	}


	public String getXzqh() {
		return xzqh;
	}


	public void setXzqh(String xzqh) {
		this.xzqh = xzqh;
	}


	public String addJwUpdate() {
		try {
			File upload;
			String filename = System.currentTimeMillis() + ".apk";

			String suffixName = testFileName.substring(testFileName
					.lastIndexOf("."));
			if (suffixName.equals(".apk")) {
				upload = new File(ServletActionContext.getServletContext()
						.getRealPath("/versionfile")
						+ "/" + filename);

				FileUtils.copyFile(test, upload);

				JwUpdate jwUpdate = new JwUpdate();
				jwUpdate.setName(testFileName);
				jwUpdate.setState("0");
				jwUpdate.setName_copy(filename);
				SimpleDateFormat sdf = new SimpleDateFormat(
						"yyyy-MM-dd HH:mm:ss");
				Date currentTime = new Date();
				jwUpdate.setTime(sdf.parse(sdf.format(currentTime)));
				jwUpdate.setDescription(description);
				jwUpdate.setDescription("更新程序");
				updateBS.addJwUpdate(jwUpdate);
				return "jwupdate_success";
			} else {
				return "jwupdate_fail";

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "jwupdate_fail";
		}

	}

	public String checkFileSiez(){
		File file = new File(path);
		JwUpdate jwUpdate=new JwUpdate();
		if (file.exists() && file.isFile()) {
			FileInputStream fis = null;
			try {
				fis = new FileInputStream(file);
				int i = fis.available();
				if(i>10485760){
					flag="1";
				}else{
					flag="0";
				}
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					if (fis != null)
						fis.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return JSON;
	}
	
	public String queryJwUpdateList() throws Exception {
		LogTools.debug(getCurrentAccount().getUsername(),
				getCurrentUnit().getUnit_name(), "应用管理", 
				"进入【应用更新】维护页面");
		rows.clear();
		JwUpdate jwupdate = new JwUpdate();
		if ("name".equals(qtype)) {
			jwupdate.setName(query);
		} else if ("desc".equals(qtype)) {
			jwupdate.setDescription(query);
		}
		Map m = new HashMap();
		m.put("1", "是");
		m.put("0", "否");
		List userList = updateBS.findJwUpdateList(jwupdate,(Integer.parseInt(page) - 1) * Integer.parseInt(rp), Integer.parseInt(rp));
		
		for (Object o : userList) {
			JwUpdate update = (JwUpdate) o;
			
				  Map map = new HashMap();
					map.put("id", update.getId());
					map.put("cell", new Object[] { update.getId(), update.getName(),update.getVersion(),
							!"".equals(update.getTime())&&null != update.getTime()?Tools.formatDate(update.getTime()):"", update.getDescription(),m.get(update.getState())});
					rows.add(map); 
				  
			  }
			
	
		
		total = updateBS.findJwUpdateListCount(jwupdate) + "";
		unitID = null;
		return JSON;
			
			
		}

	public String editJwUpdate() throws Exception {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    Date currentTime=new Date();
		jwUpdate.setTime(sdf.parse(sdf.format(currentTime)));

		updateBS.editJwUpdate(jwUpdate);

		return JSON;
	}
    
	public String delJwUpdate() throws Exception {
		String[] userId = ids.split("split");
		for (int i = 0; i < userId.length; i++) {
			jwUpdate = updateBS.findJwUpdateById(userId[i]);
			if(jwUpdate.getState().equals("1")){
				delInfo="1";
			}else{
			String fileName=jwUpdate.getName_copy();
			File file=new File(ServletActionContext.getServletContext()
					.getRealPath("/versionfile")
					+ "/"+fileName);
			file.delete();
			
			updateBS.delJwUpdate(userId[i]);
		}}
		return JSON;
	}
	
	public String changeState() throws Exception {
		String defaultApkFileName = ResourceBundle.getBundle("configes").getString("apk_fileName");
		updateBS.changeState();
		updateBS.changeState(ids);
		jwUpdate = updateBS.findJwUpdateById(ids);
		
		File upload = new File(ServletActionContext.getServletContext()
				.getRealPath("/versionfile")
				+ "/"+defaultApkFileName+".apk");
		upload.delete();
		
		String fileName=jwUpdate.getName_copy();
		File file=new File(ServletActionContext.getServletContext()
				.getRealPath("/versionfile")
				+ "/"+fileName);
		File uploadfile = new File(ServletActionContext.getServletContext()
				.getRealPath("/versionfile")
				+ "/"+defaultApkFileName+".apk");
		uploadfile.createNewFile();
		
		try{
		FileUtils.copyFile(file,uploadfile);
		}catch(Exception e){
			System.out.println(e);
		}
		return JSON;
	}
	public String queryJwUpdateById() throws Exception {
		jwUpdate = updateBS.findJwUpdateById(id);
		HttpServletResponse response = this.getResponse();
		response.setHeader("Pragma","No-Cache");
	    response.setHeader("Cache-Control","No-Cache");
	    response.setDateHeader("Expires", 0);
		return JSON;
	}

	
}
