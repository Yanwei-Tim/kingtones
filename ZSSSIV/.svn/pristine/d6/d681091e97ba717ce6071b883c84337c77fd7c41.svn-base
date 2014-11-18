package com.kingtone.jw.biz.xajw.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.kingtone.jw.biz.xajw.dao.JwVideoDao;
import com.kingtone.jw.biz.xajw.domain.JwVideo;
import com.kingtone.ssi.dao.SSIOrmDao;

/**
 * 警务视频监控 dao接口实现类
 * 
 * @author hanliqiang@kingtoneinfo.com
 * 
 */

public class JwVideoDaoImpl extends SSIOrmDao implements JwVideoDao{

	public void addJwVideo(JwVideo jwVideo) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().insert("addJwVedio", jwVideo);
	}

	public void delJwVideo(String id) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().delete("delJwVideo", id);
	}

	public void editJwVideo(JwVideo jwVideo) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().update("editJwVideo", jwVideo);
	}

	public List findJwVideoList(JwVideo jwVideo,int skipindex, int maxindex) throws Exception {
		// TODO Auto-generated method stub
		List list = new ArrayList();
		list = this.getSqlMapClientTemplate().queryForList("findJwVideoList", jwVideo, skipindex, maxindex);
		return list;
	}

	public int findAllJwVideoCount(JwVideo jwVideo) throws Exception {
		// TODO Auto-generated method stub
		int i = 0;
		i = (Integer)this.getSqlMapClientTemplate().queryForList("findAllJwVideoCount", jwVideo).get(0);
		return i;
	}

	public JwVideo findJwVideoByID(String id) throws Exception {
		// TODO Auto-generated method stub
		return (JwVideo)this.getSqlMapClientTemplate().queryForObject("findJwVideoByID",id);
	}

}
