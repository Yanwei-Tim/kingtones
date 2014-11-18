/**
 * 文件名：SycnDBEngine.java
 * 创建人：陈萧如 - chenxiaoru@kingtoneinfo.com
 * 创建时间：Dec 16, 2011
 * 版权所有：西安联合信息技术股份有限公司
 */

package com.kingtone.jw.service.scheduler.engine;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.Map.Entry;

import com.kingtone.jw.service.domain.SynchEnvelop;
import com.kingtone.jw.service.scheduler.util.SynchConstants;
import com.kingtone.jw.service.scheduler.util.SynchHelpUtil;
import com.kingtone.jw.service.util.CommonTool;
import com.kingtone.ssi.log.SSILogger;

/**
 * 同步数据库数据。
 * 
 * @author 陈萧如 - chenxiaoru@kingtoneinfo.com
 * @version 1.0 Created on Dec 16, 2011
 */
public class SynchDBEngine {
	// 需要同步的sqlite文件
	private File sqliteFile;
	// 需要同步数据库对应的角色ID
	private String roleId = null;
	// sqlite数据库执行器
	private Statement statement;
	// sqlite数据库连接
	private Connection connection = null;
	// 记录数据库中的最新更新日期字符串
	private String bizUpdateDate;

	public SynchDBEngine(File sqliteFile, String roleId) {
		this.sqliteFile = sqliteFile;
		this.roleId = roleId;
	}

	/**
	 * 
	 * 开始执行同步操作。
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @throws Exception
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 * @date: Created on: Dec 16, 2011
	 */
	public void startSynchronous() {
		try {
			//加载数据库连接。
			loadSQLStatement();
			if (isShouldBeUpdate()) {
				SSILogger.Bizlogger.info("SycnDBEngine --- 开始更新："
						+ sqliteFile.getPath() + " 的数据库数据！");
				// 获取需要同步的数据。
				SynchEnvelop synchList = null;
				try {
					synchList = getSynchData();
				} catch (Exception e) {
					SSILogger.Bizlogger
							.info("SycnDBEngine --- 获取数据库数据失败！请检查数据库连接是否正常！");
					close();
					return;
				}
				// 同步业务关联相关数据。
				synchronousBizData(synchList);
				// 同步系统资源数据。
				synchronousSysData(synchList);
				// 更新本地sqlite数据库里的最新版本信息时间。
				updateSynchTime();
				SSILogger.Bizlogger.info("SycnDBEngine --- 同步："
						+ sqliteFile.getPath() + " 的数据库数据完成！");
			}else{
				SSILogger.Bizlogger.info("SycnDBEngine --- "
						+ sqliteFile.getName() + " 已经是最新版本，无需更新！！");
			}
			// 更新服务器数据库中SYSTEM_SQLITE_SYNCH表数据
			updateSynchTableInDB();
		} catch (Exception e) {
			e.printStackTrace();
			SSILogger.Bizlogger.error("SycnDBEngine ---同步："
					+ sqliteFile.getPath() + " 的数据库数据失败！");
			System.err.println("----------------------------当前更新的sqlite文件："+sqliteFile.getPath()+"已损坏！请到本地手动删除该文件，并重新新点击run.bat执行更新操作！----------------------------");
		} finally {
			// 关闭连接
			close();
		}
	}

	/**
	 * 获取数据库中最新数据信封类
	 * 
	 * @return 数据库中最新数据的信封类
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @throws Exception
	 * @date: Created on: Dec 21, 2011
	 */
	private SynchEnvelop getSynchData() throws Exception {
		SynchEnvelop synchList = null;
		if (roleId == null)
			// 获取数据库中需要更新的所有表数据
			synchList = CommonTool.synchDAO.querySynchList(null);
		else
			// 根据角色ID获取数据库中需要更新的表数据
			synchList = CommonTool.synchDAO.querySynchListByRoleId(roleId);
		return synchList;
	}

	/**
	 * 
	 * 关闭数据连接。
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on: Dec 19, 2011
	 */
	private void close() {
		try {
			statement.close();
			connection.close();
		} catch (SQLException e) {
			SSILogger.Bizlogger.error("关闭连接失败！", e);
		}
	}

