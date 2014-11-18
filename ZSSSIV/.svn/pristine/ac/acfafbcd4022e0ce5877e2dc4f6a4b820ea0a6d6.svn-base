package com.kingtone.jw.platform.bs.impl;

import java.util.List;

import com.kingtone.jw.platform.bs.UnitBS;
import com.kingtone.jw.platform.dao.UnitDAO;
import com.kingtone.jw.platform.domain.Unit;
import com.kingtone.jw.platform.domain.User;
import com.kingtone.jw.platform.domain.UserLog;
import com.kingtone.ssi.bizservice.SSIBizService;

public class UnitBSImpl extends SSIBizService implements UnitBS {
      private UnitDAO unitDAO;
      
	public void addUnit(Unit unit) throws Exception {
		unitDAO.addUnit(unit);

	}

	public void delUnit(String unitIds) throws Exception {
		 String [] unitIdArray = unitIds.split("split");
	        for(int i=0;i<unitIdArray.length;i++){
	             unitDAO.delUnit(unitIdArray[i]);
	        }
	    }
		
	public void delUnitId(String unitIds) throws Exception {
		
	             unitDAO.delUnitId(unitIds);
	      
	    }

	public void editUnit(Unit unit) throws Exception {
		// TODO Auto-generated method stub
		unitDAO.editUnit(unit);

	}

	public Unit findUnitById(String id) throws Exception {
		// TODO Auto-generated method stub
		return unitDAO.findUnitById(id);
	}

	public List findUnitList(User user,Unit unit, int skipindex, int maxindex)
			throws Exception {
		// TODO Auto-generated method stub
		return unitDAO.findUnitList(user,unit, skipindex, maxindex);
	}

	public int findUnitListCount(User user,Unit unit) throws Exception {
		// TODO Auto-generated method stub
		return unitDAO.findUnitListCount(user,unit);
	}
	public int findUnitListCount1(String unit) throws Exception {
		// TODO Auto-generated method stub
		return unitDAO.findUnitListCount1(unit);
	}

	public void setUnitDAO(UnitDAO unitDAO) {
		this.unitDAO = unitDAO;
	}

	public List findUnitListTree(Unit unit) throws Exception {
		// TODO Auto-generated method stub
		return 		this.unitDAO.findUnitListTree(unit);
	}
	public List findUnitListById(String pId) throws Exception{
		return 		unitDAO.findUnitChild(pId);
	}
	public int findUnitByXzqh(String xzqh) throws Exception {
		// TODO Auto-generated method stub
		return unitDAO.findUnitByXzqh( xzqh);
	}
	public int findUnitByXzqhUnit(Unit  unit) throws Exception {
		// TODO Auto-generated method stub
		return unitDAO.findUnitByXzqhUnit( unit);
	}

	public void importUnit(Unit unit) throws Exception {
		this.unitDAO.importUnit(unit);
	}

	public List getUnit() throws Exception {
		return 		this.unitDAO.getUnit();
	}

	public Unit findUnitByXzqh1(String xzqh) throws Exception {
		return 		this.unitDAO.findUnitByXzqh1(xzqh);
	}
	public int findUnitListCountByXzqh(String unit) throws Exception {
		// TODO Auto-generated method stub
		return this.unitDAO.findUnitByXzqh(unit);
	}
	public int findUnitListCountByParent_id(String parent_id) throws Exception {
		// TODO Auto-generated method stub
		return this.unitDAO.findUnitByParent_id(parent_id);
	}

	public List findLogList(UserLog userLog,int skipIndex, int maxIndex) throws Exception {
		// TODO Auto-generated method stub
		return this.unitDAO.findUserLogList(userLog, skipIndex, maxIndex);
	}

	public int findLogCount(UserLog userLog) throws Exception {
		// TODO Auto-generated method stub
		return this.unitDAO.findUserLogCount(userLog);
	}

	public void delUserLog(String operateDate) throws Exception {
		this.unitDAO.deleteUserLog(operateDate);
		
	}

	
	public List findAllSubUnitsByParentId(String Parent_id) throws Exception {
		// TODO Auto-generated method stub
		return this.unitDAO.findAllSubUnitsByParentId(Parent_id);
	}

}
