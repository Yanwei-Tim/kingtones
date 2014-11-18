package com.kingtone.jw.biz.xajw.bs;

import java.util.List;

import com.kingtone.jw.biz.xajw.domain.JwGpsConfig;
import com.kingtone.jw.biz.xajw.domain.JwGpsData;
/**
 * 用于后台设置GPS状态BS
 * @author hanliqiang@kingtoneinfo.com
 *
 */

public interface JwGpsConfigBS {
	//增加GPS状态
	public void addGpsConf(JwGpsConfig jwGps)throws Exception;
	//删除GPS状态
	public void delGpsConf(String userID)throws Exception;
	//修改GPS状态
	public void updateGpsConf(JwGpsConfig jwGps)throws Exception;
	//根据userID查询GPS状态
	public JwGpsConfig findGpsConfByUserID(String userID)throws Exception;
	//根据行政区划查询jw_gps_config是的userID
	public List<String> findJwUserIDbyXzqh(String xzqh)throws Exception;
	// Add by 陈萧如 start
	// 根据用户名，设备串号，时间范围查询GPS数据信息
	public List findGPSData(JwGpsData jwGpsData, int skipindex, int maxindex)throws Exception;
	// 根据用户名，设备串号，时间范围查询GPS数据条数
	public int findGPSDataCount(JwGpsData jwGpsData)throws Exception;
	// 删除传入警务GPS数据
	public void delGPSData(JwGpsData jwGpsData)throws Exception;
	// 删除选中警务GPS数据
	public void delSelectGPSData(JwGpsData jwGpsData)throws Exception;
	// Add by 陈萧如 end
	// 根据 设备串号 查询GPS数据显示地图
	public List<JwGpsData> showMapByDeviceid(String device_ids)throws Exception;	
	// 根据 设备串号 时间段 查询GPS数据显示地图
	public List<JwGpsData> showMapByDeviceidDD(JwGpsData jwGpsData)throws Exception;	
}
