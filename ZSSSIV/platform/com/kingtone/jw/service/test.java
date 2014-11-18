package com.kingtone.jw.service;


import java.sql.SQLException;
import java.util.List;

import org.ksoap2.SoapEnvelope;
import org.ksoap2.serialization.SoapObject;
import org.ksoap2.serialization.SoapSerializationEnvelope;
import org.ksoap2.transport.HttpTransportSE;

import com.kingtone.jw.service.dao.OaPermissionDAO;
import com.kingtone.jw.service.jwoa.pojo.FileType;
import com.kingtone.ssi.contextloader.SSIApplicationContext;

public class test {
	public static void main(String[] args) {
	    
	    OaPermissionDAO oaDAO = (OaPermissionDAO) SSIApplicationContext.getContext().getBean("oaPermissionDAO");
		FileType filetype = new FileType(); 
		try {
//            List<FileType> list = oaDAO.findVFileTypeMList(filetype);
		    long start = System.currentTimeMillis();
		    List list = oaDAO.findBMlevelList();
		    long end = System.currentTimeMillis();
		    System.out.println("start=" + start +";end=" + end +"; timeLong=" + (end - start));
            System.out.println(list);
        } catch (SQLException e) {
            e.printStackTrace();
        }
//		System.out.println();
//		
//		//客户端通过service获取xmlstr 并转成object对象 测试
//		String serviceUrl = "http://localhost:8088/yljw/services/CommonServer?wsdl";
//		String methodName = "commonQuery";
//		CommonEnvelop commonEnvelop = new CommonEnvelop();
//		Map condMap = new LinkedHashMap();
//		condMap.put("TNAME", "PLOT");
//		condMap.put("TABTYPE", "TABLE");
//		commonEnvelop.setMap(condMap);
//		String cond = XmlParseTool.toXml(commonEnvelop);
//		
//		String xmlstr = call(serviceUrl, methodName, cond,"select * from t_user");
//		System.out.println(xmlstr);
//		
//		CommonEnvelop sd = new CommonEnvelop();
//		sd = (CommonEnvelop)XmlParseTool.toObj(xmlstr, sd);
//		System.out.println(sd.getList().size());
	}
	
	
	public static String  call(String serviceUrl,String methodName,String requestXml) {
		SoapObject request = new SoapObject("http://service", methodName);
		request.addProperty("requestXml", requestXml);
		SoapSerializationEnvelope envelope = new SoapSerializationEnvelope(
				SoapEnvelope.VER11);
		envelope.bodyOut = request;
		HttpTransportSE ht = new HttpTransportSE(serviceUrl);
		try {
			ht.call(null, envelope);
			if (envelope.getResponse() != null) {
				return (String) envelope.getResponse();
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
		return null;
	}
	/**
	 * @param args
	 */
//	public static void main(String[] args) {
//		服务端获取容器bean 及 xml解析测试
//		CZPersonQueryBS czpersonQueryBS = (CZPersonQueryBS)SSIApplicationContext.getContext().getBean("czpersonQueryBS");
//		try {
//			String xmlstr = czpersonQueryBS.findMobileList("select * from t_user");
//			System.out.println(xmlstr);
//			
//			ServiceData sd = new ServiceData();
//			sd = (ServiceData)XmlParseTool.toObj(xmlstr, sd);
//			System.out.println(sd.getCzpersonList().size());
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		
		//客户端通过service获取xmlstr 并转成object对象 测试
//		String serviceUrl = "http://localhost:8088/yljw/services/JWService?wsdl";
//		String methodName = "findCZPersonList";
//		String xmlstr = ServiceTool.call(serviceUrl, methodName, "select * from t_user");
//		System.out.println(xmlstr);
//		
//		ServiceData sd = new ServiceData();
//		sd = (ServiceData)XmlParseTool.toObj(xmlstr, sd);
//		System.out.println(sd.getCzpersonList().size());
		
		//附表服务测试
//		String serviceUrl = "http://localhost:8088/yljw/services/CommonServer?wsdl";
//		String methodName = "getDynamicTableName ";
//		String updateStr = ServiceTool.call(serviceUrl, methodName);
//		System.out.println(updateStr);
//		
//		String xmlstr = ServiceTool.call();
//		System.out.println(xmlstr);
//		ServiceData obj = new ServiceData();
//		XmlParseTool.toObj(xmlstr, obj);

//		new CommonServer().insertRes("table1", "(name,id) values ('ddddd'","1");
//	}

}
