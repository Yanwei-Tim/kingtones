package com.kingtone.jw.biz.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.kingtone.jw.biz.service.bs.ServiceBS;
import com.kingtone.jw.biz.service.domain.Business;
import com.kingtone.jw.biz.service.domain.BusinessRel;
import com.kingtone.jw.biz.service.domain.BusinessRes;
import com.kingtone.jw.biz.service.domain.ColMapping;
import com.kingtone.jw.biz.service.domain.ImageInfo;
import com.kingtone.jw.biz.service.domain.SystemMap;
import com.kingtone.jw.biz.service.domain.SystemRes;
import com.kingtone.jw.biz.service.domain.TableInfo;
import com.kingtone.jw.biz.service.util.Tools;
import com.kingtone.jw.platform.domain.Code;
import com.kingtone.jw.platform.domain.TreeNode;
import com.kingtone.jw.platform.domain.Unit;
import com.kingtone.jw.platform.util.OrgUtils;
import com.kingtone.jw.service.test;
import com.kingtone.jw.service.util.CommonTool;
import com.kingtone.ssi.action.SSIAction;
import com.kingtone.ssi.log.LogTools;
import com.kingtone.ssi.log.SSILogger;

import commonserver.ThreadTest;

@SuppressWarnings("unchecked")
public class ServiceAC extends SSIAction {
	
	public ServiceBS serviceBS;
	private String query;
	private String qtype;
	private String total = "0";
	protected String rp;
	protected String page;
	private List rows = new ArrayList();

	private String bizId;
	private String bizResId;
	private String bizRelId;
	private String tabInfoId;
	private String imageInfoId;
	private String colMappingId;
	private String codeId;
	private String codeTypeId;

	private Business biz;
	private BusinessRes bizRes;
	private BusinessRel bizRel;
	private SystemRes codeType;
	private SystemMap code;
	private TableInfo tabInfo;
	private ImageInfo imageInfo;
	private ColMapping colMapping;

	private String bizIds;
	private String bizRelIds;
	private String bizResIds;
	private String codeTypeIds;
	private String codeIds;
	private String tabInfoIds;
	private String imageInfoIds;
	private String colMappingIds;

	private String info;
	private String opType;
	public String queryBizList() throws Exception {
		if(!"0".equals(opType)){
			LogTools.debug(getCurrentAccount().getUsername(),
				getCurrentUnit().getUnit_name(), "业务维护", 
				"进入【业务信息】维护页面");
		}else {
			LogTools.debug(getCurrentAccount().getUsername(),
				getCurrentUnit().getUnit_name(), "配置管理", 
				"进入【配置管理】维护页面");
		}
		try{
//			String url = "http://localhost:8088/SSIV/services/CommonServer?wsdl";
//			String method = "getList";
//			String xml1 = "<com.kingtone.jw.service.domain.QueryEnvelop>"+
//			  "<bizTag>B201100015</bizTag>"+
//			  "<condition/>"+
//			  "<detail/>"+
//			  "<list/>"+
//			  "<userID>3</userID>"+
//			  "<pageSize>6</pageSize>"+
//			  "<totalNum>-1</totalNum>"+
//			  "<totalPage>-1</totalPage>"+
//			  "<pageNum>1</pageNum>"+
//			"</com.kingtone.jw.service.domain.QueryEnvelop>";
//			String xml2 = "<com.kingtone.jw.service.domain.QueryEnvelop>"+
//			  "<bizTag>B201100017</bizTag>"+
//			  "<condition/>"+
//			  "<detail/>"+
//			  "<list/>"+
//			  "<userID>3</userID>"+
//			  "<pageSize>6</pageSize>"+
//			  "<totalNum>-1</totalNum>"+
//			  "<totalPage>-1</totalPage>"+
//			  "<pageNum>1</pageNum>"+
//			"</com.kingtone.jw.service.domain.QueryEnvelop>";
//			String str = test.call(url,method,xml1);
//			String str2 = test.call(url,method,xml2);
//			System.out.println(xml1.length()+"=="+str.length());	
//			System.out.println(xml2.length()+"=="+str2.length());
		Business business = new Business();
		rows.clear();
		if ("b_id".equals(qtype)) {
			business.setB_id(query);
		} else if ("b_name".equals(qtype)) {
			business.setB_name(query);
		} else if ("b_type".equals(qtype)) {
			business.setB_type(query);
		}
		List list = serviceBS.queryBizList(business,
				(Integer.parseInt(page) - 1) * Integer.parseInt(rp), Integer
						.parseInt(rp));
		for (Object o : list) {
			Business b = (Business) o;
			Map map = new HashMap();
			map.put("b_id", b.getB_id());
			map.put("cell", new Object[] {
					b.getB_id(),
					b.getB_name(),
					((Map) CommonTool.codeMap.get("business")).get(b
							.getB_type()),
					b.getImg_name(),
					b.getL_simple_items(),
					b.getD_simple_items(),
					b.getL_sql(),
					b.getD_sql(),
					b.getFather_id(),					
					((Map) CommonTool.codeMap.get("isleaf")).get(b
							.getFinal_node()), b.getEdit_res_date(),b.getDs(),b.getB_orders()});
			rows.add(map);
		}
		total = serviceBS.queryBizCount(business) + "";
		}catch(Exception e){
			SSILogger.Bizlogger.error(e, e);
		}
		return JSON;
	}

