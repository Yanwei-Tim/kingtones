package com.kingtone.jw.service.abs;

import com.kingtone.jw.service.domain.InsertEnvelop;
import com.kingtone.jw.service.domain.QueryEnvelop;

public abstract class BusiServiceAbstract {
	/**
	 * <p>信封对象-插入</p>
	 * @author:邹甲乐(zoujiale@kingtoneinfo.com)
	 * @date:Jan 4, 2012
	 */
	private InsertEnvelop insertRequest;
	/**
	 * <p>信封对象-查询</p>
	 * @author:邹甲乐(zoujiale@kingtoneinfo.com)
	 * @date:Jan 4, 2012
	 */
	private QueryEnvelop queryRequest;
	
	/**
	 * 
	 */
	public BusiServiceAbstract(){
	}

	/**
	 * <p>查询业务列表信息</p>
	 * 
	 * @return：QueryEnvelop
	 * @throws Exception
	 * @throws:
	 * @author: 邹甲乐(zoujiale@kingtoneinfo.com)
	 * @date: Jan 4, 2012
	 */
	public abstract QueryEnvelop getList()throws Exception;
	/**
	 * <p>查询业务详细信息</p>
	 * 
	 * @return：QueryEnvelop
	 * @throws Exception
	 * @throws:
	 * @author: 邹甲乐(zoujiale@kingtoneinfo.com)
	 * @date: Jan 4, 2012
	 */
	public abstract QueryEnvelop getDetail()throws Exception;
	/**
	 * <p>插入业务详细信息</p>
	 * 
	 * @throws Exception
	 * @throws:
	 * @author: 邹甲乐(zoujiale@kingtoneinfo.com)
	 * @date: Jan 4, 2012
	 */
	public abstract void addDetail()throws Exception;
	
	/**
	 * <p>终端用户在线状态定时记录</p>
	 * 
	 * @param username
	 * @throws Exception
	 * @author: 邹甲乐(zoujiale@kingtoneinfo.com)
	 * @date: Jan 4, 2012
	 */
	public abstract void addLoadtime(String username)throws Exception;
	
	public InsertEnvelop getInsertRequest() {
		return insertRequest;
	}
	public void setInsertRequest(InsertEnvelop insertRequest) {
		this.insertRequest = insertRequest;
	}
	public QueryEnvelop getQueryRequest() {
		return queryRequest;
	}
	public void setQueryRequest(QueryEnvelop queryRequest) {
		this.queryRequest = queryRequest;
	}
}
