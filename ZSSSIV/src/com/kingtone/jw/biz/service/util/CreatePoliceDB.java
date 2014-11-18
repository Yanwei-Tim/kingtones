package com.kingtone.jw.biz.service.util;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import com.kingtone.jw.service.CommonServer;
import com.kingtone.jw.service.dao.BizDAO;
import com.kingtone.jw.service.dao.ConfDAO;
import com.kingtone.jw.service.dao.SynchDAO;
import com.kingtone.jw.service.domain.SynchEnvelop;

public class CreatePoliceDB {
	public static final String DYNAMIC_MENU = "DYNAMIC_MENU"; // 动态显示的表名

	public static final String ROW_ID = "ROW_ID"; // SqLite表主键
	public static final String TABLE_NAME = "TABLE_NAME"; // 对应表名
	// 以下为TABLE_NAME表中所有字段
	public static final String CLOUMN_ID = "ID";
	public static final String CLOUMN_NAME = "NAME";
	public static final String CLOUMN_TYPE = "TYPE";
	public static final String CLOUMN_SQLDATA = "SQLDATA";
	public static final String CLOUMN_VISIBLE = "VISIBLE";
	public static final String CLOUMN_CODE = "CODE";
	public static final String CLOUMN_DATATYPE = "DATATYPE";
	public static final String CLOUMN_ISNULL = "ISNULL";
	
	public static final String BC_TABLENAME = "BUSINESS_CONFIG";
	public static final String BRC_TABLENAME = "BUSINESS_RES_CONFIG";
	public static final String BR_TABLENAME = "BUSINESS_RELATED";
	public static final String TI_TABLENAME = "TAB_INFO";
	public static final String SRC_TABLENAME = "SYSTEM_RES_CONFIG";
	public static final String SM_TABLENAME = "SYSTEM_MAP";
	public static String IF_NEED_SYNCH="";
	private Statement stat ;
	public static 	SimpleDateFormat format_YYYYmmddhhmmss = new SimpleDateFormat("yyyyMMddHHmmss");
	private BizDAO bizDAO;
	private ConfDAO confDAO;
	private SynchDAO synchDAO;

	public CreatePoliceDB(Statement tstat,BizDAO tbizDAO,ConfDAO tconfDAO){
		this.stat=tstat;this.bizDAO=tbizDAO;this.confDAO=tconfDAO;
	}

	public CreatePoliceDB(Statement tstat,BizDAO tbizDAO,ConfDAO tconfDAO,SynchDAO synchDAO){
		this.stat=tstat;this.bizDAO=tbizDAO;this.confDAO=tconfDAO;this.synchDAO=synchDAO;
	}
	/**
	 * 新增数据
	 * @throws Exception 
	 */
	public void insertSynchMenu() throws Exception{
		SynchEnvelop request = new SynchEnvelop();
		SynchEnvelop synchEnvelop=this.synchDAO.querySynchList(request);
		insertSynchMenu(synchEnvelop);
	}
	/**
	 * 新增数据
	 * @throws Exception 
	 */
	public void insertSynchMenu(SynchEnvelop synchEnvelop) throws Exception {	
		
		/*同步数据*/
		updateSynchDataProcessBiz(synchEnvelop);
	
		//系统资源配置表 SYSTEM_RES_CONFIG
		updateSynchDataProcessRes(synchEnvelop);	
		
		//更新版本号
		updateNeedSynch();
		
		}
	
	//更新版本号
	private void updateNeedSynch() throws SQLException{
		CommonServer cs=new CommonServer();
		IF_NEED_SYNCH=cs.getIfSycn("");
		String sql="update SYSTEM_SYNCH set SYNCH='"+IF_NEED_SYNCH+"'";
		List<HashMap<String, String>> list=getSynchTableData("SYSTEM_SYNCH",null);
		if(list!=null&&list.size()>0){}else sql="insert into SYSTEM_SYNCH (SYNCH) values ('"+IF_NEED_SYNCH+"')";
		stat.execute(sql);
	}
	
