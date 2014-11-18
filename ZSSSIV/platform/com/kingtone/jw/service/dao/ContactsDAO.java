package com.kingtone.jw.service.dao;

import com.kingtone.jw.service.domain.QueryEnvelop;

/**
 * 通讯录操作接口
 * @author yangzm
 */
public interface ContactsDAO {
	
	/**
	 * 查询部门信息
	 * @param query
	 * @return
	 * @throws Exception
	 */
	public QueryEnvelop getDepartment(QueryEnvelop request) throws Exception;
	
	/**
	 * 查询人员信息信息（含分页）
	 * @param query
	 * @return
	 * @throws Exception
	 */
	public QueryEnvelop getEmployeeByDepId(QueryEnvelop request) throws Exception;
}
