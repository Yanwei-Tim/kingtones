package com.kingtone.jw.platform.bs;

import java.util.List;

import com.kingtone.jw.platform.domain.Unit;
import com.kingtone.jw.platform.domain.User;
import com.kingtone.jw.platform.domain.UserLog;

public interface UnitBS {
	public List findUnitList(User user,Unit unit, int skipindex, int maxindex)
			throws Exception;

	public List findUnitListTree(Unit unit) throws Exception;
	public List findUnitListById(String  pId) throws Exception;
	public int findUnitListCount(User user,Unit unit) throws Exception;
	public int findUnitListCount1(String unit) throws Exception;
	public int findUnitListCountByXzqh(String unit) throws Exception;

	public int findUnitListCountByParent_id(String Parent_id) throws Exception;
	public List findAllSubUnitsByParentId(String Parent_id) throws Exception;
	public void addUnit(Unit unit) throws Exception;

	public void editUnit(Unit unit) throws Exception;

	public void delUnitId(String unitIds) throws Exception;
	public void delUnit(String unitIds) throws Exception;

	public Unit findUnitById(String id) throws Exception;
	public int findUnitByXzqh(String xzqh) throws Exception;
	public void importUnit(Unit unit) throws Exception;
	public List getUnit() throws Exception;
	public int findUnitByXzqhUnit(Unit unit) throws Exception;
	public Unit findUnitByXzqh1(String xzqh) throws Exception ;
	public List findLogList(UserLog userLog,int skipindex, int maxindex) throws Exception;
	
	public int findLogCount(UserLog userLog)throws Exception;
	
	public void delUserLog(String operateDate) throws Exception;
	
}
