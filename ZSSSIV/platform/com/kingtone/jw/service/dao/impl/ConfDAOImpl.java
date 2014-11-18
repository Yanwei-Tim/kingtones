/**
 * 文件名：CommonServerDAOImpl.java
 * 
 * 创建人：邹甲乐 - zoujiale@kingtoneinfo.com
 * 
 * 创建时间：Jun 2, 2011
 * 
 * 版权所有：西安联合信息技术股份有限公司
 */
package com.kingtone.jw.service.dao.impl;

import java.applet.Applet;
import java.awt.Color;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.MediaTracker;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.rmi.server.UID;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang.Validate;
import org.kobjects.base64.Base64;
import org.springframework.jdbc.core.RowMapper;

import com.kingtone.jw.service.dao.ConfDAO;
import com.kingtone.jw.service.dao.impl.BizDAOImpl.QuerySynchListRowMaper;
import com.kingtone.jw.service.domain.QueryEnvelop;
import com.kingtone.jw.service.domain.SynchEnvelop;
import com.kingtone.jw.service.scheduler.util.SynchConstants;
import com.kingtone.jw.service.util.CommonTool;
import com.kingtone.jw.service.util.XmlParseTool;
import com.kingtone.ssi.dao.SSIDAO;
import com.kingtone.ssi.log.SSILogger;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

/**
 * 
 * Title:通用服务--DAO实现类 Description:提供附表更新、业务交互等功能 Author: 邹甲乐 -
 * zoujiale@kingtoneinfo.com Date: Jun 2, 2011
 */
public class ConfDAOImpl extends SSIDAO implements ConfDAO {
	
	/**
	 * 查询sql语句，根据业务标识获取该业务的sql语句
	 */
	public String queryColValue_Biz(String bizId,String colName) throws Exception{
		String sql = "select "+colName+" from business_config where b_id='"+bizId+"'";
		return (String) this.getJdbcTemplate().queryForObject(sql,new LoadRowMaper(colName));
	}
	public String queryColValue_Res(String resId,String colName) throws Exception{
		String sql = "select "+colName+" from system_res_config where res_id='"+resId+"'";
		return (String) this.getJdbcTemplate().queryForObject(sql,new LoadRowMaper(colName));
	}
	/**
	 * 初始化column_map列映射信息
	 */
	public void loadColMap() throws Exception {
		Map colMap = new HashMap();
		List list = this.query(CommonTool.colSql, new LoadRowMaper("b_id"));//业务
		for(Object o: list){
			Validate.notNull(o,"b_id不能为空");
			List list2 = this.query(CommonTool.colSql2+" and b_id='"+o+"' ", new LoadRowMaper("columns"));//列
			Map colMap2 = new HashMap();
			for(Object o2: list2){
				Validate.notNull(o2,"columns不能为空");
				List list3 = this.query(CommonTool.colSql3+" and b_id='"+o+"' and columns='"+o2+"'", new LoadListRowMaper());//项
				for(Object o3: list3){
					SSILogger.Bizlogger.debug("column_map--/"+o+"/"+o2+"/"+o3+"/");
					colMap2.put(o2, o3);
				}
				colMap.put(o, colMap2);
			}
		}
		CommonTool.colMap = colMap;
	}
	/**
	 * 初始化system_map系统代码表
	 */
	public void loadCodeMap() throws Exception {
		//代码分类集合
		Map codeTypeMap = new HashMap();
		List codeTypeList = this.query(CommonTool.codeSql, new LoadRowMaper("type"));
		for(Object codeTypeObj:codeTypeList){
			//代码集合
			Map codeMap = new HashMap();
			Validate.notNull(codeTypeObj,"codeTypeObj不能为空");
			List codeList = this.query(CommonTool.codeSql2+" and type='"+codeTypeObj+"' ", new LoadListRowMaper());//列
			for(Object codeObj: codeList){
				String key = (String)((HashMap)codeObj).get("KEY");
				String value = (String)((HashMap)codeObj).get("VALUE");
				Validate.notNull(key,"key不能为空");
				Validate.notNull(value,"value不能为空");
				codeMap.put(key, value);//代码项
				SSILogger.Bizlogger.debug("system_map--/"+key+"/"+value+"/");
			}
			codeTypeMap.put(codeTypeObj, codeMap);//代码类型项
		}
		CommonTool.codeMap = codeTypeMap;
	}
	