	/**
	 * 
	 * 加载sqlite文件数据库连接。
	 * 
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @throws SQLException
	 * @date: Created on: Dec 16, 2011
	 */
	private void loadSQLStatement() throws ClassNotFoundException {
		Class.forName("org.sqlite.JDBC");
		try {
			// 创建当前sqlite文件数据连接
			connection = DriverManager.getConnection("jdbc:sqlite://"
					+ sqliteFile.getPath());
			statement = connection.createStatement();
		} catch (SQLException e) {
			SSILogger.Bizlogger.error("loadSQLStatement() 错误！", e);
		}
	}

	/**
	 * 
	 * 判断是否需要更新当前数据文件。
	 * 
	 * @return true：需要更新 false：不需要更新
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @throws Exception 
	 * @throws Exception
	 * @date: Created on: Dec 16, 2011
	 */
	private boolean isShouldBeUpdate() throws Exception {
		boolean shouldUpdate = false;
		bizUpdateDate = SynchHelpUtil.getSynchDateFromDB(roleId);
		if (bizUpdateDate != null) {
			List<HashMap<String, String>> synchinfo = queryListFormSqlite(
					"SYSTEM_SYNCH", new String[] { "SYNCH"}, null, null);
			// sqlite文件中的最新同步时间信息
			String synchtime = synchinfo.get(0).get("SYNCH");
			// 如果最新的数据库版本信息或角色ID与本地sqlite文件对应信息不一致，则更新。
			if (synchtime == null || !synchtime.equals(bizUpdateDate)) {
				shouldUpdate = true;
			}
		}
		return shouldUpdate;
	}

	/**
	 * 
	 * 同步业务关联相关数据。
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @param synchEnvelop:
	 *            需要同步的数据信封类
	 * @throws SQLException
	 * @date: Created on: Dec 16, 2011
	 */
	@SuppressWarnings("unchecked")
	private void synchronousBizData(SynchEnvelop synchEnvelop)
			throws SQLException {
		// 同步Business_config数据
		List<HashMap<String, String>> bizList = synchEnvelop.getBizList();
		synchronousData(SynchConstants.BUSINESS_CONFIG_TABLE, bizList);

		// 同步Business_res_config数据
		List<HashMap<String, String>> bizComponentList = synchEnvelop
				.getBizComponentList();
		synchronousData(SynchConstants.BUSINESS_RES_CONFIG_TABLE, bizComponentList);

		// 同步Business_related数据
		List<HashMap<String, String>> bizRelateList = synchEnvelop
				.getBizRelateList();
		synchronousData(SynchConstants.BUSINESS_RELATED_TABLE, bizRelateList);

		// 同步Tab_info数据
		List<HashMap<String, String>> selCardList = synchEnvelop
				.getSelCardList();
		synchronousData(SynchConstants.TAB_INFO_TABLE, selCardList);

	}

	/**
	 * 
	 * 同步系统资源数据。
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @param synchEnvelop:
	 *            需要同步的数据信封类
	 * @throws Exception
	 * @date: Created on: Dec 16, 2011
	 */
	@SuppressWarnings("unchecked")
	private void synchronousSysData(SynchEnvelop synchEnvelop) throws Exception {
		// 同步SYSTEM_RES_CONFIG数据
		List<HashMap<String, String>> resList = SynchHelpUtil
				.formateResList(synchEnvelop.getResList());
		synchronousData(SynchConstants.SYSTEM_RES_CONFIG_TABLE, resList);

		// 同步SYSTEM_MAP资源数据表
		// 记录log信息
		SSILogger.Bizlogger.info("SycnDBEngine --- 正在同步：\""
				+ sqliteFile.getName() + "\"的" + SynchConstants.SYSTEM_MAP_TABLE + "表数据,请稍等...");
		// 删除对应SYSTEM_MAP表中旧数据
		deleteOldDataFomTablesWithOutConditions(SynchConstants.SYSTEM_MAP_TABLE, "TYPE", "RETURN_CODE");
		// 循环插入新数据
		for (HashMap<String, String> resMap : resList) {
			String source = resMap.get("SOURCE");
			String resId = resMap.get("RES_ID");
			try{
				// 获取当前RES_ID对应的系统数据。
				SynchEnvelop sysMapList = CommonTool.bizDAO
						.querySynchDataList(resId + "split" + source);
				List<HashMap<String, String>> resMapList = sysMapList.getResList();
				// 向sqlite文件插入SYSTEM_MAP表数据
				for (HashMap<String, String> item : resMapList) {
					// 设置TYPE列的值
					item.put("TYPE", resId);
					insertData(SynchConstants.SYSTEM_MAP_TABLE, item);
				}
			}catch(Exception e){
				System.err.println("-----error----->>取得當前需同步的数据失败，请检查"+SynchConstants.SYSTEM_RES_CONFIG_TABLE+"表中该数据的配置:");
				System.err.println("-----error----->>resId:"+resId + "; source=" + source);
				System.out.println("正在同步，请稍等...");
			}
		}
		SSILogger.Bizlogger.info("SycnDBEngine --- 同步：\""
				+ sqliteFile.getName() + "\"的" + SynchConstants.SYSTEM_MAP_TABLE + "表数据成功！");
	}

