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

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;


import org.apache.commons.lang.Validate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcDaoSupport;
import org.springframework.jdbc.datasource.DataSourceUtils;

import com.kingtone.jw.service.dao.BizDAO;
import com.kingtone.jw.service.domain.InsertEnvelop;
import com.kingtone.jw.service.domain.QueryEnvelop;
import com.kingtone.jw.service.domain.SynchEnvelop;
import com.kingtone.jw.service.util.CommonTool;
import com.kingtone.ssi.log.SSILogger;
import com.kingtone.ssi.multids.CustomerContextHolder;
import com.kingtone.ssi.multids.CustomerType;
//select @rownum,t.*@ from dpsiid.VW_RK_CK t where 1=1 #RYBH# #YRYBH# #SWRQ#
//select * from dpsiid.VW_RK_CK where 1=1 #RYBH# #YRYBH# #SWRQ#
/**
 * 
 * Title:通用服务--DAO实现类 Description:提供附表更新、业务交互等功能 Author: 邹甲乐 -
 * zoujiale@kingtoneinfo.com Date: Jun 2, 2011
 */
public class BizDAOImpl extends SimpleJdbcDaoSupport implements BizDAO {
	
	
	public void addDetailProc(InsertEnvelop request)throws Exception{
		Connection con = null;
		try{
		String bizId = request.getBizTag();
		Validate.notNull(bizId,"bizId为空");
		String sql = CommonTool.confDAO.queryColValue_Biz(bizId, "d_sql");
		Validate.notNull(sql,"sql为空");
		String ds = CommonTool.confDAO.queryColValue_Biz(bizId, "ds");
		Validate.notNull(ds,"DS为空");
		CustomerContextHolder.setCustomerType(CustomerType.valueOf(ds));
		Map map = request.getDetail();
		con = DataSourceUtils.getConnection(getJdbcTemplate().getDataSource());
		sql = CommonTool.getPlSql(sql,map.size());
		
		SSILogger.Bizlogger.info(sql);
		CallableStatement cs = con.prepareCall(sql);
		Set set = map.keySet();
		String info = sql;
		for(Object o:set){
			String k = o.toString();		
			String v = (String) map.get(k);
			cs.setString(k, v);
			info = info.replaceFirst("\\?", k+"='"+v+"'");
		}
		SSILogger.Bizlogger.info(info);
		cs.registerOutParameter("o", java.sql.Types.INTEGER); 
		cs.executeUpdate();
		}catch(Exception e){
			DataSourceUtils.releaseConnection(con, getJdbcTemplate().getDataSource());
			SSILogger.Bizlogger.error(e, e);
		}finally{
			DataSourceUtils.releaseConnection(con, getJdbcTemplate().getDataSource());
		}
	}
	/**
	 * 添加业务
	 * insert into framework.table1(name,psw,des) values(#name1#,#psw1#,#des1#)
	 * (name,psw,des)客户字段
	 * (#name1#,#psw1#,#des1#)系统字段
	 */
	public void addDetailSql(InsertEnvelop request) throws Exception {
		//获取业务id
		String bizId = request.getBizTag();
		Validate.notNull(bizId,"bizId为空");
		//根据业务id获取 插入sql语句
		String sql = CommonTool.confDAO.queryColValue_Biz(bizId, "l_sql");
		Validate.notNull(sql,"读取sql为空");
		//根据业务id获取数据源标识
		String ds = CommonTool.confDAO.queryColValue_Biz(bizId, "ds");
		Validate.notNull(ds,"DS为空");
		//设置动态数据源
		CustomerContextHolder.setCustomerType(CustomerType.valueOf(ds));
		//获取插入表单数据
		//-------------------------用sqlserver时需要改造的方法----------------------------------------
		sql = CommonTool.getInsertCondSql(sql, request);
		SSILogger.Bizlogger.debug(sql);
		this.getJdbcTemplate().update(sql);
	}
	/**
	 * 查询业务详细
	 * select @t.*@ from dpsiid.VW_RK_CK t where 1=1 #RYBH# #YRYBH# #SWRQ#
	 * [dpsiid.VW_RK_CK t]:表名必须使用别名
	 * [@t.*@]:查询项 为客户字段 别名 系统字段
	 * [#RYBH# #YRYBH# #SWRQ#]:条件项为系统字段名
	 */
	public QueryEnvelop queryDetail(QueryEnvelop request) throws Exception {
		QueryEnvelop response = new QueryEnvelop();
		//获取业务id
		String bizId = request.getBizTag();
		Validate.notNull(bizId,"bizId为空");
		//根据业务id获取 查询详细sql语句
		String sql = CommonTool.confDAO.queryColValue_Biz(bizId, "d_sql");
		Validate.notNull(sql,"读取sql为空");
		//根据业务id获取数据源标识
		String ds = CommonTool.confDAO.queryColValue_Biz(bizId, "ds");
		Validate.notNull(ds,"DS为空");
		String filter = CommonTool.confDAO.queryColValue_Biz(bizId, "D_SIMPLE_ITEMS");
		Validate.notNull(filter,"读取过滤为空");
		//-------------------------用sqlserver时需要改造的方法----------------------------------------
		String filterSql = CommonTool.getFilterSql(filter, bizId);
		
//		sql = sql.replaceAll("@", "");
//		sql = sql.replaceAll("@[^@]*@", filterSql);
		sql = sql.replaceAll("@", filterSql);
		//拼 查询 条件
		//-------------------------用sqlserver时需要改造的方法----------------------------------------
		sql = CommonTool.getQueryCondSql(sql, request);
		SSILogger.Bizlogger.debug(sql);
		//设置动态数据源
		CustomerContextHolder.setCustomerType(CustomerType.valueOf(ds));
		Map retMap = (HashMap) this.getJdbcTemplate().queryForObject(sql, new QueryRowMaper_Detail(bizId));	
		//存放详细页面图片数据
		retMap.put("photoKeyName", CommonTool.attachDAO.querySImgByQE(request,ds));
		response.setDetail(retMap);
		return response; 
	}

