package com.kingtone.jw.service.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.kingtone.activity.oa.receipt.widget.TreeElement;
import com.kingtone.jw.service.domain.QueryEnvelop;
import com.kingtone.jw.service.jwoa.bean.ArrayOfSuperiorsInfo;
import com.kingtone.jw.service.jwoa.pojo.FileType;
import com.kingtone.jw.service.jwoa.pojo.ReceiptType;

public interface OaPermissionDAO {
	public List getOaGList(QueryEnvelop request);
	public List getOaCYList(QueryEnvelop request);
	public Map getGDetail(String uid);
	public Map getCyDetail(String uid);
	public List getMindList(String uid);
	public List getHisMindList(String uid);
	/**
	 * 查询文件类别列表（一级）
	 * @param filetype
	 * @return
	 * @author litengmin
	 */
	public List<FileType> findVFileTypeMList(FileType filetype) throws SQLException;
	/**
	 * 查询文件类别列表（二级）
	 * @param filetype
	 * @return
	 * @author litengmin
	 */
	public List<FileType> findTowFileTypeList(FileType filetype) throws SQLException;
	/**
	 * 查询收文类别列表，供用户收文时选择
	 * @author litengmin
	 * @param receiptType
	 * @return
	 * @throws SQLException
	 */
	public List<ReceiptType> findReceiptTypeList(ReceiptType receiptType) throws SQLException;
	/**
	 * 保密级别列表
	 * @author litengmin
	 * @return
	 * @throws SQLException
	 */
	public List<String> findBMlevelList() throws SQLException;
	/**
	 * 紧急程度列表
	 * @author litengmin
	 * @return
	 * @throws SQLException
	 */
	public List<String> findjjcdList() throws SQLException;
	/**
	 * 主题词
	 * @author litengmin
	 * @return
	 * @throws SQLException
	 */
	public List<String> findZTCList() throws SQLException;
	/**
	 * 常用批示语
	 * @author litengmin
	 * @return
	 * @throws SQLException
	 */
	public List<String> findCYPSYList() throws SQLException;
	/**
	 * 根据警号查询该警员常用批示语列表
	 * @author litengmin
	 * @param userId 警员警号
	 * @return
	 * @throws SQLException
	 */
	public List<String> findUserToCYCList(String userId) throws SQLException;
	/**
	 * 3.1.9   主送单位列表、抄送单位列表
	 * @return
	 * @throws SQLException
	 */
	public List<TreeElement> findSelorgtaxis() throws SQLException;
	/**
	 * 3.1.10    抄送人列表接口
	 * @param area 所属分局，筛选条件
	 * @return
	 * @throws SQLException
	 */
	public List<TreeElement> findSelusertaxis(String area) throws SQLException;//
	
	/**
	 * 3.1.11  公安局组织架构列表
	 * @param area 分局代码
	 * @param  isFindUser 是否加载人员
	 */
	public List<TreeElement> findOrgTree(String area,boolean isFindUser) throws SQLException;//
	
	/**
	 * 3.1.12  公安局人员列表
	 */
	public List<Map<String,String>> findUserList(String orgId) throws SQLException;	
	
	/**
	 * 根据警号或姓名查询人员
	 * @param userId 警员号
	 * @param userName 姓名
	 */
	public List<Map<String, Object>> findUserList(String userId, String userName) throws SQLException; 
	/**
	 * 获取发文签发员列表
	 * @param area
	 * @return
	 * @throws SQLException
	 */
	public List<Map<String, Object>> findIssuingUserList(String area) throws SQLException;
	
	public List<Map<String, Object>> findOAOrganization()throws SQLException;
	
	public List<Map<String, Object>> findOAUser()throws SQLException;
	
}
