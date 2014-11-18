package com.kingtone.jw.biz.service.bs.impl;

import java.util.List;

import com.kingtone.jw.biz.service.bs.ServiceBS;
import com.kingtone.jw.biz.service.dao.ServiceDAO;
import com.kingtone.jw.biz.service.domain.Business;
import com.kingtone.jw.biz.service.domain.BusinessRel;
import com.kingtone.jw.biz.service.domain.BusinessRes;
import com.kingtone.jw.biz.service.domain.ColMapping;
import com.kingtone.jw.biz.service.domain.ImageInfo;
import com.kingtone.jw.biz.service.domain.SystemMap;
import com.kingtone.jw.biz.service.domain.SystemRes;
import com.kingtone.jw.biz.service.domain.TableInfo;
import com.kingtone.jw.biz.xajw.dao.JwRoleDAO;
import com.kingtone.jw.biz.xajw.domain.JwMRoleRes;
import com.kingtone.jw.biz.xajw.domain.JwRole;
import com.kingtone.ssi.bizservice.SSIBizService;

public class ServiceBSImpl extends SSIBizService implements ServiceBS{
	public ServiceDAO serviceDAO;
	public JwRoleDAO jwRoleDAO;
	
	public void setServiceDAO(ServiceDAO serviceDAO) {
		this.serviceDAO = serviceDAO;
	}

	public String getSysDate() throws Exception{
		return serviceDAO.getSysDate();
	}
	
	public List queryBizList(Business biz,int skipindex,
            int maxindex) throws Exception {
		return serviceDAO.queryBizList(biz,skipindex,
	            maxindex);
	}
	
	public int queryBizCount(Business biz) throws Exception {
		return serviceDAO.queryBizCount(biz);
	}
	
	public void addBiz(Business biz)throws Exception{
		serviceDAO.addBiz(biz);
		updateRootBizDate(null,false);
	}
	
	public void addCode(SystemMap code)throws Exception{
		serviceDAO.addSysMap(code);
	}
	
	public void addCodeType(SystemRes codeType)throws Exception{
		serviceDAO.addSysRes(codeType);
		updateRootBizDate(null,false);
	}
	
	public void addImageInfo(ImageInfo imageInfo)throws Exception{
		serviceDAO.addImageInfo(imageInfo);
	}
	
	public void addColMapping(ColMapping colMapping)throws Exception{
		serviceDAO.addColMapping(colMapping);
		updateBizEditResDate(colMapping.getB_id());
	}
	public void addTabInfo(TableInfo tabInfo)throws Exception{
		serviceDAO.addTabInfo(tabInfo);
		updateBizEditResDate(tabInfo.getB_id());
	}
	
	public List queryBizResList(BusinessRes bizRes,int skipindex,
            int maxindex) throws Exception {
		return serviceDAO.queryBizResList(bizRes,skipindex,
	            maxindex);
	}
	public List queryBizResList(BusinessRes bizRes)throws Exception{
		return serviceDAO.queryBizResList(bizRes);
	}
	public int queryBizResCount(BusinessRes bizRes) throws Exception {
		return serviceDAO.queryBizResCount(bizRes);
	}
	public int checkBizResCount(BusinessRes bizRes) throws Exception {
		return serviceDAO.checkBizResCount(bizRes);
	}
	
	public List queryBizRelList(BusinessRel bizRel,int skipindex,
            int maxindex) throws Exception {
		return serviceDAO.queryBizRelList(bizRel,skipindex,
	            maxindex);
	}
	
	public int queryBizRelCount(BusinessRel bizRel) throws Exception {
		return serviceDAO.queryBizRelCount(bizRel);
	}

	public void addBizRel(BusinessRel bizRel) throws Exception {
		serviceDAO.addBizRel(bizRel);
		updateBizEditResDate(bizRel.getB_id());
	}

	public void addBizRes(BusinessRes bizRes) throws Exception {
		// TODO Auto-generated method stub
		serviceDAO.addBizRes(bizRes);
		updateBizEditResDate(bizRes.getB_id());
	}

	public void delBiz(String bizIds) throws Exception {
		String [] bizIdArray = bizIds.split("split");
        for(int i=0;i<bizIdArray.length;i++){
        	Business biz = new Business();
        	biz.setB_id(bizIdArray[i]);
        	
            serviceDAO.deleteBiz(biz);
            /*删除关联数据*/
            delBizRelAll(biz.getB_id());
            delBizResByBid(biz.getB_id());
            deleteTabInfoByBid(biz.getB_id());
            deleteColMappingByBid(biz.getB_id());
          //权限关系删除
            updateRootBizDate(biz.getB_id(),true);
            jwRoleDAO.delJwMRoleResByBid(biz.getB_id());
            
        }
//        updateRootBizDate();
	}

