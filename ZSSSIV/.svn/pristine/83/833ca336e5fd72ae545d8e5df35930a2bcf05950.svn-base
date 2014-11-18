package com.kingtone.jw.biz.xajw.bs.impl;

import java.util.List;

import com.kingtone.jw.biz.xajw.bs.JwGpsConfigBS;
import com.kingtone.jw.biz.xajw.dao.JwGpsConfigDao;
import com.kingtone.jw.biz.xajw.domain.JwGpsConfig;
import com.kingtone.jw.biz.xajw.domain.JwGpsData;

/**
 * 用于后台设置GPS状态BSImpl
 * @author hanliqiang@kingtoneinfo.com
 *
 */

public class JwGpsConfigBSImpl implements JwGpsConfigBS{
	private JwGpsConfigDao gpsConfigDao;
	

	public void setGpsConfigDao(JwGpsConfigDao gpsConfigDao) {
		this.gpsConfigDao = gpsConfigDao;
	}

	public void addGpsConf(JwGpsConfig jwGps) throws Exception {
		// TODO Auto-generated method stub
		this.gpsConfigDao.addJwGpsConf(jwGps);
	}

	public void delGpsConf(String userID) throws Exception {
		// TODO Auto-generated method stub
		this.gpsConfigDao.delJwGpsConf(userID);
	}

	public JwGpsConfig findGpsConfByUserID(String userID) throws Exception {
		// TODO Auto-generated method stub
		return this.gpsConfigDao.findJwGpsConfByUserID(userID);
	}

	public void updateGpsConf(JwGpsConfig jwGps) throws Exception {
		// TODO Auto-generated method stub
		this.gpsConfigDao.editJwGpsConf(jwGps);
	}

	/**
	 * 
	 * 通过用户名，设备ID，时间范围获取对应的GPS数据
	 * 
	 * @return
	 * @throws Exception
	 * 
	 * @author: 陈萧如(chenxiaoru@kingtoneinfo.com)
	 * @date: Jan 16, 2012
	 */
	public List findGPSData(JwGpsData jwGpsData, int skipindex, int maxindex) throws Exception {
		return gpsConfigDao.findGPSData(jwGpsData,skipindex,maxindex);
	}
	
	/**
	 * 
	 * 通过用户名，设备ID，时间范围获取对应的GPS数据条数
	 * 
	 * @return
	 * @throws Exception
	 * 
	 * @author: 陈萧如(chenxiaoru@kingtoneinfo.com)
	 * @date: Jan 17, 2012
	 */
	public int findGPSDataCount(JwGpsData jwGpsData) throws Exception {
		return gpsConfigDao.findGPSDataCount(jwGpsData);
	}

	/**
	 * 
	 * 删除警务GPS数据
	 * 
	 * @return
	 * @throws Exception
	 * 
	 * @author: 陈萧如(chenxiaoru@kingtoneinfo.com)
	 * @date: Jan 17, 2012
	 */
	public void delSelectGPSData(JwGpsData jwGpsData) throws Exception {
		gpsConfigDao.delSelectGPSData(jwGpsData);
	}
	
	/**
	 * 
	 * 删除选中的警务GPS数据
	 * 
	 * @return
	 * @throws Exception
	 * 
	 * @author: 陈萧如(chenxiaoru@kingtoneinfo.com)
	 * @date: Feb 13, 2012
	 */
	public void delGPSData(JwGpsData jwGpsData) throws Exception {
		gpsConfigDao.delGPSData(jwGpsData);
	}

	public List<String> findJwUserIDbyXzqh(String xzqh) throws Exception {
		// TODO Auto-generated method stub
		return gpsConfigDao.findJwUserIDbyXzqh(xzqh);
	}
	
	// 根据 设备串号 查询GPS数据显示地图
	public List<JwGpsData> showMapByDeviceid(String device_ids)throws Exception{
		return gpsConfigDao.showMapByDeviceid(device_ids);
	}
	
	// 根据 设备串号 时间段 查询GPS数据显示地图
	public List<JwGpsData> showMapByDeviceidDD(JwGpsData jwGpsData)throws Exception{
		return gpsConfigDao.showMapByDeviceidDD(jwGpsData);
	}
}
