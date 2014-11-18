package com.kingtone.jw.biz.xajw.dao;

import java.util.List;

import com.kingtone.jw.biz.xajw.domain.JwLog;
import com.kingtone.jw.biz.xajw.domain.JwUser;

public interface JwLogDAO {
	public List findJwLogList(JwLog user, int skipindex, int maxindex)
			throws Exception;
	public List findJwLogListQuery(JwLog user, int skipindex, int maxindex)
	throws Exception;
	public List getJwLog(JwLog user) throws Exception;

	public List getJwLogUser(JwLog user) throws Exception;

	public int findJwLogListCount(JwLog user) throws Exception;

	public void delJwLog(String userIds) throws Exception;
	public void addJwLog(JwUser user) throws Exception;
	public int findJwLogListCountQuery(JwLog user) throws Exception;
	public List findJwLogListUserQuery(JwLog user, int skipindex, int maxindex)
	throws Exception;
	public int findJwLogListCountUserQuery(JwLog user) throws Exception;
	public List findJwLogListNuserQuery(JwLog user, int skipindex, int maxindex)
	throws Exception;
	public int findJwLogListCountNuserQuery(JwLog user) throws Exception;
}
