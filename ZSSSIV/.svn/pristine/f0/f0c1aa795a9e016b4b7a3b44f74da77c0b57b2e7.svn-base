package com.kingtone.jw.biz.common.dao.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.kingtone.jw.biz.common.dao.TztgDAO;
import com.kingtone.jw.biz.common.domain.Notice;
import com.kingtone.jw.biz.common.domain.NoticeUser;
import com.kingtone.jw.biz.common.domain.Sjsb;
import com.kingtone.jw.platform.domain.Unit;
import com.kingtone.jw.platform.domain.User;
import com.kingtone.ssi.dao.SSIOrmDao;

public class TztgDAOImpl extends SSIOrmDao implements TztgDAO{

	public List findSjsbListByXzqh(Sjsb sjsb)throws Exception{
		return this.getSqlMapClientTemplate().queryForList("findSjsbListByXzqh", sjsb);
	}
	public void deleteNotice(int id) throws Exception{
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().delete("deleteNotice", id);
	}

	public void deleteNoticeUser(int id) throws Exception {
		this.getSqlMapClientTemplate().delete("deleteNoticeUser", id);
		
	}

	public void deleteNoticeUserByNoticeid(int noticeid)throws Exception {
		this.getSqlMapClientTemplate().delete("deleteNoticeUserByNoticeid", noticeid);
		
	}

	public List findAllNoticePage(User user,Notice notice,List allSubUnits, int skipindex, int maxindex) throws Exception  {
		List list =new ArrayList();
		Notice noticeTmp =notice;
//		if (noticeTmp.getSendDeptid()!=null){
			list=this.getSqlMapClientTemplate().queryForList("findAllNoticePage",notice);
//		}else{
			StringBuffer condtion =new StringBuffer();		
//			condtion.append("'"+user.getUnitID()+"',");
			List nodeAll=allSubUnits;//this.getSqlMapClientTemplate().queryForList("queryAll",user.getUnitID());
			
//			for(Iterator it=nodeAll.iterator();it.hasNext();){
//				Unit subUnit =(Unit) it.next();				
//				condtion.append("'"+subUnit.getUnit_id()+"',");
//			}
			int num = 1;
			for(Object o:nodeAll){
				Unit subUnit =(Unit) o;
				if(num==999){
					condtion.append("'"+subUnit.getUnit_id()+"')");
					condtion.append(" or t.senddeptid in(");
					num=1;
				}else{
					condtion.append("'"+subUnit.getUnit_id()+"',");
					num++;
				}
			}
			String tmpCondtion=condtion.toString();
			if(!"".equals(tmpCondtion)){
				tmpCondtion=tmpCondtion.substring(0,tmpCondtion.length()-1);
				noticeTmp.setSendDeptid(tmpCondtion);
				List subList =this.getSqlMapClientTemplate().queryForList(
						"findAllNoticePageStrut", noticeTmp);
				for(Iterator subIt=subList.iterator();subIt.hasNext();){
					list.add((Notice)subIt.next());
				}
			}
			int index =(list.size()-skipindex) >maxindex?maxindex:list.size()-skipindex;
			list =new ArrayList(list.subList(skipindex, skipindex+index));
//		}
		
		
		return list;
	}
	public List findAllNoticePage(NoticeUser notice, int skipindex, int maxindex) throws Exception  {
		// TODO Auto-generated method stub
		return this.getSqlMapClientTemplate().queryForList("findAllNoticeUserPage1",notice,skipindex,maxindex);
	}

