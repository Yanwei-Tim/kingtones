/**
 * 文件名：UnitDAO.java
 * 
 * 创建人：邹甲乐 - zoujiale@kingtoneinfo.com
 * 
 * 创建时间：Apr 2, 2011
 * 
 * 版权所有：西安联合信息技术股份有限公司
 */
package com.kingtone.jw.platform.dao;

import java.util.List;


import com.kingtone.jw.platform.domain.Unit;
import com.kingtone.jw.platform.domain.User;
import com.kingtone.jw.platform.domain.UserLog;

/**
 * <p>
 * 组织单元数据访问对象。
 * </p>
 * 
 * @author 张战博 - ｚｈａｎｇｚｈａｎｂｏ@kingtoneinfo.com
 * @version 1.0 Created on ｊｕｌｙ 2０, 20１１ 8:43:20 PM
 */
public interface UnitDAO {

	public List findUnitList(User user,Unit  unit, int skipindex,
			int maxindex) throws Exception;
	public List findUnitListTree(Unit  unit) throws Exception;
	public List findUnitListById(Unit  unit) throws Exception;
	public int findUnitListCount(User user,Unit  unit) throws Exception;
	public int findUnitListCount1(String unit) throws Exception;

	public List findUnitChild(String pId) throws Exception;
	public List findAllSubUnitsByParentId(String parentUnitId)throws Exception;
	public void addUnit(Unit  unit) throws Exception;

	public void editUnit(Unit  unit) throws Exception;

	public void delUnit(String unitIds) throws Exception;
	public void delUnitId(String unitIds) throws Exception;

	public Unit findUnitById(String id) throws Exception;
	public Unit findUnitByXz(String id) throws Exception;
	public Unit findUnitListOfUser(String userId) throws Exception;
	public List findUnitListOfUser(User user_bak)throws Exception;
	public List queryUnitListOfUser(User user_bak)throws Exception;
	public int findUnitByXzqh(String xzqh) throws Exception;
	public int findUnitByParent_id(String parent_id) throws Exception;
	public Unit findUnitByXzqh1(String xzqh) throws Exception;
	public int findUnitByXzqhUnit(Unit  unit) throws Exception;
	public void importUnit(Unit unit) throws Exception;
	public List getUnit() throws Exception;
	public int findUnitListCountByXzqh(String unit) throws Exception;
	
	public List findUserLogList(UserLog userLog,int skipIndex,int maxIndex)throws Exception;
	public int  findUserLogCount(UserLog userLog)throws Exception;
	
	public void deleteUserLog(String operateDate)throws Exception;

}
