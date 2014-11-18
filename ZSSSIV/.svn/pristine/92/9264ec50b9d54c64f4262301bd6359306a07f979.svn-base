package com.kingtone.jw.biz.common.dao;

import java.util.List;

import com.kingtone.jw.biz.common.domain.Notice;
import com.kingtone.jw.biz.common.domain.NoticeUser;
import com.kingtone.jw.biz.common.domain.Sjsb;
import com.kingtone.jw.platform.domain.User;



public interface TztgDAO {
	
	public List findSjsbListByXzqh(Sjsb sjsb)throws Exception;
	/**
	 * 按照分页查找所有的信息
	 * startpos起始位置	pagesize页码
	 * @return 返回列表
	 * @throws RuntimeException
	 */
	public List findAllNoticePage(User user,Notice notice,List allSubUnits, int skipindex, int maxindex)
	throws Exception;
	
	public List findAllNoticePage(NoticeUser notice, int skipindex, int maxindex)
	throws Exception;
	 
	public int findAllNoticePageCount(User user,Notice notice,List allSubUnits) throws Exception;
	public int findAllNoticeUserPageCount(NoticeUser notice) throws Exception;
	/**
	 * 添加通知通报信息
	 * @param notice
	 * @throws RuntimeException
	 */
	public void saveNotice(Notice notice) throws Exception;
	/**
	 * 发送通知通报信息
	 * @param notice
	 * @throws RuntimeException
	 */
	public Object sendNotice(Notice notice) throws Exception;
	/**
	 * 发送通知通报信息
	 * @param notice
	 * @throws RuntimeException
	 */
	public void sendNoticeUser(Notice notice) throws Exception;
	/**
	 * 发送通知通报信息
	 * @param notice
	 * @throws RuntimeException
	 */
	public void updateNoticeUser(Notice notice) throws Exception;
	/**
	 * 添加通知通报信息
	 * @return id
	 * @param notice
	 * @throws RuntimeException
	 */
	public int saveNoticeForId(Notice notice) throws Exception;
	/**
	 * 修改通知通报信息
	 * @param notice
	 * @throws RuntimeException
	 */
	public void updateNotice(Notice notice) throws Exception;
	/**
	 * 修改发送通知通报信息
	 * @param notice
	 * @throws RuntimeException
	 */
	public void updateSendNotice(Notice notice) throws Exception;
	/**
	 * 删除通知通报信息
	 * @param id
	 * @throws RuntimeException
	 */
	public void deleteNotice(int id) throws Exception;
	
	/**
	 * 添加通知通报子表信息
	 * @param notice
	 * @throws RuntimeException
	 */
	public void saveNoticeUser(NoticeUser noticeUser) throws Exception;
	
	/**
	 * 删除通知通报子表信息
	 * @param id
	 * @throws RuntimeException
	 */
	public void deleteNoticeUser(int id) throws Exception;
	
	/**
	 * 删除通知通报子表信息
	 * @param noticeid
	 * @throws RuntimeException
	 */
	public void deleteNoticeUserByNoticeid(int noticeid) throws Exception;	
	
	/**
	 * 根据id查询通知通报主表信息
	 * @param id
	 * @throws RuntimeException
	 */
	public Notice findNoticeById(int id) throws Exception;
		
	/**
	 * 根据noticeid查询通知通报子表信息
	 * @param device_id
	 * @throws RuntimeException
	 */
	public List findNoticeUserByNoticeid(int noticeid) throws Exception;
	
	/**
	 * 根据noticeid查询通知通报子表信息 接收单位
	 * @param device_id
	 * @throws RuntimeException
	 */
	public List findNoticeUserDepByNoticeid(int noticeid) throws Exception;
	
	/**
	 * 根据noticeid查询分页查询通知通报所有信息签收情况
	 * @param device_id
	 * @throws RuntimeException
	 */
	public List findAllNoticeUserPage(int noticeid , int skipindex, int maxindex) throws Exception;
	
	/**
	 * 根据noticeid查询分页查询通知通报所有信息签收情况 总数
	 * @param device_id
	 * @throws RuntimeException
	 */
	public int findAllNoticeUserPageCount(int noticeid) throws Exception;
		
	/**
	 * 添加通知通报附件
	 * @param notice
	 * @throws RuntimeException
	 */
	public void updateNoticeAttach(Notice notice) throws Exception;
	
	/**
	 * 查询通知通告最大ID
	 * @param null
	 * @throws Exception
	 */
	public Notice getMaxNoticeID()throws Exception;
}