	/**
	 * 查询业务列表
	 * select @t.*@ from dpsiid.VW_RK_CK t where 1=1 #RYBH# #YRYBH# #SWRQ#
	 * [dpsiid.VW_RK_CK t]:表名必须使用别名
	 * [@t.*@]:查询项 为客户字段 别名 系统字段
	 * [#RYBH# #YRYBH# #SWRQ#]:条件项为系统字段名
	 * select @t.*@ from dpsiid.VW_RK_CK t where 1=1 #RYBH# #YRYBH# #SWRQ#
select @t.xm xm,t.xb xb,t.jg jg,t.GMSFZJBH sfzh@ from dpsiid.VW_RK_CK t where 1=1 #CSRQ# #MZ# #SFZH# #XM# #XB#
select @t.xm xm,t.xb xb,t.jg jg,t.GMSFZJBH sfzh@ from dpsiid.VW_RK_CK t where 1=1 #CSRQ# #MZ# #SFZH# #XM# #XB#
	 * 
	 * 
	 */
	public QueryEnvelop queryList(QueryEnvelop request) throws Exception {
		QueryEnvelop response = new QueryEnvelop();
		String bizId = request.getBizTag();
		Validate.notNull(bizId,"bizId为空");
		String sql = CommonTool.confDAO.queryColValue_Biz(bizId, "l_sql");
		Validate.notNull(sql,"读取sql为空");
		//根据业务id获取数据源标识
		String ds = CommonTool.confDAO.queryColValue_Biz(bizId, "ds");
		Validate.notNull(ds,"DS为空");
		String filter = CommonTool.confDAO.queryColValue_Biz(bizId, "L_SIMPLE_ITEMS");
		Validate.notNull(filter,"读取过滤为空");
		
		//-------------------------用sqlserver时需要改造的方法----------------------------------------
		String filterSql = CommonTool.getFilterSql(filter, bizId);
		
		//拼 查询 条件
		//-------------------------用sqlserver时需要改造的方法----------------------------------------
		sql = CommonTool.getQueryCondSql(sql, request);
//		String countSql = sql.replaceAll("@[^@]*@", " count(1) ");//获取查询总数sql语句
		String countSql = sql.replaceAll("@", " count(1) ");//获取查询总数sql语句
//		sql = sql.replaceAll("@", " ");
//		sql = sql.replaceAll("@[^@]*@", filterSql);
		sql = sql.replaceAll("@", filterSql);
		
		SSILogger.Bizlogger.debug(countSql);
		//设置动态数据源
		CustomerContextHolder.setCustomerType(CustomerType.valueOf(ds));
		int totalSize = this.getJdbcTemplate().queryForInt(countSql);//总记录条数
		int pageNum = request.getPageNum();//当前查询页码
		//TODO BUG
		int pageSize = request.getPageSize();//CommonTool.pagesize;//每页显示记录条数
		int totalPage = CommonTool.getTotalPage(totalSize, pageSize, pageNum);//总页数
		//拼 分页 条件
		//-------------------------用sqlserver时需要改造的方法----------------------------------------
		sql = CommonTool.getPageSql(sql, pageNum, totalPage, totalSize,pageSize);
		
		SSILogger.Bizlogger.debug(sql);
		List retList = this.getJdbcTemplate().query(sql, new QueryRowMaper(bizId));
		response.setList(retList);
		response.setTotalNum(totalSize);
		response.setTotalPage(totalPage);
		return response; 
	}
	
