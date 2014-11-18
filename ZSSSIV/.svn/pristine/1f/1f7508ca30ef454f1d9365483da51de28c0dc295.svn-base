package com.kingtone.jw.service.dao.impl;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import org.springframework.jdbc.core.RowMapper;

import com.kingtone.jw.service.dao.SynchDAO;
import com.kingtone.jw.service.dao.impl.BizDAOImpl.QuerySynchListRowMaper;
import com.kingtone.jw.service.domain.SynchEnvelop;
import com.kingtone.jw.service.scheduler.util.SynchConstants;
import com.kingtone.ssi.dao.SSIDAO;
/**
 * 
 * Title:同步数据--DAO类
 * Description:提供同步数据等功能
 * Author: 朱金华 - zhujinhua@kingtoneinfo.com
 * Date: Jun 2, 2011
 */
public class SynchDAOImpl extends SSIDAO  implements SynchDAO {
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
	/*根据用户分段同步数据
	public SynchEnvelop querySynchPartList(SynchEnvelop request,String username,String part)throws Exception{
		if(username!=null&&(!username.equals(""))){
//		if(username!=null){
			jw_username=username;
		 bus_con_sql="select t.* from business_config t ,jw_user u ,jw_role r ,jw_m_role_biz z where u.account='"+username+"' " +
				"and u.jw_role_id=r.role_id and r.role_id=z.role_id and z.biz_id=t.b_id";
		 bus_res_con_sql="select brc.* from business_res_config brc ,(" +
		 		"select distinct t.b_id,t.w_id from business_res_config t,jw_user u ,jw_role r ,jw_m_role_res s where u.account='"+username+"' " +
				"and u.jw_role_id=r.role_id and r.role_id=s.role_id and s.biz_id=t.b_id and s.res_id=t.w_id" +
				" ) brc2 where brc.w_id=brc2.w_id and brc.b_id=brc2.b_id";
		 bus_rel_con_sql=" select a1.* from business_related a1 ,(" +
		 		"select distinct t.r_id ,t.b_id from business_related t ,jw_user u ,jw_role r ,jw_m_role_biz z where u.account='"+username+"' " +
				"and u.jw_role_id=r.role_id and r.role_id=z.role_id and z.biz_id=t.r_id " +
				"and t.b_id in (select distinct z.biz_id from jw_user u ,jw_role r ,jw_m_role_biz z where u.account='"+username+"' " +
				"and u.jw_role_id=r.role_id and r.role_id=z.role_id)" +
				" ) a2 where a1.b_id=a2.b_id and a1.r_id=a2.r_id";
		 tab_info_sql="select t.* from tab_info t  ,jw_user u ,jw_role r ,jw_m_role_biz z where u.account='"+username+"' " +
				"and u.jw_role_id=r.role_id and r.role_id=z.role_id and z.biz_id=t.b_id";
		 String b_id_null=" and b_id is null";
		 if(!part.equals("business_config"))bus_con_sql=bus_con_sql+b_id_null;
		 if(!part.equals("business_res_config"))bus_res_con_sql=bus_con_sql+b_id_null;
		 if(!part.equals("business_related"))bus_rel_con_sql=bus_con_sql+b_id_null;
		 if(!part.equals("tab_info"))bus_con_sql=tab_info_sql+b_id_null;
		 return querySynchList(request,true);
		}
		return querySynchList(request);
	}*/
	
	private String bus_con_sql=null;
	private String bus_res_con_sql=null;
	private String bus_rel_con_sql=null;
	private String tab_info_sql=null;
	private String jw_username=null;
	/*根据用户同步数据*/
	public SynchEnvelop querySynchList(SynchEnvelop request,String username)throws Exception{
		if(username!=null&&(!username.equals(""))){
//		if(username!=null){
			jw_username=username;
		 bus_con_sql="select t.* from business_config t ,jw_user u ,jw_role r ,jw_m_role_biz z where u.account='"+username+"' " +
				"and u.jw_role_id=r.role_id and r.role_id=z.role_id and z.biz_id=t.b_id";
		 bus_res_con_sql="select brc.* from business_res_config brc ,(" +
		 		"select distinct t.b_id,t.w_id from business_res_config t,jw_user u ,jw_role r ,jw_m_role_res s where u.account='"+username+"' " +
				"and u.jw_role_id=r.role_id and r.role_id=s.role_id and s.biz_id=t.b_id and s.res_id=t.w_id" +
				" ) brc2 where brc.w_id=brc2.w_id and brc.b_id=brc2.b_id";
		 bus_rel_con_sql=" select a1.* from business_related a1 ,(" +
		 		"select distinct t.r_id ,t.b_id from business_related t ,jw_user u ,jw_role r ,jw_m_role_biz z where u.account='"+username+"' " +
				"and u.jw_role_id=r.role_id and r.role_id=z.role_id and z.biz_id=t.r_id " +
				"and t.b_id in (select distinct z.biz_id from jw_user u ,jw_role r ,jw_m_role_biz z where u.account='"+username+"' " +
				"and u.jw_role_id=r.role_id and r.role_id=z.role_id)" +
				" ) a2 where a1.b_id=a2.b_id and a1.r_id=a2.r_id";
		 tab_info_sql="select t.* from tab_info t  ,jw_user u ,jw_role r ,jw_m_role_biz z where u.account='"+username+"' " +
				"and u.jw_role_id=r.role_id and r.role_id=z.role_id and z.biz_id=t.b_id";
		 return querySynchList(request,true);
		}
		return querySynchList(request);
	}
	
