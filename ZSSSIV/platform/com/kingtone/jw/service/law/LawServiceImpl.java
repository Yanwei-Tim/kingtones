package com.kingtone.jw.service.law;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcDaoSupport;
import org.springframework.jdbc.support.lob.DefaultLobHandler;
import org.springframework.jdbc.support.lob.LobHandler;

import com.kingtone.jw.service.domain.QueryEnvelop;
import com.kingtone.jw.service.util.CommonTool;
import com.kingtone.ssi.multids.CustomerContextHolder;
import com.kingtone.ssi.multids.CustomerType;

public class LawServiceImpl extends SimpleJdbcDaoSupport implements LawService {

	private final Logger log = Logger.getLogger(LawServiceImpl.class);

	private final String SQL_QUERY_DIRECTORY_ROOT = "SELECT T.ID,T.CODE,T.NAME,T.SORT,T.CREATED_TIME,T.PARENT_ID FROM JW_LAW_DIRECTORY T WHERE( T.PARENT_ID IS NULL OR T.PARENT_ID=0)";
	private final String SQL_QUERY_DIRECTORY = "SELECT T.ID,T.CODE,T.NAME,T.SORT,T.CREATED_TIME,T.PARENT_ID FROM JW_LAW_DIRECTORY T WHERE 1=1 ";// T.PARENT_ID
																																				// =
																																				// ?";
	private final String SQL_COUNT_DIRECTORY_ROOT = "SELECT COUNT(*) FROM JW_LAW_DIRECTORY T WHERE( T.PARENT_ID IS NULL OR T.PARENT_ID=0)";
	private final String SQL_COUNT_DIRECTORY = "SELECT COUNT(*) FROM JW_LAW_DIRECTORY T WHERE 1=1 ";// T.PARENT_ID
																									// =
																									// ?";
	private final String SQL_COUNT_HAS_CHILD = "SELECT COUNT(*) FROM JW_LAW_DIRECTORY T WHERE T.PARENT_ID = ?";

	private final String SQL_QUERY_CONTENT_BY_DIRECTORY_ID = "SELECT T.ID,T.DIRECTORY_ID,T.CONTENT,T.CREATED_TIME FROM JW_LAW_CONTENT T WHERE T.DIRECTORY_ID = ?";

	@Override
	public QueryEnvelop queryLawDirectory(QueryEnvelop request)
			throws Exception {

		QueryEnvelop response = new QueryEnvelop();
		final List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		CustomerContextHolder.setCustomerType(CustomerType.valueOf("confDS"));

		Map<String, String> condition = request.getCondition();
		String lawName = condition.get("LAW_NAME");
		String lawCode = condition.get("LAW_CODE");
		String lawId = condition.get("LAW_ID");

		ParameterizedRowMapper<Map<String, String>> searchMapper = new ParameterizedRowMapper<Map<String, String>>() {
			public Map<String, String> mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				Map<String, String> map = new HashMap<String, String>();
				map.put("TYPE", "DIRECTORY");

				String curId = rs.getString("ID");
				map.put("ID", curId);
				map.put("CODE", rs.getString("CODE"));
				map.put("NAME", rs.getString("NAME"));
				map.put("SORT", rs.getString("SORT"));
				map.put("CREATED_TIME",
						String.valueOf(rs.getDate("CREATED_TIME")));
				map.put("PARENT_ID", rs.getString("PARENT_ID"));
				map.put("HAS_CHILD", String.valueOf(hasChild(curId)));
				list.add(map);
				return map;
			}
		};

		String searchSql = SQL_QUERY_DIRECTORY_ROOT;
		String countSql = SQL_COUNT_DIRECTORY_ROOT;
		if (!StringUtils.isEmpty(lawId)) {// 有值，获取下级目录
			searchSql = SQL_QUERY_DIRECTORY + " and T.PARENT_ID = " + lawId
					+ " ";
			countSql = SQL_COUNT_DIRECTORY + " and T.PARENT_ID = " + lawId
					+ " ";
		}

		// 法规名称查询
		if (!StringUtils.isEmpty(lawName)) {
			searchSql += " AND T.NAME LIKE '%" + lawName + "%' ";
			countSql += " AND T.NAME LIKE '%" + lawName + "%' ";
		}

		// 法规编码查询
		if (!StringUtils.isEmpty(lawCode)) {
			searchSql += " AND T.CODE LIKE '%" + lawCode + "%' ";
			countSql += " AND T.CODE LIKE '%" + lawCode + "%' ";
		}
		searchSql += " ORDER BY T.SORT ASC ,T.CREATED_TIME DESC ";
		countSql += " ORDER BY T.SORT ASC ,T.CREATED_TIME DESC ";

		int totalSize = this.getJdbcTemplate().queryForInt(countSql);
		int pageNum = request.getPageNum(); // 当前查询页码
		int pageSize = request.getPageSize(); // CommonTool.pagesize;//每页显示记录条数
		int totalPage = CommonTool.getTotalPage(totalSize, pageSize, pageNum);// 总页数

		String sql = CommonTool.getPageSql(searchSql, pageNum, totalPage,
				totalSize, pageSize);

		this.getJdbcTemplate().query(sql, searchMapper);

		response.setPageNum(pageNum);
		response.setTotalNum(totalSize);
		response.setTotalPage(totalPage);
		response.setPageSize(pageSize);
		response.setList(list);
		return response;
	}

	@Override
	public QueryEnvelop queryLawContent(QueryEnvelop request) throws Exception {
		QueryEnvelop response = new QueryEnvelop();
		final List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		CustomerContextHolder.setCustomerType(CustomerType.valueOf("confDS"));

		Map<String, String> condition = request.getCondition();
		String lawId = condition.get("LAW_ID");

		final LobHandler lobHandler = new DefaultLobHandler();
		ParameterizedRowMapper<Map<String, String>> searchMapper = new ParameterizedRowMapper<Map<String, String>>() {
			public Map<String, String> mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				Map<String, String> map = new HashMap<String, String>();
				map.put("TYPE", "CONTENT");
				map.put("ID", rs.getString("ID"));
				map.put("DIRECTORY_ID", rs.getString("DIRECTORY_ID"));
				map.put("CONTENT", lobHandler.getClobAsString(rs, "CONTENT"));
				map.put("CREATED_TIME",
						String.valueOf(rs.getDate("CREATED_TIME")));
				list.add(map);
				return map;
			}
		};

		if (!StringUtils.isEmpty(lawId)) {// 有值，查询内容
			this.getJdbcTemplate().query(SQL_QUERY_CONTENT_BY_DIRECTORY_ID,
					new Object[] { lawId }, searchMapper);
		}

		
		response.setList(list);
		return response;
	}

	private boolean hasChild(String dirId) {
		boolean isHave = false;

		int count = this.getJdbcTemplate().queryForInt(SQL_COUNT_HAS_CHILD,
				new Object[] { dirId });
		if (count > 0) {
			isHave = true;
		}

		return isHave;
	}

}
