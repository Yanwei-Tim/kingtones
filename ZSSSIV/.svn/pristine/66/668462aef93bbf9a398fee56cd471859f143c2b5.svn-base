package com.kingtone.jw.biz.common.dao.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.kingtone.jw.biz.common.dao.SjcjDAO;
import com.kingtone.jw.biz.common.domain.Spcj;
import com.kingtone.jw.biz.common.domain.Tpcj;
import com.kingtone.jw.platform.domain.Unit;
import com.kingtone.jw.platform.domain.User;
import com.kingtone.ssi.dao.SSIOrmDao;

public class SjcjDAOImpl extends SSIOrmDao implements SjcjDAO{

	public void deleteSpcj(int id) throws Exception {
		this.getSqlMapClientTemplate().delete("deleteSpcj", id);
		
	}

	public void deleteTpcj(int id) throws Exception {
		this.getSqlMapClientTemplate().delete("deleteTpcj", id);
		
	}

	public List findAllSpcjPage(User user,Spcj spcj, List allSubUnits,int skipindex, int maxindex) throws Exception {
		List list =new ArrayList();
		Spcj noticeTmp =spcj;
		if (noticeTmp.getXzqh()!=null && !"".equals(noticeTmp.getXzqh())){
			list=this.getSqlMapClientTemplate().queryForList("findAllSpcjPage",noticeTmp);
			StringBuffer condtion =new StringBuffer();
//			condtion.append("'"+user.getXzqh()+"',");
			List nodeAll=allSubUnits;//this.getSqlMapClientTemplate().queryForList("queryAll",user.getUnitID());
//			for(Iterator it=nodeAll.iterator();it.hasNext();){
//				Unit subUnit =(Unit) it.next();
//				condtion.append("'"+subUnit.getXzqh()+"',");
//			}
			int num = 1;
			for(Object o:nodeAll){
				Unit subUnit =(Unit) o;
				if(num==999){
					condtion.append("'"+subUnit.getXzqh()+"')");
					condtion.append(" or s.xzqh in(");
					num=1;
				}else{
					condtion.append("'"+subUnit.getXzqh()+"',");
					num++;
				}
			}
			String tmpCondtion=condtion.toString();
			if(!"".equals(tmpCondtion)){
				tmpCondtion=tmpCondtion.substring(0,tmpCondtion.length()-1);
				noticeTmp.setXzqh(tmpCondtion);
				List subList =this.getSqlMapClientTemplate().queryForList(
						"findAllSpcjPageStruct", noticeTmp);
				for(Iterator subIt=subList.iterator();subIt.hasNext();){
					list.add((Spcj)subIt.next());
				}
			}
			int index =(list.size()-skipindex) >maxindex?maxindex:list.size()-skipindex;
			list =new ArrayList(list.subList(skipindex, skipindex+index));
		}else{
			// 行政區劃組織
			StringBuffer condtion =new StringBuffer();
			condtion.append("'"+user.getXzqh()+"',");
			List nodeAll=allSubUnits;//this.getSqlMapClientTemplate().queryForList("queryAll",user.getUnitID());
//			for(Iterator it=nodeAll.iterator();it.hasNext();){
//				Unit subUnit =(Unit) it.next();
//				condtion.append("'"+subUnit.getXzqh()+"',");
//			}
			int num = 1;
			for(Object o:nodeAll){
				Unit subUnit =(Unit) o;
				if(num==999){
					condtion.append("'"+subUnit.getXzqh()+"')");
					condtion.append(" or s.xzqh in(");
					num=1;
				}else{
					condtion.append("'"+subUnit.getXzqh()+"',");
					num++;
				}
			}
			String tmpCondtion=condtion.toString();
			tmpCondtion=tmpCondtion.substring(0,tmpCondtion.length()-1);
			noticeTmp.setXzqh(tmpCondtion);
			List subList =this.getSqlMapClientTemplate().queryForList(
					"findAllSpcjPageStruct", noticeTmp);
			for(Iterator subIt=subList.iterator();subIt.hasNext();){
				list.add((Spcj)subIt.next());
			}
			
			int index =(list.size()-skipindex) >maxindex?maxindex:list.size()-skipindex;
			list =new ArrayList(list.subList(skipindex, skipindex+index));
		}
			
		return list;
	}

