package com.kingtone.jw.platform.bs.impl;

import java.util.List;

import com.kingtone.jw.platform.bs.PsUnitCountBS;
import com.kingtone.jw.platform.bs.PsUserBS;
import com.kingtone.jw.platform.bs.PsUserCountBS;
import com.kingtone.jw.platform.dao.PsUserCountDAO;
import com.kingtone.jw.platform.dao.PsUserDAO;
import com.kingtone.jw.platform.domain.Dispatch;
import com.kingtone.jw.platform.domain.JqCount;
import com.kingtone.jw.platform.domain.JqUser;
import com.kingtone.jw.platform.domain.Organization;
import com.kingtone.ssi.bizservice.SSIBizService;

public class PsUserCountBSImpl extends SSIBizService implements PsUserCountBS {

	private PsUserCountDAO psUCDAO;

	public void setPsUCDAO(PsUserCountDAO psUCDAO) {
		this.psUCDAO = psUCDAO;
	}

	@Override
	public List findJqUserCount(JqCount jqcount, int skipindex, int maxindex)throws Exception {
		return psUCDAO.findJqUserCount(jqcount, skipindex, maxindex);
	}

	@Override
	public int findJqUserCountye(JqCount jqcount) throws Exception {
		return psUCDAO.findJqUserCountye(jqcount);

	}

	@Override
	public void addDispatchJq(Dispatch dispatch) throws Exception {
		psUCDAO.addDispatchJq(dispatch);
		
	}

	@Override
	public void JqDispatchUpdate(Dispatch dispatch) throws Exception {
		psUCDAO.JqDispatchUpdate(dispatch);
		
	}

}
