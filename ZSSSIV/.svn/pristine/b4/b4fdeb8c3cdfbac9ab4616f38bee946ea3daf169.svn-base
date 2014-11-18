package com.kingtone.jw.biz.service.dao.impl;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.datasource.DriverManagerDataSource;

import com.kingtone.jw.biz.service.dao.ServiceDAO;
import com.kingtone.jw.biz.service.domain.Business;
import com.kingtone.jw.biz.service.domain.BusinessRel;
import com.kingtone.jw.biz.service.domain.BusinessRes;
import com.kingtone.jw.biz.service.domain.ColMapping;
import com.kingtone.jw.biz.service.domain.ImageInfo;
import com.kingtone.jw.biz.service.domain.SystemMap;
import com.kingtone.jw.biz.service.domain.SystemRes;
import com.kingtone.jw.biz.service.domain.TableInfo;
import com.kingtone.ssi.dao.SSIOrmDao;

public class ServiceDAOImpl  extends SSIOrmDao implements ServiceDAO{

	public String getSysDate() throws Exception{
		return (String) this.getSqlMapClientTemplate().queryForObject("getSysDate");
	}
	public void addBiz(Business biz) throws Exception {
		// TODO Auto-generated method stub
		//biz.setB_id(IDUtil.newID());
		this.getSqlMapClientTemplate().insert("addBiz",biz);
	}
	/*删除时，级联删除*/
	public void deleteBiz(Business biz) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().delete("deleteBiz", biz);
		this.getSqlMapClientTemplate().delete("deleteBizBrc", biz.getB_id());
		this.getSqlMapClientTemplate().delete("deleteBizBr", biz.getB_id());
		this.getSqlMapClientTemplate().delete("deleteBizTi", biz.getB_id());
	}

	public void deleteSysMap(SystemMap sysMap)throws Exception{
		this.getSqlMapClientTemplate().delete("deleteSystemMap", sysMap);
	}
	public void deleteColMapping(ColMapping colMapping)throws Exception{
		this.getSqlMapClientTemplate().delete("deleteColMapping", colMapping);
	}
	/*删除BID下的所有组件数据*/
	public void deleteColMappingByBid(ColMapping colMapping)throws Exception{
		this.getSqlMapClientTemplate().delete("deleteColMappingByBid", colMapping);
	}
	
	public void deleteImageInfo(ImageInfo imageInfo)throws Exception{
		this.getSqlMapClientTemplate().delete("deleteImageInfo", imageInfo);
	}
	
	
	public List queryBizList(Business biz,int skipindex,
            int maxindex) throws Exception {
		// TODO Auto-generated method stub
		
//		DriverManagerDataSource ds = new DriverManagerDataSource();
//		ds.setDriverClassName("oracle.jdbc.driver.OracleDriver");
//		ds.setUrl("jdbc:oracle:thin:@222.90.232.195:1521:oradb");
//		ds.setUsername("XASGAJ_BUSI");
//		ds.setPassword("XASGAJ_BUSI");
//		this.setDataSource(ds);
		
		return this.getSqlMapClientTemplate().queryForList("queryBizList", biz,skipindex,maxindex);
	}
	public int queryBizCount(Business biz) throws Exception {
		// TODO Auto-generated method stub
		Object c = this.getSqlMapClientTemplate().queryForObject("queryBizCount",  biz);
		return Integer.parseInt(c.toString());
	}
	
	public int checkBizResCount(BusinessRes bizRes) throws Exception {
		// TODO Auto-generated method stub
		Object c = this.getSqlMapClientTemplate().queryForObject("checkBizResCount",  bizRes);
		return Integer.parseInt(c.toString());
	}

	public void updateBiz(Business biz) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().update("updateBiz",biz);
	}
	
	/*对列表和详细过滤进行选择*/
	public void updateBizItems(Business biz)throws Exception{
		this.getSqlMapClientTemplate().update("updateBizItems",biz);
	}

	/*对业务维护进行时间更新*/
	public void updateBizEditResDate(Business biz)throws Exception{
		this.getSqlMapClientTemplate().update("updateBizEditResDate",biz);
	}
	/*对业务维护进行时间更新*/
	public void updateBizEditResDate(String b_id)throws Exception{
		Business biztemp=new Business();
		biztemp.setB_id(b_id);
		biztemp.setEdit_res_date(this.getSysDate());
		this.updateBizEditResDate(biztemp);
	}
	public void addBizRel(BusinessRel bizRel) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().insert("addBusinessRel",bizRel);
	}

	public void addBizRes(BusinessRes bizRes) throws Exception {
		this.getSqlMapClientTemplate().insert("addBusinessRes",bizRes);
	}

	public void addSysMap(SystemMap sysMap) throws Exception {
		this.getSqlMapClientTemplate().insert("addSystemMap",sysMap);
	}

	public void addSysRes(SystemRes sysRes) throws Exception {
		this.getSqlMapClientTemplate().insert("addSystemRes",sysRes);
	}

	public void addTabInfo(TableInfo tabInfo) throws Exception {
		this.getSqlMapClientTemplate().insert("addTableInfo",tabInfo);
	}
	
	public void addImageInfo(ImageInfo imageInfo) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().insert("addImageInfo",imageInfo);
	}
	
	public void addColMapping(ColMapping colMapping) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().insert("addColMapping",colMapping);
	}
	
	

	public void deleteBizRel(BusinessRel bizRel) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().delete("deleteBusinessRel", bizRel);
	}
	/*删除业务数据时，删除关系表中rid=id 和bid=id的所有数据*/
	public void deleteBizRelAll(BusinessRel bizRel) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().delete("deleteBusinessRelAll", bizRel);
	}
	/*删除业务数据时，删除关系表中rid=id 和r_column的所有数据*/
	public void deleteBizRelByRidRcolumn(BusinessRel bizRel) throws Exception{
		this.getSqlMapClientTemplate().delete("deleteBizRelByRidRcolumn", bizRel);
	}

	public void deleteBizRes(BusinessRes bizRes) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().delete("deleteBusinessRes", bizRes);
	}
	/*删除等于BID的所有字段映射*/
	public void deleteBizResByBid(BusinessRes bizRes) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().delete("deleteBusinessResByBid", bizRes);
	}	
	