	/**
	 * 
	 * 将传入数据列表同步到对应的sqlite文件的表中。。
	 * 
	 * @param tablename：需要同步的表的表名
	 * @param insertDataList：需要插入的数据
	 * @throws SQLException
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on: Dec 19, 2011
	 */
	private void synchronousData(String tablename,
			List<HashMap<String, String>> insertDataList) throws SQLException {
		// 记录log信息
		SSILogger.Bizlogger.info("SycnDBEngine --- 正在同步：\""
				+ sqliteFile.getName() + "\"的" + tablename + "表数据,请稍等...");
		// 删除对应表中旧数据
		deleteOldDataFomTables(tablename);
		// 插入传入数据列表到对应表中
		insertDataList(tablename, insertDataList);
		// 记录log信息
		SSILogger.Bizlogger.info("SycnDBEngine --- 同步：\""
				+ sqliteFile.getName() + "\"的" + tablename + "表数据成功！");
	}

	/**
	 * 
	 * 更新本地sqlite数据库里的最新版本信息时间。
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @throws SQLException
	 * @date: Created on: Dec 16, 2011
	 */
	private void updateSynchTime() throws SQLException {
		String sql = "update SYSTEM_SYNCH set SYNCH='" + bizUpdateDate + "'";
		statement.executeUpdate(sql);
	}

	/**
	 * 
	 * 更新服务器数据库中SYSTEM_SQLITE_SYNCH表数据
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @throws Exception
	 * @date: Created on: Dec 21, 2011
	 */
	private void updateSynchTableInDB() throws Exception {
		SSILogger.Bizlogger.info("SycnDBEngine --- 更新数据库SYSTEM_SQLITE_SYNCH表数据：（ROLE_ID="
						+ roleId + "; SYNCH_DATE="
						+ bizUpdateDate + "; FILE_NAME=" + sqliteFile.getName());
		// 设置更新数据map
		HashMap<String, String> synchInfoMap = new HashMap<String, String>();
		synchInfoMap.put(SynchConstants.COLUMN_ROLE_ID, roleId);
		synchInfoMap.put(SynchConstants.COLUMN_FILE_NAME, sqliteFile.getName());
		synchInfoMap.put(SynchConstants.COLUMN_SYNCH_DATE, bizUpdateDate);
		synchInfoMap.put(SynchConstants.COLUMN_FILE_LENGTH, sqliteFile.length()+"");
		// 更新服务器数据库中SYSTEM_SQLITE_SYNCH表数据
		CommonTool.synchDAO.updateSqliteSyncInfo(synchInfoMap);
	}

	/**
	 * 
	 * 删除对应的表数据。
	 * 
	 * @param tableName：需要执行删除操作的表名
	 * @throws SQLException
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on: Dec 16, 2011
	 */
	private void deleteOldDataFomTables(String tableName) throws SQLException {
		String sql = "delete from " + tableName;
		if (statement != null) {
			statement.executeUpdate(sql);
		}
	}
	
	/**
	 * 删除带条件表数据
	 * 
	 * @param tableName 需要执行删除操作的表名
	 * @param columnName 删除条件的列名
	 * @param notEqualToValue 不等于的值
	 * @throws SQLException
	 */
	private void deleteOldDataFomTablesWithOutConditions(String tableName, String columnName, String notEqualToValue) throws SQLException {
		String sql = "delete from " + tableName + " where 1=1 " + (columnName!=null?("and " + columnName + " != \'"+notEqualToValue)+"\'":"");
		if (statement != null) {
			statement.executeUpdate(sql);
		}
	}


