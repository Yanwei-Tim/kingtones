package com.kingtone.jw.biz.manage.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.kingtone.jw.biz.manage.dao.LawDirectoryDAO;
import com.kingtone.jw.biz.manage.domain.LawContent;
import com.kingtone.jw.biz.manage.domain.LawDirectory;
import com.kingtone.ssi.dao.SSIOrmDao;

public class LawDirectoryDAOImpl extends SSIOrmDao implements LawDirectoryDAO {

	@Override
	public List<LawDirectory> findLawDirectoryAllTree(LawDirectory lawDirectory)//获得法律法规的树目录
			throws Exception {
		List<LawDirectory> list = new ArrayList<LawDirectory>();
		
		list = this.getSqlMapClientTemplate().queryForList("findLawDirectoryList", lawDirectory);
		
		return list;
	}

	public LawContent queryLawDirectoryContent(int directoryId)throws Exception{//获得法律法规的内容
		return (LawContent) this.getSqlMapClientTemplate().queryForObject("findLawContent", directoryId);
	}
	
	public void addLawDirectory(LawDirectory lawDirectory) throws Exception{//添加法律法规目录
		this.getSqlMapClientTemplate().insert("addLawDirectory", lawDirectory);
		
	}
	
	public LawDirectory getLawDirectorybyId(int id) throws Exception {//根据id获取目录的信息
		return (LawDirectory) this.getSqlMapClientTemplate().queryForObject("getLawDirectorybyId", id);
	}

	public void updateLawDirectory(LawDirectory lawDirectory) throws Exception{//修改目录的信息
		this.getSqlMapClientTemplate().update("updateLawDirectory", lawDirectory);
	}
	
	public int getLawContentCount(int id) throws Exception {//检查目录下是否有内容（用于添加内容）
		int n = Integer.parseInt(this.getSqlMapClientTemplate().queryForObject("getLawContentCount", id).toString());
		return n;
	}
	
	public void addLawContent(LawContent lawContent) throws Exception{//添加法律法规内容
		this.getSqlMapClientTemplate().insert("addLawContent", lawContent);
	}
	
	public LawContent getLawContentbyId(int id) throws Exception {//根据id获取目录的信息
		return (LawContent) this.getSqlMapClientTemplate().queryForObject("findLawContentbyId", id);
	}
	
	public void updateLawContent(LawContent lawContent) throws Exception{//修改目录内容的信息
		this.getSqlMapClientTemplate().update("updateLawContent", lawContent);
	}
	
	public void delLawContent(int id) throws Exception {//删除目录内容
		this.getSqlMapClientTemplate().delete("deleteLawContent", id);
	}
		
	public int getLawDirectoryCount(int id) throws Exception {//检查目录下是否有子目录（用于删除目录）
		int n = Integer.parseInt(this.getSqlMapClientTemplate().queryForObject("getLawDirectoryCount", id).toString());
		return n;
	}
	
	public void delLawDirectory(int id) throws Exception {//删除目录
		this.getSqlMapClientTemplate().delete("deleteLawDirectory", id);
	}
//	@Override
//	public List<LawDirectory> findLawDirectoryList(LawDirectory lawDirectory,
//			int skipindex, int maxindex) throws Exception {
//		return null;
//	}
//	@Override
//	public boolean insertLawDirectory(LawDirectory lawDirectory)
//			throws Exception {
//		return false;
//	}
//
////	@Override
////	public boolean updateLawDirectory(LawDirectory lawDirectory)
////			throws Exception {
////		return false;
////	}
//
//	@Override
//	public boolean deleteLawDirectoryById(String id) throws Exception {
//		return false;
//	}
//
//	@Override
//	public LawDirectory findLawDirectoryById(String id) throws Exception {
//		return null;
//	}

}