/*	public void deleteSystemMap(SystemMap systemMap) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().delete("deleteSystemMap", systemMap);
	}*/

	public void deleteSysRes(SystemRes sysRes) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().delete("deleteSystemRes", sysRes);
	}

	public void deleteTabInfo(TableInfo tabInfo) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().delete("deleteTableInfo", tabInfo);
	}
	public void deleteTabInfoByBid(TableInfo tabInfo) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().delete("deleteTableInfoByBid", tabInfo);
	}
	
	public List queryBizRelList(BusinessRel bizRel,int skipindex,
            int maxindex) throws Exception {
		// TODO Auto-generated method stub
		return this.getSqlMapClientTemplate().queryForList("queryBusinessRelList",bizRel,skipindex,
	            maxindex);
	}
	public int queryBizRelCount(BusinessRel bizRel)throws Exception{
		Object c = this.getSqlMapClientTemplate().queryForObject("queryBusinessRelCount",bizRel);
		return Integer.parseInt(c.toString());
	}

	public List queryBizResList(BusinessRes bizRes,int skipindex,
            int maxindex) throws Exception {
		// TODO Auto-generated method stub
		return this.getSqlMapClientTemplate().queryForList("queryBusinessResList",bizRes,skipindex,maxindex);
	}
	public List queryBizResList(BusinessRes bizRes)throws Exception{
		return this.getSqlMapClientTemplate().queryForList("queryBusinessRes",bizRes);
	}
	public int queryBizResCount(BusinessRes bizRes) throws Exception {
		// TODO Auto-generated method stub
		Object c = this.getSqlMapClientTemplate().queryForObject("queryBusinessResCount",bizRes);
		return Integer.parseInt(c.toString());
	}
	/*查找存在的组件*/
	public int queryExsitBizResCount(BusinessRes bizRes)throws Exception{
		Object c = this.getSqlMapClientTemplate().queryForObject("queryExsitBizResCount",bizRes);
		return Integer.parseInt(c.toString());
	}
	
	public List querySysMapList(SystemMap sysMap,int skipindex,
            int maxindex) throws Exception {
		// TODO Auto-generated method stub
		return this.getSqlMapClientTemplate().queryForList("querySystemMapList",sysMap, skipindex,
	            maxindex);
	}

	public List querySysResList(SystemRes sysRes,int skipindex,
            int maxindex) throws Exception {
		// TODO Auto-generated method stub
		return this.getSqlMapClientTemplate().queryForList("querySystemResList",sysRes, skipindex,
	            maxindex);
	}

	public List queryTabInfoList(TableInfo tabInfo,int skipindex,
            int maxindex) throws Exception {
		// TODO Auto-generated method stub
		return this.getSqlMapClientTemplate().queryForList("queryTableInfoList",tabInfo,skipindex,maxindex);
	}
	public int queryTabInfoCount(TableInfo tabInfo) throws Exception {
		Object c = this.getSqlMapClientTemplate().queryForObject("queryTableInfoCount",tabInfo);
		return Integer.parseInt(c.toString());
	}

	public void updateBizRel(BusinessRel bizRel) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().update("upBusinessRel",bizRel);
	}

	public void updateBizRes(BusinessRes bizRes) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().update("upBusinessRes",bizRes);
	}
	public void upBusinessResShow(BusinessRes bizRes) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().update("upBusinessResShow",bizRes);
	}
	