	/*删除同步数据*/
	private void deleteSyschInit(String tablename) throws SQLException{
		// 删除现有的数据
		stat.execute("delete from "+tablename);
	
	}
	/*插入同步数据*/
	private void insertSynchInit(String tablename,List<HashMap<String, String>> datalist,String colname,String id){
		this.insertSynchInit(tablename, datalist, colname, id, false);
	}
	/*插入同步数据*/
	private void insertSynchInit(String tablename,List<HashMap<String, String>> datalist,String colname,String id,boolean ifresdata){

		int first=0;
		if(datalist!=null&&datalist.size()>0)
		for (int j = 0; j < datalist.size(); j++) {
			String server_id=null;
			HashMap<String, String> datamap = (HashMap<String, String>) datalist
					.get(j);
			if(datamap.get(colname)!=null){server_id=datamap.get(colname);}
			String cloumnStr = "";
			String valStr = "";
			StringBuffer Strb = new StringBuffer("");
			// 获取表名
			Strb.append("insert into "+tablename+" (");

			for (Iterator<String> it = datamap.keySet().iterator(); it
					.hasNext();) {

				String cloumn = (String) it.next();
				String val = (String) datamap.get(cloumn);				
				cloumnStr = cloumnStr + cloumn + ",";				
				if(val!=null)val=val.trim();
				if(val!=null&&val.indexOf("'")>0)val=val.replace("'", "''");
				if(val==null||val.equals("null")){
					valStr = valStr + "null,";
					}else
				valStr = valStr + "'" + val + "',";
			}
			if((tablename.equals(this.SM_TABLENAME))){
				cloumnStr=cloumnStr+colname;valStr=valStr+"'"+id+"'";
				server_id=id;
				}
			if (cloumnStr != null && cloumnStr.endsWith(",")) {
				cloumnStr = cloumnStr.substring(0,
						cloumnStr.lastIndexOf(","));
			}
			if (valStr != null && valStr.endsWith(",")) {
				valStr = valStr.substring(0,
						valStr.lastIndexOf(","));
			}
			Strb.append(cloumnStr);
			Strb.append(") values (" + valStr + ")");
			try {
				
				if((colname!=null&&server_id!=null&&id!=null&&id.equals(server_id))){
					//System.out.println(tablename+" sql:"+Strb.toString());
					if(first==0)
						stat.execute("delete from "+tablename+" where "+colname+"='"+server_id+"'");
					if(ifresdata)first=1;//对资源数据同步时，只执行一次删除。
					// 写入新的数据
					stat.executeUpdate(Strb.toString());
				}
				if(colname==null&&id==null)stat.execute(Strb.toString());
			} catch (Exception e) {
				//System.out.println("insert synch error:"+e.getMessage());
				e.printStackTrace();
			}
		}

	}
	
	/*获取需同步的数据*/
	public List<HashMap<String, String>> getSynchTableData(
			String tableName, String condition,String orderBy,boolean open) throws SQLException{
		List list=getSynchTableData(tableName, condition, orderBy);
		return list;
	}
	
	/*获取需同步的数据*/
	public List<HashMap<String, String>> getSynchTableData(
			String tableName, String condition) throws SQLException {
		return getSynchTableData(tableName,condition,null);
	}
	/*获取需同步的数据*/
	public List<HashMap<String, String>> getSynchTableData(
			String tableName, String condition,String orderBy) throws SQLException {
		if(condition==null)condition="2=2";
		List<HashMap<String, String>> resList = new ArrayList<HashMap<String, String>>();

		String selection = " 1=1 and " + condition;

		ResultSet rs = stat.executeQuery("select * from "+tableName+" where "+selection+" order by "+orderBy);		

		ResultSetMetaData rsmd = rs.getMetaData();
		HashMap<String, String> datamap;
		while (rs.next()) {
			datamap=new HashMap();
			for(int i =1;i<=rsmd.getColumnCount();i++){
				datamap.put(rsmd.getColumnName(i), rs.getString(i));
			}	
			resList.add(datamap);
		}
		rs.close();
		return resList;
	}
	
	
	/*同步系统资源配置表*/
	public void updateSynchDataProcessRes(SynchEnvelop synchEnvelop) throws Exception{
		String tablename = "SYSTEM_RES_CONFIG";
		String condition = "2=2";
		String tablename_resdata="SYSTEM_MAP";

			List<HashMap<String, String>> serverdatalist=synchEnvelop.getResList();
			for(int i=0;i<serverdatalist.size();i++){
				int n=0;boolean ifupdate=false,ifneedinsert=false;
				List<HashMap<String, String>> datalist=getSynchTableData(tablename,condition);
				if(datalist!=null&&datalist.size()>0){
				for (int j = 0; j < datalist.size(); j++) {
					try{
						
					HashMap<String, String> datamap = (HashMap<String, String>) datalist
							.get(j);
					
					
				if(datamap.get("RES_ID").equals(serverdatalist.get(i).get("RES_ID"))){
					ifupdate=true;
				Date clientTableDate = format_YYYYmmddhhmmss.parse(datamap.get("CHANGE_DATE"));
				Date serverTableDate = format_YYYYmmddhhmmss.parse(serverdatalist.get(i).get("CHANGE_DATE"));
				if (serverTableDate.after(clientTableDate)) {
					
					ifneedinsert=true;
				}
				}else n++;
				
				} catch (Exception e) {
					
					e.printStackTrace();
				}
				
			}
				if(n==(datalist.size())&&ifupdate==false){
					ifneedinsert=true;
				}
		}else ifneedinsert=true;
							
				if(ifneedinsert){
					List insertdata=new ArrayList();
					insertdata.add(serverdatalist.get(i));
					/*同步资源*/
					insertSynchInit(tablename,insertdata,"RES_ID",serverdatalist.get(i).get("RES_ID"));
					/*同步资源数据表*/
					updateSynchResData(tablename_resdata,serverdatalist.get(i).get("SOURCE"),"TYPE",serverdatalist.get(i).get("RES_ID"));
				}
		}
		
	}
	