	public int findAllSpcjPageCount(User user,Spcj spcj,List allSubUnits) throws Exception {
		int n=0;
		Spcj noticeTmp=spcj;
		if (noticeTmp.getXzqh()!=null && !"".equals(noticeTmp.getXzqh())) {
			n = (Integer)this.getSqlMapClientTemplate().queryForList("findAllSpcjPageCount",noticeTmp).get(0);
//			 行政區劃組織
			StringBuffer condtion =new StringBuffer();
//			condtion.append("'"+user.getXzqh()+"',");
			List nodeAll= allSubUnits;//this.getSqlMapClientTemplate().queryForList("queryAll",user.getUnitID());
//			for(Iterator it=nodeAll.iterator();it.hasNext();){
//				Unit subUnit =(Unit) it.next();
//				condtion.append("'"+subUnit.getXzqh()+"',");
//			}
			int num = 1;
			for(Object o:nodeAll){
				Unit subUnit =(Unit)o;
				if(num==999){
					condtion.append("'"+subUnit.getXzqh()+"')");
					condtion.append(" or s.xzqh in(");
					num=1;
				}else{
					condtion.append("'"+subUnit.getXzqh()+"',");
					num++;
				}
			}
			String tmpCondtion=condtion.toString();
			if(!"".equals(tmpCondtion)){
				tmpCondtion=tmpCondtion.substring(0,tmpCondtion.length()-1);
				noticeTmp.setXzqh(tmpCondtion);
				List subList =this.getSqlMapClientTemplate().queryForList(
						"findAllSpcjPageStruct", noticeTmp);
//				for(Iterator subIt=subList.iterator();subIt.hasNext();){
//					list.add((Spcj)subIt.next());
//				}
				if(subList.size()>0){
					n += Integer.parseInt(subList.get(0).toString());
				}
			}
			
		} else {
			List list =new ArrayList();
//			 行政區劃組織
			StringBuffer condtion =new StringBuffer();
			condtion.append("'"+user.getXzqh()+"',");
			List nodeAll= allSubUnits;//this.getSqlMapClientTemplate().queryForList("queryAll",user.getUnitID());
//			for(Iterator it=nodeAll.iterator();it.hasNext();){
//				Unit subUnit =(Unit) it.next();
//				condtion.append("'"+subUnit.getXzqh()+"',");
//			}
			int num = 1;
			for(Object o:nodeAll){
				Unit subUnit =(Unit)o;
				if(num==999){
					condtion.append("'"+subUnit.getXzqh()+"')");
					condtion.append(" or s.xzqh in(");
					num=1;
				}else{
					condtion.append("'"+subUnit.getXzqh()+"',");
					num++;
				}
			}
			String tmpCondtion=condtion.toString();
			tmpCondtion=tmpCondtion.substring(0,tmpCondtion.length()-1);
			noticeTmp.setXzqh(tmpCondtion);
			List subList =this.getSqlMapClientTemplate().queryForList(
					"findAllSpcjPageStruct", noticeTmp);
			for(Iterator subIt=subList.iterator();subIt.hasNext();){
				list.add((Spcj)subIt.next());
			}
			n = list.size();
		}
		return n;
	}

	public List findAllTpcjPage(User user,Tpcj tpcj,List allSubUnits, int skipindex, int maxindex) throws Exception {
		List list =new ArrayList();
		Tpcj noticeTmp =tpcj;
		if (noticeTmp.getXzqh()!=null && !"".equals(noticeTmp.getXzqh())){
			list=this.getSqlMapClientTemplate().queryForList("findAllTpcjPage",noticeTmp);
			StringBuffer condtion =new StringBuffer();
//			condtion.append("'"+user.getXzqh()+"',");
			List nodeAll=allSubUnits;//this.getSqlMapClientTemplate().queryForList("queryAll",user.getUnitID());
			
//			for(Iterator it=nodeAll.iterator();it.hasNext();){
//				Unit subUnit =(Unit) it.next();
//				condtion.append("'"+subUnit.getXzqh()+"',");
//			}
			int num = 1;
			for(int i=0;i<nodeAll.size();i++){
				Unit subUnit =(Unit) nodeAll.get(i);
				if(num==999){
					condtion.append("'"+subUnit.getXzqh()+"')");
					condtion.append(" or s.xzqh in(");
					num=1;
				}else{
					condtion.append("'"+subUnit.getXzqh()+"',");
					num++;
				}
			}
			String tmpCondtion=condtion.toString();
			if(!"".equals(tmpCondtion)){
				tmpCondtion=tmpCondtion.substring(0,tmpCondtion.length()-1);
				noticeTmp.setXzqh(tmpCondtion);
				List subList =this.getSqlMapClientTemplate().queryForList(
						"findAllTpcjPageStruct", noticeTmp);
				for(Iterator subIt=subList.iterator();subIt.hasNext();){
					list.add((Tpcj)subIt.next());
				}
			}
			
			
			int index =(list.size()-skipindex) >maxindex?maxindex:list.size()-skipindex;
			list =new ArrayList(list.subList(skipindex, skipindex+index));
		}else{
			// 行政區劃組織
			StringBuffer condtion =new StringBuffer();
			condtion.append("'"+user.getXzqh()+"',");
			List nodeAll=allSubUnits;//this.getSqlMapClientTemplate().queryForList("queryAll",user.getUnitID());
			
//			for(Iterator it=nodeAll.iterator();it.hasNext();){
//				Unit subUnit =(Unit) it.next();
//				condtion.append("'"+subUnit.getXzqh()+"',");
//			}
			int num = 1;
			for(int i=0;i<nodeAll.size();i++){
				Unit subUnit =(Unit) nodeAll.get(i);
				if(num==999){
					condtion.append("'"+subUnit.getXzqh()+"')");
					condtion.append(" or s.xzqh in(");
					num=1;
				}else{
					condtion.append("'"+subUnit.getXzqh()+"',");
					num++;
				}
			}
			String tmpCondtion=condtion.toString();
			if(!"".equals(tmpCondtion)){
				tmpCondtion=tmpCondtion.substring(0,tmpCondtion.length()-1);
				noticeTmp.setXzqh(tmpCondtion);
				List subList =this.getSqlMapClientTemplate().queryForList(
						"findAllTpcjPageStruct", noticeTmp);
				for(Iterator subIt=subList.iterator();subIt.hasNext();){
					list.add((Tpcj)subIt.next());
				}
			}
			
			int index =(list.size()-skipindex) >maxindex?maxindex:list.size()-skipindex;
			list =new ArrayList(list.subList(skipindex, skipindex+index));
		}
			
		return list;
	}