	public String checkIsLeaf() throws Exception{
		info = "";
		Business biz = new Business();
		biz.setB_id(bizId);
		biz = serviceBS.queryBiz(biz);
		if("0".equals(biz.getFinal_node())){
			info="0";
		}
		return JSON;
	}
	
	public String queryBizResList() throws Exception {
		BusinessRes bizRes = new BusinessRes();
		bizRes.setB_id(bizId);
		rows.clear();
		if ("name".equals(qtype)) {
			bizRes.setName(query);
		} else if ("type".equals(qtype)) {
			bizRes.setType(query);
		}

		List list = serviceBS.queryBizResList(bizRes,
				(Integer.parseInt(page) - 1) * Integer.parseInt(rp), Integer
						.parseInt(rp));
		for (Object o : list) {
			BusinessRes b = (BusinessRes) o;
			Map map = new HashMap();
			map.put("id", b.getB_id() + "and" + b.getW_id());// 联合id
			map.put("cell", new Object[] {
					b.getB_id() + "and" + b.getW_id(),
					b.getW_id(),
					b.getB_id(),
					b.getName(),
					((Map) CommonTool.codeMap.get("w_type")).get(b.getType()),
					b.getRes_id(),
					((Map) CommonTool.codeMap.get("isshow")).get(b.getVisible()
							+ ""),
					((Map) CommonTool.codeMap.get("validate")).get(b
							.getValidate_type()),
					b.getValidate_des(),
					b.getCode(),
					b.getDatatype(),
					((Map) CommonTool.codeMap.get("isnull")).get(b
							.getIsbenull()
							+ ""), b.getOrders(), b.getTabgroup() });
			rows.add(map);
		}
		total = serviceBS.queryBizResCount(bizRes) + "";
		return JSON;
	}

	public String queryBizRelList() throws Exception {
		BusinessRel bizRel = new BusinessRel();
		bizRel.setB_id(bizId);
		rows.clear();
		List list = serviceBS.queryBizRelList(bizRel,
				(Integer.parseInt(page) - 1) * Integer.parseInt(rp), Integer
						.parseInt(rp));
		for (Object o : list) {
			BusinessRel b = (BusinessRel) o;
			Map map = new HashMap();
			map.put("id", b.getB_id() + "and" + b.getR_id());// 联合id
			map.put("cell", new Object[] {
					b.getB_id() + "and" + b.getR_id(),
					b.getB_id(),
					b.getR_id(),
					b.getR_column(),
					((Map) CommonTool.codeMap.get("relatetype")).get(b
							.getR_type()
							+ "") });
			rows.add(map);
		}
		total = serviceBS.queryBizRelCount(bizRel) + "";
		return JSON;
	}

