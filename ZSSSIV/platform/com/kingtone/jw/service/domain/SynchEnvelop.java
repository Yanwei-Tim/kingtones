package com.kingtone.jw.service.domain;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@SuppressWarnings("unchecked")
public class SynchEnvelop {
	/* 资源更新日期 */
	public Map resDateMap = new HashMap();
	/* 业务更新日期 */
	public Map bizDateMap = new HashMap();
	
	/* 资源列表 */
	public  List resList = new ArrayList();
	/* 选项卡列表 */
	public  List selCardList = new ArrayList();
	/* 业务列表 */
	public  List bizList = new ArrayList();
	/* 业务关联列表 */
	public  List bizRelateList = new ArrayList();
	/* 业务组件列表 */
	public  List bizComponentList = new ArrayList();
	public Map getResDateMap() {
		return resDateMap;
	}
	public void setResDateMap(Map resDateMap) {
		this.resDateMap = resDateMap;
	}
	public Map getBizDateMap() {
		return bizDateMap;
	}
	public void setBizDateMap(Map bizDateMap) {
		this.bizDateMap = bizDateMap;
	}
	public List getResList() {
		return resList;
	}
	public List getSelCardList() {
		return selCardList;
	}
	public List getBizList() {
		return bizList;
	}
	public List getBizRelateList() {
		return bizRelateList;
	}
	public List getBizComponentList() {
		return bizComponentList;
	}
	public void setResList(List resList) {
		this.resList = resList;
	}
	public void setSelCardList(List selCardList) {
		this.selCardList = selCardList;
	}
	public void setBizList(List bizList) {
		this.bizList = bizList;
	}
	public void setBizRelateList(List bizRelateList) {
		this.bizRelateList = bizRelateList;
	}
	public void setBizComponentList(List bizComponentList) {
		this.bizComponentList = bizComponentList;
	}
}
