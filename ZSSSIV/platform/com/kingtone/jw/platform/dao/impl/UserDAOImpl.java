package com.kingtone.jw.platform.dao.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.kingtone.jw.platform.dao.UserDAO;
import com.kingtone.jw.platform.domain.Account;
import com.kingtone.jw.platform.domain.Unit;
import com.kingtone.jw.platform.domain.User;
import com.kingtone.ssi.dao.SSIOrmDao;

public class UserDAOImpl extends SSIOrmDao implements UserDAO {

	public void addUser(User user) throws Exception {
		this.getSqlMapClientTemplate().insert("userAdd", user);
	}

	public void delUser(String userIds) throws Exception {
		this.getSqlMapClientTemplate().delete("userDelete", userIds);

	}

	public void editUser(User user) throws Exception {
		this.getSqlMapClientTemplate().update("userUpdate", user);

	}

	public User findUserById(String id) throws Exception {
		return (User) this.getSqlMapClientTemplate().queryForObject(
				"findUserByID", id);
	}

	public List findUserList(User loginUser,User user, int skipindex, int maxindex)
			throws Exception {
		List list =new ArrayList();
		User userTmp =user;
		if (userTmp.getUnitID()!=null && !"null".equals(userTmp.getUnitID())) {
			
			list = this.getSqlMapClientTemplate().queryForList(
					"findAllUserPage", userTmp);
			StringBuffer condtion =new StringBuffer();
//			condtion.append("'"+loginUser.getUnitID()+"',");		
			//获取所有根节点
			List nodeAll=this.getSqlMapClientTemplate().queryForList("queryAll",loginUser.getUnitID());
//			for(Iterator it=nodeAll.iterator();it.hasNext();){
//				Unit subUnit =(Unit) it.next();
//				condtion.append("'"+subUnit.getUnit_id()+"',");
//			}
			int num = 1;
			for(Object o:nodeAll){
				Unit subUnit = (Unit)o;
				if(num==999){
					condtion.append("'"+subUnit.getUnit_id()+"')");
					condtion.append(" or m.unit_id in(");
					num=1;
				}else{
					condtion.append("'"+subUnit.getUnit_id()+"',");
					num++;
				}
			}
			
			String tmpCondtion=condtion.toString();
			if(!"".equals(tmpCondtion)){
				tmpCondtion=tmpCondtion.substring(0,tmpCondtion.length()-1);
				userTmp.setUnitID(tmpCondtion);
				
				//获取数据信息
				List subList =this.getSqlMapClientTemplate().queryForList(
						"findAllUserPageStruct", userTmp);
				for(Iterator subIt=subList.iterator();subIt.hasNext();){
					list.add((User)subIt.next());
				}
				
				int index =(list.size()-skipindex) >maxindex?maxindex:list.size()-skipindex;
				list =new ArrayList(list.subList(skipindex, skipindex+index));
			}
		} else {
			//查询条件组织
			StringBuffer condtion =new StringBuffer();
			condtion.append("'"+loginUser.getUnitID()+"',");		
			//获取所有根节点
			List nodeAll=this.getSqlMapClientTemplate().queryForList("queryAll",loginUser.getUnitID());
//			for(Iterator it=nodeAll.iterator();it.hasNext();){
//				Unit subUnit =(Unit) it.next();
//				condtion.append("'"+subUnit.getUnit_id()+"',");
//			}
			int num = 1;
			for(Object o:nodeAll){
				Unit subUnit = (Unit)o;
				if(num==999){
					condtion.append("'"+subUnit.getUnit_id()+"')");
					condtion.append(" or m.unit_id in(");
					num=1;
				}else{
					condtion.append("'"+subUnit.getUnit_id()+"',");
					num++;
				}
			}
			
			String tmpCondtion=condtion.toString();
			tmpCondtion=tmpCondtion.substring(0,tmpCondtion.length()-1);
			userTmp.setUnitID(tmpCondtion);
			
			//获取数据信息
			List subList =this.getSqlMapClientTemplate().queryForList(
					"findAllUserPageStruct", userTmp);
			for(Iterator subIt=subList.iterator();subIt.hasNext();){
				list.add((User)subIt.next());
			}
			
			int index =(list.size()-skipindex) >maxindex?maxindex:list.size()-skipindex;
			list =new ArrayList(list.subList(skipindex, skipindex+index));
		}
		return list;
	}

	public List findUserListByUnitId(User user)throws Exception{
		List list = this.getSqlMapClientTemplate().queryForList("findAllUserPage", user);
		return list;
	}
	