	public String queryImageInfoList() throws Exception {
		LogTools.debug(getCurrentAccount().getUsername(),
				getCurrentUnit().getUnit_name(), "图片维护", 
				"进入【图片配置】维护页面");
		imageInfo = new ImageInfo();
		rows.clear();
		if ("img_name".equals(qtype)) {
			imageInfo.setImg_name(query);
		} else if ("img_des".equals(qtype)) {
			imageInfo.setImg_des(query);
		}
		List list = serviceBS.queryImageInfoList(imageInfo, (Integer
				.parseInt(page) - 1)
				* Integer.parseInt(rp), Integer.parseInt(rp));
		for (Object o : list) {
			ImageInfo b = (ImageInfo) o;
			Map map = new HashMap();
			map.put("id", b.getImg_name());
			map.put("cell", new Object[] { b.getImg_name(), b.getImg_path(),
					b.getImg_des() });
			rows.add(map);
		}
		total = serviceBS.queryImageInfoCount(imageInfo) + "";
		return JSON;
	}
	
	public String queryImageInfoAllList() throws Exception {
		
		List list = serviceBS.queryImageInfoList();
		for (Object o : list) {
			ImageInfo b = (ImageInfo) o;
//			Map map = new HashMap();
//			map.put("id", b.getImg_name());
//			map.put("cell", new Object[] { b.getImg_name(), b.getImg_path(),
//					b.getImg_des() });
			b.setImg_name(b.getImg_path().substring(b.getImg_path().lastIndexOf("/")+1));
			rows.add(b);
		}
		return JSON;
	}

	public String queryColMappingList() throws Exception {
		colMapping = new ColMapping();
		rows.clear();
		if ("b_id".equals(qtype)) {
			colMapping.setB_id(query);
		} else if ("columns".equals(qtype)) {
			colMapping.setColumns(query);
		}
		colMapping.setB_id(bizId);
		List list = serviceBS.queryColMappingList(colMapping, (Integer
				.parseInt(page) - 1)
				* Integer.parseInt(rp), Integer.parseInt(rp));
		for (Object o : list) {
			ColMapping b = (ColMapping) o;
			// bug修改：解决"<"符号在360和ie下不能正常显示 -陈萧如
			String op = b.getOp();
			if(op!=null&&op.equals("<")){
				op = "&lt;";
			}
			Map map = new HashMap();
			map.put("id", b.getB_id() + "and" + b.getColumns());
			map.put("cell", new Object[] {
					b.getB_id() + "and" + b.getColumns(),
					b.getB_id(),
					b.getColumns(),
					b.getCname(),
					b.getTable_name(),
					b.getC_column(),
					b.getCname_type(),
					((Map) CommonTool.codeMap.get("haveres"))
							.get(b.getIs_res()), b.getRes_id(), op});
			rows.add(map);
		}
		total = serviceBS.queryColMappingCount(colMapping) + "";
		return JSON;
	}

	public String queryTabInfoList() throws Exception {
		tabInfo = new TableInfo();
		rows.clear();
		if ("b_id".equals(qtype)) {
			tabInfo.setB_id(query);
		}
		tabInfo.setB_id(bizId);
		List list = serviceBS.queryTabInfoList(tabInfo,
				(Integer.parseInt(page) - 1) * Integer.parseInt(rp), Integer
						.parseInt(rp));
		for (Object o : list) {
			TableInfo b = (TableInfo) o;
			Map map = new HashMap();
			map.put("id", b.getB_id() + "and" + b.getTab_id());
			map.put("cell", new Object[] { b.getB_id() + "and" + b.getTab_id(),
					b.getTab_id(), b.getB_id(), b.getTab_name() });
			rows.add(map);
		}
		total = serviceBS.queryTabInfoCount(tabInfo) + "";
		return JSON;
	}

