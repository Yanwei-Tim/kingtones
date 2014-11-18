package com.kingtone.jw.biz.common.dao;

import java.util.List;


import com.kingtone.jw.biz.common.domain.Spcj;
import com.kingtone.jw.biz.common.domain.Tpcj;
import com.kingtone.jw.platform.domain.User;



public interface SjcjDAO {
	/**
	 * 按照分页查找所有的信息
	 * startpos起始位置	pagesize页码
	 * @return 返回列表
	 * @throws RuntimeException
	 */
	public List findAllSpcjPage(User user,Spcj spcj,List allSubUnits, int skipindex, int maxindex)
			throws Exception;

	/**
	 * 按照分页查找所有的手机终端信息的总数
	 */
	public int findAllSpcjPageCount(User user,Spcj spcj,List allSubUnits) throws Exception;
	
	/**
	 * 根据主表查询视频信息
	 */
	public Spcj findSpcjById(int id) throws Exception;
	
	/**
	 * 删除上传视频
	 */
	public void deleteSpcj(int id) throws Exception ;
	
	/**
	 * 按照分页查找所有的信息
	 * startpos起始位置	pagesize页码
	 * @return 返回列表
	 * @throws RuntimeException
	 */
	public List findAllTpcjPage(User user,Tpcj tpcj,List allSubUnits, int skipindex, int maxindex)
			throws Exception;

	public List finaAllNode(String parent_id) throws Exception;
	/**
	 * 按照分页查找所有的手机终端信息的总数
	 */
	public int findAllTpcjPageCount(User user,Tpcj tpcj,List allSubUnits) throws Exception;
	
	/**
	 * 根据主表查询图片信息
	 */
	public Tpcj findTpcjById(int id) throws Exception;
	/**
	 * 删除上传图片
	 */
	public void deleteTpcj(int id) throws Exception ;
	

}
