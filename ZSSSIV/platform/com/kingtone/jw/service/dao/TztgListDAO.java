package com.kingtone.jw.service.dao;

import com.kingtone.jw.service.domain.QueryEnvelop;

public interface TztgListDAO {
//	public List findtztg_bak(QueryEnvelop request) throws Exception;
	public QueryEnvelop findtztg(QueryEnvelop request) throws Exception;
	public void setTztgUpdate(String id) throws Exception;
}