	public String queryCodeTypeList() throws Exception {
		LogTools.debug(getCurrentAccount().getUsername(),
				getCurrentUnit().getUnit_name(), "业务代码表", 
				"进入【业务代码表】维护页面");
		codeType = new SystemRes();
		rows.clear();
		if ("res_id".equals(qtype)) {
			codeType.setRes_id(query);
		} else if ("res_name".equals(qtype)) {
			codeType.setRes_name(query);
		}
		List list = serviceBS.queryCodeTypeList(codeType, (Integer
				.parseInt(page) - 1)
				* Integer.parseInt(rp), Integer.parseInt(rp));
		for (Object o : list) {
			SystemRes b = (SystemRes) o;
			Map map = new HashMap();
			map.put("res_id", b.getRes_id());
			map.put("cell", new Object[] { b.getRes_id(), b.getRes_name(),
					b.getChange_date(), b.getSource(),b.getDs() });
			rows.add(map);
		}
		total = serviceBS.queryCodeTypeCount(codeType) + "";
		return JSON;
	}

	public String queryCodeList() throws Exception {
		LogTools.debug(getCurrentAccount().getUsername(),
				getCurrentUnit().getUnit_name(), "系统代码表", 
				"进入【系统代码表】维护页面");
		code = new SystemMap();
		rows.clear();
		if ("key".equals(qtype)) {
			code.setKey(query);
		} else if ("value".equals(qtype)) {
			code.setValue(query);
		} else if ("type".equals(qtype)) {
			code.setType(query);
		}
		List list = serviceBS.queryCodeList(code, (Integer.parseInt(page) - 1)
				* Integer.parseInt(rp), Integer.parseInt(rp));
		for (Object o : list) {
			SystemMap b = (SystemMap) o;
			Map map = new HashMap();
			map.put("id", b.getType() + "and" + b.getKey());
			map.put("cell", new Object[] { b.getType() + "and" + b.getKey(),
					b.getKey(), b.getValue(), b.getType() });
			rows.add(map);
		}
		total = serviceBS.queryCodeCount(code) + "";
		return JSON;
	}

	public String addBiz() throws Exception {
		biz.setB_id(Tools.getUID());
		biz.setEdit_res_date(serviceBS.getSysDate());
		serviceBS.addBiz(biz);
		return JSON;
	}

	public String addBizRel() throws Exception {
		int count = serviceBS.checkBizRelCount(bizRel);
		if (count == 0) {
			serviceBS.addBizRel(bizRel);
			info="1";
		}else{
			info="0";
		}
		return JSON;
	}

	public String addBizRes() throws Exception {
		int count = serviceBS.checkBizResCount(bizRes);
		if (count == 0) {
			serviceBS.addBizRes(bizRes);
			info = "1";
		} else {
			info = "0";
		}
		return JSON;
	}

	public String addCode() throws Exception {
		int count = serviceBS.checkCodeCount(code);
		if (count == 0) {
			serviceBS.addCode(code);
			info = "1";
		} else {
			info = "0";
		}
		return JSON;
	}

	public String addCodeType() throws Exception {
		int count = serviceBS.checkCodeTypeCount(codeType);
		if (count == 0) {
			codeType.setChange_date(serviceBS.getSysDate());
			serviceBS.addCodeType(codeType);
			info = "1";
		} else {
			info = "0";
		}
		return JSON;
	}

	public String addTabInfo() throws Exception {
		int count = serviceBS.checkTabInfoCount(tabInfo);
		if (count == 0) {
			serviceBS.addTabInfo(tabInfo);
			info = "1";
		} else {
			info = "0";
		}
		return JSON;
	}

	public String addImageInfo() throws Exception {
		int count = serviceBS.checkImageInfoCount(imageInfo);
		if (count == 0) {
			serviceBS.addImageInfo(imageInfo);
			info = "1";
		} else {
			info = "0";
		}
		return JSON;
	}

	public String addColMapping() throws Exception {
		int count = serviceBS.checkColMappingCount(colMapping);
		if (count == 0) {
			serviceBS.addColMapping(colMapping);
			info = "1";
		} else {
			info = "0";
		}
		return JSON;
	}

	public String delBiz() throws Exception {
		serviceBS.delBiz(bizIds);
		return JSON;
	}

