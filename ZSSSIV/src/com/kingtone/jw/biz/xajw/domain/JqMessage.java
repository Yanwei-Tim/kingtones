package com.kingtone.jw.biz.xajw.domain;
/*
 * 
 * 警情信息
 * author:yulipeng
 * time:2014.11.13
 */
public class JqMessage {

	private String id;
	private String userAccount;
	private String message;
	private String gps;
	private String messageTime;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserAccount() {
		return userAccount;
	}
	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getGps() {
		return gps;
	}
	public void setGps(String gps) {
		this.gps = gps;
	}
	public String getMessageTime() {
		return messageTime;
	}
	public void setMessageTime(String messageTime) {
		this.messageTime = messageTime;
	}
	
	
}
