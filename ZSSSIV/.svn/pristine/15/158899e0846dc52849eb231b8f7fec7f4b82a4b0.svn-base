package com.kingtone.jw.biz.service.bs.impl;

import java.util.List;

import com.kingtone.jw.biz.service.bs.SysCodeListBS;
import com.kingtone.jw.biz.service.dao.ServiceDAO;
import com.kingtone.jw.biz.service.dao.SysCodeListDAO;
import com.kingtone.jw.biz.service.domain.SystemMap;
import com.kingtone.jw.biz.service.domain.TableInfo;
import com.kingtone.jw.biz.service.util.DataBaseHelper;
import com.kingtone.jw.service.dao.BizDAO;
import com.kingtone.jw.service.dao.ConfDAO;
import com.kingtone.ssi.bizservice.SSIBizService;
/*系统选择*/
public class SysCodeListBSImpl extends SSIBizService implements SysCodeListBS{
	public SysCodeListDAO sysCodeListDAO;
	public ServiceDAO serviceDAO;
	private BizDAO bizDAO;
	private ConfDAO confDAO;
	
	public void setServiceDAO(ServiceDAO serviceDAO) {
		this.serviceDAO = serviceDAO;
	}
	public List findSysCodeListByType(SystemMap systemMap)throws Exception{
		return sysCodeListDAO.findSysCodeListByType(systemMap);
	}

	public void setSysCodeListDAO(SysCodeListDAO sysCodeListDAO) {
		this.sysCodeListDAO = sysCodeListDAO;
	}
	/*根据父类ID查子类列表*/
	public List findBizListByParent(String pbizId)throws Exception{
		return serviceDAO.findBizListByParent(pbizId);
	}
	/*获取数据来源*/
	public List querySystemMapListType()throws Exception{
		return sysCodeListDAO.querySystemMapListType();
	}
	/*组件资源树*/
	public List querySysResListTree() throws Exception{
		return sysCodeListDAO.querySysResListTree();
	}
	/*选项卡下拉框*/
	public List queryTabInfoListSel(TableInfo tabInfo) throws Exception{
		return sysCodeListDAO.queryTabInfoListSel(tabInfo);
	}
	/*创建SQLite数据库*/
	public void addCreatePoliceDB() throws Exception{
		DataBaseHelper db=new DataBaseHelper(bizDAO,confDAO);
		db.createPoliceDB();
	}
	public void setBizDAO(BizDAO bizDAO) {
		this.bizDAO = bizDAO;
	}
	public void setConfDAO(ConfDAO confDAO) {
		this.confDAO = confDAO;
	}
}
