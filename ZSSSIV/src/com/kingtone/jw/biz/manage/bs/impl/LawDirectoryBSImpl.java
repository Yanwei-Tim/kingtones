package com.kingtone.jw.biz.manage.bs.impl;

import java.util.List;

import com.kingtone.jw.biz.manage.bs.LawDirectoryBS;
import com.kingtone.jw.biz.manage.dao.LawDirectoryDAO;
import com.kingtone.jw.biz.manage.domain.LawContent;
import com.kingtone.jw.biz.manage.domain.LawDirectory;
import com.kingtone.ssi.bizservice.SSIBizService;

public class LawDirectoryBSImpl extends SSIBizService implements LawDirectoryBS {

	private LawDirectoryDAO lawDirectoryDAO;

	public void setLawDirectoryDAO(LawDirectoryDAO lawDirectoryDAO) {
		this.lawDirectoryDAO = lawDirectoryDAO;
	}

	@Override
	public List<LawDirectory> findLawDirectoryAllTree(LawDirectory lawDirectory)
			throws Exception {
		List<LawDirectory> list = null;
		list = lawDirectoryDAO.findLawDirectoryAllTree(lawDirectory);
		return list;
	}

	@Override
	public LawContent queryLawDirectoryContent(int directoryId)throws Exception {
		return lawDirectoryDAO.queryLawDirectoryContent(directoryId);

	}

	@Override
	public void addLawDirectory(LawDirectory lawDirectory) throws Exception {
		lawDirectoryDAO.addLawDirectory(lawDirectory);
		
	}
	@Override
	public LawDirectory getLawDirectorybyId(int id) throws Exception {
		return lawDirectoryDAO.getLawDirectorybyId(id);
	}
	
	@Override
	public void updateLawDirectory(LawDirectory lawDirectory) throws Exception {
		lawDirectoryDAO.updateLawDirectory(lawDirectory);
		
	}

	@Override
	public int getLawContentCount(int id) throws Exception {
		return lawDirectoryDAO.getLawContentCount(id);
	}

	@Override
	public void addLawContent(LawContent lawContent) throws Exception {
		lawDirectoryDAO.addLawContent(lawContent);
		
	}

	@Override
	public LawContent getLawContentbyId(int id) throws Exception {
		return lawDirectoryDAO.getLawContentbyId(id);
	}

	@Override
	public void updateLawContent(LawContent lawContent) throws Exception {
		lawDirectoryDAO.updateLawContent(lawContent);		
	}

	@Override
	public void delLawContent(int id) throws Exception {
		lawDirectoryDAO.delLawContent(id);
		
	}

	@Override
	public void delLawDirectory(int id) throws Exception {
		lawDirectoryDAO.delLawDirectory(id);
		
	}

	@Override
	public int getLawDirectoryCount(int id) throws Exception {
		return lawDirectoryDAO.getLawDirectoryCount(id);
	}
	

}
