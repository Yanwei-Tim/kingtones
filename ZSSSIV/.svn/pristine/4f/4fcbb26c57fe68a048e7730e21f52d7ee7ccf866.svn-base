package com.kingtone.jw.biz.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;




import com.kingtone.jw.biz.common.bs.SjcjBS;
import com.kingtone.jw.biz.common.domain.Spcj;
import com.kingtone.jw.biz.common.domain.Tpcj;
import com.kingtone.jw.biz.common.util.Utils;
import com.kingtone.jw.biz.service.util.Tools;
import com.kingtone.jw.platform.domain.Unit;
import com.kingtone.jw.platform.domain.User;
import com.kingtone.jw.platform.util.OrgUtils;
import com.kingtone.jw.service.util.GetConfig;
import com.kingtone.ssi.action.SSIAction;
import com.kingtone.ssi.log.LogTools;
@SuppressWarnings("unchecked")
public class SjcjAC extends SSIAction {

	public SjcjBS sjcjBS;

	public void setSjcjBS(SjcjBS sjcjBS) {
		this.sjcjBS = sjcjBS;
	}
	private List rows = new ArrayList();
	protected String rp;
	protected String page;
	protected String total = "0";
	private String id;
	private String ids;
	private Tpcj tpcj;
	private Spcj spcj;
	
	private String fileUrl;
	private String treeNodeID;
	public String getTreeNodeID() {
		return treeNodeID;
	}

	public void setTreeNodeID(String treeNodeID) {
		this.treeNodeID = treeNodeID;
	}
	private String xm = null;
	private String xzqh = null;
	private String dw = null;
	public String getDw() {
		return dw;
	}
	private String device_id = null;
	private String startdate = null;
	private String enddate = null;
	//private String picstrpath1=Utils.GetConfigByKey("pic_path1");
	//private String videopath=Utils.GetConfigByKey("video_path");
	private String picstrpath1=GetConfig.GetConfigByKey("upload_path");
	private String videopath=GetConfig.GetConfigByKey("upload_path");
	
	private String info=null;
	
	
	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String queryTpcjList() throws Exception{
		LogTools.debug(getCurrentAccount().getUsername(),
				getCurrentUnit().getUnit_name(), "图片采集", 
				"进入【图片采集】维护页面");
		tpcj = new Tpcj();
		Tpcj tpcjTmp =new Tpcj();
		
		tpcj.setXm(xm);
		tpcj.setXzqh(xzqh);
		tpcj.setDevice_id(device_id);
		tpcj.setStartdate(startdate);
		tpcj.setEnddate(enddate);
		
		tpcjTmp.setXm(xm);
		tpcjTmp.setXzqh(xzqh);
		tpcjTmp.setDevice_id(device_id);
		tpcjTmp.setStartdate(startdate);
		tpcjTmp.setEnddate(enddate);
		// 登錄用戶信息
		User user =new User();
		if(null==xzqh||"".equals(xzqh)){
			user.setXzqh(getCurrentUnit().getXzqh());
		}else{
			user.setXzqh(xzqh);
		}
		if(null==dw||"".equals(dw)){
			user.setUnitID(getCurrentUnit().getUnit_id());
		}else{
			user.setUnitID(dw);
		}
		List tpcjList = sjcjBS.findAllTpcjPage(user,tpcj, (Integer.parseInt(page) - 1)
				* Integer.parseInt(rp), Integer.parseInt(rp));
		
		for (Object o : tpcjList) {
			Tpcj cj = (Tpcj) o;
			Map map = new HashMap();
			map.put("id",cj.getId() );
			map.put("cell", new Object[] {cj.getId(),
					cj.getPicturename(), 
					cj.getXm(),
					//cj.getDw(),
					//cj.getBm(),
					cj.getDevice_id(),
					Tools.formatDate(cj.getCreatetime()),
					cj.getDescription()
					 });
			rows.add(map);
		}
		
			total =sjcjBS.findAllTpcjPageCount(user,tpcjTmp) + "";
		
		
		return JSON;
	}
	
	public void setDw(String dw) {
		this.dw = dw;
	}

