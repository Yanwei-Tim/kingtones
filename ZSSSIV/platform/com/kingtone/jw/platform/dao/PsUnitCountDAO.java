package com.kingtone.jw.platform.dao;

import java.util.List;

import com.kingtone.jw.platform.domain.JqCount;

public interface PsUnitCountDAO {

	public List findJqUnitCount(JqCount jqcount,int skipindex, int maxindex) throws Exception;
	public int findJqUnitCountye(JqCount jqcount) throws Exception;


}