	/* 获取资源数据 */
	public List<HashMap<String, String>> SynchInitDatebaseResDataStr(String id,String sqlStr) throws Exception {
		String result = bizDAO.querySynchDataStr(id+"split"+sqlStr);
		List<HashMap<String, String>> list=null;
		if(result!=null&&result!=""){
			list=new ArrayList();
			String[] strs=result.split("@#KV#@");
			for(int i=0;i<strs.length;i++){
				HashMap<String, String> hm=new HashMap<String, String>();
				hm.put("KEY", strs[i].substring(strs[i].indexOf("@KEY_@")+6, strs[i].indexOf("@VALUE_@")));
				hm.put("VALUE", strs[i].substring(strs[i].indexOf("@VALUE_@")+8));
				list.add(hm);
			}
		}		
		return list;
	}
	
	/*同步资源数据表*/
	private void updateSynchResData(String tablename,String sqlStr,String colname,String id) throws Exception{		
		List insertdata=this.SynchInitDatebaseResDataStr(id,sqlStr);
		insertSynchInit(tablename,insertdata,colname,id,true);
	}
	
	/*同步业务配置表*/
	public void updateSynchDataProcessBiz(SynchEnvelop synchEnvelop) throws SQLException{
		String tablename = "BUSINESS_CONFIG";
		String condition = "2=2";
		String colname="B_ID";
		List server_b_id_list=new ArrayList();

			List<HashMap<String, String>> serverbizlist=synchEnvelop.getBizList();
			List<HashMap<String, String>> datalist=getSynchTableData(tablename,condition);
			for(int i=0;i<serverbizlist.size();i++){
				
				int n=0;boolean ifupdate=false,ifneedinsert=false;String b_id=null;
				
				b_id=serverbizlist.get(i).get("B_ID");
				if(datalist!=null&&datalist.size()>0){
					 //System.out.println(" android datalist size:"+datalist.size());
				for (int j = 0; j < datalist.size(); j++) {
					try{
						
					HashMap<String, String> datamap = (HashMap<String, String>) datalist
							.get(j);
					
					 //System.out.println(" 1:"+datamap.get("B_ID")+" 2:"+serverbizlist.get(i).get("B_ID")+" 3:"+datamap.get("B_ID").equals(serverbizlist.get(i).get("B_ID")));
				if(datamap.get("B_ID").equals(serverbizlist.get(i).get("B_ID"))){
					ifupdate=true;
					//System.out.println(" c:"+datamap.get("EDIT_RES_DATE")+" s:"+serverbizlist.get(i).get("EDIT_RES_DATE"));
				Date clientTableDate = format_YYYYmmddhhmmss.parse(datamap.get("EDIT_RES_DATE"));
				Date serverTableDate = format_YYYYmmddhhmmss.parse(serverbizlist.get(i).get("EDIT_RES_DATE"));
				if (serverTableDate.after(clientTableDate)) {
					ifneedinsert=true;
				}
				
				}else n++;
				
				if(n==(datalist.size())&&ifupdate==false){
					ifneedinsert=true;
				}
					} catch (Exception e) {
						e.printStackTrace();
					}
					}
				}else
					ifneedinsert=true;
				
				if(ifneedinsert){
				List insertdata=new ArrayList();
				tablename = "BUSINESS_CONFIG";
				insertdata.add(serverbizlist.get(i));
				insertSynchInit(tablename,insertdata,colname,b_id);
				
				//业务资源配置 Business_res_config
				insertdata=synchEnvelop.getBizComponentList();	
				 tablename = "BUSINESS_RES_CONFIG";
				//deleteSyschInit(tablename);
				if (insertdata != null && insertdata.size() > 0) {
					insertSynchInit(tablename,insertdata,colname,b_id,true);
					}

				//业务关联表 Business_related
				insertdata=synchEnvelop.getBizRelateList();	
				tablename = "BUSINESS_RELATED";
				//deleteSyschInit(tablename);
				if (insertdata != null && insertdata.size() > 0) {
					insertSynchInit(tablename,insertdata,colname,b_id,true);
					}
				
				//选项卡信息表 TAB_INFO
				insertdata=synchEnvelop.getSelCardList();	
				tablename = "TAB_INFO";
				//deleteSyschInit(tablename);
				if (insertdata != null && insertdata.size() > 0) {
					insertSynchInit(tablename,insertdata,colname,b_id,true);
					}
				}
				
		}	
	}
	
}
