package com.kingtone.jw.biz.xajw.bs.impl;

import java.util.List;

import com.kingtone.jw.biz.xajw.bs.JwLogBS;
import com.kingtone.jw.biz.xajw.dao.JwLogDAO;
import com.kingtone.jw.biz.xajw.domain.JwLog;
import com.kingtone.ssi.bizservice.SSIBizService;

public class JwLogBSImpl extends SSIBizService implements JwLogBS {
	public JwLogDAO jwLogDAO;

	public void delJwLog(String userIds) throws Exception {
		this.jwLogDAO.delJwLog(userIds);

	}

	public List findJwLogList(JwLog user, int skipindex, int maxindex)
			throws Exception {

		return this.jwLogDAO.findJwLogList(user, skipindex, maxindex);
	}

	public List getJwLog(JwLog user) throws Exception {

		return this.jwLogDAO.getJwLog(user);
	}

	public List getJwLogUser(JwLog user) throws Exception {

		return this.jwLogDAO.getJwLogUser(user);
	}

	public int findJwLogListCount(JwLog user) throws Exception {

		return this.jwLogDAO.findJwLogListCount(user);
	}

	public void setJwLogDAO(JwLogDAO jwLogDAO) {
		this.jwLogDAO = jwLogDAO;
	}

	public List findJwLogListQuery(JwLog user, int skipindex, int maxindex) throws Exception {
		// TODO Auto-generated method stub
		return this.jwLogDAO.findJwLogListQuery(user, skipindex, maxindex);
	}
	public List findJwLogListUserQuery(JwLog user, int skipindex, int maxindex) throws Exception {
		// TODO Auto-generated method stub
		return this.jwLogDAO.findJwLogListUserQuery(user, skipindex, maxindex);
	}
	public List findJwLogListNuserQuery(JwLog user, int skipindex, int maxindex) throws Exception {
		// TODO Auto-generated method stub
		return this.jwLogDAO.findJwLogListNuserQuery(user, skipindex, maxindex);
	}

	public int findJwLogListCountQuery(JwLog user) throws Exception {
		// TODO Auto-generated method stub
		return this.jwLogDAO.findJwLogListCountQuery(user);
	}
	public int findJwLogListCountUserQuery(JwLog user) throws Exception {
		// TODO Auto-generated method stub
		return this.jwLogDAO.findJwLogListCountUserQuery(user);
	}
	public int findJwLogListCountNuserQuery(JwLog user) throws Exception {
		// TODO Auto-generated method stub
		return this.jwLogDAO.findJwLogListCountNuserQuery(user);
	}

}
