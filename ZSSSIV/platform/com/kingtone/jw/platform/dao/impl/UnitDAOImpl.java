package com.kingtone.jw.platform.dao.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.kingtone.jw.platform.dao.UnitDAO;
import com.kingtone.jw.platform.domain.Unit;
import com.kingtone.jw.platform.domain.User;
import com.kingtone.jw.platform.domain.UserLog;
import com.kingtone.ssi.dao.SSIOrmDao;

public class UnitDAOImpl extends SSIOrmDao implements UnitDAO {

	public void addUnit(Unit unit) throws Exception {
		unit.setIs_leaf("1");
		this.getSqlMapClientTemplate().insert("unitAdd", unit);
	}

	public void delUnit(String unitIds) throws Exception {
		this.getSqlMapClientTemplate().delete("unitDelete", unitIds);
	}
	public void delUnitId(String unitIds) throws Exception {
		this.getSqlMapClientTemplate().delete("unitDeleteId", unitIds);
	}

	public void editUnit(Unit unit) throws Exception {
		this.getSqlMapClientTemplate().update("unitUpdate", unit);
	}

	public Unit findUnitById(String id) throws Exception {
		return (Unit) this.getSqlMapClientTemplate().queryForObject(
				"findUnitByID", id);
	}
	
	public Unit findUnitByXz(String id) throws Exception {
		return (Unit)this.getSqlMapClientTemplate().queryForObject(
				"findUnitByxzqh", id);
	}
	public List findUnitList(User user,Unit unit, int skipindex, int maxindex)
			throws Exception {
		List list=new ArrayList();
		Unit unitTmp =unit;
		if(unitTmp.getParent_id()!=null && !"null".equals(unitTmp.getParent_id())){
//			list = this.getSqlMapClientTemplate().queryForList(
//					"findAllUnitPage", unitTmp, skipindex, maxindex);   2012.2.10修改组织机构显示
			StringBuffer condtion =new StringBuffer();
			condtion.append("'"+user.getUnitID()+"',");
			
			List nodeAll=this.getSqlMapClientTemplate().queryForList("queryAllParantName",user.getUnitID());
			
			int num = 1;
			for(Object o:nodeAll){
				Unit subUnit =(Unit) o;
				if(num==999){
					condtion.append("'"+subUnit.getUnit_id()+"')");
					condtion.append(" or t.parent_id in(");
					num=1;
				}else{
					condtion.append("'"+subUnit.getUnit_id()+"',");
					num++;
				}
			}
			
			
//			for(Iterator it=nodeAll.iterator();it.hasNext();){
//				Unit subUnit =(Unit) it.next();
//				condtion.append("'"+subUnit.getUnit_id()+"',");
//			}
			String tmpCondtion=condtion.toString();
			System.out.println(tmpCondtion);
			
			tmpCondtion=tmpCondtion.substring(0,tmpCondtion.length()-1);
			unitTmp.setParent_id(tmpCondtion);
			List subList =this.getSqlMapClientTemplate().queryForList("findUnitPageStruct", unitTmp);
			for(Iterator subIt=subList.iterator();subIt.hasNext();){
				list.add((Unit)subIt.next());
			}
			
			
			int index =(list.size()-skipindex) >maxindex?maxindex:list.size()-skipindex;
			list =new ArrayList(list.subList(skipindex, skipindex+index));
		}else{
			StringBuffer condtion =new StringBuffer();
			condtion.append("'"+user.getUnitID()+"',");
			
			List nodeAll=this.getSqlMapClientTemplate().queryForList("queryAllParantName",user.getUnitID());
			
			int num = 1;
			for(Object o:nodeAll){
				Unit subUnit =(Unit) o;
				if(num==999){
					condtion.append("'"+subUnit.getUnit_id()+"')");
					condtion.append(" or t.parent_id in(");
					num=1;
				}else{
					condtion.append("'"+subUnit.getUnit_id()+"',");
					num++;
				}
			}
			
			
//			for(Iterator it=nodeAll.iterator();it.hasNext();){
//				Unit subUnit =(Unit) it.next();
//				condtion.append("'"+subUnit.getUnit_id()+"',");
//			}
			String tmpCondtion=condtion.toString();
			System.out.println(tmpCondtion);
			
			tmpCondtion=tmpCondtion.substring(0,tmpCondtion.length()-1);
			unitTmp.setParent_id(tmpCondtion);
			List subList =this.getSqlMapClientTemplate().queryForList("findUnitPageStruct", unitTmp);
			for(Iterator subIt=subList.iterator();subIt.hasNext();){
				list.add((Unit)subIt.next());
			}
			
			
			int index =(list.size()-skipindex) >maxindex?maxindex:list.size()-skipindex;
			list =new ArrayList(list.subList(skipindex, skipindex+index));
			
		}
		
		return list;
	}

	public int findUnitListCount(User user,Unit unit) throws Exception {
		int n=0;
		Unit unitTmp=unit;
		if(unitTmp.getParent_id()!=null&&!"null".equals(unitTmp.getParent_id())){		
		
		 n= Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"findUnitPageCount", unitTmp).toString());
		 List list =new ArrayList();
			StringBuffer condtion =new StringBuffer();
			condtion.append("'"+user.getUnitID()+"',");
			
