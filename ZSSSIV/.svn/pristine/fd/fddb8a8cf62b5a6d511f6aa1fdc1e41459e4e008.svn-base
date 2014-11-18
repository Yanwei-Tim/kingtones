package com.kingtone.jw.platform.bs.impl;

import java.util.List;

import com.kingtone.jw.platform.bs.PSBS;
import com.kingtone.jw.platform.dao.PSDAO;
import com.kingtone.jw.platform.domain.Organization;
import com.kingtone.ssi.bizservice.SSIBizService;

public class PSBSImpl extends SSIBizService implements PSBS {
	private PSDAO psDAO;
	public void setPsDAO(PSDAO psDAO) {
		this.psDAO = psDAO;
	}
	
	public String findHead() throws Exception{
		return psDAO.findHead();
	}
	public List findPulicSituation(Organization organ) throws Exception {
		// TODO Auto-generated method stub
		return this.psDAO.findPulicSituation(organ);
	}

	@Override
	public List findJqList(Organization organ, int skipindex, int maxindex) throws Exception {
		return psDAO.findJqList(organ,skipindex,maxindex);
	}

	@Override
	public int findJqByCode(String code) throws Exception {
		return psDAO.findJqByCode(code);
	}

	@Override
	public void addJq(Organization organ) throws Exception {
		psDAO.addJq(organ);		
	}

	@Override
	public Organization findJqById(String id) throws Exception {
		return psDAO.findJqById(id);
	}

	@Override
	public int findJqByCodeJq(Organization organ) throws Exception {
		return psDAO.findJqByCodeJq(organ);
		
	}

	@Override
	public void editOrgan(Organization organ) throws Exception {
		psDAO.editOrgan(organ);
		
	}

	@Override
	public int findJqSonCount(Organization organ) throws Exception {
		return psDAO.findJqSonCount(organ);
		 
	}

	@Override
	public int findJqUserCount(Organization organ) throws Exception {
		return psDAO.findJqUserCount(organ);
	}
	
	public void delOrgan(String orgIds) throws Exception {
		String[] orgArray = orgIds.split("split");
        for(int i=0;i<orgArray.length;i++){
        	psDAO.delOrgan(orgArray[i]);
        }
    }

	@Override
	public List getOrganAll() throws Exception {
		return psDAO.getOrganAll();
	}

	@Override
	public List getOrganAllbyId(String pId) throws Exception {
		return psDAO.getOrganAllbyId(pId);
	}

	@Override
	public void importOrgan(Organization organ) throws Exception {
		psDAO.importOrgan(organ);
		
	}

	@Override
	public int findJqListCount(Organization organ) throws Exception {
		return psDAO.findJqListCount(organ);
	}


}
