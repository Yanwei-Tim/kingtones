package com.kingtone.jw.biz.service;

import com.kingtone.jw.biz.service.bs.ServiceBS;
import com.kingtone.ssi.action.SSIAction;

public class SysConfMgAC extends SSIAction {
	// serviceBS
	public ServiceBS serviceBS;

	public void setServiceBS(ServiceBS serviceBS) {
		this.serviceBS = serviceBS;
	}
}
