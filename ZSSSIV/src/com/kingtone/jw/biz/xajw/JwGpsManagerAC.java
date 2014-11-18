package com.kingtone.jw.biz.xajw;

import java.rmi.server.UID;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import com.kingtone.jw.biz.xajw.bs.JwGpsManagerBS;
import com.kingtone.jw.biz.xajw.domain.JqContent;
import com.kingtone.jw.biz.xajw.domain.JqMessage;
import com.kingtone.jw.biz.xajw.domain.JwGpsConfig;
import com.kingtone.jw.biz.xajw.domain.JwGpsData;
import com.kingtone.jw.platform.bs.UnitBS;
import com.kingtone.ssi.action.SSIAction;

/**
 * GPS状态设置和搜索(地图)Action
 * 
 * @author yulipeng@kingtoneinfo.com
 * 
 */

@SuppressWarnings("unchecked")
public class JwGpsManagerAC extends SSIAction {
	public JwGpsManagerBS gpsManagerBS;
	private UnitBS unitBS;
	protected JqMessage jqMessage;
	private JwGpsConfig jwGpsConfig;
	// 查询关键字类型
	private String qtype;
	// 查询关键字
	private String query;
	private String xzqh;
	
	private List rows = new ArrayList();	
	private List jqlist = new ArrayList();
	protected String total = "0";	
	protected String page;	
	protected String rp;	
	protected String userName;	
	protected String deviceid;	
	protected String startdate;	
	protected String enddate;	
	protected JwGpsData jwGpsData;	
	private String ids;
	private String id;	
	
	public JqMessage getJqMessage() {
		return jqMessage;
	}

	public void setJqMessage(JqMessage jqMessage) {
		this.jqMessage = jqMessage;
	}

	public List getJqlist() {
		return jqlist;
	}

	public void setJqlist(List jqlist) {
		this.jqlist = jqlist;
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

	public void setUnitBS(UnitBS unitBS) {
		this.unitBS = unitBS;
	}

	public void setGpsManagerBS(JwGpsManagerBS gpsManagerBS) {
		this.gpsManagerBS = gpsManagerBS;
	}

	public JwGpsConfig getJwGpsConfig() {
		return jwGpsConfig;
	}

	public void setJwGpsConfig(JwGpsConfig jwGpsConfig) {
		this.jwGpsConfig = jwGpsConfig;
	}
	
	// 删除项
	private String deleteItems;
	public String getDeleteItems() {
		return deleteItems;
	}
	public void setDeleteItems(String deleteItems) {
		this.deleteItems = deleteItems;
	}
	
	public void setRows(List rows) {
		this.rows = rows;
	}
	public List getRows() {
		return rows;
	}
	public String getXzqh() {
		return xzqh;
	}

	public void setXzqh(String xzqh) {
		this.xzqh = xzqh;
	}
	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getRp() {
		return rp;
	}
	public void setRp(String rp) {
		this.rp = rp;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getDeviceid() {
		return deviceid;
	}
	public void setDeviceid(String deviceid) {
		this.deviceid = deviceid;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	public JwGpsData getJwGpsData() {
		return jwGpsData;
	}
	public void setJwGpsData(JwGpsData jwGpsData) {
		this.jwGpsData = jwGpsData;
	}
	
	private String result;
	
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String findGpsall()throws Exception{////将10分钟内所有定位坐标上传的警员(地图)
     	JwGpsData jgd = new JwGpsData();
        List list = gpsManagerBS.findGps10all();       
        Iterator it = list.iterator();
		while (it.hasNext()) {
			jgd = (JwGpsData) it.next();
			rows.add(jgd);
		}				
		return "jsonResult";
	}	
	
	public String findUserforMap()throws Exception{////根据账号或姓名搜索警员(地图)
		JwGpsData jgd = new JwGpsData();
		if(jwGpsData.getUaid()==0){//0姓名，1账号
			jgd.setUserName(jwGpsData.getAccount());
		}else{
			jgd.setAccount(jwGpsData.getAccount());
		}
		List list = gpsManagerBS.findUserforMap(jgd);
		Iterator it = list.iterator();
		while (it.hasNext()) {
			jgd = (JwGpsData) it.next();
			rows.add(jgd);
		}					
		return "jsonResult";
	}
	public String findUserJqforMap() throws Exception{ //调度指挥管理，获取警情内容
		JwGpsData jgd = new JwGpsData();
        List list = gpsManagerBS.findGps10all();       
        Iterator it = list.iterator();
		while (it.hasNext()) {
			jgd = (JwGpsData) it.next();
			rows.add(jgd);
		}
		
		JqContent jqcontent = new JqContent();
		List listjq = gpsManagerBS.findJqforMap();
		Iterator jqit = listjq.iterator();
		while (jqit.hasNext()) {
			jqcontent = (JqContent) jqit.next();
			jqlist.add(jqcontent);
		}
		return "jsonResult";		
	}
	
	public String sendJqMessage() throws Exception{//插入警情信息

		jqMessage.setId(new UID().toString());
		gpsManagerBS.insertJqMessage(jqMessage);
		return "jsonResult";		
	}
}
