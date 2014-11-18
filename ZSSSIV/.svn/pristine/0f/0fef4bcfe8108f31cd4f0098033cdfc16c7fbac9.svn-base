package com.kingtone.jw.platform.dao.impl;

import java.util.List;

import com.kingtone.jw.platform.dao.CodeListDAO;
import com.kingtone.jw.platform.domain.Code;
import com.kingtone.ssi.dao.SSIOrmDao;

public class CodeListDAOImpl extends SSIOrmDao implements CodeListDAO{
	public List findCodeListByType(Code code)throws Exception{
		return this.getSqlMapClientTemplate().queryForList("findCodeListByType", code);
	}
}