	public int findAllTpcjPageCount(User user,Tpcj tpcj,List allSubUnits) throws Exception {
		int n=0;
		Tpcj noticeTmp=tpcj;
		if (noticeTmp.getXzqh()!=null && !"".equals(noticeTmp.getXzqh())) {
			n = (Integer)this.getSqlMapClientTemplate().queryForList("findAllTpcjPageCount",noticeTmp).get(0);
			List list =new ArrayList();
//			 行政區劃組織
			StringBuffer condtion =new StringBuffer();
//			condtion.append("'"+user.getXzqh()+"',");
			List nodeAll=allSubUnits;//this.getSqlMapClientTemplate().queryForList("queryAll",user.getUnitID());
			
//			for(Iterator it=nodeAll.iterator();it.hasNext();){
//				Unit subUnit =(Unit) it.next();
//				condtion.append("'"+subUnit.getXzqh()+"',");
//			}
			int num = 1;
			for(int i=0;i<nodeAll.size();i++){
				Unit subUnit =(Unit) nodeAll.get(i);
				if(num==999){
					condtion.append("'"+subUnit.getXzqh()+"')");
					condtion.append(" or s.xzqh in(");
					num=1;
				}else{
					condtion.append("'"+subUnit.getXzqh()+"',");
					num++;
				}
			}
			String tmpCondtion=condtion.toString();
			if(!"".equals(tmpCondtion)){
				
				tmpCondtion=tmpCondtion.substring(0,tmpCondtion.length()-1);
				noticeTmp.setXzqh(tmpCondtion);
				List subList =this.getSqlMapClientTemplate().queryForList(
						"findAllTpcjPageStruct", noticeTmp);
			}
//			for(Iterator subIt=subList.iterator();subIt.hasNext();){
//				list.add((Tpcj)subIt.next());
//			}
			n += list.size();
		} else {
			List list =new ArrayList();
//			 行政區劃組織
			StringBuffer condtion =new StringBuffer();
			condtion.append("'"+user.getXzqh()+"',");
			List nodeAll=allSubUnits;//this.getSqlMapClientTemplate().queryForList("queryAll",user.getUnitID());
			
//			for(Iterator it=nodeAll.iterator();it.hasNext();){
//				Unit subUnit =(Unit) it.next();
//				condtion.append("'"+subUnit.getXzqh()+"',");
//			}
			int num = 1;
			for(int i=0;i<nodeAll.size();i++){
				Unit subUnit =(Unit) nodeAll.get(i);
				if(num==999){
					condtion.append("'"+subUnit.getXzqh()+"')");
					condtion.append(" or s.xzqh in(");
					num=1;
				}else{
					condtion.append("'"+subUnit.getXzqh()+"',");
					num++;
				}
			}
			String tmpCondtion=condtion.toString();
			if(!"".equals(tmpCondtion)){
				tmpCondtion=tmpCondtion.substring(0,tmpCondtion.length()-1);
				noticeTmp.setXzqh(tmpCondtion);
				List subList =this.getSqlMapClientTemplate().queryForList(
						"findAllTpcjPageStruct", noticeTmp);
				for(Iterator subIt=subList.iterator();subIt.hasNext();){
					list.add((Tpcj)subIt.next());
				}
			}
			
			n += list.size();
		}
		return n;
	}

	public Spcj findSpcjById(int id) throws Exception {
		// TODO Auto-generated method stub
		return (Spcj)this.getSqlMapClientTemplate().queryForObject("findSpcjById",id);
	}

	public Tpcj findTpcjById(int id) throws Exception {
		// TODO Auto-generated method stub
		return (Tpcj)this.getSqlMapClientTemplate().queryForObject("findTpcjById",id);
	}

	public List finaAllNode(String parent_id) throws Exception {
		List list =new ArrayList();
		list =this.getSqlMapClientTemplate().queryForList("queryAll",parent_id);
		return list;
	}

}