	/**
	 * 查询业务代码表
	 */
	public List queryCodeList(String ds,String sql, RowMapper rowMaper) throws Exception {
		CustomerContextHolder.setCustomerType(CustomerType.valueOf(ds));
		return this.getJdbcTemplate().query(sql, rowMaper);
	}
	
	private static class QueryRowMaper_Detail implements RowMapper {
		public String bizId = "";
		public Map map = new HashMap();
		public QueryRowMaper_Detail(String bizId){
			this.bizId = bizId;
			map = (HashMap) CommonTool.colMap.get(bizId);
		}
		@SuppressWarnings("unchecked")
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			HashMap<String, String> dataMap = new HashMap<String, String>();
			ResultSetMetaData rsMeta = rs.getMetaData();
			int columnCount = rsMeta.getColumnCount();
			for (int i = 1; i <= columnCount; i++) {
				String colName = rsMeta.getColumnName(i)==null?null:rsMeta.getColumnName(i);
				String colValue = rs.getString(i)==null?null:rs.getString(i).trim();
//				Map mm = (HashMap)map.get(colName);
//				String colName_ch = (String) mm.get("CNAME");
				colValue = CommonTool.getCodeValue(bizId, colName, colValue);
				dataMap.put(colName, colValue);
			}
			return dataMap;
		}
	}
	
	private static class QueryRowMaper implements RowMapper {
		public String bizId = "";
		public QueryRowMaper(String bizId){
			this.bizId = bizId;
		}
		@SuppressWarnings("unchecked")
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			HashMap<String, String> dataMap = new HashMap<String, String>();
			ResultSetMetaData rsMeta = rs.getMetaData();
			int columnCount = rsMeta.getColumnCount();
			for (int i = 1; i <= columnCount; i++) {
				String colName = rsMeta.getColumnName(i)==null?null:rsMeta.getColumnName(i);
				String colValue = rs.getString(i)==null?null:rs.getString(i).trim();
				colValue = CommonTool.getCodeValue(bizId, colName, colValue);
				dataMap.put(colName, colValue);
			}
			return dataMap;
		}
	}
	/*同步数据*/
	public static class QuerySynchListRowMaper implements RowMapper {
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			HashMap<String, String> dataMap = new HashMap<String, String>();
			ResultSetMetaData rsMeta = rs.getMetaData();
			int columnCount = rsMeta.getColumnCount();
			for (int i = 1; i <= columnCount; i++) {
				String colName = rsMeta.getColumnName(i);
				String colValue = rs.getString(i);
				//说明 BUSINESS_CONFIG 中的两个字段不同步到终端
				if(colName.equals("L_SQL")||colName.equals("D_SQL")||colName.equals("B_S_NAME")){}else
				dataMap.put(colName, colValue);
			}
			return dataMap;
		}
	}
	
	/*同步数据*/
	public SynchEnvelop querySynchDataList(String sqlStr)throws Exception{
		String[] sqls = sqlStr.split("split");
		String ds = CommonTool.confDAO.queryColValue_Res(sqls[0], "ds");
		CustomerContextHolder.setCustomerType(CustomerType.valueOf(ds));
		SynchEnvelop response = new SynchEnvelop();
		List resList =this.getJdbcTemplate().query(sqls[1], new QuerySynchListRowMaper());
		response.setResList(resList);
		return response; 
	}
	
	/*同步业务数据*/
	public String querySynchDataStr(String sqlStr)throws Exception{
		StringBuffer sb= new StringBuffer();
		String[] sqls = sqlStr.split("split");
		String ds = CommonTool.confDAO.queryColValue_Res(sqls[0], "ds");
		CustomerContextHolder.setCustomerType(CustomerType.valueOf(ds));
		List<HashMap<String, String>> resList =this.getJdbcTemplate().query(sqls[1], new QuerySynchListRowMaper());
		if(resList!=null&&resList.size()>0){
			for(HashMap<String, String> hm:resList){				
				sb.append("@KEY_@"+hm.get("KEY")).append("@VALUE_@").append(""+hm.get("VALUE")).append("@#KV#@");				
			}
		}
		return sb.toString(); 
	}
}
