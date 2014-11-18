package com.kingtone.jw.biz.service.dao.impl;

import java.util.List;

import com.kingtone.jw.biz.service.dao.SysCodeListDAO;
import com.kingtone.jw.biz.service.domain.SystemMap;
import com.kingtone.jw.biz.service.domain.SystemRes;
import com.kingtone.jw.biz.service.domain.TableInfo;
import com.kingtone.ssi.dao.SSIOrmDao;
/*系统选择*/
public class SysCodeListDAOImpl extends SSIOrmDao implements SysCodeListDAO{
	public List findSysCodeListByType(SystemMap systemMap)throws Exception{
		//System.out.println("systemMap type:"+systemMap.getType());
		return this.getSqlMapClientTemplate().queryForList("findSysCodeListByType", systemMap);
	}
	/*获取数据来源*/
	public List querySystemMapListType()throws Exception{
		return this.getSqlMapClientTemplate().queryForList("querySystemMapListType");
	}
	/*组件资源树*/
	public List querySysResListTree() throws Exception {
		// TODO Auto-generated method stub
		return this.getSqlMapClientTemplate().queryForList("querySystemResList",new SystemRes());
	}
	/*选项卡下拉框*/
	public List queryTabInfoListSel(TableInfo tabInfo) throws Exception{
		return this.getSqlMapClientTemplate().queryForList("queryTableInfoList",tabInfo);
	}
}