	/**
	 * 
	 * 根据查询条件查询sqlite表数据。
	 * 
	 * @param tableName：需查询的表名
	 * @param columnNames：需要返回的列，为空时默认返回所有
	 * @param condition：查询条件
	 * @param orderBy：排序字段
	 * @return 返回查询的数据列表
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @throws SQLException
	 * @date: Created on: Dec 19, 2011
	 */
	private List<HashMap<String, String>> queryListFormSqlite(String tableName,
			String[] columnNames, String condition, String orderBy)
			throws SQLException {
		// 拼接查询sql语句。
		StringBuffer sqlBuffer = new StringBuffer();
		// 返回值
		List<HashMap<String, String>> resList = new ArrayList<HashMap<String, String>>();
		// 查询条件
		String selecttion = "1=1 and "
				+ ((condition == null || condition.isEmpty()) ? "2=2"
						: condition);
		// 获取返回列名。
		if (columnNames == null || columnNames.length == 0) {
			sqlBuffer.append("Select * from " + tableName);
		} else {
			sqlBuffer.append("Select ");
			for (int i = 0; i < columnNames.length; i++) {
				if (i != 0) {
					sqlBuffer.append(",");
				}
				sqlBuffer.append(columnNames[i]);
			}
			sqlBuffer.append(" from " + tableName);
		}
		// 拼接查询条件
		sqlBuffer.append(" where " + selecttion);
		// 拼接排序标识
		if (orderBy != null && !orderBy.isEmpty()) {
			sqlBuffer.append("oreder by " + orderBy);
		}
		// 执行查询操作
		ResultSet rs = statement.executeQuery(sqlBuffer.toString());
		ResultSetMetaData rsmd = rs.getMetaData();
		while (rs.next()) {
			HashMap<String, String> columnMap = new HashMap<String, String>();
			for (int i = 1; i <= rsmd.getColumnCount(); i++) {
				columnMap.put(rsmd.getColumnName(i), rs.getString(i));
			}
			resList.add(columnMap);
		}
		rs.close();
		return resList;
	}

	/**
	 * 
	 * 向对应表中插入数据列表。
	 * 
	 * @param tablename:
	 *            需插入的表名
	 * @param columnValueList:
	 *            需插入的数据列表
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @throws SQLException
	 * @date: Created on: Dec 19, 2011
	 */
	private void insertDataList(String tablename,
			List<HashMap<String, String>> columnValueList){
		// 遍历需插入的数据列表。
		for (HashMap<String, String> columnValue : columnValueList) {
			insertData(tablename, columnValue);
		}
	}

	/**
	 * 
	 * 向对应表中插入一条数据。
	 * 
	 * @param tablename:
	 *            需插入的表名
	 * @param columnValues
	 *            需插入的数据
	 * @throws SQLException
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on: Dec 19, 2011
	 */
	private void insertData(String tablename,
			HashMap<String, String> columnValues) {
		StringBuffer sqlBuffer = new StringBuffer("insert into " + tablename
				+ "(");
		// sql语句插入列名部分
		String columnsql = new String();
		// sql语句插入值部分
		String valuesql = new String();
		Set<Entry<String, String>> entrySet = columnValues.entrySet();
		Iterator<Entry<String, String>> iterator = entrySet.iterator();
		int index = 0;
		// 遍历当前插入列，拼接insert sql语句
		while (iterator.hasNext()) {
			Entry<String, String> columnEntry = iterator.next();
			if (index != 0) {
				columnsql += ",";
				valuesql += ",";
			}
			columnsql += columnEntry.getKey();
			valuesql += SynchHelpUtil.formatInsertValueExpress(columnEntry
					.getValue());
			index++;
		}
		sqlBuffer.append(columnsql).append(") values (").append(valuesql)
				.append(")");
		// 执行当前插入数据操作
		try {
			statement.executeUpdate(sqlBuffer.toString());
		} catch (SQLException e) {
			System.err.println("-----error----->>当前数据插入执行失败，请检查该数据的数据库配置:");
			System.err.println("-----error----->>"+sqlBuffer.toString());
			System.out.println("正在同步，请稍等...");
		}
	}

}
