/**
 * 
 */
package com.kingtone.jw.service.dao.impl;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.jdbc.core.RowMapper;

import com.kingtone.jw.service.dao.GpsDAO;
import com.kingtone.jw.service.domain.GpsConfigEnvelop;
import com.kingtone.jw.service.domain.GpsEnvelop;
import com.kingtone.ssi.dao.SSIDAO;

/**
 * @author xushilin
 * 
 */
public class GpsDAOImpl extends SSIDAO implements GpsDAO {


	public void InsertGPS(GpsEnvelop request) throws Exception {
		String sql = "insert into jw_gps_data(userId,deviceid,x,y,speed,direction,imsi) select u.id,";
		String DeviceId = request.getDiviceId();
		if (DeviceId != null && DeviceId != null) {
			DeviceId=DeviceId.toUpperCase();
			String x = request.getX();
			String y = request.getY();
			String speed = request.getSpeed();
			String direction = request.getDirection();
			String imsi = request.getImsi();
			sql += "'" + DeviceId + "','" + x + "','" + y + "','" + speed
					+ "','" + direction + "','" + imsi
					+ "' from jw_user u where upper(u.sjcm)='" + DeviceId + "'";

			this.getJdbcTemplate().update(sql);
		}
	}


	public GpsConfigEnvelop getOnOffStateByDeviceId(String deviceId)
			throws Exception {
		if (deviceId != null) {
			String sqlText = "select t.* from jw_gps_config t left join jw_user u on t.userid=u.id where upper(u.sjcm)='"
				+ deviceId.toUpperCase() + "'";
			GpsConfigEnvelop ge = new GpsConfigEnvelop();
		
			Map map = (HashMap) this.queryForObject(sqlText,
					new QueryRowMaper());
			ge.setDetail(map);
			return ge;
		} else {
			return null;
		}
	}

	private static class QueryRowMaper implements RowMapper {
		@SuppressWarnings("unchecked")
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			HashMap<String, String> dataMap = new HashMap<String, String>();
			ResultSetMetaData rsMeta = rs.getMetaData();
			int columnCount = rsMeta.getColumnCount();
			for (int i = 1; i <= columnCount; i++) {
				String colName = rsMeta.getColumnName(i) == null ? null
						: rsMeta.getColumnName(i);
				String colValue = rs.getString(i) == null ? null : rs
						.getString(i).trim();

				dataMap.put(colName, colValue);
			}
			return dataMap;
		}
	}
}
