package com.kingtone.jw.biz.service.dao;

import java.util.List;

import com.kingtone.jw.biz.service.domain.Business;
import com.kingtone.jw.biz.service.domain.BusinessRel;
import com.kingtone.jw.biz.service.domain.BusinessRes;
import com.kingtone.jw.biz.service.domain.ColMapping;
import com.kingtone.jw.biz.service.domain.ImageInfo;
import com.kingtone.jw.biz.service.domain.SystemMap;
import com.kingtone.jw.biz.service.domain.SystemRes;
import com.kingtone.jw.biz.service.domain.TableInfo;

public interface ServiceDAO {
	
	public String getSysDate() throws Exception;
	
	/*业务配置表查询 BUSINESS_CONFIG*/
	public List queryBizList(Business biz,int skipindex,
            int maxindex)throws Exception;
	/*业务配置表查询 BUSINESS_CONFIG*/
	public int queryBizCount(Business biz)throws Exception;
	public Business queryBiz(Business biz)throws Exception;
	/*业务配置表查询 BUSINESS_CONFIG*/
	public void addBiz(Business biz)throws Exception;
	/*业务配置表查询 BUSINESS_CONFIG*/
	public void updateBiz(Business biz)throws Exception;
	/*对列表和详细过滤进行选择*/
	public void updateBizItems(Business biz)throws Exception;
	/*对业务维护进行时间更新*/
	public void updateBizEditResDate(Business biz)throws Exception;
	/*对业务维护进行时间更新*/
	public void updateBizEditResDate(String b_id)throws Exception;
	/*业务配置表查询 BUSINESS_CONFIG*/
	public void deleteBiz(Business biz)throws Exception;
	
	/*业务资源配置Business_res_config*/
	public List queryBizResList(BusinessRes bizRes,int skipindex,
            int maxindex)throws Exception;
	public List queryBizResList(BusinessRes bizRes)throws Exception;
	public int queryBizResCount(BusinessRes bizRes)throws Exception;
	public int checkBizResCount(BusinessRes bizRes)throws Exception;
	/*查找存在的组件*/
	public int queryExsitBizResCount(BusinessRes bizRes)throws Exception;
	
	/*业务资源配置Business_res_config*/
	public void addBizRes(BusinessRes bizRes)throws Exception;
	/*业务资源配置Business_res_config*/
	public void updateBizRes(BusinessRes bizRes)throws Exception;
	public void upBusinessResShow(BusinessRes bizRes) throws Exception;
	/*业务资源配置Business_res_config*/
	public void deleteBizRes(BusinessRes bizRes)throws Exception;
	/*删除等于BID的所有字段映射*/
	public void deleteBizResByBid(BusinessRes bizRes) throws Exception;
	
	/*业务关联表 Business_related*/
	public List queryBizRelList(BusinessRel bizRel,int skipindex,
            int maxindex)throws Exception;
	public int queryBizRelCount(BusinessRel bizRel)throws Exception;
	/*业务关联表 Business_related*/
	public void addBizRel(BusinessRel bizRel)throws Exception;
	/*业务关联表 Business_related*/
	public void updateBizRel(BusinessRel bizRel)throws Exception;
	/*业务关联表 Business_related*/
	public void deleteBizRel(BusinessRel bizRel)throws Exception;	
	/*删除业务数据时，删除关系表中rid=id 和bid=id的所有数据*/
	public void deleteBizRelAll(BusinessRel bizRel) throws Exception;
	/*删除业务数据时，删除关系表中rid=id 和r_column的所有数据*/
	public void deleteBizRelByRidRcolumn(BusinessRel bizRel) throws Exception;
	/*根据RID查*/
	public List queryBizRelByRidList(String r_id)throws Exception;
	
	
	/*系统资源配置表*/
	public List querySysResList(SystemRes sysRes,int skipindex,
            int maxindex)throws Exception;
	public int querySysResCount(SystemRes sysRes)throws Exception;
	/*系统资源配置表*/
	public void addSysRes(SystemRes sysRes)throws Exception;
	/*系统资源配置表*/
	public void updateSysRes(SystemRes sysRes)throws Exception;
	public void updateSysMap(SystemMap sysMap)throws Exception;
	public void updateImageInfo(ImageInfo imageInfo)throws Exception;
	public void updateColMapping(ColMapping colMapping)throws Exception;
	/*系统资源配置表*/
	public void deleteSysRes(SystemRes sysRes)throws Exception;
	public void deleteSysMap(SystemMap sysMap)throws Exception;
	public void deleteColMapping(ColMapping colMapping)throws Exception;
	/*删除BID下的所有组件数据*/
	public void deleteColMappingByBid(ColMapping colMapping)throws Exception;
	
	public void deleteImageInfo(ImageInfo imageInfo)throws Exception;
	
	/*选项卡信息表*/
	public List queryTabInfoList(TableInfo tabInfo,int skipindex,
            int maxindex)throws Exception;
	public int queryTabInfoCount(TableInfo tabInfo)throws Exception;
	/*选项卡信息表*/
	public void addTabInfo(TableInfo tabInfo)throws Exception;
	/*选项卡信息表*/
	public void updateTabInfo(TableInfo tabInfo)throws Exception;
	/*选项卡信息表*/
	public void deleteTabInfo(TableInfo tabInfo)throws Exception;
	/*删除选项卡信息表信息 by bid*/
	public void deleteTabInfoByBid(TableInfo tabInfo) throws Exception;
	public List queryTabInfoList(TableInfo tabInfo)throws Exception;
	
	/*字典表*/
	public List querySysMapList(SystemMap sysMap,int skipindex,
            int maxindex)throws Exception;
	public int querySysMapCount(SystemMap sysMap)throws Exception;
	/*字典表*/
	public void addSysMap(SystemMap sysMap)throws Exception;
	/*字典表
	public void updateSystemMap(SystemMap systemMap)throws Exception;*/
	/*字典表
	public void deleteSystemMap(SystemMap systemMap)throws Exception;*/
	
	public List queryAllImageInfoList() throws Exception;
	public List queryAllResInfoList() throws Exception;	
	public List queryImageInfoList(ImageInfo imageInfo,int skipindex,
            int maxindex) throws Exception;
	public List queryImageInfoList() throws Exception;
	public int queryImageInfoCount(ImageInfo imageInfo) throws Exception;
	
	
	public List queryColMappingList(ColMapping colMapping,int skipindex,
            int maxindex) throws Exception;
	public List queryAllColMappingList(ColMapping colMapping) throws Exception;
	public int queryColMappingCount(ColMapping colMapping) throws Exception;
	
	
	public void addColMapping(ColMapping colMapping) throws Exception;
	
	public void addImageInfo(ImageInfo imageInfo) throws Exception ;
	
	public int checkBizRelCount(BusinessRel bizRel) throws Exception;
	public int checkCodeCount(SystemMap code) throws Exception;
	public int checkCodeTypeCount(SystemRes codeType) throws Exception;
	public int checkColMappingCount(ColMapping colMapping) throws Exception;
	public int checkImageInfoCount(ImageInfo imageInfo) throws Exception;
	public int checkTabInfoCount(TableInfo tabInfo) throws Exception;
	/*根据父类ID查子类列表*/
	public List findBizListByParent(String pbizId)throws Exception;
	/*业务流程业务*/
	public List queryRelateOperation()throws Exception;
}