	public int findAllNoticePageCount(User user,Notice notice,List allSubUnits) throws Exception  {
		int n=0;
		Notice noticeTmp=notice;
//		if (notice.getSendDeptid()!=null) {
			n = (Integer)this.getSqlMapClientTemplate().queryForList("findAllNoticePageCount",notice).get(0);
//		} else {
			List list =new ArrayList();
			StringBuffer condtion =new StringBuffer();		
			condtion.append("'"+user.getUnitID()+"',");
			List nodeAll=allSubUnits;//this.getSqlMapClientTemplate().queryForList("queryAll",user.getUnitID());
			
//			for(Iterator it=nodeAll.iterator();it.hasNext();){
//				Unit subUnit =(Unit) it.next();				
//				condtion.append("'"+subUnit.getUnit_id()+"',");
//			}
			
			int num = 1;
			for(Object o:nodeAll){
				Unit subUnit =(Unit) o;
				if(num==999){
					condtion.append("'"+subUnit.getUnit_id()+"')");
					condtion.append(" or t.senddeptid in(");
					num=1;
				}else{
					condtion.append("'"+subUnit.getUnit_id()+"',");
					num++;
				}
			}
			String tmpCondtion=condtion.toString();
	
			tmpCondtion=tmpCondtion.substring(0,tmpCondtion.length()-1);
			noticeTmp.setSendDeptid(tmpCondtion);
			List subList =this.getSqlMapClientTemplate().queryForList(
					"findAllNoticePageStrut", noticeTmp);
			for(Iterator subIt=subList.iterator();subIt.hasNext();){
				list.add((Notice)subIt.next());
			}
			n = list.size();
//		}
		return n;
	}
	public int findAllNoticeUserPageCount(NoticeUser notice) throws Exception  {
		// TODO Auto-generated method stub
		return (Integer)this.getSqlMapClientTemplate().queryForList("findAllNoticeUserPageCount1",notice).get(0);
	}

	public List findAllNoticeUserPage(int noticeid, int skipindex, int maxindex) throws Exception  {
		return this.getSqlMapClientTemplate().queryForList("findAllNoticeUserPage",noticeid,skipindex,maxindex);
	}

	public int findAllNoticeUserPageCount(int noticeid) throws Exception  {
		return (Integer)this.getSqlMapClientTemplate().queryForList("findAllNoticeUserPageCount",noticeid).get(0);
	}

	public Notice findNoticeById(int id) throws Exception  {
		return (Notice)this.getSqlMapClientTemplate().queryForObject("findNoticeById",id);
	}

	public List findNoticeUserByNoticeid(int noticeid)throws Exception  {
		return this.getSqlMapClientTemplate().queryForList("findNoticeUserByNoticeid",noticeid);
	}

	public List findNoticeUserDepByNoticeid(int noticeid) throws Exception  {
		return this.getSqlMapClientTemplate().queryForList("findNoticeUserDepByNoticeid",noticeid);
	}

	public void saveNotice(Notice notice) throws Exception  {
		this.getSqlMapClientTemplate().insert("saveNotice",notice);
		
	}
	public Object sendNotice(Notice notice) throws Exception  {
		return  this.getSqlMapClientTemplate().insert("sendNotice",notice);
		
	}
	public void  sendNoticeUser(Notice notice) throws Exception  {
		 this.getSqlMapClientTemplate().insert("sendNoticeuser",notice);
		
	}
	public void  updateNoticeUser(Notice notice) throws Exception  {
		 this.getSqlMapClientTemplate().insert("updateNoticeuser",notice);
		
	}

	public int saveNoticeForId(Notice notice) throws Exception  {
		// TODO Auto-generated method stub
		return Integer.parseInt(this.getSqlMapClientTemplate().insert("saveNotice",notice).toString()); 
	}

	public void saveNoticeUser(NoticeUser noticeUser) throws Exception  {
		this.getSqlMapClientTemplate().insert("saveNoticeUser",noticeUser);
		
	}

	public void updateNotice(Notice notice) throws Exception  {
		this.getSqlMapClientTemplate().update("updatenotice",notice);
	}
	public void updateSendNotice(Notice notice) throws Exception  {
		this.getSqlMapClientTemplate().update("updatesendnotice",notice);
	}
		
	

	public void updateNoticeAttach(Notice notice) throws Exception  {
		this.getSqlMapClientTemplate().update("updateNoticeAttach",notice);
		
	}
	public Notice getMaxNoticeID() throws Exception {
		// TODO Auto-generated method stub
		return (Notice)this.getSqlMapClientTemplate().queryForObject("getMaxNoticeID");
	}

}
