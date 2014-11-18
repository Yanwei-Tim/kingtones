package com.kingtone.jw.service.face.entity;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * 查询条件的根实体
 * @author yangzm
 */
@XmlRootElement(name = "root")
@XmlAccessorType(XmlAccessType.FIELD)
public class QueryRoot {

	@XmlElement(name = "QueryCondition")
	private QueryCondition queryCondition;

	public QueryCondition getQueryCondition() {
		return queryCondition;
	}

	public void setQueryCondition(QueryCondition queryCondition) {
		this.queryCondition = queryCondition;
	}

	@Override
	public String toString() {
		System.out.println("----- img = " + queryCondition.getImg());
		System.out.println("----- sex = " + queryCondition.getSex());
		System.out.println("----- score = " + queryCondition.getScore());
		System.out.println("----- maxCount = " + queryCondition.getMaxCount());
		return super.toString();
	}
}
