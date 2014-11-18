package com.kingtone.jw.biz.xajw.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.kingtone.jw.biz.xajw.dao.JwGpsConfigDao;
import com.kingtone.jw.biz.xajw.domain.JwGpsConfig;
import com.kingtone.jw.biz.xajw.domain.JwGpsData;
import com.kingtone.ssi.dao.SSIOrmDao;

/**
 * 用于后台设置GPS状态dao接口impl
 * @author hanliqiang@kingtoneinfo.com
 *
 */
public class JwGpsConfigDaoImpl extends SSIOrmDao implements JwGpsConfigDao{

	public void addJwGpsConf(JwGpsConfig jwGps) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().insert("addGpsConf", jwGps);
	}

	public void delJwGpsConf(String userID) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().delete("deleteGpsConf", userID);
	}

	public JwGpsConfig findJwGpsConfByUserID(String userID) throws Exception {
		// TODO Auto-generated method stub
		JwGpsConfig jg = new JwGpsConfig();
		jg = (JwGpsConfig)this.getSqlMapClientTemplate().queryForObject("findGpsConfByID", userID);
		return jg;
	}

	public void editJwGpsConf(JwGpsConfig jwGps) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().update("editJwGpsConf", jwGps);
	}

//	
//	public List findJwGpsDateList(JwGpsData jwGpsDate, int skipindex, int maxindex)
//			throws Exception {
//		// TODO Auto-generated method stub
//		List list = new ArrayList();
//		list = this.getSqlMapClientTemplate().queryForList("findJwGpsDateList",jwGpsDate,skipindex,maxindex);
//		return null;
//	}
//
//	public int findJwGpsDateListCount(JwGpsData jwGpsDate) throws Exception {
//		// TODO Auto-generated method stub
//		int i = 0;
//		i = (Integer)this.getSqlMapClientTemplate().queryForList("findJwGpsDateListCount",jwGpsDate).get(0);
//		return i;
//	}

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
		List list = new ArrayList();
		list = this.getSqlMapClientTemplate().queryForList("findGPSData",jwGpsData,skipindex,maxindex);
		return list;
	}
	
	/**
	 * 
	 * 通过用户名，设备ID，时间范围获取对应的GPS数据
	 * 
	 * @return
	 * @throws Exception
	 * 
	 * @author: 陈萧如(chenxiaoru@kingtoneinfo.com)
	 * @date: Jan 17, 2012
	 */
	
	public int findGPSDataCount(JwGpsData jwGpsData) throws Exception {
		int n=0;
		n = (Integer)this.getSqlMapClientTemplate().queryForList("findGPSDataCount",jwGpsData).get(0);
		return n;
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
	public void delGPSData(JwGpsData jwGpsData) throws Exception {
		this.getSqlMapClientTemplate().delete("delGPSData", jwGpsData);
	}
	
	/**
	 * 
	 * 删除选中警务GPS数据
	 * 
	 * @return
	 * @throws Exception
	 * 
	 * @author: 陈萧如(chenxiaoru@kingtoneinfo.com)
	 * @date: Feb 13, 2012
	 */
	public void delSelectGPSData(JwGpsData jwGpsData) throws Exception {
		this.getSqlMapClientTemplate().delete("delSelectGPSData", jwGpsData);
	}

	public List<String> findJwUserIDbyXzqh(String xzqh) throws Exception {
		// TODO Auto-generated method stub
		List<String> list = new ArrayList<String>();
		list = this.getSqlMapClientTemplate().queryForList("findByXzqh", xzqh);
		return list;
	}
	
	// 根据 设备串号 查询GPS数据显示地图
	public List<JwGpsData> showMapByDeviceid(String device_ids)throws Exception{
		List<JwGpsData> list = this.getSqlMapClientTemplate().queryForList("showMapByDeviceid", device_ids);
		return list;
	}
	
	// 根据 设备串号 时间段 查询GPS数据显示地图
	public List<JwGpsData> showMapByDeviceidDD(JwGpsData jwGpsData)throws Exception{
		List<JwGpsData> list = this.getSqlMapClientTemplate().queryForList("showMapByDeviceidDD", jwGpsData);
		return list;
	}
}
