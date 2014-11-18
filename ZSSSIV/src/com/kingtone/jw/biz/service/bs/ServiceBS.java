package com.kingtone.jw.biz.service.bs;

import java.util.List;

import com.kingtone.jw.biz.service.domain.Business;
import com.kingtone.jw.biz.service.domain.BusinessRel;
import com.kingtone.jw.biz.service.domain.BusinessRes;
import com.kingtone.jw.biz.service.domain.ColMapping;
import com.kingtone.jw.biz.service.domain.ImageInfo;
import com.kingtone.jw.biz.service.domain.SystemMap;
import com.kingtone.jw.biz.service.domain.SystemRes;
import com.kingtone.jw.biz.service.domain.TableInfo;

public interface ServiceBS {
	
	public String getSysDate() throws Exception;
	
	/*业务配置表查询 BUSINESS_CONFIG*/
	public List queryBizList(Business biz,int skipindex,
            int maxindex)throws Exception;
	public int queryBizCount(Business biz)throws Exception;
	public Business queryBiz(Business biz)throws Exception;
	public void addBiz(Business biz)throws Exception;
	public void delBiz(String bizIds)throws Exception;
	public void updateBiz(Business biz)throws Exception;
	/*对列表和详细过滤进行选择*/
	public void updateBizItems(Business biz)throws Exception;
	/*对业务维护进行时间更新*/
	public void updateBizEditResDate(String b_id)throws Exception;
	/*获取业务根节点*/
	public Business queryRootBiz()throws Exception;
	
	public List queryBizResList(BusinessRes bizRes,int skipindex,
            int maxindex)throws Exception;
	public List queryBizResList(BusinessRes bizRes)throws Exception;
	public int queryBizResCount(BusinessRes bizRes)throws Exception;
	public void addBizRes(BusinessRes bizRes)throws Exception;
	public void delBizRes(String bizResIds)throws Exception;
	public int checkBizResCount(BusinessRes bizRes)throws Exception;
	/*查找存在的组件*/
	public boolean queryExsitBizRes(String colMappingIds) throws Exception ;
	public void updateBizRes(BusinessRes bizRes)throws Exception;
	/*是否显示*/
	public void updateBizResShow(String bizResIds,int show) throws Exception;
	
	public List queryBizRelList(BusinessRel bizRel,int skipindex,
            int maxindex)throws Exception;
	public int queryBizRelCount(BusinessRel bizRel)throws Exception;
	public void addBizRel(BusinessRel bizRel)throws Exception;
	public void delBizRel(String bizRelIds)throws Exception;
	public void updateBizRel(BusinessRel bizRel)throws Exception;
	public int checkBizRelCount(BusinessRel bizRel)throws Exception;
	
	public List queryCodeTypeList(SystemRes codeType,int skipindex,
            int maxindex)throws Exception;
	public int queryCodeTypeCount(SystemRes codeType)throws Exception;
	public void addCodeType(SystemRes codeType)throws Exception;
	public void delCodeType(String codeTypeIds)throws Exception;
	public void updateCodeType(SystemRes codeType)throws Exception;
	public int checkCodeTypeCount(SystemRes codeType)throws Exception;
	
	public List queryCodeList(SystemMap code,int skipindex,
            int maxindex)throws Exception;
	public int queryCodeCount(SystemMap code)throws Exception;
	public void addCode(SystemMap code)throws Exception;
	public void delCode(String codeIds)throws Exception;
	public void updateCode(SystemMap code)throws Exception;
	public int checkCodeCount(SystemMap code)throws Exception;
	
	public List queryTabInfoList(TableInfo tabInfo,int skipindex,
            int maxindex)throws Exception;
	public int queryTabInfoCount(TableInfo tabInfo)throws Exception;
	public void addTabInfo(TableInfo tabInfo)throws Exception;
	public void delTabInfo(String tabInfoIds)throws Exception;
	public void updateTabInfo(TableInfo tabInfo)throws Exception;
	public List queryTabInfoList(TableInfo tabInfo)throws Exception;
	public int checkTabInfoCount(TableInfo tabInfo)throws Exception;
	
	public List queryAllImageInfoList() throws Exception;
	public List queryAllResInfoList() throws Exception;
	public List queryImageInfoList(ImageInfo imageInfo,int skipindex,
            int maxindex)throws Exception;
	public List queryImageInfoList()throws Exception;
	public int queryImageInfoCount(ImageInfo imageInfo)throws Exception;
	public void addImageInfo(ImageInfo imageInfo)throws Exception;
	public void delImageInfo(String imageInfoIds)throws Exception;
	public void updateImageInfo(ImageInfo imageInfo)throws Exception;
	public int checkImageInfoCount(ImageInfo imageInfo)throws Exception;
	
	public List queryColMappingList(ColMapping colMapping,int skipindex,
            int maxindex)throws Exception;
	public List queryAllColMappingList(ColMapping colMapping) throws Exception;
	public int queryColMappingCount(ColMapping colMapping)throws Exception;
	public void addColMapping(ColMapping colMapping)throws Exception;
	public void delColMapping(String colMappingIds)throws Exception;
	public void updateColMapping(ColMapping colMapping)throws Exception;
	public int checkColMappingCount(ColMapping colMapping)throws Exception;
	/*根据RID查*/
	public List queryBizRelByRidList(String r_id)throws Exception;
	/*业务流程业务*/
	public List queryRelateOperation()throws Exception;
}
