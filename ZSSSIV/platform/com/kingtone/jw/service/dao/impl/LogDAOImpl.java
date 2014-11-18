package com.kingtone.jw.service.dao.impl;

import java.rmi.server.UID;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;

import com.kingtone.jw.biz.common.domain.JwUpdate;
import com.kingtone.jw.service.dao.LogDAO;
import com.kingtone.jw.service.domain.FaceEnvelop;
import com.kingtone.jw.service.domain.InsertEnvelop;
import com.kingtone.jw.service.domain.QueryEnvelop;
import com.kingtone.jw.service.jwoa.envelop.OaEnvelop;
import com.kingtone.ssi.dao.SSIDAO;

public class LogDAOImpl extends SSIDAO implements LogDAO{
	
	//add by yangzm
	private final String SQL_INSERT_LOG = "insert into jw_log(ID,USER_ID,BIZ_ID,OP_TIME) values(?,?,?,systimestamp) ";
	
	private String newID(){
		return new UID().toString();
	}
	public void InsertAddLog(InsertEnvelop request) throws Exception {
		String jwLogSql = "insert into jw_log(ID,USER_ID,BIZ_ID,OP_TIME) values(";
		String bizId = request.getBizTag();
		String userId = request.getUserID();
		jwLogSql+="'"+newID()+"','"+userId+"','"+bizId+"',systimestamp)";
		if(bizId!=null && userId!=null)
			this.getJdbcTemplate().update(jwLogSql);
			
	}
	public void InsertQueryLog(QueryEnvelop request) throws Exception {
		String jwLogSql = "insert into jw_log(ID,USER_ID,BIZ_ID,OP_TIME) values(";
		String bizId = request.getBizTag();
		String userId = request.getUserID();
		jwLogSql+="'"+newID()+"','"+userId+"','"+bizId+"',systimestamp)";
		if(bizId!=null && userId!=null)
			this.getJdbcTemplate().update(jwLogSql);
	}
	
	/**
	 * zoujiale:2011-10-19 获取数据库中最新的版本信息
	 */
	public List<JwUpdate> queryUpdateInfo() throws Exception {
		String sql = "select * from jw_update  where state='1'";
		return this.query(sql, new JwUpdateRowMaper());
	}
	
	private static class JwUpdateRowMaper implements RowMapper {

		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			JwUpdate jwUpdate = new JwUpdate();
			jwUpdate.setId(rs.getString("ID"));
			jwUpdate.setName(rs.getString("NAME"));
			jwUpdate.setName_copy(rs.getString("NAME_COPY"));
			jwUpdate.setTime(rs.getDate("TIME"));
			jwUpdate.setVersion(rs.getString("VERSION"));
			jwUpdate.setDescription(rs.getString("DESCRIPTION"));
			return jwUpdate;
		}
	}
	
	public void addLoadtime(String username) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		  Date currentTime=new Date();
		 String loadtime= sdf.format(currentTime);
		String sql="update jw_user set loadtime=to_date('"+ loadtime+"','yyyy-MM-dd HH24:mi:ss') where account='"+username+"'";
		this.getJdbcTemplate().execute(sql);
	}
	
	/**
	 * 插入OA部分调用日志。
	 * 
	 * @author yangzm
	 * @date：2014-08-20
	 */
	public void InsertOALog(OaEnvelop request) throws Exception {
		String bizId = request.getBizTag();
		String userId = request.getUserAccount();

		if (bizId != null && userId != null) {
			this.getJdbcTemplate().update(SQL_INSERT_LOG,
					new Object[] { newID(), userId, bizId });
		}
	}

	/**
	 * 插入人脸识别部分调用日志。
	 * 
	 * @author yangzm
	 * @date：2014-08-20
	 */
	public void InsertFaceLog(FaceEnvelop request) throws Exception {
		String bizId = request.getBizTag();
		String userId = request.getUserId();
		if (bizId != null && userId != null) {
			this.getJdbcTemplate().update(SQL_INSERT_LOG,
					new Object[] { newID(), userId, bizId });
		}
	}
	
}
