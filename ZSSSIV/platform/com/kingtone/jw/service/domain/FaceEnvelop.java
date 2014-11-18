package com.kingtone.jw.service.domain;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FaceEnvelop {

	private String bizTag; // 业务编码
	private String userId; // 用户ID
	private String name;// 用户姓名
	private String depId;// 机构ID
	private Map condition = new HashMap(); // 查询条件  可选值有[img,sex,nation,score,maxCount]

	private String code;// 返回信息代码 1：成功； 其他数值：错误代码
	private String message;// 返回的信息
	private int rowcount;// 返回的记录数
	private List list = new ArrayList();// 返回结果  [name,idNumber,img,score,sort]

	public String getBizTag() {
		return bizTag;
	}

	public void setBizTag(String bizTag) {
		this.bizTag = bizTag;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDepId() {
		return depId;
	}

	public void setDepId(String depId) {
		this.depId = depId;
	}

	public Map getCondition() {
		return condition;
	}

	public void setCondition(Map condition) {
		this.condition = condition;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getRowcount() {
		return rowcount;
	}

	public void setRowcount(int rowcount) {
		this.rowcount = rowcount;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

}