	/*同步数据*/
	public SynchEnvelop querySynchList(SynchEnvelop request,boolean ifuser)throws Exception{
		SynchEnvelop response = new SynchEnvelop();
		
		String table="BUSINESS_CONFIG";
		String sql = " select * from "+table;
		if(ifuser)sql=bus_con_sql;
		//业务配置表  Business_config
		List bizList = this.query(sql, new QuerySynchListRowMaper());
		response.setBizList(bizList);
		//System.out.println("sql:"+sql);
		
		//业务资源配置Business_res_config
		table="BUSINESS_RES_CONFIG";
		sql = " select * from "+table;
		if(ifuser)sql=bus_res_con_sql;
		List bizComponentList = this.query(sql, new QuerySynchListRowMaper());
		response.setBizComponentList(bizComponentList);
		//System.out.println("sql:"+sql);
		
		//业务关联表 Business_related
		table="BUSINESS_RELATED";
		sql = " select * from "+table;
		if(ifuser)sql=bus_rel_con_sql;
		List bizRelateList = this.query(sql, new QuerySynchListRowMaper());
		response.setBizRelateList(bizRelateList);
		//System.out.println("sql:"+sql);
		
		String src_where="";
		String src_condion=querySynchSysResCon();
		if(src_condion!=null)src_where=" where "+src_condion;
		//系统资源配置表
		table="SYSTEM_RES_CONFIG";
		sql = " select * from "+table+src_where;
		List resList = this.query(sql, new QuerySynchListRowMaper());
		response.setResList(resList);
		//System.out.println("sql:"+sql);
		
		//选项卡信息表
		table="TAB_INFO";
		sql = " select * from "+table;
		if(ifuser)sql=tab_info_sql;
		List selCardList = this.query(sql, new QuerySynchListRowMaper());
		response.setSelCardList(selCardList);
		//System.out.println("sql:"+sql);
		
		return response; 
	}
	
	/*同步数据*/
	public SynchEnvelop querySynchList(SynchEnvelop request)throws Exception{
		SynchEnvelop response = new SynchEnvelop();
		
		String table="BUSINESS_CONFIG";
		String sql = " select * from "+table;
		//业务配置表  Business_config
		List bizList = this.query(sql, new QuerySynchListRowMaper());
		response.setBizList(bizList);
		
		//业务资源配置Business_res_config
		table="BUSINESS_RES_CONFIG";
		sql = " select * from "+table;
		List bizComponentList = this.query(sql, new QuerySynchListRowMaper());
		response.setBizComponentList(bizComponentList);
		
		//业务关联表 Business_related
		table="BUSINESS_RELATED";
		sql = " select * from "+table;
		List bizRelateList = this.query(sql, new QuerySynchListRowMaper());
		response.setBizRelateList(bizRelateList);
		
		String src_where="";
		String src_condion=querySynchSysResCon();
		if(src_condion!=null)src_where=" where "+src_condion;
		//系统资源配置表
		table="SYSTEM_RES_CONFIG";
		sql = " select * from "+table+src_where;
		List resList = this.query(sql, new QuerySynchListRowMaper());
		response.setResList(resList);
		
		//选项卡信息表
		table="TAB_INFO";
		sql = " select * from "+table;
		List selCardList = this.query(sql, new QuerySynchListRowMaper());
		response.setSelCardList(selCardList);
		
		return response; 
	}
	
