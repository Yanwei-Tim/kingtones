package com.kingtone.jw.platform.dao.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.kingtone.jw.platform.dao.PsUserDAO;
import com.kingtone.jw.platform.domain.JqUser;
import com.kingtone.ssi.dao.SSIOrmDao;
/**
 * 
 * 警情人员dao层
 * @author yulipeng
 *
 */
public class PsUserDaoImpl extends SSIOrmDao implements PsUserDAO {

	public List findJqUser(JqUser jquser,int skipindex, int maxindex) throws Exception{//获取右边的内容
		
		List list=new ArrayList();
		//Organization organTmp = new Organization();
		JqUser jquserTmp = new JqUser();
		String gid = this.getSqlMapClientTemplate().queryForObject("findHeadUser").toString();//0001
		
		if(jquser.getOrg_id()!=null && !"null".equals(jquser.getOrg_id()) && !gid.equals(jquser.getOrg_id())){
			List subList =this.getSqlMapClientTemplate().queryForList("findJqUser", jquser);
			for(Iterator subIt=subList.iterator();subIt.hasNext();){
				list.add((JqUser)subIt.next());
			}
			
			int index =(list.size()-skipindex) >maxindex?maxindex:list.size()-skipindex;
			list =new ArrayList(list.subList(skipindex, skipindex+index));
		}else{
			//String hid = this.findHead();		
			//organTmp.setParent_id(hid);
			if(jquser.getName()!=null && !"null".equals(jquser.getName())){
				jquserTmp.setName(jquser.getName());
			}
			if(jquser.getCode()!=null && !"null".equals(jquser.getCode())){
				jquserTmp.setCode(jquser.getCode());
			}
			if(jquser.getAccount()!=null && !"null".equals(jquser.getAccount())){
				jquserTmp.setAccount(jquser.getAccount());
			}
			List subList =this.getSqlMapClientTemplate().queryForList("findJqAllUser",jquserTmp);
			for(Iterator subIt=subList.iterator();subIt.hasNext();){
				list.add((JqUser)subIt.next());
			}
			
			int index =(list.size()-skipindex) >maxindex?maxindex:list.size()-skipindex;
			list =new ArrayList(list.subList(skipindex, skipindex+index));			
		}
		
		return list;

	}
	
	public int findJqListCount(JqUser jquser) throws Exception{//获取数据数量（用于分页）
		int pagesize=0;
		List list=new ArrayList();
		//Organization organTmp = new Organization();
		JqUser jquserTmp = new JqUser();
		String gid = this.getSqlMapClientTemplate().queryForObject("findHeadUser").toString();//0001
		
		if(jquser.getOrg_id()!=null && !"null".equals(jquser.getOrg_id()) && !gid.equals(jquser.getOrg_id())){
			List subList =this.getSqlMapClientTemplate().queryForList("findJqUser", jquser);
			for(Iterator subIt=subList.iterator();subIt.hasNext();){
				list.add((JqUser)subIt.next());
			}
			pagesize=list.size();
		}else{
			//String hid = this.findHead();		
			//organTmp.setParent_id(hid);
			if(jquser.getName()!=null && !"null".equals(jquser.getName())){
				jquserTmp.setName(jquser.getName());
			}
			if(jquser.getCode()!=null && !"null".equals(jquser.getCode())){
				jquserTmp.setCode(jquser.getCode());
			}
			if(jquser.getAccount()!=null && !"null".equals(jquser.getAccount())){
				jquserTmp.setAccount(jquser.getAccount());
			}
			List subList =this.getSqlMapClientTemplate().queryForList("findJqAllUser",jquserTmp);
			for(Iterator subIt=subList.iterator();subIt.hasNext();){
				list.add((JqUser)subIt.next());
			}
			
			pagesize=list.size();			
		}
		
		return pagesize;
	}
	public int findJqByCandA(JqUser jquser) throws Exception {//获取用户的编码code和账号，判断是否重复
		int n = Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"countJqByCandA", jquser).toString());
		return n;
	}
	
	public void addUserJq(JqUser jquser) throws Exception {//添加organ用户
		String id = this.getSqlMapClientTemplate().queryForObject("findHeadUser").toString();
    	if("".equals(jquser.getOrg_id())){
    		jquser.setOrg_id(id);
    	}
		
		this.getSqlMapClientTemplate().insert("JqUserAdd", jquser);
	}
	
	public JqUser findJqUserByID(String id) throws Exception {//根据id查用户（修改里面用）
		return (JqUser) this.getSqlMapClientTemplate().queryForObject(
				"findJqUserByID", id);
	}
	
	public int findJqByUserxg(JqUser jquser) throws Exception {//判断用户code和account是否重复（修改用）
		int n = Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"findJqByUserxg", jquser).toString());
		return n;
	}
	
	public void editUser(JqUser jquser) throws Exception {//修改用户
		this.getSqlMapClientTemplate().update("jqUserUpdate", jquser);
	}
	
	public int findJqDispatchCount(JqUser jquser) throws Exception {//判断是否有相关处警信息（删除用户使用）
		int n = Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"findJqDispatchCount", jquser).toString());
		return n;
	}
	
	public void delUser(String userid) throws Exception {//删除user用户
		this.getSqlMapClientTemplate().delete("userJqDelete", userid);
	}
	
	public List getOrganAll() throws Exception { //获取所有用户子节点 (用于Excel导出)
		List list = this.getSqlMapClientTemplate().queryForList("getUserAll");
		return list;
	}
	
	public List getOrganAllbyId(String pId) throws Exception {//根据id获取所有用户子节点 (用于Excel导出)
		List list = this.getSqlMapClientTemplate().queryForList("getUserAllbyId",pId);
		return list;
	}
	
	public void importOrgan(JqUser jquser) throws Exception {//导入警情用户信息 (用于Excel导入)
		this.getSqlMapClientTemplate().insert("importusers", jquser);
		
	}
	
}