			List nodeAll=this.getSqlMapClientTemplate().queryForList("queryAll",user.getUnitID());
			
//			for(Iterator it=nodeAll.iterator();it.hasNext();){
//				Unit subUnit =(Unit) it.next();
//				condtion.append("'"+subUnit.getUnit_id()+"',");
//			}
			int num = 1;
			for(Object o:nodeAll){
				Unit subUnit =(Unit) o;
				if(num==999){
					condtion.append("'"+subUnit.getUnit_id()+"')");
					condtion.append(" or t.parent_id in(");
					num=1;
				}else{
					condtion.append("'"+subUnit.getUnit_id()+"',");
					num++;
				}
			}
			String tmpCondtion=condtion.toString();
			
			tmpCondtion=tmpCondtion.substring(0,tmpCondtion.length()-1);
			unitTmp.setParent_id(tmpCondtion);
			List subList =this.getSqlMapClientTemplate().queryForList("findUnitPageStruct", unitTmp);
			for(Iterator subIt=subList.iterator();subIt.hasNext();){
				list.add((Unit)subIt.next());
			}
			n=list.size();
		}else {
			List list =new ArrayList();
			StringBuffer condtion =new StringBuffer();
			condtion.append("'"+user.getUnitID()+"',");
			
			List nodeAll=this.getSqlMapClientTemplate().queryForList("queryAll",user.getUnitID());
			
//			for(Iterator it=nodeAll.iterator();it.hasNext();){
//				Unit subUnit =(Unit) it.next();
//				condtion.append("'"+subUnit.getUnit_id()+"',");
//			}
			int num = 1;
			for(Object o:nodeAll){
				Unit subUnit =(Unit) o;
				if(num==999){
					condtion.append("'"+subUnit.getUnit_id()+"')");
					condtion.append(" or t.parent_id in(");
					num=1;
				}else{
					condtion.append("'"+subUnit.getUnit_id()+"',");
					num++;
				}
			}
			String tmpCondtion=condtion.toString();
			
			tmpCondtion=tmpCondtion.substring(0,tmpCondtion.length()-1);
			unitTmp.setParent_id(tmpCondtion);
			List subList =this.getSqlMapClientTemplate().queryForList("findUnitPageStruct", unitTmp);
			for(Iterator subIt=subList.iterator();subIt.hasNext();){
				list.add((Unit)subIt.next());
			}
			n=list.size();
		}
		return n;
	}
	
	
	public int findUnitListCount1(String unitid) throws Exception {
		int n = Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"findUnitPageCountimport", unitid).toString());
		return n;
	}

	public Unit findUnitListOfUser(String userId) throws Exception {
		return (Unit) this.getSqlMapClientTemplate().queryForObject(
				"findUnitByID", userId);
	}

	public List findUnitListOfUser(User user_bak) throws Exception {
		List list = this.getSqlMapClientTemplate().queryForList(
				"findUnitListOfUser", user_bak);
		return list;
	}

	public List findUnitListTree(Unit unit) throws Exception {

		List list = this.getSqlMapClientTemplate().queryForList(
				"findAllUnitPage", unit);
		return list;
	}

	public List queryUnitListOfUser(User user_bak) throws Exception {
		List list = this.getSqlMapClientTemplate().queryForList(
				"queryUnitListOfUser", user_bak);
		return list;
	}

	public int findUnitByXzqh(String xzqh) throws Exception {
		int n = Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"countUnitByXzqh", xzqh).toString());
		return n;
	}
	public int findUnitByParent_id(String xzqh) throws Exception {
		int n = Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"findUnitByParent_id", xzqh).toString());
		return n;
	}
	public int findUnitByXzqhUnit(Unit  unit) throws Exception {
		int n = Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"findUnitByXzqhUnit", unit).toString());
		return n;
	}

	public void importUnit(Unit unit) throws Exception {
		this.getSqlMapClientTemplate().insert("importunit", unit);
		
	}

	public List getUnit() throws Exception {
		List list = this.getSqlMapClientTemplate().queryForList("getUnit");
		return list;
	}

	public List findUnitListById(Unit  unit) throws Exception{
		List list = this.getSqlMapClientTemplate().queryForList("getUnitByID",unit);
		return list;
	}
	public int findUnitListCountByXzqh(String xzqh) throws Exception {
		int n = Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"findUnitListCountByXzqh", xzqh).toString());
		return n;
	}

	public Unit findUnitByXzqh1(String xzqh) throws Exception {
		return (Unit) this.getSqlMapClientTemplate().queryForObject(
				"findUnitByXzqh1", xzqh);
	}

	public int findUserLogCount(UserLog userLog) throws Exception {
		int n=Integer.parseInt(this.getSqlMapClientTemplate().queryForObject("queryUserLogCount", userLog).toString());
		return n;
	}

	public List findUserLogList(UserLog userLog, int skipIndex, int maxIndex) throws Exception {
		List list =this.getSqlMapClientTemplate().queryForList("queryUserLog",userLog, skipIndex, maxIndex);
		return list;
	}

	public void deleteUserLog(String OPERATE_DATE) throws Exception {
		this.getSqlMapClientTemplate().delete("delUserLog", OPERATE_DATE);
		
	}

	@SuppressWarnings("unchecked")
	public List findAllSubUnitsByParentId(String parentUnitId) throws Exception {
		List allSubUnits=this.getSqlMapClientTemplate().queryForList("queryAll",parentUnitId);
		return allSubUnits;
	}

	
	public List findUnitChild(String pId) throws Exception {
		List list = this.getSqlMapClientTemplate().queryForList("queryAllParantName",pId);
		return list;
	}

}
