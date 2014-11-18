package com.kingtone.jw.platform.bs;

import java.util.List;

import com.kingtone.jw.platform.domain.Code;

public interface CodeListBS {

	public List findCodeListByType(Code code)throws Exception;
}