	public int findUserListCount(User loginUser,User user) throws Exception {
		int n;
		User userTmp=user;
		if (userTmp.getUnitID()!=null && !"null".equals(userTmp.getUnitID())) {
			n = Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
					"findUserPageCountnotunit", user).toString());
			List list =new ArrayList();
//			查询条件组织
			StringBuffer condtion =new StringBuffer();
//			condtion.append("'"+loginUser.getUnitID()+"',");		
			//获取所有根节点
			List nodeAll=this.getSqlMapClientTemplate().queryForList("queryAll",loginUser.getUnitID());
//			for(Iterator it=nodeAll.iterator();it.hasNext();){
//				Unit subUnit =(Unit) it.next();
//				condtion.append("'"+subUnit.getUnit_id()+"',");
//			}
			int num = 1;
			for(Object o:nodeAll){
				Unit subUnit =(Unit) o;
				if(num==999){
					condtion.append("'"+subUnit.getUnit_id()+"')");
					condtion.append(" or m.unit_id in(");
					num=1;
				}else{
					condtion.append("'"+subUnit.getUnit_id()+"',");
					num++;
				}
			}
			String tmpCondtion=condtion.toString();
			if(!"".equals(tmpCondtion)){
				tmpCondtion=tmpCondtion.substring(0,tmpCondtion.length()-1);
				userTmp.setUnitID(tmpCondtion);
				
				//获取数据信息
				List subList =this.getSqlMapClientTemplate().queryForList(
						"findAllCountnotunit", userTmp);
//				for(Iterator subIt=subList.iterator();subIt.hasNext();){
//					list.add((User)subIt.next());
//				}
				n += Integer.parseInt(subList.get(0).toString());
			}
		} else {
			List list =new ArrayList();
//			查询条件组织
			StringBuffer condtion =new StringBuffer();
			condtion.append("'"+loginUser.getUnitID()+"',");		
			//获取所有根节点
			List nodeAll=this.getSqlMapClientTemplate().queryForList("queryAll",loginUser.getUnitID());
//			for(Iterator it=nodeAll.iterator();it.hasNext();){
//				Unit subUnit =(Unit) it.next();
//				condtion.append("'"+subUnit.getUnit_id()+"',");
//			}
			int num = 1;
			for(Object o:nodeAll){
				Unit subUnit =(Unit) o;
				if(num==999){
					condtion.append("'"+subUnit.getUnit_id()+"')");
					condtion.append(" or m.unit_id in(");
					num=1;
				}else{
					condtion.append("'"+subUnit.getUnit_id()+"',");
					num++;
				}
			}
			String tmpCondtion=condtion.toString();
			tmpCondtion=tmpCondtion.substring(0,tmpCondtion.length()-1);
			userTmp.setUnitID(tmpCondtion);
			
			//获取数据信息
			List subList =this.getSqlMapClientTemplate().queryForList(
					"findAllUserPageStruct", userTmp);
			for(Iterator subIt=subList.iterator();subIt.hasNext();){
				list.add((User)subIt.next());
			}
			n = list.size();
		}
		return n;
	}

	public void deleteUserRoleMapping(String userIds) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().delete("USERROLeDelete", userIds);

	}

	public void deleteUserUnitMapping(String userIds) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().delete("UserUnitDelete", userIds);

	}

	public void editUserRoleMapping(User user) throws Exception {
		this.getSqlMapClientTemplate().insert("insertUserRole1", user);

	}

	public void edittUserUnitMapping(User user) throws Exception {
		this.getSqlMapClientTemplate().insert("insertUserUnit1", user);

	}

	public User queryUserByuserId(String userid) {
		return (User) this.getSqlMapClientTemplate().queryForObject(
				"findUserByuserID", userid);
	}

	public List getAllTuser() throws Exception {
		List list = this.getSqlMapClientTemplate().queryForList("getAllTuser");
		return list;
	}

	
	
	public List getUnitUser(User loginUser) throws Exception {
		List list =new ArrayList();
		User userTmp = new User();
			//查询条件组织
			StringBuffer condtion =new StringBuffer();
			condtion.append("'"+loginUser.getUnitID()+"',");		
			//获取所有根节点
			List nodeAll=this.getSqlMapClientTemplate().queryForList("queryAll",loginUser.getUnitID());
//			for(Iterator it=nodeAll.iterator();it.hasNext();){
//				Unit subUnit =(Unit) it.next();
//				condtion.append("'"+subUnit.getUnit_id()+"',");
//			}
			int num = 1;
			for(Object o:nodeAll){
				Unit subUnit = (Unit)o;
				if(num==999){
					condtion.append("'"+subUnit.getUnit_id()+"')");
					condtion.append(" or m.unit_id in(");
					num=1;
				}else{
					condtion.append("'"+subUnit.getUnit_id()+"',");
					num++;
				}
			}
			
			String tmpCondtion=condtion.toString();
			tmpCondtion=tmpCondtion.substring(0,tmpCondtion.length()-1);
			userTmp.setUnitID(tmpCondtion);
			
			//获取数据信息
			List subList =this.getSqlMapClientTemplate().queryForList(
					"findUnitUser", userTmp);
			for(Iterator subIt=subList.iterator();subIt.hasNext();){
				list.add((User)subIt.next());
			}
			
		return list;
	}

	
	public int findUserListCountUnit(User user) throws Exception {
		int n = Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"findUserPageCountUnit", user).toString());
		return n;
	}

	public void importUser(User user) throws Exception {
		this.getSqlMapClientTemplate().insert("importUser", user);

	}

	public void importaccount(Account account) throws Exception {
		this.getSqlMapClientTemplate().insert("importaccount", account);
	}

	public int findUserListCount1(String userName) throws Exception {
		int n = Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"findUserListCountuserName", userName).toString());
		return n;
	}

	public int findUserByFullName(String fullName) throws Exception {
		int n = Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"findUserByFullName", fullName).toString());
		return n;
	}

	public int findUserByUserName(String userName) throws Exception {
		int n = Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"findUserByUserName", userName).toString());
		return n;
	}

	public int findUserByUser(User user) throws Exception {
		int n = Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"findUserByUser", user).toString());
		return n;
	}

	public String findUserXbList(String id) throws Exception {
		return (String) this.getSqlMapClientTemplate().queryForObject(
				"findUserXbList", id);
	}

	public String findUserCzList(String id) throws Exception {
		return (String) this.getSqlMapClientTemplate().queryForObject(
				"findUserCzList", id);
	}

	
	public int isPswChange(User user) throws Exception {
		int n = Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"isPswChange", user).toString());
		return n;
	}

	


}
