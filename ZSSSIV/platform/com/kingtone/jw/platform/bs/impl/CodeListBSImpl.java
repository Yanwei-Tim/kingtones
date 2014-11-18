package com.kingtone.jw.platform.bs.impl;

import java.util.List;

import com.kingtone.jw.platform.bs.CodeListBS;
import com.kingtone.jw.platform.dao.CodeListDAO;
import com.kingtone.jw.platform.domain.Code;
import com.kingtone.ssi.bizservice.SSIBizService;

public class CodeListBSImpl extends SSIBizService implements CodeListBS{
	public CodeListDAO codeListDAO;

	public void setCodeListDAO(CodeListDAO codeListDAO) {
		this.codeListDAO = codeListDAO;
	}

	public List findCodeListByType(Code code) throws Exception {
		return codeListDAO.findCodeListByType(code);
	}
}
