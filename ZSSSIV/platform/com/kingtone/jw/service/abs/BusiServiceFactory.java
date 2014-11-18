package com.kingtone.jw.service.abs;

import java.util.ResourceBundle;
/**
 * <p>业务服务工厂类：
 * 生成不同方式的业务服务实现对象，
 * 供CommonServer通用服务类调用
 * 
 * 服务数据获取方式包括:JDBC、Socket、WebService等
 * </p>
 *
 * @author: 邹甲乐(zoujiale@kingtoneinfo.com)
 * @date: Jan 5, 2012
*/
public class BusiServiceFactory {
	public static String MODEL_JDBC = "0";
	public static String MODEL_SOCKET = "1";
	public static String MODEL_WEBSERVICE = "2";

	public static String BUSI_SERVICE_TYPE = ResourceBundle.getBundle("configes").getString("BUSI_SERVICE_TYPE");
	
	public static BusiServiceAbstract getBean(String flag) {
		
		if (MODEL_JDBC.equals(flag)) {
			return new BusiServiceJdbcImpl();
		} else if (MODEL_SOCKET.equals(flag)) {
			return new BusiServiceSocketImpl();
		} else if (MODEL_WEBSERVICE.equals(flag)) {
			return new BusiServiceWsImpl();
		} else {
			return new BusiServiceJdbcImpl();
		}
	}
}
