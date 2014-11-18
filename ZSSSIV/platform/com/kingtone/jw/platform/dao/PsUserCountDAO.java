package com.kingtone.jw.platform.dao;

import java.util.List;

import com.kingtone.jw.platform.domain.Dispatch;
import com.kingtone.jw.platform.domain.JqCount;

public interface PsUserCountDAO {

	public List findJqUserCount(JqCount jqcount,int skipindex, int maxindex) throws Exception;
	public int findJqUserCountye(JqCount jqcount) throws Exception;
	public void addDispatchJq(Dispatch dispatch) throws Exception;
	public void JqDispatchUpdate(Dispatch dispatch) throws Exception;

}
