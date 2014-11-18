package com.kingtone.jw.biz.common.bs;

import java.util.List;

import com.kingtone.jw.biz.common.domain.Notice;
import com.kingtone.jw.biz.common.domain.NoticeUser;
import com.kingtone.jw.biz.common.domain.Sjsb;
import com.kingtone.jw.platform.domain.User;



public interface TztgBS {
	
	public List findSjsbListByXzqh(Sjsb sjsb)throws Exception;
	public List findAllNoticePage(User user,Notice notice, int skipindex, int maxindex)throws Exception;
	public List findAllNoticePage(NoticeUser notice, int skipindex, int maxindex)throws Exception;
	public int findAllNoticePageCount(User user,Notice notice) throws Exception;
	public int findAllNoticeUserPageCount(NoticeUser notice) throws Exception;
	public void saveNotice(Notice notice,String optype) throws Exception;
	public void updateNotice(Notice notice,String optype) throws Exception;
	public Notice findNoticeById(int id) throws Exception;
	public void deleteNotice(int id) throws Exception;
	public void updateNoticeAttach(Notice notice) throws Exception;
	/**
	 * @author hanliqiang
	 * 通知通告推送
	 */
	public void sendPNMessage(Notice notice)throws Exception;
}

