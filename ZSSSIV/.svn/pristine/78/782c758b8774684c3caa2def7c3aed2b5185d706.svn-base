package com.kingtone.jw.service.util;

import java.util.List;
import java.util.Vector;

import org.ksoap2.SoapEnvelope;
import org.ksoap2.serialization.SoapObject;
import org.ksoap2.serialization.SoapSerializationEnvelope;
import org.ksoap2.transport.HttpTransportSE;

public class ServiceTool {

//	private static String serviceUrl = "http://localhost:8088/axistest/services/MyService?wsdl";
//	private static String methodName = "processService";

	/**
	 * 
	 * @param serviceUrl http://localhost:8088/axistest/services/MyService?wsdl
	 * @param methodName processService
	 * @param sqlstr
	 * @return string
	 */
	public static String  call(String serviceUrl,String methodName,String sqlstr) {
		SoapObject request = new SoapObject("http://service", methodName);
		request.addProperty("sqlstr", sqlstr);
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
	 * 
	 * @param serviceUrl http://localhost:8088/axistest/services/MyService?wsdl
	 * @param methodName processService
	 * @param sqlstr
	 * @return string
	 */
	public static String  call(String serviceUrl,String methodName,String tableName,String fbName) {
		SoapObject request = new SoapObject("http://service", methodName);
		request.addProperty("tableName", tableName);
		request.addProperty("fbName", fbName);
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
	
	public static String call(String serviceUrl,String methodName) {
		SoapObject request = new SoapObject("http://service", methodName);
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
	
	public static String call() {
		String serviceUrl="http://localhost:8088/yljw/services/CommonServer?wsdl";
		String methodName="getDynamicMenu";
		SoapObject request = new SoapObject("http://service", methodName);
		request.addProperty("tablename", "table1");
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
	 * 2011-11-25 YanHao
	 * 
	 * @param serviceUrl
	 * @param request
	 * @return
	 */
	public static String call(String serviceUrl, SoapObject request) {
		SoapSerializationEnvelope envelope = new SoapSerializationEnvelope(
				SoapEnvelope.VER11);
		envelope.bodyOut = request;
		try {
			HttpTransportSE ht = new HttpTransportSE(serviceUrl);
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
}