	public String delBizRel() throws Exception {
		serviceBS.delBizRel(bizRelIds);
		bizRelIds = null;
		return JSON;
	}

	public String delBizRes() throws Exception {
		serviceBS.delBizRes(bizResIds);
		return JSON;
	}

	public String delCodeType() throws Exception {
		serviceBS.delCodeType(codeTypeIds);
		return JSON;
	}

	public String delCode() throws Exception {
		serviceBS.delCode(codeIds);
		return JSON;
	}

	public String delTabInfo() throws Exception {
		serviceBS.delTabInfo(tabInfoIds);
		return JSON;
	}

	public String delImageInfo() throws Exception {
		serviceBS.delImageInfo(imageInfoIds);
		return JSON;
	}

	public String delColMapping() throws Exception {
		serviceBS.delColMapping(colMappingIds);
		return JSON;
	}
	/*查找存在的组件*/
	public String queryExsitBizRes() throws Exception {
		if(serviceBS.queryExsitBizRes(colMappingIds))
//			info="存在被关联组件使用的数据,请重新选择";
			info="true";
		else info ="false";
		return JSON;
	}

	public String queryBizResById() throws Exception {
		bizRes = new BusinessRes();
		String[] ids = bizResId.split("and");
		bizRes.setB_id(ids[0]);
		bizRes.setW_id(Integer.parseInt(ids[1]));
		List list = serviceBS.queryBizResList(bizRes);
		if (list.size() > 0) {
			bizRes = (BusinessRes) list.get(0);
		}
		return JSON;
	}

	public String queryBizRelById() throws Exception {
		bizRel = new BusinessRel();
		String[] ids = bizRelId.split("and");
		bizRel.setB_id(ids[0]);
		bizRel.setR_id(ids[1]);
		List list = serviceBS.queryBizRelList(bizRel, 0, 1);
		if (list.size() > 0) {
			bizRel = (BusinessRel) list.get(0);
		}
		return JSON;
	}

	public String queryBizById() throws Exception {
		biz = new Business();
		biz.setB_id(bizId);
		List list = serviceBS.queryBizList(biz, 0, 1);
		if (list.size() > 0) {
			biz = (Business) list.get(0);
		}
		//System.out.println(biz.getB_type()+"##########");
		return JSON;
	}

	public String queryTabInfoById() throws Exception {
		tabInfo = new TableInfo();
		String[] ids = tabInfoId.split("and");
		tabInfo.setB_id(ids[0]);
		tabInfo.setTab_id(Integer.parseInt(ids[1]));
		List list = serviceBS.queryTabInfoList(tabInfo);
		if (list.size() > 0) {
			tabInfo = (TableInfo) list.get(0);
		}
		return JSON;
	}

	public String queryImageInfoById() throws Exception {
		imageInfo = new ImageInfo();
		imageInfo.setImg_name(imageInfoId);
		List list = serviceBS.queryImageInfoList(imageInfo, 0, 1);
		if (list.size() > 0) {
			imageInfo = (ImageInfo) list.get(0);
		}
		return JSON;
	}

	public String queryColMappingById() throws Exception {
		colMapping = new ColMapping();
		String[] ids = colMappingId.split("and");
		colMapping.setB_id(ids[0]);
		colMapping.setColumns(ids[1]);
		List list = serviceBS.queryColMappingList(colMapping, 0, 1);
		if (list.size() > 0) {
			colMapping = (ColMapping) list.get(0);
		}
		return JSON;
	}

	public String queryCodeById() throws Exception {
		code = new SystemMap();
		String[] ids = codeId.split("and");
		code.setType(ids[0]);
		code.setKey(ids[1]);
		List list = serviceBS.queryCodeList(code, 0, 1);
		if (list.size() > 0) {
			code = (SystemMap) list.get(0);
		}
		return JSON;
	}

	public String queryCodeTypeById() throws Exception {
		codeType = new SystemRes();
		codeType.setRes_id(codeTypeId);
		List list = serviceBS.queryCodeTypeList(codeType, 0, 1);
		if (list.size() > 0) {
			codeType = (SystemRes) list.get(0);
		}
		return JSON;
	}

