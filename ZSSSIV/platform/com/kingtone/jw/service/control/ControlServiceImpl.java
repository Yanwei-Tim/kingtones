package com.kingtone.jw.service.control;

import java.rmi.server.UID;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcDaoSupport;
import com.kingtone.jw.service.domain.QueryEnvelop;
import com.kingtone.ssi.dao.SSIDAO;


public class ControlServiceImpl extends SSIDAO implements ControlService{
	private final String SQL_INSERT_CONTROL_USER = "INSERT INTO CONTROL_USER(ID,IDCARD,NAME,SEX,BIRTHDATE,ACCOUNT,POLICENAME,GPSX,GPSY) " +
			"VALUES(?,?,?,?,?,?,?,?,?)";
	private final String SQL_INSERT_CONTROL_CAR = "INSERT INTO CONTROL_CAR(ID,CNUMBER,CTYPE,ACCOUNT,POLICENAME,GPSX,GPSY) " +
			"VALUES(?,?,?,?,?,?,?)";
	private final String SQL_QUERY_CONTROL_USER = "select t.XM,t.BKZXZT,t.BKRWLX,t.CZCSYQ from t_xxbk_ryjbxx t where t.BKZXZT='0' ";

	public QueryEnvelop queryControlUser(QueryEnvelop request) throws Exception{
		QueryEnvelop response = new QueryEnvelop();
		final List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		
		String usql=SQL_INSERT_CONTROL_USER;
		String uqsql=SQL_QUERY_CONTROL_USER;
		
		Map<String, String> condition = request.getCondition();
		String ID=new UID().toString();
		String IDCARD = condition.get("IDCARD");
		String NAME = condition.get("NAME");
		String SEX = condition.get("SEX");
		String BIRTHDATE = condition.get("BIRTHDATE");
		String ACCOUNT = condition.get("ACCOUNT");
		String POLICENAME = condition.get("POLICENAME");
		String GPSX = condition.get("GPSX");
		String GPSY = condition.get("GPSY");	
		
		this.getJdbcTemplate().update(usql,new Object[]{ID,IDCARD,NAME,SEX,BIRTHDATE,ACCOUNT,POLICENAME,GPSX,GPSY}); 
		
		// 姓名查询
		if (!StringUtils.isEmpty(NAME)) {
			uqsql += " and t.xm=" + NAME;
		}
		// 身份证号查询
		if (!StringUtils.isEmpty(IDCARD)) {
			uqsql += " and t.sfzh=" + IDCARD;
		}
		// 性别查询
		if (!StringUtils.isEmpty(SEX)) {
			uqsql += " and t.xb=" + SEX;
		}
		// 出生日期查询
		if (!StringUtils.isEmpty(BIRTHDATE)) {
			uqsql += " and t.csrq=" + BIRTHDATE;
		}
		
		ParameterizedRowMapper<Map<String, String>> searchMapper = new ParameterizedRowMapper<Map<String, String>>() {
			public Map<String, String> mapRow(ResultSet rs, int rowNum)throws SQLException {
				Map<String, String> map = new HashMap<String, String>();				
				map.put("NAME", rs.getString("XM"));//布控人姓名
				map.put("BKZXZT", rs.getString("BKZXZT"));//布控执行状态  0：布控；1：撤控；2：到期
				map.put("BKRWLX", rs.getString("BKRWLX"));//布控任务类型 可为NULL 1：同案布控 2：分布式布控
				map.put("CZCSYQ", rs.getString("CZCSYQ"));//处置措施要求
				list.add(map);
				return map;
			}
		};
		this.getJdbcTemplate().query(uqsql, searchMapper);
		response.setList(list);
		return response;
	}
	
	@Override
	public void queryControlCar(QueryEnvelop request) throws Exception {
		QueryEnvelop response = new QueryEnvelop();
		final List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		
		String csql=SQL_INSERT_CONTROL_CAR;
		Map<String, String> condition = request.getCondition();
		String ID=new UID().toString();
		String CNUMBER = condition.get("CNUMBER");
		String CTYPE = condition.get("CTYPE");
		String ACCOUNT = condition.get("ACCOUNT");
		String POLICENAME = condition.get("POLICENAME");
		String GPSX = condition.get("GPSX");
		String GPSY = condition.get("GPSY");
		
		this.getJdbcTemplate().update(csql,new Object[] {ID,CNUMBER,CTYPE,ACCOUNT,POLICENAME,GPSX,GPSY});		
	}
}
