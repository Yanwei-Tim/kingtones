package com.kingtone.jw.biz.xajw;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.kingtone.jw.biz.xajw.bs.JwUserBS;
import com.kingtone.jw.biz.xajw.bs.JwUserDisplayBS;
import com.kingtone.jw.biz.xajw.domain.JwGpsConfig;
import com.kingtone.jw.biz.xajw.domain.JwGpsData;
import com.kingtone.jw.biz.xajw.domain.JwUser;
import com.kingtone.jw.biz.xajw.domain.JwUserStatus;

import com.kingtone.jw.platform.bs.UnitBS;
import com.kingtone.jw.platform.domain.Unit;

import com.kingtone.ssi.action.SSIAction;

/**
 * GPS状态设置Action
 * 
 * @author yulipeng@kingtoneinfo.com
 * 
 */

@SuppressWarnings("unchecked")
public class JwUserDisplayAC extends SSIAction {
	public JwUserDisplayBS userDisplayBS;
	public JwUserBS jwUserBS;
	private UnitBS unitBS;
	
	private JwGpsConfig jwGpsConfig;
	// 查询关键字类型
	private String qtype;
	// 查询关键字
	private String query;
	private String xzqh;
	// 单击tree节点id
	private String unitID;
	private JwUserStatus jwUserStatus;
	

	public JwUserStatus getJwUserStatus() {
		return jwUserStatus;
	}

	public void setJwUserStatus(JwUserStatus jwUserStatus) {
		this.jwUserStatus = jwUserStatus;
	}

	public String getId() {
		return id;
	}

	public void setJwUserBS(JwUserBS jwUserBS) {
		this.jwUserBS = jwUserBS;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUnitID() {
		return unitID;
	}

	public void setUnitID(String unitID) {
		this.unitID = unitID;
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

	public void setUserDisplayBS(JwUserDisplayBS userDisplayBS) {
		this.userDisplayBS = userDisplayBS;
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

	private List rows = new ArrayList();	
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
	
	public String queryGpsDisplay() throws Exception{//显示警员GPS显示状态
		
		rows.clear();
		JwUser jwUser = new JwUser();
		JwUser jwUserTmp = new JwUser();
		List deptList = unitBS.getUnit();
		
    	if ("name".equals(qtype)) {
    		jwUser.setName(query);
    		jwUserTmp.setName(query);
 		} else if ("account".equals(qtype)) {
 			jwUser.setAccount(query);
 			jwUserTmp.setAccount(query);
 		}
    	jwUser.setXzqh(xzqh);
    	jwUserTmp.setXzqh(xzqh);
    	
    	List ulist = userDisplayBS.findJqUser(jwUser,(Integer.parseInt(page)-1)*Integer.parseInt(rp),Integer.parseInt(rp)*Integer.parseInt(page));   	
    	total= userDisplayBS.findDisplayUserCount(jwUserTmp)+"";    	
    	Map m1 = new HashMap();
		m1.put("0", "<font color=red>隐藏</font>");
		m1.put("1", "<font color=green>显示</font>");
		m1.put("2", "无设置");
		for(int i=0;i<deptList.size();i++){
			Unit unit = (Unit)deptList.get(i);
			
			for (Object o : ulist) {
				JwUser user1 = (JwUser) o;	
				Map map = new HashMap();
				if(unit.getXzqh().equals(user1.getXzqh())){
					map.put("id", user1.getId());
					map.put("cell", new Object[] { user1.getId(), user1.getAccount(),user1.getName(),
							unit.getUnit_name(), user1.getJzname(), m1.get(user1.getDisplay())});
					rows.add(map);
				}
			}
		}		
		return JSON;    	    	    	    	
    }
	
	public String updateUpdateStatus() throws Exception{//修改警员gps显示状态
		userDisplayBS.updateUpdateStatus(jwUserStatus);
		return JSON;
	}
	
	public String queryUserDispatch() throws Exception{//显示警员调度状态
		rows.clear();
		JwUser jwUser = new JwUser();
		JwUser jwUserTmp = new JwUser();
		List deptList = unitBS.getUnit();
		
    	if ("name".equals(qtype)) {
    		jwUser.setName(query);
    		jwUserTmp.setName(query);
 		} else if ("account".equals(qtype)) {
 			jwUser.setAccount(query);
 			jwUserTmp.setAccount(query);
 		}
    	jwUser.setXzqh(xzqh);
    	jwUserTmp.setXzqh(xzqh);
    	
    	List ulist = userDisplayBS.findJqUser(jwUser,(Integer.parseInt(page)-1)*Integer.parseInt(rp),Integer.parseInt(rp)*Integer.parseInt(page));   	
    	total= userDisplayBS.findDisplayUserCount(jwUserTmp)+"";    	
    	Map m1 = new HashMap();
		m1.put("1", "<font color=green>开启</font>");
		m1.put("0", "<font color=red>关闭</font>");
		m1.put("2", "无设置");
		for(int i=0;i<deptList.size();i++){
			Unit unit = (Unit)deptList.get(i);
			
			for (Object o : ulist) {
				JwUser user1 = (JwUser) o;	
				Map map = new HashMap();
				if(unit.getXzqh().equals(user1.getXzqh())){
					map.put("id", user1.getId());
					map.put("cell", new Object[] { user1.getId(), user1.getAccount(),user1.getName(),
							unit.getUnit_name(), user1.getJzname(), m1.get(user1.getDispatch())});
					rows.add(map);
				}
			}
		}		
		return JSON;
	}
	
	public String updateDispatchStatus() throws Exception{//修改警员调度状态
		userDisplayBS.updateDispatchStatus(jwUserStatus);
		return JSON;
	}
}
