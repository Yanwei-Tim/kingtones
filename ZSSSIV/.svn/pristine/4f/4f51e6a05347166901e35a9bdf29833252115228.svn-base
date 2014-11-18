package com.kingtone.jw.platform.bs.impl;

import java.util.List;

import com.kingtone.jw.platform.bs.PsUnitCountBS;
import com.kingtone.jw.platform.dao.PsUnitCountDAO;
import com.kingtone.jw.platform.domain.JqCount;
import com.kingtone.ssi.bizservice.SSIBizService;

public class PsUnitCountBSImpl extends SSIBizService implements PsUnitCountBS {

	private PsUnitCountDAO psUnitCDAO;

	public void setPsUnitCDAO(PsUnitCountDAO psUnitCDAO) {
		this.psUnitCDAO = psUnitCDAO;
	}

	@Override
	public List findJqUnitCount(JqCount jqcount, int skipindex, int maxindex)throws Exception {
		return psUnitCDAO.findJqUnitCount(jqcount, skipindex, maxindex);
	}

	@Override
	public int findJqUnitCountye(JqCount jqcount) throws Exception {
		return psUnitCDAO.findJqUnitCountye(jqcount);

	}

}