	public void delBizRel(String bizRelIds) throws Exception {
		// TODO Auto-generated method stub
		String [] bizRelIdArray = bizRelIds.split("split");
        for(int i=0;i<bizRelIdArray.length;i++){
        	BusinessRel bizRel = new BusinessRel();
        	String[] ids = bizRelIdArray[i].split("and");
        	bizRel.setB_id(ids[0]);
        	bizRel.setR_id(ids[1]);
        	serviceDAO.deleteBizRel(bizRel);
        	updateBizEditResDate(bizRel.getB_id());
        }
	}
	/*删除业务数据时，删除关系表中rid=id 和bid=id的所有数据*/
	private void delBizRelAll(String b_id)throws Exception {
		BusinessRel bizRel = new BusinessRel();
		bizRel.setB_id(b_id);
		bizRel.setR_id(b_id);
		serviceDAO.deleteBizRelAll(bizRel);		
	}

	/*删除等于BID的所有组件*/
	public void delBizResByBid(String b_id) throws Exception {
		BusinessRes bizRes = new BusinessRes();
		bizRes.setB_id(b_id);
		//权限关系删除
		jwRoleDAO.delJwMRoleBizByBid(b_id);
		serviceDAO.deleteBizResByBid(bizRes);
	}
	/*删除选项卡信息表信息 by bid*/
	public void deleteTabInfoByBid(String b_id) throws Exception {
		TableInfo tabInfo=new TableInfo();
		tabInfo.setB_id(b_id);
		serviceDAO.deleteTabInfoByBid(tabInfo);
	}
	/*删除BID下的所有字段映射数据*/
	public void deleteColMappingByBid(String b_id) throws Exception {
		ColMapping colMapping =new ColMapping();
		colMapping.setB_id(b_id);
		serviceDAO.deleteColMappingByBid(colMapping);
	}
	
	
	public void delBizRes(String bizResIds) throws Exception {
		// TODO Auto-generated method stub
		String [] bizResIdArray = bizResIds.split("split");
        for(int i=0;i<bizResIdArray.length;i++){
        	BusinessRes bizRes = new BusinessRes();
        	String[] ids = bizResIdArray[i].split("and");
        	bizRes.setB_id(ids[0]);
        	bizRes.setW_id(Integer.parseInt(ids[1]));
        	//权限关系删除
        	JwMRoleRes jwMRoleRes=new JwMRoleRes();
        	jwMRoleRes.setBiz_id(bizRes.getB_id());
        	jwMRoleRes.setRes_id(String.valueOf(bizRes.getW_id()));
        	jwRoleDAO.delJwMRoleResByRidBid(jwMRoleRes);
        	serviceDAO.deleteBizRes(bizRes);
        	updateBizEditResDate(bizRes.getB_id());
        }
	}
//	private int show=1;
//	private int noshow=0;
	/*是否显示*/
	public void updateBizResShow(String bizResIds,int show) throws Exception {
		// TODO Auto-generated method stub
		String [] bizResIdArray = bizResIds.split("split");
		if(bizResIdArray!=null&&bizResIdArray.length>0){
			String b_id="";
        for(int i=0;i<bizResIdArray.length;i++){
        	BusinessRes bizRes = new BusinessRes();
        	String[] ids = bizResIdArray[i].split("and");
        	b_id=ids[0];
        	bizRes.setB_id(ids[0]);
        	bizRes.setW_id(Integer.parseInt(ids[1]));
        	bizRes.setVisible(show);//1 显示;0 不显示
        	serviceDAO.upBusinessResShow(bizRes);        	
        }       
        this.updateBizEditResDate(b_id);
        }
	}

	public void updateBiz(Business biz) throws Exception {
		serviceDAO.updateBiz(biz);
		updateRootBizDate(biz.getB_id(),true);
	}
	/*对列表和详细过滤进行选择*/
	public void updateBizItems(Business biz)throws Exception{
		serviceDAO.updateBizItems(biz);
	}
	/*对业务维护进行时间更新*/
	public void updateBizEditResDate(String b_id)throws Exception{
		Business biztemp=new Business();
		biztemp.setB_id(b_id);
		biztemp.setEdit_res_date(this.getSysDate());
		serviceDAO.updateBizEditResDate(biztemp);
		updateRootBizDate(b_id,true);		
	}
		
	/*修改根节点时间*/
	private void updateRootBizDate(String biz_id,boolean roleNeedUpdate)throws Exception{
		if(roleNeedUpdate){
			//做更新角色时间开关
			JwRole jwRole=new JwRole();
			jwRole.setBiz_id(biz_id);
			jwRole.setChange_date(serviceDAO.getSysDate());
			jwRoleDAO.editJwRoleCDateByBiz(jwRole);
		}
		Business biz=queryRootBiz();
		if(biz!=null){
			biz.setEdit_res_date(this.getSysDate());
			serviceDAO.updateBizEditResDate(biz);
		}
	}
	
