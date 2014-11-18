package com.kingtone.jw.biz.service.bs;

import java.util.List;

import com.kingtone.jw.biz.service.domain.SystemMap;
import com.kingtone.jw.biz.service.domain.TableInfo;
/*系统选择*/
public interface SysCodeListBS {
	/*系统下拉框*/
	public List findSysCodeListByType(SystemMap systemMap)throws Exception;
	/*根据父类ID查子类列表*/
	public List findBizListByParent(String pbizId)throws Exception;
	/*获取数据来源*/
	public List querySystemMapListType()throws Exception;
	/*组件资源树*/
	public List querySysResListTree() throws Exception;
	/*选项卡下拉框*/
	public List queryTabInfoListSel(TableInfo tabInfo) throws Exception;
	/*创建SQLite数据库*/
	public void addCreatePoliceDB() throws Exception;
}
