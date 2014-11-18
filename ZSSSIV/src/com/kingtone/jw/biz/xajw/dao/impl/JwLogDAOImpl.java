package com.kingtone.jw.biz.xajw.dao.impl;

import java.util.List;

import com.kingtone.jw.biz.xajw.dao.JwLogDAO;
import com.kingtone.jw.biz.xajw.domain.JwLog;
import com.kingtone.jw.biz.xajw.domain.JwUser;
import com.kingtone.ssi.dao.SSIOrmDao;

public class JwLogDAOImpl extends SSIOrmDao implements JwLogDAO {
	/**
	 * 删除日志信息
	 * 
	 * @return
	 */
	public void delJwLog(String userIds) throws Exception {
		this.getSqlMapClientTemplate().delete("delJwLog", userIds);

	}

	/**
	 * 分页查找日志信息
	 * 
	 * @return
	 */
	public List findJwLogList(JwLog jwLog, int skipindex, int maxindex)
			throws Exception {
		List list;

		list = this.getSqlMapClientTemplate().queryForList("findJwLogList",
				jwLog, skipindex, maxindex);

		return list;
	}

	/**
	 * 查找日志总数信息
	 * 
	 * @return
	 */
	public int findJwLogListCount(JwLog jwLog) throws Exception {
		int n = Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"findJwLogListCount", jwLog).toString());
		return n;
	}

	/**
	 * 未使用用户统计信息
	 * 
	 * @return
	 */
	public List getJwLog(JwLog user) throws Exception {
		List list;
		StringBuffer bizIds = new StringBuffer();
		String[] bizId = user.getBiz_id().split("split");
		for (int j = 0; j < bizId.length; j++) {
			bizIds = bizIds.append("'" + bizId[j] + "',");
			if (j == bizId.length - 1) {
				bizIds.delete(bizIds.length() - 1, bizIds.length());
			}

		}
		String sql = "select ll.mx as days,b.b_name as bizname,u.name,u.sjhm,u.sjcm,u.xzqh,u.account from( select user_id, biz_id,systimestamp - max(op_time),SUBSTR(systimestamp - max(op_time),0,10 ),to_number(substr(systimestamp - max(op_time),0,10 )) mx from jw_log where biz_id in ("
				+ bizIds
				+ ",'S000000000') group by user_id, biz_id) ll ,business_config b,jw_user u where ll.biz_id = b.b_id and ll.user_id = u.account and mx>='"
				+ user.getDays() + "'";

		list = this.getSqlMapClientTemplate().queryForList("getJwLog", sql);

		return list;
	}

	/**
	 * 使用用户统计信息
	 * 
	 * @return
	 */
	public List getJwLogUser(JwLog user) throws Exception {

		List list;
		if (user.getUser_id().equals("")) {
			StringBuffer bizIds = new StringBuffer();
			String[] bizId = user.getBiz_id().split("split");
			for (int j = 0; j < bizId.length; j++) {
				bizIds = bizIds.append("'" + bizId[j] + "',");
				if (j == bizId.length - 1) {
					bizIds.delete(bizIds.length() - 1, bizIds.length());
				}

			}

			String sql = "select ll.count as count,b.b_name as bizname,u.name,u.account,u.sjhm,u.sjcm,u.xzqh from (select count(1) as count, l.user_id, l.biz_id from jw_log l where l.biz_id in ("
					+ bizIds
					+ ") and l.op_time  >= to_date('"
					+ user.getOp_time1()
					+ " 00:00:00','YYYY-MM-DD HH24:MI:SS') and  l.op_time <= to_date('"
					+ user.getOp_time2()
					+ " 23:59:59','YYYY-MM-DD HH24:MI:SS') group by l.user_id, l.biz_id order by l.biz_id, l.user_id) ll, business_config b,jw_user u where ll.biz_id = b.b_id and ll.user_id = u.account";

			list = this.getSqlMapClientTemplate().queryForList("getJwLogUser1",
					sql);
		} else {
			StringBuffer bizIds = new StringBuffer();
			String[] bizId = user.getBiz_id().split("split");
			for (int j = 0; j < bizId.length; j++) {
				bizIds = bizIds.append("'" + bizId[j] + "',");
				if (j == bizId.length - 1) {
					bizIds.delete(bizIds.length() - 1, bizIds.length());
				}

			}
			String sql = "select b.b_name as bizname,to_char(t.op_time,'YYYY-MM-DD HH24:MI:SS') as op_time1,u.id ,u.name,u.xb,u.account,u.sjhm,u.sjcm,u.xzqh,u.description from jw_log t,business_config b,jw_user u where t.user_id=u.account and t.biz_id=b.b_id and biz_id in ("
					+ bizIds
					+ ") and user_id = '"
					+ user.getUser_id()
					+ "' and op_time >= to_date('"
					+ user.getOp_time1()
					+ " 00:00:00','YYYY-MM-DD HH24:MI:SS') and  op_time<=to_date('"
					+ user.getOp_time2() + "  23:59:59','YYYY-MM-DD HH24:MI:SS')";
			list = this.getSqlMapClientTemplate().queryForList("getJwLogUser2",
					sql);
		}

		return list;
	}

	public void addJwLog(JwUser user) throws Exception {
		this.getSqlMapClientTemplate().insert("addJwLog",user);

}

	public List findJwLogListQuery(JwLog user, int skipindex, int maxindex) throws Exception {
		StringBuffer bizIds = new StringBuffer();
		String[] bizId = user.getBiz_id().split("split");
		for (int j = 0; j < bizId.length; j++) {
			bizIds = bizIds.append("'" + bizId[j] + "',");
			if (j == bizId.length - 1) {
				bizIds.delete(bizIds.length() - 1, bizIds.length());
			}

		}

		String sql = "select ll.count as count,b.b_name as bizname,u.name,u.account,u.sjhm,u.sjcm,u.xzqh from (select count(1) as count, l.user_id, l.biz_id from jw_log l where l.biz_id in ("
				+ bizIds
				+ ") and l.op_time  >= to_date('"
				+ user.getOp_time1()
				+ " 00:00:00','YYYY-MM-DD HH24:MI:SS') and  l.op_time <= to_date('"
				+ user.getOp_time2()
				+ " 23:59:59','YYYY-MM-DD HH24:MI:SS') group by l.user_id, l.biz_id order by l.biz_id, l.user_id) ll, business_config b,jw_user u where ll.biz_id = b.b_id and ll.user_id = u.account";

		List list = this.getSqlMapClientTemplate().queryForList("getJwLogUser1",sql, skipindex, maxindex);
			return list;
		
	}

	public int findJwLogListCountQuery(JwLog user) throws Exception {
		
		StringBuffer bizIds = new StringBuffer();
		String[] bizId = user.getBiz_id().split("split");
		for (int j = 0; j < bizId.length; j++) {
			bizIds = bizIds.append("'" + bizId[j] + "',");
			if (j == bizId.length - 1) {
				bizIds.delete(bizIds.length() - 1, bizIds.length());
			}

		}

		String sql = "select count(*) from (select count(1) as count, l.user_id, l.biz_id from jw_log l where l.biz_id in ("
				+ bizIds
				+ ") and l.op_time  >= to_date('"
				+ user.getOp_time1()
				+ " 00:00:00','YYYY-MM-DD HH24:MI:SS') and  l.op_time <= to_date('"
				+ user.getOp_time2()
				+ " 23:59:59','YYYY-MM-DD HH24:MI:SS') group by l.user_id, l.biz_id order by l.biz_id, l.user_id) ll, business_config b,jw_user u where ll.biz_id = b.b_id and ll.user_id = u.account";
		int n = Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"findJwLogListCountQuery", sql).toString());
		return n;
	}

	public int findJwLogListCountUserQuery(JwLog user) throws Exception {
		StringBuffer bizIds = new StringBuffer();
		String[] bizId = user.getBiz_id().split("split");
		for (int j = 0; j < bizId.length; j++) {
			bizIds = bizIds.append("'" + bizId[j] + "',");
			if (j == bizId.length - 1) {
				bizIds.delete(bizIds.length() - 1, bizIds.length());
			}

		}
		String sql = "select count(*) from jw_log t,business_config b,jw_user u where t.user_id=u.account and t.biz_id=b.b_id and biz_id in ("
				+ bizIds
				+ ") and user_id = '"
				+ user.getUser_id()
				+ "' and op_time >= to_date('"
				+ user.getOp_time1()
				+ " 00:00:00','YYYY-MM-DD HH24:MI:SS') and  op_time<=to_date('"
				+ user.getOp_time2() + "  23:59:59','YYYY-MM-DD HH24:MI:SS')";
		int n = Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"findJwLogListCountUserQuery", sql).toString());
		return n;
	}

	public List findJwLogListUserQuery(JwLog user, int skipindex, int maxindex) throws Exception {
		StringBuffer bizIds = new StringBuffer();
		String[] bizId = user.getBiz_id().split("split");
		for (int j = 0; j < bizId.length; j++) {
			bizIds = bizIds.append("'" + bizId[j] + "',");
			if (j == bizId.length - 1) {
				bizIds.delete(bizIds.length() - 1, bizIds.length());
			}

		}
		String sql = "select b.b_name as bizname,to_char(t.op_time,'YYYY-MM-DD HH24:MI:SS') as op_time1,u.id ,u.name,u.xb,u.account,u.sjhm,u.sjcm,u.xzqh,u.description from jw_log t,business_config b,jw_user u where t.user_id=u.account and t.biz_id=b.b_id and biz_id in ("
				+ bizIds
				+ ") and user_id = '"
				+ user.getUser_id()
				+ "' and op_time >= to_date('"
				+ user.getOp_time1()
				+ " 00:00:00','YYYY-MM-DD HH24:MI:SS') and  op_time<=to_date('"
				+ user.getOp_time2() + "  23:59:59','YYYY-MM-DD HH24:MI:SS')";
	List	list = this.getSqlMapClientTemplate().queryForList("getJwLogUser2",
				sql, skipindex, maxindex);
	return list;
	}

	public int findJwLogListCountNuserQuery(JwLog user) throws Exception {
		
		StringBuffer bizIds = new StringBuffer();
		String[] bizId = user.getBiz_id().split("split");
		for (int j = 0; j < bizId.length; j++) {
			bizIds = bizIds.append("'" + bizId[j] + "',");
			if (j == bizId.length - 1) {
				bizIds.delete(bizIds.length() - 1, bizIds.length());
			}

		}
		String sql = "select count(*) from( select user_id, biz_id,systimestamp - max(op_time),SUBSTR(systimestamp - max(op_time),0,10 ),to_number(substr(systimestamp - max(op_time),0,10 )) mx from jw_log where biz_id in ("
				+ bizIds
				+ ",'S000000000') group by user_id, biz_id) ll ,business_config b,jw_user u where ll.biz_id = b.b_id and ll.user_id = u.account and mx>='"
				+ user.getDays() + "'";

		int n = Integer.parseInt(this.getSqlMapClientTemplate().queryForObject(
				"findJwLogListCountNuserQuery", sql).toString());

		return n;
	}

	public List findJwLogListNuserQuery(JwLog user, int skipindex, int maxindex) throws Exception {
		List list;
		StringBuffer bizIds = new StringBuffer();
		String[] bizId = user.getBiz_id().split("split");
		for (int j = 0; j < bizId.length; j++) {
			bizIds = bizIds.append("'" + bizId[j] + "',");
			if (j == bizId.length - 1) {
				bizIds.delete(bizIds.length() - 1, bizIds.length());
			}

		}
		String sql = "select ll.mx as days,b.b_name as bizname,u.name,u.sjhm,u.sjcm,u.xzqh,u.account from( select user_id, biz_id,systimestamp - max(op_time),SUBSTR(systimestamp - max(op_time),0,10 ),to_number(substr(systimestamp - max(op_time),0,10 )) mx from jw_log where biz_id in ("
				+ bizIds
				+ ",'S000000000') group by user_id, biz_id) ll ,business_config b,jw_user u where ll.biz_id = b.b_id and ll.user_id = u.account and mx>='"
				+ user.getDays() + "'";

		list = this.getSqlMapClientTemplate().queryForList("getJwLog", sql, skipindex, maxindex);

		return list;
	}}
