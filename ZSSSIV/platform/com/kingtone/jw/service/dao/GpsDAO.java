/**
 * 
 */
package com.kingtone.jw.service.dao;

import com.kingtone.jw.service.domain.GpsConfigEnvelop;
import com.kingtone.jw.service.domain.GpsEnvelop;

/**
 * @author xushilin
 *
 */
public interface GpsDAO {
	
	/**
	 * gps 写入
	 * @param request
	 * @throws Exception
	 */
	public void InsertGPS(GpsEnvelop request)throws Exception;
	
	/**
	 * 根据手机串码返回gps开启状态
	 * @param deviceId
	 * @return
	 * @throws Exception
	 */
	public GpsConfigEnvelop getOnOffStateByDeviceId(String deviceId) throws Exception;
}