	/*查根节点*/
	public Business queryRootBiz()throws Exception{
		Business biz = new Business();
		biz.setFather_id("0");
		List list = queryBizList(biz, 0, 1);
		if (list.size() > 0) {
			biz = (Business) list.get(0);
		}
		return biz;
	}
	public void updateBizRes(BusinessRes bizRes) throws Exception {
		serviceDAO.updateBizRes(bizRes);
		updateBizEditResDate(bizRes.getB_id());
	}
	public void updateBizRel(BusinessRel bizRel) throws Exception {
		serviceDAO.updateBizRel(bizRel);
		updateBizEditResDate(bizRel.getB_id());
	}

	public List queryCodeList(SystemMap code, int skipindex, int maxindex)
			throws Exception {
		return serviceDAO.querySysMapList(code,skipindex,maxindex);
	}

	public List queryCodeTypeList(SystemRes codeType, int skipindex,
			int maxindex) throws Exception {
		return serviceDAO.querySysResList(codeType,skipindex,maxindex);
	}

	public int queryCodeCount(SystemMap code) throws Exception {
		return serviceDAO.querySysMapCount(code);
	}

	public int queryCodeTypeCount(SystemRes codeType) throws Exception {
		return serviceDAO.querySysResCount(codeType);
	}

	public int queryTabInfoCount(TableInfo tabInfo) throws Exception {
		return serviceDAO.queryTabInfoCount(tabInfo);
	}
	public List queryTabInfoList(TableInfo tabInfo, int skipindex, int maxindex)
			throws Exception {
		return serviceDAO.queryTabInfoList(tabInfo, skipindex, maxindex);
	}
	
	public int queryImageInfoCount(ImageInfo imageInfo) throws Exception {
		return serviceDAO.queryImageInfoCount(imageInfo);
	}
	public List queryImageInfoList(ImageInfo imageInfo, int skipindex, int maxindex)
			throws Exception {
		return serviceDAO.queryImageInfoList(imageInfo, skipindex, maxindex);
	}
	public List queryImageInfoList()throws Exception {
		return serviceDAO.queryImageInfoList();
	}
	public List queryAllImageInfoList() throws Exception{
		return serviceDAO.queryAllImageInfoList();
	}
	public List queryAllResInfoList() throws Exception{
		return serviceDAO.queryAllResInfoList();
	}
	
	
	public int queryColMappingCount(ColMapping colMapping) throws Exception {
		return serviceDAO.queryColMappingCount(colMapping);
	}
	public List queryColMappingList(ColMapping colMapping, int skipindex, int maxindex)
			throws Exception {
		return serviceDAO.queryColMappingList(colMapping, skipindex, maxindex);
	}
	public List queryAllColMappingList(ColMapping colMapping) throws Exception{
		return serviceDAO.queryAllColMappingList(colMapping);
	}

	public void delCode(String codeIds) throws Exception {
//		serviceDAO.deleteSysMap(code);
		String [] codeIdArray = codeIds.split("split");
        for(int i=0;i<codeIdArray.length;i++){
        	SystemMap code = new SystemMap();
        	String[] ids = codeIdArray[i].split("and");
        	code.setType(ids[0]);
        	code.setKey(ids[1]);
        	serviceDAO.deleteSysMap(code);
        }
	}

	public void delCodeType(String codeTypeIds) throws Exception {
		String [] codeTypeIdArray = codeTypeIds.split("split");
        for(int i=0;i<codeTypeIdArray.length;i++){
        	SystemRes codeType = new SystemRes();
        	codeType.setRes_id(codeTypeIdArray[i]);
            serviceDAO.deleteSysRes(codeType);
        }
	}

	public void delColMapping(String colMappingIds) throws Exception {
//		serviceDAO.deleteColMapping(colMapping);
		String [] colMappingIdArray = colMappingIds.split("split");
        for(int i=0;i<colMappingIdArray.length;i++){
        	ColMapping colMapping = new ColMapping();
        	String[] ids = colMappingIdArray[i].split("and");
        	colMapping.setB_id(ids[0]);
        	colMapping.setColumns(ids[1]);
        	/*删除相关组件数据*/
        	BusinessRel bizRel=new BusinessRel();
        	bizRel.setR_id(colMapping.getB_id());
        	bizRel.setR_column(colMapping.getColumns());
        	serviceDAO.deleteBizRelByRidRcolumn(bizRel);
        	
        	serviceDAO.deleteColMapping(colMapping);
        	updateBizEditResDate(colMapping.getB_id());
        }
	}
	/*查找存在的组件*/
	public boolean queryExsitBizRes(String colMappingIds) throws Exception {
		String [] colMappingIdArray = colMappingIds.split("split");
		int n=0;boolean ifExsit=false;
        for(int i=0;i<colMappingIdArray.length;i++){
//        	ColMapping colMapping = new ColMapping();
        	String[] ids = colMappingIdArray[i].split("and");
//        	colMapping.setB_id(ids[0]);
//        	colMapping.setColumns(ids[1]);
        	BusinessRes bizRes = new BusinessRes();
        	bizRes.setB_id(ids[0]);
        	bizRes.setCode(ids[1]);
        	n=serviceDAO.queryExsitBizResCount(bizRes);
        	if(n>0){ifExsit=true;break;}
        }
        return ifExsit;
	}

