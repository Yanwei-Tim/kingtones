package com.kingtone.jw.biz.xajw.bs;


import java.util.List;

import com.kingtone.jw.biz.xajw.domain.JqMessage;
import com.kingtone.jw.biz.xajw.domain.JwGpsData;


public interface JwGpsManagerBS {
	
	public List findGps10all() throws Exception;
	public List findUserforMap(JwGpsData jwGpsData) throws Exception;
	/*调度指挥管理，获取警情内容*/
	public List findJqforMap() throws Exception;
	/*插入警情信息*/
	public void insertJqMessage(JqMessage jqMessage) throws Exception;
}
