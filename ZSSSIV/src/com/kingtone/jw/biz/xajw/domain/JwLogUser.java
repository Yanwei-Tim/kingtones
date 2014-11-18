package com.kingtone.jw.biz.xajw.domain;

import java.util.Date;

public class JwLogUser {
    private String bizname;//模块名称
	private String days ;//未使用天数
	private String id; //用户编号
	private String name;//用户名
	private String xb;//性别
	private String account;//性别
	private String sjhm;//手机号码
	private String sjcm;//手机串号
	private String jzname;//警种
	private String xzqh;//部门
	private String description;//身份证号
	private String count;//登录次数
	private Date op_time;// 操作时间
	private String op_time1;
	
	public String getOp_time1() {
		return op_time1;
	}
	public void setOp_time1(String op_time1) {
		this.op_time1 = op_time1;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getBizname() {
		return bizname;
	}
	public void setBizname(String bizname) {
		this.bizname = bizname;
	}
	public String getDays() {
		return days;
	}
	public void setDays(String days) {
		this.days = days;
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
	public String getJzname() {
		return jzname;
	}
	public void setJzname(String jzname) {
		this.jzname = jzname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSjcm() {
		return sjcm;
	}
	public void setSjcm(String sjcm) {
		this.sjcm = sjcm;
	}
	public String getSjhm() {
		return sjhm;
	}
	public void setSjhm(String sjhm) {
		this.sjhm = sjhm;
	}
	
	public String getXb() {
		return xb;
	}
	public void setXb(String xb) {
		this.xb = xb;
	}
	public String getXzqh() {
		return xzqh;
	}
	public void setXzqh(String xzqh) {
		this.xzqh = xzqh;
	}
	public Date getOp_time() {
		return op_time;
	}
	public void setOp_time(Date op_time) {
		this.op_time = op_time;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	
	
	
	
}
