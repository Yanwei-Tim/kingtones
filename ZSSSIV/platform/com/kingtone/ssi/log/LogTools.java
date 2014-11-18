package com.kingtone.ssi.log;

import org.apache.log4j.MDC;

public class LogTools {
	public static void debug(String opUser,String opDept,String opModel,String desc){
		//操作用户信息 和配置文件中的%X{operateUser}对应
	    MDC.put("operateUser", opUser);
	    //操作者单位 和配置文件中的%X{operateObject}对应
	    MDC.put("operateDept", opDept);
	    //模块信息 和配置文件中的%X{operateObject}对应
	    MDC.put( "operateObject", opModel);
	    //和配置文件中的%m对应 
	    SSILogger.accesslog_category.debug(desc);
	}
}
