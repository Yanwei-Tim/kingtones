package com.kingtone.jw.biz.xajw.dao.impl;

import java.util.List;

import com.kingtone.jw.biz.xajw.dao.JwGpsManagerDao;
import com.kingtone.jw.biz.xajw.domain.JqMessage;
import com.kingtone.jw.biz.xajw.domain.JwGpsData;
import com.kingtone.ssi.dao.SSIOrmDao;

/**
 * 用于后台设置GPS状态dao接口impl
 * @author hanliqiang@kingtoneinfo.com
 *
 */
public class JwGpsManagerDaoImpl extends SSIOrmDao implements JwGpsManagerDao{

	public List findGps10all() throws Exception {//将10分钟内所有定位坐标上传的警员
		return this.getSqlMapClientTemplate().queryForList("findGPS10all");
	}
	
	public List findUserforMap(JwGpsData jwGpsData) throws Exception {//账号或姓名搜索警员
		return this.getSqlMapClientTemplate().queryForList("findUserforMap", jwGpsData);
	}
	public List findJqforMap() throws Exception {//调度指挥管理，获取警情内容
		return this.getSqlMapClientTemplate().queryForList("findJqforMap");
	}
	public void insertJqMessage(JqMessage jqMessage) throws Exception {//插入警情信息
		this.getSqlMapClientTemplate().insert("insertJqMessage",jqMessage);
	}
}