	public String updateTabInfo() throws Exception {

		serviceBS.updateTabInfo(tabInfo);
		return JSON;
	}

	public String updateImageInfo() throws Exception {

		serviceBS.updateImageInfo(imageInfo);
		return JSON;
	}

	public String updateColMapping() throws Exception {
		serviceBS.updateColMapping(colMapping);
		return JSON;
	}

	public String updateCode() throws Exception {
		serviceBS.updateCode(code);
		return JSON;
	}

	public String updateCodeType() throws Exception {
		codeType.setChange_date(serviceBS.getSysDate());
		serviceBS.updateCodeType(codeType);
		return JSON;
	}

	public String updateBiz() throws Exception {
		biz.setEdit_res_date(serviceBS.getSysDate());
		String opra = biz.getOperation();
		if(opra != null && !"".equals(opra)){
			if(opra.endsWith(",")){
				opra = opra.substring(0,opra.length()-1);
			}
			biz.setOperation(opra);
		}
		serviceBS.updateBiz(biz);
		return JSON;
	}
	
	public String updateBizItems() throws Exception {
		biz.setEdit_res_date(serviceBS.getSysDate());
		serviceBS.updateBizItems(biz);
		return JSON;
	}

	public String updateBizRes() throws Exception {
		serviceBS.updateBizRes(bizRes);
		return JSON;
	}
	public String updateBizResShow() throws Exception {
		serviceBS.updateBizResShow(bizResIds,bizRes.getVisible());
		return JSON;
	}
	
	public String updateBizRel() throws Exception {
		serviceBS.updateBizRel(bizRel);
		return JSON;
	}

	public void setBizIds(String bizIds) {
		this.bizIds = bizIds;
	}

	public void setServiceBS(ServiceBS serviceBS) {
		this.serviceBS = serviceBS;
	}

	public List getRows() {
		return rows;
	}

	public void setQuery(String query) {
		this.query = query;
	}