	/**
	 * 初始化system_res_config业务代码表
	 */
	public void loadResMap() throws Exception {
		//代码分类集合
		Map codeTypeMap = new HashMap();
		List codeTypeList = this.query(CommonTool.resSortSql, new LoadListRowMaper());
		for(Object codeTypeObj:codeTypeList){
			String res_id = (String) ((HashMap)codeTypeObj).get("RES_ID");//代码分类标识
			String source = (String) ((HashMap)codeTypeObj).get("SOURCE");//代码sql语句
			String ds = (String) ((HashMap)codeTypeObj).get("DS");
			Validate.notNull(res_id,"res_id不能为空");
			Validate.notNull(source,"source不能为空");
			//代码集合
			List codeList = new ArrayList();
			try{
			codeList = CommonTool.bizDAO.queryCodeList(ds,source, new LoadListRowMaper());//this.query(source, new LoadListRowMaper());
			}catch(Exception e){
				SSILogger.Bizlogger.error("资源代码表中SQL语句错误："+source);
			}
			Map codeMap = new HashMap();
			for(Object codeObj:codeList){
				String key = (String)((HashMap)codeObj).get("KEY");
				String value = (String)((HashMap)codeObj).get("VALUE");
				Validate.notNull(key,"key不能为空");
				Validate.notNull(value,"value不能为空");
				SSILogger.Bizlogger.debug("system_res_config--/"+key.trim()+"/"+value.trim()+"/");
				codeMap.put(key.trim(), value.trim());
			}
			codeTypeMap.put(res_id, codeMap);
		}
		CommonTool.resMap = codeTypeMap;
	}
	
	/**
	 * 初始化column_map列映射信息c_column->columns
	 */
	public void loadC_ColumnMap() throws Exception {

		Map colMap = new HashMap();
		List list = this.query(CommonTool.colSql, new LoadRowMaper("b_id"));// 业务
		for (Object o : list) {
			Validate.notNull(o, "b_id不能为空");
			List list2 = this.query(CommonTool.colSql4 + " and b_id='" + o
					+ "' ", new LoadRowMaper("c_column"));// 列
			Map colMap2 = new HashMap();
			for (Object o2 : list2) {
				Validate.notNull(o2, "c_column不能为空");
				List list3 = this
						.query(CommonTool.colSql3 + " and b_id='" + o
								+ "' and c_column='" + o2 + "'",
								new LoadListRowMaper());// 项
				for (Object o3 : list3) {
					SSILogger.Bizlogger.debug("column_map--/" + o + "/" + o2
							+ "/" + o3 + "/");
					colMap2.put(o2, o3);
				}
				colMap.put(o, colMap2);
			}
		}
		CommonTool.cColumnMap = colMap;

	}
	private static class LoadRowMaper implements RowMapper {
		String colName = "";
		public LoadRowMaper(String colName){
			this.colName = colName;
		}
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
				return  rs.getString(colName);
		}
	}
	private static class LoadListRowMaper implements RowMapper {
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			HashMap<String, String> dataMap = new HashMap<String, String>();
			ResultSetMetaData rsMeta = rs.getMetaData();
			int columnCount = rsMeta.getColumnCount();
			for (int i = 1; i <= columnCount; i++) {
				String colName = rsMeta.getColumnName(i);
				String colValue = rs.getString(i);
				dataMap.put(colName, colValue);
			}
			return dataMap;
		}
	}

	/**
	 * 文件信息查询
	 */
	public List queryFileList(String sql) throws Exception {
		List returnList = new ArrayList();

		returnList.add(this.query(sql, new LoadListRowMaper()));

		System.out.println("list---" + returnList);
		return returnList;
	}
	/* 
	 * 文件信息插入
	 */
	public void insertFileInfo(String sql) throws Exception {
		this.getJdbcTemplate().update(sql);
		
	}
	public void delUnUpFile(String sql){
		this.getJdbcTemplate().execute(sql);
	}
	public void loadD_ColumnMap() throws Exception {

		Map colMap = new HashMap();
		List list = this.query(CommonTool.colSql, new LoadRowMaper("b_id"));// 业务
		for (Object o : list) {
			Validate.notNull(o, "b_id不能为空");
			List list2 = this.query(CommonTool.colSql5 + " and b_id='" + o
					+ "' ", new LoadRowMaper("d_column"));// 列
			Map colMap2 = new HashMap();
			for (Object o2 : list2) {
//				Validate.notNull(o2, "d_column不能为空");
				if(o2!=null){
					List list3 = this.query(CommonTool.colSql3 + " and b_id='"
							+ o + "' and d_column='" + o2 + "'",
							new LoadListRowMaper());// 项
					for (Object o3 : list3) {
						SSILogger.Bizlogger.debug("column_map--/" + o + "/"
								+ o2 + "/" + o3 + "/");
						colMap2.put(o2, o3);
					}
					colMap.put(o, colMap2);
				}
			
			}
		}
		CommonTool.dColumnMap = colMap;

	}
}
