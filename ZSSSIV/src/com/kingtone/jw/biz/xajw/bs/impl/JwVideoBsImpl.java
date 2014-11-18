package com.kingtone.jw.biz.xajw.bs.impl;

import java.util.List;

import com.kingtone.jw.biz.xajw.bs.JwVideoBS;
import com.kingtone.jw.biz.xajw.dao.JwVideoDao;
import com.kingtone.jw.biz.xajw.domain.JwVideo;
import com.kingtone.ssi.util.IDUtil;

/**
 * 警务视频监控 Bs接口实现类
 * 
 * @author hanliqiang@kingtoneinfo.com
 * 
 */
public class JwVideoBsImpl implements JwVideoBS{
	private JwVideoDao jwVideoDao;

	public void setJwVideoDao(JwVideoDao jwVideoDao) {
		this.jwVideoDao = jwVideoDao;
	}

	public void addJwVideo(JwVideo jwVideo) throws Exception {
		// TODO Auto-generated method stub
		jwVideo.setId(IDUtil.newID());
		this.jwVideoDao.addJwVideo(jwVideo);
	}

	public void delJwVideo(String id) throws Exception {
		// TODO Auto-generated method stub
		this.jwVideoDao.delJwVideo(id);
	}

	public void editJwVideo(JwVideo jwVideo) throws Exception {
		// TODO Auto-generated method stub
		this.jwVideoDao.editJwVideo(jwVideo);
	}

	public int findAllJwVideoCount(JwVideo jwVideo) throws Exception {
		// TODO Auto-generated method stub
		return this.jwVideoDao.findAllJwVideoCount(jwVideo);
	}

	public JwVideo findJwVideoByID(String id) throws Exception {
		// TODO Auto-generated method stub
		return this.jwVideoDao.findJwVideoByID(id);
	}

	public List findJwVideoList(JwVideo jwVideo,int skipindex, int maxindex) throws Exception {
		// TODO Auto-generated method stub
		return this.jwVideoDao.findJwVideoList(jwVideo, skipindex, maxindex);
	}
	
}
