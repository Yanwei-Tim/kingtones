package com.kingtone.jw.biz.xajw.domain;

/**
 * GPS状态设置，关联表jw_gps_config
 * 设置参数state为GPS启动状态，interval为GPS发送间隔时间
 * @author hanliqiang@kingtoneinfo.com
 * 
 */
public class JwGpsConfig {
	private String userID;// 用户ID
	private int state;// gps启动参数设置0：开机启动；1：进入警务通启动；2：根据后台的设置;3:不开启
	private String interval;// gps上报时间间隔单位（秒）
	private String ids;
	private String xzqh;
	
	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public String getXzqh() {
		return xzqh;
	}

	public void setXzqh(String xzqh) {
		this.xzqh = xzqh;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getInterval() {
		return interval;
	}

	public void setInterval(String interval) {
		this.interval = interval;
	}

	

}