/*	public void updateSystemMap(SystemMap systemMap) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().update("updateSystemMap",systemMap);
	}*/

	public void updateSysRes(SystemRes sysRes) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().update("updateSystemRes",sysRes);
	}

	public void updateTabInfo(TableInfo tabInfo) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().update("updateTableInfo",tabInfo);
	}

	public int querySysMapCount(SystemMap sysMap) throws Exception {
		Object c = this.getSqlMapClientTemplate().queryForObject("querySystemMapCount",sysMap);
		return Integer.parseInt(c.toString());
	}

	public int querySysResCount(SystemRes sysRes) throws Exception {
		Object c = this.getSqlMapClientTemplate().queryForObject("querySystemResCount",sysRes);
		return Integer.parseInt(c.toString());
	}
	
	public List queryAllImageInfoList() throws Exception {
		// TODO Auto-generated method stub
		return this.getSqlMapClientTemplate().queryForList("queryImageInfoList");
	}
	public List queryAllResInfoList() throws Exception {
		// TODO Auto-generated method stub
		return this.getSqlMapClientTemplate().queryForList("querySystemResList");
	}
	
	public List queryImageInfoList(ImageInfo imageInfo,int skipindex,
            int maxindex) throws Exception {
		
//		DriverManagerDataSource ds = new DriverManagerDataSource();
//		ds.setDriverClassName("oracle.jdbc.driver.OracleDriver");
//		ds.setUrl("jdbc:oracle:thin:@192.168.43.45:1521:oradb");
//		ds.setUsername("fw_conf");
//		ds.setPassword("fw_conf");
//		this.setDataSource(ds);
		return this.getSqlMapClientTemplate().queryForList("queryImageInfoList",imageInfo,skipindex,maxindex);
	}
	public List queryImageInfoList() throws Exception {
		return this.getSqlMapClientTemplate().queryForList("queryImageInfoList");
	}
	public int queryImageInfoCount(ImageInfo imageInfo) throws Exception {
		Object c = this.getSqlMapClientTemplate().queryForObject("queryImageInfoCount",imageInfo);
		return Integer.parseInt(c.toString());
	}

	
	public List queryColMappingList(ColMapping colMapping,int skipindex,
            int maxindex) throws Exception {
		// TODO Auto-generated method stub
		return this.getSqlMapClientTemplate().queryForList("queryColMappingList",colMapping,skipindex,maxindex);
	}
	public List queryAllColMappingList(ColMapping colMapping) throws Exception {
		// TODO Auto-generated method stub
		return this.getSqlMapClientTemplate().queryForList("queryColMappingList",colMapping);
	}
	public int queryColMappingCount(ColMapping colMapping) throws Exception {
		Object c = this.getSqlMapClientTemplate().queryForObject("queryColMappingCount",colMapping);
		return Integer.parseInt(c.toString());
	}

	public void updateColMapping(ColMapping colMapping) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().update("updateColMapping",colMapping);
	}

	public void updateImageInfo(ImageInfo imageInfo) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().update("updateImageInfo",imageInfo);
	}

	public void updateSysMap(SystemMap sysMap) throws Exception {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().update("updateSystemMap",sysMap);
	}

	public List queryTabInfoList(TableInfo tabInfo) throws Exception {
		// TODO Auto-generated method stub
		return this.getSqlMapClientTemplate().queryForList("queryTableInfo",tabInfo);
	}
	public int checkBizRelCount(BusinessRel bizRel) throws Exception {
		// TODO Auto-generated method stub
		Object c = this.getSqlMapClientTemplate().queryForObject("checkBizRelCount",  bizRel);
		return Integer.parseInt(c.toString());
	}
	public int checkCodeCount(SystemMap code) throws Exception {
		Object c = this.getSqlMapClientTemplate().queryForObject("checkSystemMapCount",  code);
		return Integer.parseInt(c.toString());
	}
	public int checkCodeTypeCount(SystemRes codeType) throws Exception {
		Object c = this.getSqlMapClientTemplate().queryForObject("checkSystemResCount",  codeType);
		return Integer.parseInt(c.toString());
	}
	public int checkColMappingCount(ColMapping colMapping) throws Exception {
		Object c = this.getSqlMapClientTemplate().queryForObject("checkColMappingCount",  colMapping);
		return Integer.parseInt(c.toString());
	}
	public int checkImageInfoCount(ImageInfo imageInfo) throws Exception {
		Object c = this.getSqlMapClientTemplate().queryForObject("checkImageInfoCount",  imageInfo);
		return Integer.parseInt(c.toString());
	}
	public int checkTabInfoCount(TableInfo tabInfo) throws Exception {
		Object c = this.getSqlMapClientTemplate().queryForObject("checkTabInfoCount",  tabInfo);
		return Integer.parseInt(c.toString());
	}
	public Business queryBiz(Business biz) throws Exception {
		return (Business) this.getSqlMapClientTemplate().queryForObject("queryBizList",biz);
	}
	/*根据父类ID查子类列表*/
	public List findBizListByParent(String pbizId)throws Exception{
		return this.getSqlMapClientTemplate().queryForList("findBizListByParent",pbizId);
	}
	/*根据RID查*/
	public List queryBizRelByRidList(String r_id)throws Exception{
		return this.getSqlMapClientTemplate().queryForList("findBizRelByRid",r_id);
	}
	public List queryRelateOperation() throws Exception {
		// TODO Auto-generated method stub
		return this.getSqlMapClientTemplate().queryForList("queryRelateOperation");
	}
}
