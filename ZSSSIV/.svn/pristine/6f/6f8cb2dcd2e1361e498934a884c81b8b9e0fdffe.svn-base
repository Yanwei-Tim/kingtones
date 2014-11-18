package com.kingtone.jw.biz.manage;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.kingtone.jw.biz.manage.bs.LawBS;
import com.kingtone.jw.biz.manage.domain.Law;
import com.kingtone.jw.biz.xajw.domain.JwUser;
import com.kingtone.ssi.action.SSIAction;
import com.kingtone.ssi.log.LogTools;

public class LawAC extends SSIAction{

	public LawBS lawBS;
	private List rows = new ArrayList();

	protected String rp;

	protected String page;

	protected String total = "0";

	// 查询关键字
	private String query;

	// 查询关键字类型
	private String qtype;


	private String  accountInfo=null;
	
	private static final String UP_LOAD_FILE = "uploadfile";

	
	private String delInfo;
	private File test;
	private String testFileName;

	private String addID;
	
	//private Address address;
	
	private Law law;
	
	/**
	 * 法律法规一览查询处理
	 * @return
	 * @throws Exception
	 */
	public String queryLawList() throws Exception {
		LogTools.debug(getCurrentAccount().getUsername(),
				getCurrentUnit().getUnit_name(), "法律法规", 
				"进入【法律法规】维护页面");
		rows.clear();
		
		Law lawTmp =new Law();

		if("LAW_CODE".equals(qtype)){
			lawTmp.setLAW_CODE(query);			
		}else if("LAW_NAME".equals(qtype)){
			lawTmp.setLAW_NAME(query);
		}else if("ADMINISTRATION".equals(qtype)){
			lawTmp.setADMINISTRATION(query);
		}else if("IRREGULARITYACTION".equals(qtype)){
			lawTmp.setIRREGULARITYACTION(query);
		}else if("LAW_TYPE".equals(qtype)){
			lawTmp.setLAW_TYPE(query);
		}
		
		// 每页显示记录数
		int skipIndex=(Integer.parseInt(page) - 1) * Integer.parseInt(rp);
		
		JwUser jwuser=new JwUser();
		List lawList =new ArrayList();		
		
		lawList =lawBS.findLawList(lawTmp, skipIndex, Integer.parseInt(rp));

		for (Iterator it =lawList.iterator();it.hasNext();) {
			Law lawBean = (Law) it.next();
			Map map = new HashMap();
			map.put("id", lawBean.getLAW_ID());
			map.put("cell", new Object[] { lawBean.getLAW_ID(),lawBean.getLAW_CODE(),lawBean.getLAW_NAME(),
					lawBean.getADMINISTRATION(),lawBean.getIRREGULARITYACTION(),lawBean.getLAW_TYPE()

			});
			rows.add(map);
		}
		total=lawBS.findLawListCount(lawTmp)+"";
		return JSON;

	}

	
	/**
	 * 删除通讯录记录操作
	 * @return
	 * @throws Exception
	 */
	public String delLawByLawID() throws Exception {
		String[] addIds = addID.split("split");
		for (int i = 0; i < addIds.length; i++) {

			lawBS.delLaw(addIds[i]);
		}
		return JSON;
	}
	
	/**
	 * 通訊錄添加
	 * @return
	 * @throws Exception
	 */
	public String addLaw()throws Exception{
		
		int count1=lawBS.findLawCountByCode(law.getLAW_CODE());
		if(count1>0){
			accountInfo="1";
			 return JSON;	
		}else{
			lawBS.insertLaw(law);
			return JSON;
		}
	}
	
	/**
	 * 通訊錄查詢 通過通訊錄id
	 * @return
	 * @throws Exception
	 */
	public String findLawByLawID()throws Exception{
		
		law= lawBS.findLawByLawID(addID);
		return JSON;
	}
	
	/**
	 * 通訊錄更新
	 * @return
	 * @throws Exception
	 */
	public String updateLaw()throws Exception{
		
		lawBS.updateLaw(law);
		return JSON;
	}
	/**
	 * @return the accountInfo
	 */
	public String getAccountInfo() {
		return accountInfo;
	}

	/**
	 * @param accountInfo the accountInfo to set
	 */
	public void setAccountInfo(String accountInfo) {
		this.accountInfo = accountInfo;
	}

	/**
	 * @return the delInfo
	 */
	public String getDelInfo() {
		return delInfo;
	}

	/**
	 * @param delInfo the delInfo to set
	 */
	public void setDelInfo(String delInfo) {
		this.delInfo = delInfo;
	}

	/**
	 * @return the law
	 */
	public Law getLaw() {
		return law;
	}

	/**
	 * @param law the law to set
	 */
	public void setLaw(Law law) {
		this.law = law;
	}

	/**
	 * @return the page
	 */
	public String getPage() {
		return page;
	}

	/**
	 * @param page the page to set
	 */
	public void setPage(String page) {
		this.page = page;
	}

	/**
	 * @return the qtype
	 */
	public String getQtype() {
		return qtype;
	}

	/**
	 * @param qtype the qtype to set
	 */
	public void setQtype(String qtype) {
		this.qtype = qtype;
	}

	/**
	 * @return the query
	 */
	public String getQuery() {
		return query;
	}

	/**
	 * @param query the query to set
	 */
	public void setQuery(String query) {
		this.query = query;
	}

	/**
	 * @return the rows
	 */
	public List getRows() {
		return rows;
	}

	/**
	 * @param rows the rows to set
	 */
	public void setRows(List rows) {
		this.rows = rows;
	}

	/**
	 * @return the rp
	 */
	public String getRp() {
		return rp;
	}

	/**
	 * @param rp the rp to set
	 */
	public void setRp(String rp) {
		this.rp = rp;
	}

	/**
	 * @return the test
	 */
	public File getTest() {
		return test;
	}

	/**
	 * @param test the test to set
	 */
	public void setTest(File test) {
		this.test = test;
	}

	/**
	 * @return the testFileName
	 */
	public String getTestFileName() {
		return testFileName;
	}

	/**
	 * @param testFileName the testFileName to set
	 */
	public void setTestFileName(String testFileName) {
		this.testFileName = testFileName;
	}

	/**
	 * @return the total
	 */
	public String getTotal() {
		return total;
	}

	/**
	 * @param total the total to set
	 */
	public void setTotal(String total) {
		this.total = total;
	}

	/**
	 * @param lawBS the lawBS to set
	 */
	public void setLawBS(LawBS lawBS) {
		this.lawBS = lawBS;
	}


	/**
	 * @return the addID
	 */
	public String getAddID() {
		return addID;
	}


	/**
	 * @param addID the addID to set
	 */
	public void setAddID(String addID) {
		this.addID = addID;
	}
}
