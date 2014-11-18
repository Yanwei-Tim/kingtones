package com.kingtone.jw.biz.common.domain;

import java.util.Date;

public class NoticeUser {
	private int id; //主键
	private int reqUserid;//接收人id
	private int readstatus;//是否阅读 未阅读=0;已=1;
	private int noticeid;//通知主表外键
	private String device_id;//手机串号
	private String xm;//手机设备相应的姓名
	private String dw;//接收单位名称。同时对应表中的REQDEPTNAME字，用于暂存接收单位的名称
	private String bm;//接收部门名称
	private Date receiveTime;//签收时间
	private String jh;
	//private String reqdeptname;//接收单位名称
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getReqUserid() {
		return reqUserid;
	}
	public void setReqUserid(int reqUserid) {
		this.reqUserid = reqUserid;
	}

	public int getNoticeid() {
		return noticeid;
	}
	public void setNoticeid(int noticeid) {
		this.noticeid = noticeid;
	}
	public int getReadstatus() {
		return readstatus;
	}
	public void setReadstatus(int readstatus) {
		this.readstatus = readstatus;
	}
	public String getDevice_id() {
		return device_id;
	}
	public void setDevice_id(String device_id) {
		this.device_id = device_id;
	}
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	public String getDw() {
		return dw;
	}
	public void setDw(String dw) {
		this.dw = dw;
	}
	public String getBm() {
		return bm;
	}
	public void setBm(String bm) {
		this.bm = bm;
	}
	public Date getReceiveTime() {
		return receiveTime;
	}
	public void setReceiveTime(Date receiveTime) {
		this.receiveTime = receiveTime;
	}
//	public String getReqdeptname() {
//		return reqdeptname;
//	}
//	public void setReqdeptname(String reqdeptname) {
//		this.reqdeptname = reqdeptname;
//	}
	public String getJh() {
		return jh;
	}
	public void setJh(String jh) {
		this.jh = jh;
	}

}