	public void delImageInfo(String imageInfoIds) throws Exception {
		String [] imageInfoIdArray = imageInfoIds.split("split");
        for(int i=0;i<imageInfoIdArray.length;i++){
        	ImageInfo imageInfo = new ImageInfo();
        	imageInfo.setImg_name(imageInfoIdArray[i]);
            serviceDAO.deleteImageInfo(imageInfo);
        }
	}

	public void delTabInfo(String tabInfoIds) throws Exception {
//		serviceDAO.deleteTabInfo(tabInfo);
		String [] tabInfoIdArray = tabInfoIds.split("split");
        for(int i=0;i<tabInfoIdArray.length;i++){
        	TableInfo tabInfo = new TableInfo();
        	String[] ids = tabInfoIdArray[i].split("and");
        	tabInfo.setB_id(ids[0]);
        	tabInfo.setTab_id(Integer.parseInt(ids[1]));
        	serviceDAO.deleteTabInfo(tabInfo);
        	updateBizEditResDate(tabInfo.getB_id());
        }
	}

	public void updateCode(SystemMap code) throws Exception {
		// TODO Auto-generated method stub
		serviceDAO.updateSysMap(code);
	}

	public void updateCodeType(SystemRes codeType) throws Exception {
		// TODO Auto-generated method stub
		serviceDAO.updateSysRes(codeType);
		updateRootBizDate(null,true);//修改所有角色时间
	}

	public void updateColMapping(ColMapping colMapping) throws Exception {
		// TODO Auto-generated method stub
		serviceDAO.updateColMapping(colMapping);
		updateBizEditResDate(colMapping.getB_id());
	}

	public void updateImageInfo(ImageInfo imageInfo) throws Exception {
		// TODO Auto-generated method stub
		serviceDAO.updateImageInfo(imageInfo);
	}

	public void updateTabInfo(TableInfo tabInfo) throws Exception {
		// TODO Auto-generated method stub
		serviceDAO.updateTabInfo(tabInfo);
		updateBizEditResDate(tabInfo.getB_id());
	}

	public List queryTabInfoList(TableInfo tabInfo) throws Exception {
		// TODO Auto-generated method stub
		return serviceDAO.queryTabInfoList(tabInfo);
	}

	public int checkBizRelCount(BusinessRel bizRel) throws Exception {
		// TODO Auto-generated method stub
		return serviceDAO.checkBizRelCount(bizRel);
	}

	public int checkCodeCount(SystemMap code) throws Exception {
		// TODO Auto-generated method stub
		return serviceDAO.checkCodeCount(code);
	}

	public int checkCodeTypeCount(SystemRes codeType) throws Exception {
		// TODO Auto-generated method stub
		return serviceDAO.checkCodeTypeCount(codeType);
	}

	public int checkColMappingCount(ColMapping colMapping) throws Exception {
		// TODO Auto-generated method stub
		return serviceDAO.checkColMappingCount(colMapping);
	}

	public int checkImageInfoCount(ImageInfo imageInfo) throws Exception {
		// TODO Auto-generated method stub
		return serviceDAO.checkImageInfoCount(imageInfo);
	}

	public int checkTabInfoCount(TableInfo tabInfo) throws Exception {
		// TODO Auto-generated method stub
		return serviceDAO.checkTabInfoCount(tabInfo);
	}

	public Business queryBiz(Business biz) throws Exception {
		// TODO Auto-generated method stub
		return serviceDAO.queryBiz(biz);
	}
	/*根据RID查*/
	public List queryBizRelByRidList(String r_id)throws Exception{
		return serviceDAO.queryBizRelByRidList(r_id);
	}

	public void setJwRoleDAO(JwRoleDAO jwRoleDAO) {
		this.jwRoleDAO = jwRoleDAO;
	}

	public List queryRelateOperation() throws Exception {
		// TODO Auto-generated method stub
		return serviceDAO.queryRelateOperation();
	}
}