	//过滤字典表返回需同步到终端的字典数据
	private String querySynchSysResCon() throws Exception{
		StringBuffer sb=new StringBuffer();String sbstr=null;
		sb.append("res_id in (");
		String bcsql="select distinct bc.b_id from business_config bc";
		List<HashMap<String, String>> bcList = this.query(bcsql, new QuerySynchListRowMaper());		
		String brcsql="select distinct brc.res_id from business_res_config brc where brc.res_id is not null";
		List<HashMap<String, String>> brcList = this.query(brcsql, new QuerySynchListRowMaper());
		
		if((bcList!=null&&bcList.size()>0)||(brcList!=null&&brcList.size()>0)){
			
			for(HashMap<String, String> o: bcList){
				Set set = o.keySet();
				String value=o.get(set.toArray()[0].toString());
				String[] strs=value.split(",");
				for(String s:strs){
					sb.append("'"+s+"'");sb.append(",");
				}
			}
			
			for(HashMap<String, String> o: brcList){
				Set set = o.keySet();
				String value=o.get(set.toArray()[0].toString());
				String[] strs=value.split(",");
				for(String s:strs){
					sb.append("'"+s+"'");sb.append(",");
				}
			}
			sbstr=sb.substring(0, sb.length()-1);
		}
		if(sbstr!=null)sbstr=sbstr+")";
		return sbstr;
	}
	

	/*查找根节点更新时间*/
	public String queryRootBizUpdateDate()throws Exception{
		String sql = "select "+"edit_res_date"+" from business_config where father_id='"+"0"+"'";
		return (String) this.getJdbcTemplate().queryForObject(sql,new LoadRowMaper("edit_res_date"));
		
	}

	/*查找警务角色更新时间*/
	public String queryRoleBizUpdateDate(String account)throws Exception{
		String sql = "select r.change_date from jw_user t ,jw_role r where t.account='"+account+"' and t.jw_role_id=r.role_id" ;		
		return (String) this.getJdbcTemplate().queryForObject(sql,new LoadRowMaper("change_date"));
	}
	

	/**
	 * 
	 * 通過角色ID获取中SYSTEM_SQLITE_SYNCH表中的同步信息
	 * @param roleId：角色ID
	 * @return
	 * @throws Exception
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on: Dec 21, 2011
	 */
	
	public List querySqliteSynchListByRoleId(String roleId)
			throws Exception {
		String sql = "select * from SYSTEM_SQLITE_SYNCH where ROLE_ID = '"+(roleId==null?"all":roleId)+"'";
		List sqliteSynchList = this.query(sql, new QuerySynchListRowMaper());
		return sqliteSynchList;
	}
	
	/**
	 * 
	 * 更新SYSTEM_SQLITE_SYNCH中的同步信息
	 * @param synchMap
	 * @throws Exception
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on: Dec 21, 2011
	 */
	
	public void updateSqliteSyncInfo(HashMap<String, String> synchMap)
			throws Exception {
		String sql = "";
		// 角色ID
		String roleId = synchMap.get(SynchConstants.COLUMN_ROLE_ID);
		// 对应最新sqlite文件路径
		String fileName = synchMap.get(SynchConstants.COLUMN_FILE_NAME);
		// 版本时间
		String synchDate = synchMap.get(SynchConstants.COLUMN_SYNCH_DATE);
		// 文件大小
		String fileLength = synchMap.get(SynchConstants.COLUMN_FILE_LENGTH);
		
		List sqliteSynchListByRoleId = querySqliteSynchListByRoleId(roleId);
		// 如果SYSTEM_SQLITE_SYNCH中不存在对应与该角色ID的数据，就插入，否则更新。
		if(sqliteSynchListByRoleId ==null || sqliteSynchListByRoleId.size() == 0){
			sql = "insert into SYSTEM_SQLITE_SYNCH(ROLE_ID, FILE_NAME, SYNCH_DATE, FILE_LENGTH) values ('" + 
					(roleId==null?"all":roleId) + "','" +
					fileName + "','" +
					synchDate + "','" +
					fileLength + "')";
		}else{
			sql = "update SYSTEM_SQLITE_SYNCH set FILE_NAME = '" + fileName + "', SYNCH_DATE = '" +
					synchDate+ "', FILE_LENGTH = '" +
					fileLength + "' where ROLE_ID = '"+ (roleId==null?"all":roleId) +"'";
		}
		this.update(sql);
	}

	/**
	 * 
	 * 通過角色ID获取需要同步的数据
	 * @param roleId: 角色ID
	 * @return: 返回查询结果信封类
	 * @throws Exception
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on: Dec 19, 2011
	 */
	
