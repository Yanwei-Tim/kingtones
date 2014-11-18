package com.kingtone.jw.platform.dao.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import com.kingtone.jw.platform.dao.PsUserCountDAO;
import com.kingtone.jw.platform.domain.Dispatch;
import com.kingtone.jw.platform.domain.JqCount;
import com.kingtone.ssi.dao.SSIOrmDao;

/**
 * 
 * 警情人员统计dao层
 * @author yulipeng
 *
 */
public class PsUserCountDaoImpl extends SSIOrmDao implements PsUserCountDAO {
	
	public List findJqUserCount(JqCount jqcount,int skipindex, int maxindex) throws Exception{//获取人员统计列表

		List list=new ArrayList();
		List subList=null;
		String gid = this.getSqlMapClientTemplate().queryForObject("findHeadUser").toString();//0001		
		Date dt = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

		Calendar c = Calendar.getInstance();//上个月当前时间
		c.add(Calendar.MONTH, -1);
		if(jqcount.getOrg_id()!=null && !"null".equals(jqcount.getOrg_id()) && !gid.equals(jqcount.getOrg_id())){

			if(jqcount.getStime()!=null && !"null".equals(jqcount.getStime())){
				subList = this.getSqlMapClientTemplate().queryForList("countAllUser", jqcount);				
			}else{
				jqcount.setStime(formatter.parse(formatter.format(c.getTime())));
				jqcount.setEtime(dt);
				subList = this.getSqlMapClientTemplate().queryForList("countAllUser", jqcount);				
			}
		}else{

			jqcount.setOrg_id(null);//org_id设置为空
			if(jqcount.getStime()!=null && !"null".equals(jqcount.getStime())){
				subList = this.getSqlMapClientTemplate().queryForList("countAllUser", jqcount);				
			}else{
				jqcount.setStime(formatter.parse(formatter.format(c.getTime())));
				jqcount.setEtime(dt);
				subList = this.getSqlMapClientTemplate().queryForList("countAllUser", jqcount);				
			}
		}
		
		for(Iterator subIt=subList.iterator();subIt.hasNext();){
			list.add((JqCount)subIt.next());
		}		
		int index =(list.size()-skipindex) >maxindex?maxindex:list.size()-skipindex;
		list =new ArrayList(list.subList(skipindex, skipindex+index));
		return list;
		
	}
	
	public int findJqUserCountye(JqCount jqcount) throws Exception{//获取人员统计的总页数
		int pagesize=0;
		List list=new ArrayList();
		List subList=null;
		String gid = this.getSqlMapClientTemplate().queryForObject("findHeadUser").toString();//0001		
		Date dt = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

		Calendar c = Calendar.getInstance();//上个月当前时间
		c.add(Calendar.MONTH, -1);
		if(jqcount.getOrg_id()!=null && !"null".equals(jqcount.getOrg_id()) && !gid.equals(jqcount.getOrg_id())){
			
			if(jqcount.getStime()!=null && !"null".equals(jqcount.getStime())){
				subList = this.getSqlMapClientTemplate().queryForList("countAllUser", jqcount);				
			}else{
				jqcount.setStime(formatter.parse(formatter.format(c.getTime())));
				jqcount.setEtime(dt);
				subList = this.getSqlMapClientTemplate().queryForList("countAllUser", jqcount);				
			}
		}else{
			jqcount.setOrg_id(null);//org_id设置为空
			if(jqcount.getStime()!=null && !"null".equals(jqcount.getStime())){
				subList = this.getSqlMapClientTemplate().queryForList("countAllUser", jqcount);				
			}else{
				jqcount.setStime(formatter.parse(formatter.format(c.getTime())));
				jqcount.setEtime(dt);
				subList = this.getSqlMapClientTemplate().queryForList("countAllUser", jqcount);				
			}
		}
		
		for(Iterator subIt=subList.iterator();subIt.hasNext();){
			list.add((JqCount)subIt.next());
		}		
		pagesize=list.size();
		return pagesize;
	}
	
	public void addDispatchJq(Dispatch dispatch) throws Exception {//添加dispatch处警信息
		
		this.getSqlMapClientTemplate().insert("JqDispatchAdd", dispatch);
	}
	
	public void JqDispatchUpdate(Dispatch dispatch) throws Exception {//修改dispatch处警信息
		
		this.getSqlMapClientTemplate().update("JqDispatchUpdate", dispatch);
	}
	
}
