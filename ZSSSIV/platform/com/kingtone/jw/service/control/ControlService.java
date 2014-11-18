package com.kingtone.jw.service.control;

import com.kingtone.jw.service.domain.QueryEnvelop;

public interface ControlService {

	/**
	 * 
	 * 插入查询布控人员
	 * author：yulipeng
	 * time:2014.11.17
	 */
	public QueryEnvelop queryControlUser(QueryEnvelop request) throws Exception;
	
	/**
	 * 
	 * 插入查询布控车辆
	 * author：yulipeng
	 * time:2014.11.17
	 */
	public void queryControlCar(QueryEnvelop request) throws Exception;
}
