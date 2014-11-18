package com.kingtone.jw.service.external.trafficpolice;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.ksoap2.serialization.SoapObject;

import com.kingtone.jw.service.abs.BusiServiceAbstract;
import com.kingtone.jw.service.domain.QueryEnvelop;
import com.kingtone.jw.service.util.ServiceTool;

public class TrafficPoliceServiceImpl extends BusiServiceAbstract {

	@Override
	public QueryEnvelop getDetail() throws Exception {
		// TODO Auto-generated method stub
		QueryEnvelop response = new QueryEnvelop();
		String xmlType = "QueryCondition";
		List<HashMap<String, String>> dataList = getData(xmlType);
		// 业务数据
		response.setDetail(dataList.get(0));
		return null;
	}
	
	@Override
	public QueryEnvelop getList() throws Exception {
		// TODO Auto-generated method stub
		QueryEnvelop response = new QueryEnvelop();
		String xmlType = "QueryCondition";
		List<HashMap<String, String>> dataList = getData(xmlType);
		// 业务数据
		response.setList(dataList);
		// 记录数
		response.setTotalNum(dataList.size());
		// 总页数、巨龙未提供分页接口，故默认值为1
		response.setTotalPage(1);
		return null;
	}

	private List<HashMap<String, String>> getData(String xmlType) {
		TrafficPoliceParseAdapter tp = new TrafficPoliceParseAdapter();
		StringBuffer sendStr = new StringBuffer(
				"<?xml version=\"1.0\" encoding=\"GBK\" ?><root>");
		sendStr.append("<").append(xmlType).append(">");
		QueryEnvelop request = getQueryRequest();
		String bizId = request.getBizTag();
		Map<String, String> conds = request.getCondition();
		Iterator<Entry<String, String>> iter = conds.entrySet().iterator();
		String key = "";
		String value = "";
		while (iter.hasNext()) {
			Entry<String, String> entry = iter.next();
			key = entry.getKey();
			value = entry.getValue();
			sendStr.append("<").append(key).append(">").append(value).append(
					"</").append(key).append(">");
		}
		sendStr.append("</").append(xmlType).append(">");
		sendStr.append("</root>");

		String returnXmlStr = "";

		// 报文解析
		List<HashMap<String, String>> dataList = tp.xmlAnalytic(bizId,
				returnXmlStr);
		return dataList;
	}

	/**
	 * 调用交警的webservice接口
	 * 
	 * @param xtlb系统类别
	 * @param jkxlh接口序号
	 * @param jkid接口标识
	 * @param QueryXmlDoc查询条件报文
	 * @return
	 */
	public String queryObjectOut(String xtlb, String jkxlh, String jkid,
			String QueryXmlDoc) {
		String methodName = "";
		String serviceUrl = "";
		SoapObject request = new SoapObject("http://service", methodName);
		request.addProperty("xtlb", xtlb);
		request.addProperty("jkxlh", jkxlh);
		request.addProperty("jkid", jkid);
		request.addProperty("QueryXmlDoc", QueryXmlDoc);
		String result = ServiceTool.call(serviceUrl, request);
		return result;
	}

	@Override
	public void addDetail() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addLoadtime(String username) throws Exception {
		// TODO Auto-generated method stub
		
	}
}
