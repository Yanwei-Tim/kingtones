package com.kingtone.jw.service.dao;

import java.util.List;

import com.kingtone.jw.biz.common.domain.JwUpdate;
import com.kingtone.jw.service.domain.FaceEnvelop;
import com.kingtone.jw.service.domain.InsertEnvelop;
import com.kingtone.jw.service.domain.QueryEnvelop;
import com.kingtone.jw.service.jwoa.envelop.OaEnvelop;

/**
 * <p>接口功能：记录日志、查询Apk更新信息、更新终端用户在线状态</p>
 *
 * @author: 邹甲乐(zoujiale@kingtoneinfo.com)
 * @date: Jan 6, 2012
*/
public interface LogDAO {
	/**
	 * 进行查询操作时更新警务日志。
	 * @param request
	 * @throws Exception
	 */
	public void InsertQueryLog(QueryEnvelop request)throws Exception;
	
	/**
	 * 增加一条数据时更新警务日志。
	 * @param request
	 * @throws Exception
	 */
	public void InsertAddLog(InsertEnvelop request)throws Exception;

	/**
	 * 获取数据库中最新的版本信息。
	 * @return
	 * @throws Exception
	 */
	public List<JwUpdate> queryUpdateInfo()throws Exception;
	
	/**
	 * <p>终端发更新户在线状态，类似脉冲</p>
	 * 
	 * @param loadtime
	 * @throws Exception
	 * @author: 邹甲乐(zoujiale@kingtoneinfo.com)
	 * @date: Jan 6, 2012
	 */
	public void addLoadtime(String loadtime)throws Exception;
	
	
	/**
	 * 插入OA部分调用日志。
	 * @param request
	 * @throws Exception
	 * @author yangzm
	 * @date：2014-08-20
	 */
	public void InsertOALog(OaEnvelop request)throws Exception;
	
	/**
	 * 插入人脸识别部分调用日志。
	 * @param request
	 * @throws Exception
	 * @author yangzm
	 * @date：2014-08-20
	 */
	public void InsertFaceLog(FaceEnvelop request)throws Exception;

}
