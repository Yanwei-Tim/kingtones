package com.kingtone.jw.service.domain;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@SuppressWarnings("unchecked")
public class QueryEnvelop {
	/* 查询条件 */
	public Map condition = new HashMap();
	/* 查询页码 */
	public int pageNum =-1; 
	/* 总页数 */
	public int totalPage = -1;
	/* 总条数 */
	private int totalNum = -1;

	/* 每页显示的记录数 默认5条 */
	private int pageSize = 5;
	private String jkType;
	private String name;
	private String danWei;
	private String idCard;

	

	public String getJkType() {
		return jkType;
	}

	public void setJkType(String jkType) {
		this.jkType = jkType;
	}

	/* 返回数据列表 */
	public List list = new ArrayList();
	/* 返回详细信息 */
	public Map detail = new HashMap();
	
	/* 查询业务标识 */
	private String bizTag = null;

	/* 用户登录账号，用于记录日志 */
	private String userID = null;

	public Map getCondition() {
		return condition;
	}

	public void setCondition(Map condition) {
		this.condition = condition;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public Map getDetail() {
		return detail;
	}

	public void setDetail(Map detail) {
		this.detail = detail;
	}

	public String getBizTag() {
		return bizTag;
	}

	public void setBizTag(String bizTag) {
		this.bizTag = bizTag;
	}

	public int getTotalNum() {
		return totalNum;
	}

	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageSize() {
		return pageSize;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public String getDanWei() {
		return danWei;
	}

	public void setDanWei(String danWei) {
		this.danWei = danWei;
	}

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	
}
