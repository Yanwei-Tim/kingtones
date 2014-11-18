package com.kingtone.jw.biz.xajw.dao;


import java.util.List;

import com.kingtone.jw.biz.xajw.domain.JqMessage;
import com.kingtone.jw.biz.xajw.domain.JwGpsData;
/**
 * 用于后台设置GPS状态dao接口
 * @author hanliqiang@kingtoneinfo.com
 *
 */

public interface JwGpsManagerDao {
	public List findGps10all() throws Exception;
	public List findUserforMap(JwGpsData jwGpsData) throws Exception;
	/*调度指挥管理，获取警情内容*/
	public List findJqforMap() throws Exception;
	/*插入警情信息*/
	public void insertJqMessage(JqMessage jqMessage) throws Exception;
}