	public void setQtype(String qtype) {
		this.qtype = qtype;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public String getRp() {
		return rp;
	}

	public void setRp(String rp) {
		this.rp = rp;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getBizId() {
		return bizId;
	}

	public void setBizId(String bizId) {
		this.bizId = bizId;
	}

	public Business getBiz() {
		return biz;
	}

	public void setBiz(Business biz) {
		this.biz = biz;
	}

	public BusinessRes getBizRes() {
		return bizRes;
	}

	public void setBizRes(BusinessRes bizRes) {
		this.bizRes = bizRes;
	}

	public BusinessRel getBizRel() {
		return bizRel;
	}

	public void setBizRel(BusinessRel bizRel) {
		this.bizRel = bizRel;
	}

	public void setBizRelIds(String bizRelIds) {
		this.bizRelIds = bizRelIds;
	}

	public void setBizResIds(String bizResIds) {
		this.bizResIds = bizResIds;
	}

	public String getInfo() {
		return info;
	}

	public void setBizResId(String bizResId) {
		this.bizResId = bizResId;
	}

	public void setBizRelId(String bizRelId) {
		this.bizRelId = bizRelId;
	}

	public SystemRes getCodeType() {
		return codeType;
	}

	public void setCodeType(SystemRes codeType) {
		this.codeType = codeType;
	}

	public SystemMap getCode() {
		return code;
	}

	public void setCode(SystemMap code) {
		this.code = code;
	}

	public TableInfo getTabInfo() {
		return tabInfo;
	}

	public void setTabInfo(TableInfo tabInfo) {
		this.tabInfo = tabInfo;
	}

	public ImageInfo getImageInfo() {
		return imageInfo;
	}

	public void setImageInfo(ImageInfo imageInfo) {
		this.imageInfo = imageInfo;
	}

	public ColMapping getColMapping() {
		return colMapping;
	}

	public void setColMapping(ColMapping colMapping) {
		this.colMapping = colMapping;
	}

	public void setCodeTypeIds(String codeTypeIds) {
		this.codeTypeIds = codeTypeIds;
	}

	public void setCodeIds(String codeIds) {
		this.codeIds = codeIds;
	}

	public void setTabInfoIds(String tabInfoIds) {
		this.tabInfoIds = tabInfoIds;
	}

	public void setImageInfoIds(String imageInfoIds) {
		this.imageInfoIds = imageInfoIds;
	}

	public void setColMappingIds(String colMappingIds) {
		this.colMappingIds = colMappingIds;
	}

	public void setTabInfoId(String tabInfoId) {
		this.tabInfoId = tabInfoId;
	}

	public void setImageInfoId(String imageInfoId) {
		this.imageInfoId = imageInfoId;
	}

	public void setColMappingId(String colMappingId) {
		this.colMappingId = colMappingId;
	}

	public void setCodeId(String codeId) {
		this.codeId = codeId;
	}

	public void setCodeTypeId(String codeTypeId) {
		this.codeTypeId = codeTypeId;
	}

	public void setOpType(String opType) {
		this.opType = opType;
	}
	
	/*查根节点*/
	public String queryRootBiz() throws Exception {
		biz=serviceBS.queryRootBiz();
		return JSON;
	}
	
	private static final String UP_LOAD_FILE = "uploadfile";
	private File upload;// 实际上传文件
	private String uploadFileName; // 上传文件名
	private File test;
	private String testFileName;
	private String testContentType;
	
	public void setTest(File test) {
		this.test = test;
	}
	public void setTestContentType(String testContentType) {
		this.testContentType = testContentType;
	}
	public void setTestFileName(String testFileName) {
		this.testFileName = testFileName;
	}
	/**
	 * 上传图片
	 * 
	 * @return
	 */
	public String importImage() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String targetDirectory = request.getRealPath(UP_LOAD_FILE);
		File upload1;
		String result="1";   //成功 
		//删除提示信息
	    String result_info=null;
	    String result_tiaozhuan="importImage_success";
		try {
			String suffixName = testFileName.substring(testFileName
					.lastIndexOf(".")+1);
			//suffixName==null||
			if(suffixName!=null&&(suffixName.toLowerCase().equals("jpeg")||suffixName.toLowerCase().equals("jpg")||suffixName.toLowerCase().equals("png")
					||suffixName.toLowerCase().equals("bmp")||suffixName.toLowerCase().equals("gif"))){
				upload1 = new File(ServletActionContext.getServletContext().getRealPath("/uploadfile")
						+ "/image/" +testFileName);
				if(upload1.exists()){
					result_info = "已存在同名图片，请修改图片名称或上传其它图片。";result="-1";
					 result_tiaozhuan="importImage_fail";
				}else
				     FileUtils.copyFile(test, upload1);
				}else{			 
			     result_info = "上传文件格式不支持，仅上传jpeg、jpg、png、bmp和gif格式的图片！";result="-1";
				 result_tiaozhuan="importImage_fail";
				}
		}catch (Exception e) {

			//e.printStackTrace();
			result_info = "上传失败！";
			result="0";
			result_tiaozhuan="importImage_fail";
		}
		if(!result.equals("-1")&&!result.equals("0")){
			result_info = "上传成功！";result="1";result_tiaozhuan="importImage_success";
			request.setAttribute("tpmc",testFileName.substring(0,testFileName.lastIndexOf(".")));
			request.setAttribute("tplj","/uploadfile/image/"+testFileName);
		}
		
		request.setAttribute("result",result);
		request.setAttribute("import_result_info",result_info);
		
		return result_tiaozhuan;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public String[] imgfilelist=null;
	public String queryUploadImgFileInfo() throws Exception {
		File file = new File(ServletActionContext.getServletContext().getRealPath("/uploadfile")
				+ "/image/");
		imgfilelist = file.list();		
		return JSON;
	}

	public String[] getImgfilelist() {
		return imgfilelist;
	}
	public String toHelpGuideIndex(){
		LogTools.debug(getCurrentAccount().getUsername(),
				getCurrentUnit().getUnit_name(), "配置向导", 
				"进入【配置向导】页面");
		return "guide_index";
	}
}
