package com.kingtone.jw.biz.xajw.bs.impl;

import java.util.List;

import com.kingtone.jw.biz.xajw.bs.JwGpsManagerBS;
import com.kingtone.jw.biz.xajw.dao.JwGpsManagerDao;
import com.kingtone.jw.biz.xajw.domain.JqMessage;
import com.kingtone.jw.biz.xajw.domain.JwGpsData;

/**
 * 用于后台设置GPS状态BSImpl
 * @author 
 *
 */

public class JwGpsManagerBSImpl implements JwGpsManagerBS{
	private JwGpsManagerDao gpsManagerDAO;

	public void setGpsManagerDAO(JwGpsManagerDao gpsManagerDAO) {
		this.gpsManagerDAO = gpsManagerDAO;
	}

	@Override
	public List findGps10all() throws Exception {
		return gpsManagerDAO.findGps10all();

	}

	@Override
	public List findUserforMap(JwGpsData jwGpsData) throws Exception {
		return gpsManagerDAO.findUserforMap(jwGpsData);
	}

	@Override
	public List findJqforMap() throws Exception {
		return gpsManagerDAO.findJqforMap();
	}

	@Override
	public void insertJqMessage(JqMessage jqMessage) throws Exception {
		gpsManagerDAO.insertJqMessage(jqMessage);
		
	}


}
