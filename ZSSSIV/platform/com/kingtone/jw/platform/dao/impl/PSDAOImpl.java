package com.kingtone.jw.platform.dao.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.kingtone.jw.platform.dao.PSDAO;
import com.kingtone.jw.platform.domain.Organization;
import com.kingtone.ssi.dao.SSIOrmDao;

/**
 * 
 * 警情机构dao层
 * @author yulipeng
 *
 */
public class PSDAOImpl extends SSIOrmDao implements PSDAO {
	
	public String findHead() throws Exception{//获取根节点null
		String id = (String) this.getSqlMapClientTemplate().queryForObject("queryHead");
		return id;
	}
	public List findPulicSituation(Organization organ) throws Exception {//获取树（中间的内容）
		List list = this.getSqlMapClientTemplate().queryForList("findPulicSituation", organ);		
		return list;
	}

	public List findJqList(Organization organ, int skipindex, int maxindex) throws Exception{//获取机构（右边的内容）
		List list=new ArrayList();
		Organization organTmp = new Organization();
		String hid = this.findHead();	//0001
		
		if(organ.getParent_id()!=null && !"null".equals(organ.getParent_id()) && !hid.equals(organ.getParent_id())){
			List subList =this.getSqlMapClientTemplate().queryForList("queryAllJqParantNames2", organ);
			for(Iterator subIt=subList.iterator();subIt.hasNext();){
				list.add((Organization)subIt.next());
			}
			
			int index =(list.size()-skipindex) >maxindex?maxindex:list.size()-skipindex;
			list =new ArrayList(list.subList(skipindex, skipindex+index));
		}else{
			if(organ.getName()!=null && !"null".equals(organ.getName())){
				organTmp.setName(organ.getName());
			}
			if(organ.getCode()!=null && !"null".equals(organ.getCode())){
				organTmp.setCode(organ.getCode());
			}
			List subList =this.getSqlMapClientTemplate().queryForList("queryAllJqParantNames",organTmp);
			for(Iterator subIt=subList.iterator();subIt.hasNext();){
				list.add((Organization)subIt.next());
			}
			
			int index =(list.size()-skipindex) >maxindex?maxindex:list.size()-skipindex;
			list =new ArrayList(list.subList(skipindex, skipindex+index));			
		}
		
		return list;
	}
	
	public int findJqListCount(Organization organ) throws Exception{//获取数据数量（用于分页）
		int pagesize=0;
		List list=new ArrayList();
		Organization organTmp = new Organization();
		String hid = this.findHead();	//0001
		
		if(organ.getParent_id()!=null && !"null".equals(organ.getParent_id()) && !hid.equals(organ.getParent_id())){
			List subList =this.getSqlMapClientTemplate().queryForList("queryAllJqParantNames2", organ);
			for(Iterator subIt=subList.iterator();subIt.hasNext();){
				list.add((Organization)subIt.next());
			}
			pagesize=list.size();
		}else{
			if(organ.getName()!=null && !"null".equals(organ.getName())){
				organTmp.setName(organ.getName());
			}
			if(organ.getCode()!=null && !"null".equals(organ.getCode())){
				organTmp.setCode(organ.getCode());
			}
			List subList =this.getSqlMapClientTemplate().queryForList("queryAllJqParantNames",organTmp);
			for(Iterator subIt=subList.iterator();subIt.hasNext();){
				list.add((Organization)subIt.next());
			}
			pagesize=list.size();		
		}
		
		return pagesize;
	}
	public int findJqByCode(String code) throws Exception {//获取机构的编码code，判断是否重复
		int n = Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"countJqByCode", code).toString());
		return n;
	}
	
	public void addJq(Organization organ) throws Exception {//添加organ机构
		this.getSqlMapClientTemplate().insert("organAdd", organ);
	}
	
	public Organization findJqById(String id) throws Exception {//根据id查organ（修改里面用）
		return (Organization) this.getSqlMapClientTemplate().queryForObject(
				"findJqByID", id);
	}
	public int findJqByCodeJq(Organization organ) throws Exception {//判断code是否重复（修改用）
		int n = Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"findJqByCodeJq", organ).toString());
		return n;
	}
	public void editOrgan(Organization organ) throws Exception {//修改organ机构
		this.getSqlMapClientTemplate().update("jqUpdate", organ);
	}
	
	public int findJqSonCount(Organization organ) throws Exception {//判断是否有子节点（删除使用）
		int n = Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"findJqSonCount", organ).toString());
		return n;
	}
	
	public int findJqUserCount(Organization organ) throws Exception {//判断是否有相关用户（删除使用）
		int n = Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"findJqUserCount", organ).toString());
		return n;
	}
	
	public void delOrgan(String orgid) throws Exception {//删除organ机构
		this.getSqlMapClientTemplate().delete("organDelete", orgid);
	}
	
	public List getOrganAll() throws Exception { //获取所有机构子节点 (用于Excel导出)
		List list = this.getSqlMapClientTemplate().queryForList("getOrganAll");
		return list;
	}
	
	public List getOrganAllbyId(String pId) throws Exception {//根据id获取所有机构子节点 (用于Excel导出)
		List list = this.getSqlMapClientTemplate().queryForList("getOrganAllbyId",pId);
		return list;
	}
	
	public void importOrgan(Organization organ) throws Exception {//导入警情机构信息信息 (用于Excel导入)
		this.getSqlMapClientTemplate().insert("importorgan", organ);
		
	}

	
}
