package com.kingtone.jw.biz.common.domain;

import java.util.Date;

public class Notice {
	private int id; //主键
	private String title;//通知标题
	private String type;//通知类型
	private String content;//通知内容
	private String sendUserid;//发送人id
	private Date sendTime;//发送时间
	private String sendDeptid;//单位外键ID
	private String startdate;//开始时间
	private String enddate;//结束时间
	private String sendStatus; //发送状态
	private String sendDeptname;//发送单位名称
	private String sendUsername;//发送人名称
	
	private String reqdevice_id;//多个接收人拼成的手机串号
	private String requsername;//多个接收人拼成的名字
	private String reqDeptId;//多个接收单位拼成的ID
	private String reqDeptName;//多个接收单位拼成的名称
	private int readStatus;
	private int noticeId;
	
	private String xzqh;
	
	private String uploadFileName;//上传文件的名字
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSendUserid() {
		return sendUserid;
	}
	public void setSendUserid(String sendUserid) {
		this.sendUserid = sendUserid;
	}
	public Date getSendTime() {
		return sendTime;
	}
	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
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
	public String getSendStatus() {
		return sendStatus;
	}
	public void setSendStatus(String sendStatus) {
		this.sendStatus = sendStatus;
	}
	public String getSendDeptid() {
		return sendDeptid;
	}
	public void setSendDeptid(String sendDeptid) {
		this.sendDeptid = sendDeptid;
	}
	public String getSendDeptname() {
		return sendDeptname;
	}
	public void setSendDeptname(String sendDeptname) {
		this.sendDeptname = sendDeptname;
	}
	public String getSendUsername() {
		return sendUsername;
	}
	public void setSendUsername(String sendUsername) {
		this.sendUsername = sendUsername;
	}
	public String getReqdevice_id() {
		return reqdevice_id;
	}
	public void setReqdevice_id(String reqdevice_id) {
		this.reqdevice_id = reqdevice_id;
	}
	public String getRequsername() {
		return requsername;
	}
	public void setRequsername(String requsername) {
		this.requsername = requsername;
	}
	public String getReqDeptId() {
		return reqDeptId;
	}
	public void setReqDeptId(String reqDeptId) {
		this.reqDeptId = reqDeptId;
	}
	public String getReqDeptName() {
		return reqDeptName;
	}
	public void setReqDeptName(String reqDeptName) {
		this.reqDeptName = reqDeptName;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public String getXzqh() {
		return xzqh;
	}
	public void setXzqh(String xzqh) {
		this.xzqh = xzqh;
	}
	public int getReadStatus() {
		return readStatus;
	}
	public void setReadStatus(int readStatus) {
		this.readStatus = readStatus;
	}
	public int getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}
}