	public SynchEnvelop querySynchListByRoleId(String roleId) throws Exception {
		if(roleId != null && !roleId.isEmpty()){
			// business_config 根据riole_id查询数据sql语句
			StringBuffer bus_con_sql_buffer= new StringBuffer();
			bus_con_sql_buffer.append("select t.*");
			bus_con_sql_buffer.append("  from business_config t, jw_role r, jw_m_role_biz z");
			bus_con_sql_buffer.append(" where r.role_id = '").append(roleId).append("'");
			bus_con_sql_buffer.append("   and r.role_id = z.role_id");
			bus_con_sql_buffer.append("   and z.biz_id = t.b_id");
			bus_con_sql = bus_con_sql_buffer.toString();
			
			// business_res_config 根据riole_id查询数据sql语句
			StringBuffer bus_res_con_sql_buffer = new StringBuffer();
			bus_res_con_sql_buffer.append("select distinct t.*");
			bus_res_con_sql_buffer.append("  from business_res_config t, jw_role r, jw_m_role_res s");
			bus_res_con_sql_buffer.append(" where r.role_id = '").append(roleId).append("'");
			bus_res_con_sql_buffer.append("   and r.role_id = s.role_id");
			bus_res_con_sql_buffer.append("   and s.biz_id = t.b_id");
			bus_res_con_sql_buffer.append("   and s.res_id = t.w_id");
			bus_res_con_sql = bus_res_con_sql_buffer.toString();
			
			// business_related 根据riole_id查询数据sql语句
			StringBuffer bus_rel_con_sql_buffer = new StringBuffer();
			bus_rel_con_sql_buffer.append("select a1.*");
			bus_rel_con_sql_buffer.append("  from business_related a1,");
			bus_rel_con_sql_buffer.append("       (select distinct t.r_id, t.b_id");
			bus_rel_con_sql_buffer.append("          from business_related t, jw_role r, jw_m_role_biz z");
			bus_rel_con_sql_buffer.append("         where r.role_id = '").append(roleId).append("'");
			bus_rel_con_sql_buffer.append("           and r.role_id = z.role_id");
			bus_rel_con_sql_buffer.append("           and z.biz_id = t.r_id");
			bus_rel_con_sql_buffer.append("           and t.b_id in (select distinct z.biz_id");
			bus_rel_con_sql_buffer.append("                            from jw_role r, jw_m_role_biz z");
			bus_rel_con_sql_buffer.append("                           where r.role_id = '").append(roleId).append("'");
			bus_rel_con_sql_buffer.append("                             and r.role_id = z.role_id)) a2");
			bus_rel_con_sql_buffer.append(" where a1.b_id = a2.b_id");
			bus_rel_con_sql_buffer.append("   and a1.r_id = a2.r_id");
			bus_rel_con_sql = bus_rel_con_sql_buffer.toString();
			
			// tab_info 根据riole_id查询数据sql语句
			StringBuffer tab_info_sql_buffer = new StringBuffer();
			tab_info_sql_buffer.append("select distinct t.*");
			tab_info_sql_buffer.append("  from tab_info t, jw_role r, jw_m_role_biz z");
			tab_info_sql_buffer.append(" where r.role_id = '").append(roleId).append("'");
			tab_info_sql_buffer.append("   and r.role_id = z.role_id");
			tab_info_sql_buffer.append("   and z.biz_id = t.b_id");
			tab_info_sql = tab_info_sql_buffer.toString();
				
			return querySynchList(null,true);
		}
		return querySynchList(null);
	}
	
	/**
	 * 
	 * 通过角色ID查找警务角色更新时间
	 * @param roleId
	 * @return
	 * @throws Exception
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on: Dec 21, 2011
	 */
	
	public String queryRoleBizUpdateDateByRoleId(String roleId)
			throws Exception {
		String sql = "select r.change_date from jw_role r where r.role_id='"+roleId+"'" ;		
		return (String) this.getJdbcTemplate().queryForObject(sql,new LoadRowMaper("change_date"));
	}
	
	/**
	 * 
	 * 获取警务用户的角色ID
	 * @param userAccount：用户账号
	 * @return 用户角色ID
	 * @throws Exception
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on: Dec 27, 2011
	 */
	public String queryRoleIdByUserName(String userAccount) throws Exception{
		String sql = "SELECT JW_ROLE_ID FROM JW_USER WHERE ACCOUNT = '" + userAccount + "'";
		return (String) this.getJdbcTemplate().queryForObject(sql,new LoadRowMaper("JW_ROLE_ID"));
	}
}
