package com.kingtone.jw.biz.xajw.dao.impl;

import java.rmi.server.UID;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.kingtone.jw.biz.xajw.dao.JwUserDisplayDao;
import com.kingtone.jw.biz.xajw.domain.JwUser;
import com.kingtone.jw.biz.xajw.domain.JwUserStatus;
import com.kingtone.ssi.dao.SSIOrmDao;

/**
 * 用于后台设置GPS状态dao接口impl
 * @author hanliqiang@kingtoneinfo.com
 *
 */
public class JwUserDisplayDaoImpl extends SSIOrmDao implements JwUserDisplayDao{

	public List findJqUser(JwUser jwUser,int skipindex, int maxindex) throws Exception{//获取警员gps显示状态
		
		List list=new ArrayList();
		jwUser.setSkipindex(skipindex);
		jwUser.setMaxindex(maxindex);
		if(jwUser.getXzqh()!=null && !"null".equals(jwUser.getXzqh()) && !"0001".equals(jwUser.getXzqh())){
			List subList =this.getSqlMapClientTemplate().queryForList("findGpsDisplay", jwUser);
			for(Iterator subIt=subList.iterator();subIt.hasNext();){
				list.add((JwUser)subIt.next());
			}
		}else{
			jwUser.setXzqh(null);
			List subList =this.getSqlMapClientTemplate().queryForList("findGpsDisplay", jwUser);
			for(Iterator subIt=subList.iterator();subIt.hasNext();){
				list.add((JwUser)subIt.next());
			}						
		}		
		return list;

	}
	
	public int findDisplayUserCount(JwUser jwUser) throws Exception{//同上，用于分页
		int n=0;
		if(jwUser.getXzqh()!=null && !"null".equals(jwUser.getXzqh()) && !"0001".equals(jwUser.getXzqh())){
			n = Integer.parseInt(this.getSqlMapClientTemplate().queryForObject("findGpsDisplayCount", jwUser).toString());
		}else{
			jwUser.setXzqh(null);
			n = Integer.parseInt(this.getSqlMapClientTemplate().queryForObject("findGpsDisplayCount", jwUser).toString());					
		}		
		return n;

	}
	
	public void updateUpdateStatus(JwUserStatus jwUserStatus) throws Exception{//修改警员gps显示状态
		String ids = jwUserStatus.getUserid();
		String strs[] = ids.split("split");
		for (int i = 0; i < strs.length; i++) {
			int n = Integer.parseInt(this.getSqlMapClientTemplate().queryForObject("userStatusif",strs[i]).toString());
			jwUserStatus.setUserid(strs[i]);
			if(n>0){
				this.getSqlMapClientTemplate().update("updateUserStatus", jwUserStatus);
			}else{
				jwUserStatus.setId(new UID().toString());
				jwUserStatus.setDispatch(0);
				this.getSqlMapClientTemplate().insert("insertUserStatus", jwUserStatus);
			}
		}		
	}
    
	public void updateDispatchStatus(JwUserStatus jwUserStatus) throws Exception{//修改警员调度状态
		String ids = jwUserStatus.getUserid();
		String strs[] = ids.split("split");
		for (int i = 0; i < strs.length; i++) {
			int n = Integer.parseInt(this.getSqlMapClientTemplate().queryForObject("userStatusif",strs[i]).toString());
			jwUserStatus.setUserid(strs[i]);
			if(n>0){
				this.getSqlMapClientTemplate().update("updateDispatchStatus", jwUserStatus);
			}else{
				jwUserStatus.setId(new UID().toString());
				jwUserStatus.setDisplay(0);
				this.getSqlMapClientTemplate().insert("insertUserStatus", jwUserStatus);
			}
		}		
	}
}
