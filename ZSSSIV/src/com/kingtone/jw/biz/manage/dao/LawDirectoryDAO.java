package com.kingtone.jw.biz.manage.dao;

import java.util.List;

import com.kingtone.jw.biz.manage.domain.LawContent;
import com.kingtone.jw.biz.manage.domain.LawDirectory;

public interface LawDirectoryDAO {

	// 树形获取目录集合数据
	public List<LawDirectory> findLawDirectoryAllTree(LawDirectory lawDirectory)
			throws Exception;
	//获得法律法规的内容
	public LawContent queryLawDirectoryContent(int directoryId)throws Exception;
	//添加法律法规目录
	public void addLawDirectory(LawDirectory lawDirectory) throws Exception;
	//根据id获取目录的信息
	public LawDirectory getLawDirectorybyId(int id) throws Exception;
	//修改目录的信息
	public void updateLawDirectory(LawDirectory lawDirectory) throws Exception;
	//检查目录下是否有内容（用于添加内容）
	public int getLawContentCount(int id) throws Exception;
	//添加法律法规内容
	public void addLawContent(LawContent lawContent) throws Exception;
	//根据id获取目录的信息
	public LawContent getLawContentbyId(int id) throws Exception;
	//修改目录内容的信息
	public void updateLawContent(LawContent lawContent) throws Exception;
	//删除目录内容
	public void delLawContent(int id) throws Exception;
	//检查目录下是否有子目录（用于删除目录）
	public int getLawDirectoryCount(int id) throws Exception;
	//删除目录
	public void delLawDirectory(int id) throws Exception;
	
//	public List<LawDirectory> findLawDirectoryList(LawDirectory lawDirectory,
//			int skipindex, int maxindex) throws Exception;

//	// 增加法律法规目录
//	public boolean insertLawDirectory(LawDirectory lawDirectory)
//			throws Exception;
//
////	// 更新法律法规目录
////	public boolean updateLawDirectory(LawDirectory lawDirectory)
////			throws Exception;
//
//	// 按ID删除法律法规目录
//	public boolean deleteLawDirectoryById(String id) throws Exception;
//
//	//根据ID查询LawDirectory对象
//	public LawDirectory findLawDirectoryById(String id) throws Exception;
}
