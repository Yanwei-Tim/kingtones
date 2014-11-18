package com.kingtone.jw.platform.dao;

import java.util.List;

import com.kingtone.jw.platform.domain.Code;

public interface CodeListDAO {
	public List findCodeListByType(Code code)throws Exception;
}
