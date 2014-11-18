package com.kingtone.jw.platform.org;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kingtone.jw.biz.xajw.domain.JwLog;
import com.kingtone.jw.platform.bs.UnitBS;
import com.kingtone.jw.platform.domain.UserLog;
import com.kingtone.ssi.action.SSIAction;
import com.kingtone.ssi.log.LogTools;

public class LogAC extends SSIAction {

	private UnitBS unitBS;
	
	  //展开tree节点ID
    private String id ;
    
    //查询关键字类型
	private String qtype;
	 
	private String query;
	 
	protected String rp;
	 
	protected String page;
	
    private List rows = new ArrayList();
    
    //总记录数
    protected String total = "1500";
    
    private String logIds;
    
	public String queryLog()throws Exception{
		LogTools.debug(getCurrentAccount().getUsername(),
				getCurrentUnit().getUnit_name(), "后台日志管理", 
				"进入【后台日志】维护页面");
		UserLog userLog = new UserLog();
		rows.clear();
		if ("OPERATE_DATE".equals(qtype)) {
			userLog.setOPERATE_DATE(query);			

		} else if ("OPERATE_USER".equals(qtype)) {
			userLog.setOPERATE_USER(query);
			
		}else if ("OPERATE_DEPT".equals(qtype)) {
			userLog.setOPERATE_DEPT(query);
			
		}else if ("OPERATE_OBJECT".equals(qtype)) {
			userLog.setOPERATE_OBJECT(query);
			
		}
		List list = unitBS.findLogList(userLog, (Integer.parseInt(page) - 1)
				* Integer.parseInt(rp), Integer.parseInt(rp));
		for (Object o : list) {
			UserLog b = (UserLog) o;
			Map map = new HashMap();
			map.put("id", b.getOPERATE_DATE());
			map.put("cell", new Object[] { b.getOPERATE_DATE(),b.getOPERATE_USER(),b.getOPERATE_DEPT(),b.getOPERATE_OBJECT(),b.getOPERATE_INFO() });
			rows.add(map);
		}
		total = unitBS.findLogCount(userLog) + "";
		return JSON;
	}

	public String delUserLog() throws Exception {
		String[] logId = logIds.split("split");
		for (int i = 0; i < logId.length; i++) {

			unitBS.delUserLog(logId[i]);
		}
		return JSON;
	} 
	
	public void setUnitBS(UnitBS unitBS) {
		this.unitBS = unitBS;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}


	public String getLogIds() {
		return logIds;
	}


	public void setLogIds(String logIds) {
		this.logIds = logIds;
	}
}
