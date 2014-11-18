package com.kingtone.jw.service.dao.impl;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;

import com.kingtone.jw.service.dao.TztgListDAO;
import com.kingtone.jw.service.domain.QueryEnvelop;
import com.kingtone.jw.service.util.CommonTool;
import com.kingtone.jw.service.util.DateTool;
import com.kingtone.ssi.dao.SSIDAO;
import com.kingtone.ssi.log.SSILogger;

public class TztgListDAOImpl extends SSIDAO implements TztgListDAO {

	
//	public List findtztg_bak(QueryEnvelop request) throws Exception {
//		String bizId = request.getBizTag();
//		List list = new ArrayList();
//		String userId = request.getUserID();
//		List tlist = this.queryXzqh_User(userId,bizId);
//		HashMap userMap =(HashMap) tlist.get(0);
//		String xzqh = userMap.get("XZQH").toString();
//		String userName = userMap.get("NAME").toString();
//		List tztgList = this.queryTztg_bak(bizId);
//		for(int i=0;i<tztgList.size();i++){
//			HashMap tztgMap = (HashMap)tztgList.get(i);
//			if(tztgMap.containsKey("REQDEPTID")&&tztgMap.get("REQDEPTID")!=null){
//				String tempxzqh = tztgMap.get("REQDEPTID").toString();
//				if(tempxzqh.indexOf(xzqh)>=0){
//					list.add(tztgMap);
//				}else if(tztgMap.containsKey("REQUSERNAME")&&tztgMap.get("REQUSERNAME")!=null){
//					String tempuserId = tztgMap.get("REQUSERNAME").toString();
//					if(tempuserId.indexOf(userName)>=0){
//						list.add(tztgMap);
//					}
//				}
//			}else if(tztgMap.containsKey("REQUSERNAME")&&tztgMap.get("REQUSERNAME")!=null){
//				String tempuserId = tztgMap.get("REQUSERNAME").toString();
//				if(tempuserId.indexOf(userName)>=0){
//					list.add(tztgMap);
//				}
//			}
//		}
//		return list;
//	}
//	private List queryTztg_bak(String bizId){
//		String sql = "select * from JW_TZTG ";
//		return this.getJdbcTemplate().query(sql, new QueryRowMaper(bizId));//this.getJdbcTemplate().queryForList(sql,new QueryRowMaper(bid));
//	}
	
	public QueryEnvelop findtztg(QueryEnvelop request) throws Exception {
		String bizId = request.getBizTag();
		List list = new ArrayList();
		String userId = request.getUserID();
		List tlist = this.queryXzqh_User(userId,bizId);
		HashMap userMap =(HashMap) tlist.get(0);
		String xzqh = userMap.get("XZQH").toString();
		String userName = userMap.get("NAME").toString();
		
		return this.queryTztg(request, xzqh, userName);
	}
	
	private QueryEnvelop queryTztg(QueryEnvelop request, String xzqh, String userName){
		String bizId = request.getBizTag();
		String countSql =  "select count(1) from JW_TZTG where (REQDEPTID like \'%" + xzqh +"%\' or REQUSERNAME like \'%"+userName+"%\') and SENDSTATUS = 1";
		int totalSize = this.getJdbcTemplate().queryForInt(countSql);//总记录条数
		int pageNum = request.getPageNum();//当前查询页码
		int pageSize = request.getPageSize();//CommonTool.pagesize;//每页显示记录条数
		int totalPage = CommonTool.getTotalPage(totalSize, pageSize, pageNum);//总页数
		//拼 分页 条件
		//-------------------------用sqlserver时需要改造的方法----------------------------------------
		String sql = "select * from JW_TZTG where (REQDEPTID like \'%" + xzqh +"%\' or REQUSERNAME like \'%"+userName+"%\') and SENDSTATUS = 1 order by SENDTIME desc";
		sql = CommonTool.getPageSql(sql, pageNum, totalPage, totalSize,pageSize);
		SSILogger.Bizlogger.debug(sql);
		List retList = this.getJdbcTemplate().query(sql, new QueryRowMaper(bizId));
		// 返回值
		QueryEnvelop response = new QueryEnvelop();
		response.setBizTag(request.getBizTag());
		response.setList(retList);
		response.setTotalNum(totalSize);
		response.setTotalPage(totalPage);
		return response;
	}

//	private void setTztgUpdate(String device_id){
//		String sql = "update jw_tztguser set readstatus='1',receivetime='"+DateTool.getDataTime()+"'";
//		this.getJdbcTemplate().execute(sql);
//	}
	private List queryXzqh_User(String userId,String bizId){
	
		String sql = "select * from JW_USER where account='"+userId+"'";
		return  this.getJdbcTemplate().query(sql, new QueryRowMaper(bizId));//this.getJdbcTemplate().queryForList(sql);
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
	public void setTztgUpdate(String id) throws Exception {
		String deviceSql = "select sjcm from jw_user where account='"+id+"'";
		String sql = "update jw_tztguser set readstatus='1',receivetime=to_date('"
				+ DateTool.getDataTime()
				+ "','yyyy-mm-dd HH24:MI:SS') where readstatus='0' and device_id=("
				+ deviceSql + ")";
		this.getJdbcTemplate().execute(sql);
	}
}
