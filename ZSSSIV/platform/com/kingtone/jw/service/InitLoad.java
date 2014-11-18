package com.kingtone.jw.service;

import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import com.kingtone.jw.service.util.CommonTool;
import com.kingtone.ssi.contextloader.SSIApplicationContext;
import com.kingtone.ssi.log.SSILogger;
/**
 * Title:缓存数据加载
 * Description:
 * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
 * Date: Jul 12, 2011
 */
public class InitLoad extends HttpServlet{
	public void init() throws ServletException {
		try {
//			CommonTool.bizDAO = (BizDAO) SSIApplicationContext.getContext().getBean("bizDAO");
//			SSILogger.Bizlogger.info("初始化bizDAO...");
//			CommonTool.confDAO  = (ConfDAO) SSIApplicationContext.getContext().getBean("confDAO");
//			SSILogger.Bizlogger.info("初始化confDAO...");
			CommonTool.confDAO.loadCodeMap();
			SSILogger.Bizlogger.info("初始化system_map系统代码表...");
			CommonTool.confDAO.loadColMap();
			SSILogger.Bizlogger.info("初始化column_map列映射信息...");
			CommonTool.confDAO.loadResMap();
			SSILogger.Bizlogger.info("初始化system_res_config业务代码表...");
			CommonTool.confDAO.loadC_ColumnMap();
			SSILogger.Bizlogger.info("初始化column_map列映射信息c_column->columns...");
			CommonTool.platDAO.load_PnMap();
			SSILogger.Bizlogger.info("初始化pn_map信息");
			
		} catch (Exception e) {
			SSILogger.Bizlogger.error(e,e);
		}
	}
}
