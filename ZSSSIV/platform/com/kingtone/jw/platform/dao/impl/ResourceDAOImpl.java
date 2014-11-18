package com.kingtone.jw.platform.dao.impl;

import java.util.List;

import com.kingtone.jw.platform.dao.ResourceDAO;
import com.kingtone.jw.platform.domain.Resource;
import com.kingtone.ssi.dao.SSIOrmDao;

public class ResourceDAOImpl extends SSIOrmDao implements ResourceDAO {

	public void addResource(Resource resource_bak) throws Exception {
		this.getSqlMapClientTemplate().insert("resourceAdd", resource_bak);

	}

	public void delResource(String resourceIds) throws Exception {
		this.getSqlMapClientTemplate().delete("resourceDelete", resourceIds);

	}

	public void editResource(Resource resource_bak) throws Exception {
		this.getSqlMapClientTemplate().update("resourceUpdate", resource_bak);

	}

	public Resource findResourceById(String id) throws Exception {
		return (Resource) this.getSqlMapClientTemplate().queryForObject(
				"findResourcByID", id);
	}

	public List findResourceList(Resource resource_bak, int skipindex,
			int maxindex) throws Exception {
		List list = this.getSqlMapClientTemplate().queryForList(
				"findAllResourcPage", resource_bak, skipindex, maxindex);
		return list;
	}

	public int findResourceListCount(Resource resource_bak) throws Exception {
		int n = Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"findResourcPageCount", resource_bak).toString());
		return n;
	}

	public List queryResourceList() throws Exception {
		List list = this.getSqlMapClientTemplate().queryForList(
				"queryResourceList");
		return list;
	}

}