	public String delTpcj()throws Exception{
		String [] idsArray = ids.split("split");
		for(int i=0;i<idsArray.length;i++){
			sjcjBS.deleteTpcj(Integer.parseInt(idsArray[i]), "");
		}
		return JSON;
	}
	
	public String querySpcjList() throws Exception{
		LogTools.debug(getCurrentAccount().getUsername(),
				getCurrentUnit().getUnit_name(), "视频采集", 
				"进入【视频采集】维护页面");
		spcj = new Spcj();
		Spcj spcjTmp =new Spcj();
		
		spcj.setXm(xm);
		spcj.setXzqh(xzqh);
		spcj.setDevice_id(device_id);
		spcj.setStartdate(startdate);
		spcj.setEnddate(enddate);
		
		spcjTmp.setXm(xm);
		spcjTmp.setXzqh(xzqh);
		spcjTmp.setDevice_id(device_id);
		spcjTmp.setStartdate(startdate);
		spcjTmp.setEnddate(enddate);

		// 登录用户信息
		User user =new User();
		if(null==xzqh||"".equals(xzqh)){
			user.setXzqh(getCurrentUnit().getXzqh());
		}else{
			user.setXzqh(xzqh);
		}
		if(null==dw||"".equals(dw)){
			user.setUnitID(getCurrentUnit().getUnit_id());
		}else{
			user.setUnitID(dw);
		}
		List spcjList = sjcjBS.findAllSpcjPage(user,spcj, (Integer.parseInt(page) - 1)
				* Integer.parseInt(rp), Integer.parseInt(rp));
		
		for (Object o : spcjList) {
			Spcj obj = (Spcj) o;
			Map map = new HashMap();
			map.put("id",obj.getId() );
			map.put("cell", new Object[] {obj.getId(),
					obj.getVideoname(), 
					obj.getXm(),
					//obj.getDw(),
					//obj.getBm(),
					obj.getDevice_id(),
					!"".equals(obj.getCreatetime()) && null != obj.getCreatetime() ? Tools.formatDate(obj.getCreatetime()):"",
					obj.getDescription()
					 });
			rows.add(map);
		}
		
			total =sjcjBS.findAllSpcjPageCount(user,spcjTmp) + "";
	
		
		return JSON;
	}
	
	public String delSpcj()throws Exception{
		String [] idsArray = ids.split("split");
		for(int i=0;i<idsArray.length;i++){
			sjcjBS.deleteSpcj(Integer.parseInt(idsArray[i]), "");
		}
		return JSON;
	}

	public String queryImageUrl()throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		 fileUrl=picstrpath1+sjcjBS.findTpcjById(Integer.parseInt(id)).getPicturename();
		 File f = new File( fileUrl);
			if(!f.exists()){
				info="2";
				return JSON;
			}else{
				session.setAttribute("fileUrl", fileUrl);
				return JSON;
			}
	}
	public String queryVedioUrlDir()throws Exception{
		String fileUrl = videopath+sjcjBS.findSpcjById(Integer.parseInt(id)).getVideoname();
		 File f = new File( fileUrl);
 		if(!f.exists())
			info="1";
		return JSON;
	}
	
	public String queryVedioUrl()throws Exception{
		String fileUrl = videopath+sjcjBS.findSpcjById(Integer.parseInt(id)).getVideoname();
		 File f = new File( fileUrl);
 		if(!f.exists()){
			info="1";
			return JSON;
		}else{
		templeteByPath(fileUrl);
		return JSON;}
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
			response.setStatus(HttpServletResponse.SC_OK);
			response.flushBuffer();
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

	public List getRows() {
		return rows;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public void setTpcj(Tpcj tpcj) {
		this.tpcj = tpcj;
	}

	public void setSpcj(Spcj spcj) {
		this.spcj = spcj;
	}

	public void setXm(String xm) {
		this.xm = xm;
	}

	public void setXzqh(String xzqh) {
		this.xzqh = xzqh;
	}

	public void setDevice_id(String device_id) {
		this.device_id = device_id;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public String getFileUrl() {
		return this.fileUrl;
	}
}
