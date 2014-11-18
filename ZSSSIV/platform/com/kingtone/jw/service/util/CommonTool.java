package com.kingtone.jw.service.util;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import com.kingtone.jw.service.bs.apk.ApkCheckBS;
import com.kingtone.jw.service.bs.login.LoginBS;
import com.kingtone.jw.service.control.ControlService;
import com.kingtone.jw.service.dao.ContactsDAO;
import com.kingtone.jw.service.dao.AttachDAO;
import com.kingtone.jw.service.dao.BizDAO;
import com.kingtone.jw.service.dao.ConfDAO;
import com.kingtone.jw.service.dao.GpsDAO;
import com.kingtone.jw.service.dao.LogDAO;
import com.kingtone.jw.service.dao.LoginDAO;
import com.kingtone.jw.service.dao.OaPermissionDAO;
import com.kingtone.jw.service.dao.PlatDAO;
import com.kingtone.jw.service.dao.SynchDAO;
import com.kingtone.jw.service.dao.TztgListDAO;
import com.kingtone.jw.service.domain.InsertEnvelop;
import com.kingtone.jw.service.domain.QueryEnvelop;
import com.kingtone.jw.service.face.service.FaceService;
import com.kingtone.jw.service.law.LawService;
import com.kingtone.ssi.contextloader.SSIApplicationContext;

public class CommonTool {
	public static BizDAO bizDAO = (BizDAO) SSIApplicationContext.getContext().getBean("bizDAO");
	public static ConfDAO confDAO = (ConfDAO) SSIApplicationContext.getContext().getBean("confDAO");
	public static PlatDAO platDAO = (PlatDAO) SSIApplicationContext.getContext().getBean("platDAO");
	public static LogDAO logDAO = (LogDAO) SSIApplicationContext.getContext().getBean("logDAO");
	public static GpsDAO gpsDAO=(GpsDAO) SSIApplicationContext.getContext().getBean("gpsDAO");
	//同步操作
	public static SynchDAO synchDAO=(SynchDAO) SSIApplicationContext.getContext().getBean("synchDAO");
	//附件相关操作
	public static AttachDAO attachDAO=(AttachDAO) SSIApplicationContext.getContext().getBean("attachDAO");	
	public static OaPermissionDAO oaPermissionDAO =(OaPermissionDAO)SSIApplicationContext.getContext().getBean("oaPermissionDAO");
	
	public static ApkCheckBS apkCheckBS=(ApkCheckBS) SSIApplicationContext.getContext().getBean("apkCheckBS");
	
	// Add by 陈萧如 2012-01-04 start
	public static LoginDAO loginDAO=(LoginDAO) SSIApplicationContext.getContext().getBean("loginDAO");
	public static LoginBS loginBS=(LoginBS) SSIApplicationContext.getContext().getBean("loginBS");

	// Add by 陈萧如 2012-01-04 end
	
	//add by yangzm for 通讯录
	public static ContactsDAO contactsDAO = (ContactsDAO) SSIApplicationContext.getContext().getBean("contactsDAO");
	
	//add by yangzm for face
	public static FaceService faceService = (FaceService) SSIApplicationContext.getContext().getBean("faceService");
	
	//add by yangzm for newLaw
	public static LawService lawService = (LawService) SSIApplicationContext.getContext().getBean("lawService");
	
	//add by ylp for control
	public static ControlService controlService = (ControlService) SSIApplicationContext.getContext().getBean("controlService");
	
	public static TztgListDAO tztgListDAO=(TztgListDAO) SSIApplicationContext.getContext().getBean("tztgListDAO");
//	public static TztgBS tztgBS=(TztgBS) SSIApplicationContext.getContext().getBean("tztgBS");
	
	//system_map系统代码表
	public static Map codeMap = new HashMap();
	//column_map列映射信息
	public static Map colMap = new HashMap();
	//system_res_config业务代码表
	public static Map resMap = new HashMap();
	//column_map列映射信息c_column->columns
	public static Map cColumnMap =new HashMap();
	public static Map dColumnMap =new HashMap();
	public static Map pnMap =new HashMap();
	public static String codeSql = "select distinct type from system_map t";
	public static String codeSql2 = "select * from system_map t where 1=1 ";
	//加载列映射信息SQL语句
	public static final String colSql = "select distinct b_id from column_map t ";
	public static final String colSql2 = "select columns from column_map t where 1=1 ";
	public static final String colSql3 = "select * from column_map t where 1=1 ";
	public static final String colSql4="select c_column from column_map t where 1=1 ";
	public static final String colSql5="select d_column from column_map t where 1=1 ";
	
	public static final String pnSql="select distinct account from ssi_user_m_message t where 1=1 ";
	//加载代码表信息SQL语句
	public static final String resSortSql = "select res_id,source,ds from system_res_config where 1=1 ";
	//根据业务id获取业务sql语句
//	public static final String bizSql = "select l_sql from business_config where 1=1 ";
//	public static final String bizSql2 = "select d_sql from business_config where 1=1 ";
	
	/*SOCKET服务*/
	public static int socketport = 9000;	
	/*压缩图片文件夹*/
	public static String IMGFILEPATH="C:\\simpleimg\\";
//	public static String IMGFILEPATH="C:\\";
	/*压缩图片尺寸*/
	public static int IMGWIDTH=320;
	
	/**
	 * Description:拼存储过程调用语句
	 * call test(?,?)
	 * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
	 * Date: Jul 15, 2011
	 * @param name
	 * @param num
	 * @return
	 */
	public static String getPlSql(String name,int num){
		String sql = "{call "+name+"(?";
		for(int i=0;i<num;i++){
			sql+=",?";
		}
		sql+=")}";
		return sql;
	}
	/**
	 * Description:获取总页数
	 * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
	 * Date: Jul 18, 2011
	 * @param totalSize
	 * @param pageSize
	 * @param pageNum
	 * @return
	 */
	public static int getTotalPage(int totalSize,int pageSize,int pageNum){
		int totalPage = 0;
		if(totalSize==0){//总记录为0
			totalPage = 0;
		}else{//总记录不为0
			if(pageNum!=-1){//分页
				totalPage = (totalSize%pageSize!=0)?(totalSize/pageSize+1):totalSize/pageSize;
			}else{//不分页
				totalPage = 1;
			}
		}
		return totalPage; 
	}
	/**
	 * Description:获取带分页的sql
	 * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
	 * Date: Jul 18, 2011
	 * @param sql
	 * @param pageNum
	 * @param totalPage
	 * @param totalSize
	 * @param pageSize
	 * @return
	 */
	public static String getPageSql(String sql,int pageNum,int totalPage,int totalSize,int pageSize){
		int startRow = 0;
		int endRow = 0;
		if(pageNum != -1){
			if(pageNum>0 && pageNum<totalPage){
				endRow = pageNum*pageSize;
				startRow =endRow - pageSize;
			}else if(pageNum==totalPage){
				endRow = totalSize;
				startRow = (pageNum-1)* pageSize;
			}
			
			sql = CommonTool.generatePagingSql(sql,startRow,pageSize);
		}
		return sql;
	}
	//适用于sqlserver2000有待改进
	public static String generatePagingSql2(String sql,int start,int limit){
		StringBuffer sqlBuffer = new StringBuffer();
//		SELECT TOP limit * FROM TABLE1
//		WHERE c1 NOT IN(SELECT TOP (pageNum-1)*limit c1 FROM 
//		(SELECT * FROM table1 where c1 is not null)as tab1
//		)
		return sqlBuffer.toString();
	}
	public static String generatePagingSql(String sql,int start,int limit){
		return new StringBuffer("SELECT * FROM ( SELECT T.*, ROWNUM NUM FROM (").append(sql).append(
		") T WHERE ROWNUM <= ").append(start + limit).append(
		" ) TT  WHERE TT.NUM > ").append(start).toString();
	}
	/**
	 * Description:代码表列值转换 例如 将列值为0、1转换为男、女
	 * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
	 * Date: Jul 12, 2011
	 * @param bizId 业务标识
	 * @param colName 系统列名
	 * @param colValue 系统列值
	 * @return 转换后的列值
	 */
	//TODO BUG
	public static String getCodeValue(String bizId,String colName,String colValue){
		colValue = colValue==null?"":colValue;
		String value = colValue;
		Map colMap = (HashMap) CommonTool.colMap.get(bizId);
		if(colMap!=null){
			Map colMap2 = (HashMap) colMap.get(colName);
			if(colMap2!=null){
				String is_Res = (String) colMap2.get("IS_RES");
				String res_id = (String) colMap2.get("RES_ID");
				if("1".equals(is_Res)){
					Map resMap = (HashMap) CommonTool.resMap.get(res_id);
					if(resMap!=null){
						if(colValue.contains(",")){
							String [] colValues = colValue.split(",");
							String newValue = " ";
							for(int i=0;i<colValues.length;i++){
								String v = (String) resMap.get(colValues[i]);
								if(v!=null){
									newValue+=v;
									newValue+=",";
								}
							}
							value=newValue.substring(0, newValue.length()-1).trim();
						}else{
							String newValue = (String) resMap.get(colValue);
							if(newValue!=null)
								value = newValue;
						}
					}
				}
			}
		}
		return value;
	}
	
	
//	public static String getFilterSql(String filter,String bizId){
//		String[] filters = filter.replaceAll(" ", "").split(",");
//		Map map = (HashMap) CommonTool.colMap.get(bizId);
//		if(map!=null){
//			for(int i=0;i<filters.length;i++){
//				Map cmap = (HashMap) map.get(filters[i]);
//				if(cmap!=null){
//					String c_type = (String) cmap.get("CNAME_TYPE");
//					String c_name = (String) cmap.get("C_COLUMN");
//					if("CHAR_DATE".equals(c_type)){
//						c_name = " to_date("+c_name+",'YYYY-MM-DD') ";
//					}else if("CHAR_TIMESTAMP".equals(c_type)){
//						c_name = " to_date("+c_name+",'YYYY-MM-DD HH24:MI:SS') ";
//					}
//					if(c_name!=null)
//						filters[i] = c_name+" "+filters[i]; 
//				}
//			}
//		}
//		String retStr = "";
//		for(int j=0;j<filters.length;j++){
//			retStr+=","+filters[j];
//		}
//		return " "+retStr.substring(1)+" ";
//	}
	/**
	 * Description:此方法主要将字符串日期数据转换为"XX年XX月XX日 "
	 * Author: tony
	 * 
	 */
	public static String getFilterSql(String filter,String bizId){
		String[] filters = filter.replaceAll(" ", "").split(",");
		Map map = (HashMap) CommonTool.colMap.get(bizId);
		if(map!=null){
			for(int i=0;i<filters.length;i++){
				Map cmap = (HashMap) map.get(filters[i]);
				if(cmap!=null){
					String c_type = (String) cmap.get("CNAME_TYPE");
					String c_name = (String) cmap.get("C_COLUMN");
					if("CHAR_DATE".equals(c_type)){
//						c_name = " DATEPART(yy,"+c_name+")||'年'||DATEPART(mm,"+c_name+")||'月'||DATEPART(dd,"+c_name+")||'日' ";
						c_name = " SUBSTR("+c_name+",1,4)||'年'||SUBSTR("+c_name+",5,2)||'月'||SUBSTR("+c_name+",7,2)||'日' ";
					}else if("CHAR_TIMESTAMP".equals(c_type)){
//						c_name = " DATEPART(yy,"+c_name+")||'年'||DATEPART(mm,"+c_name+")||'月'||DATEPART(dd,"+c_name+")||'日 '||DATEPART(hh,"+c_name+")||'时'||DATEPART(mi,"+c_name+")||'分'||DATEPART(ss,"+c_name+")||'秒' ";
						c_name = " SUBSTR("+c_name+",1,4)||'年'||SUBSTR("+c_name+",5,2)||'月'||SUBSTR("+c_name+",7,2)||'日 '||SUBSTR("+c_name+",9,2)||'时'||SUBSTR("+c_name+",11,2)||'分'||SUBSTR("+c_name+",13,2)||'秒' ";
					}else if("TIMESTAMP".equals(c_type)){
						c_name = " to_char("+c_name+",'YYYY-MM-DD HH24:MI:SS') ";
					}
					if(c_name!=null)
						filters[i] = c_name+" "+filters[i]; 
				}
			}
		}
		String retStr = "";
		for(int j=0;j<filters.length;j++){
			retStr+=","+filters[j];
		}
		return " "+retStr.substring(1)+" ";
	}
	/**
	 * Description:根据列映射表中的信息：转换列名、转换操作符、转换列值 
	 * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
	 * Date: Jul 12, 2011
	 * @param bizId 业务标识
	 * @param colName 系统列名
	 * @param colValue 系统列值
	 * @return 拼成的sql语句
	 */
	public static String getQueryCondSql(String sql,QueryEnvelop request){
		Map map = request.getCondition();
		Set<Object> keys = map.keySet();
		for(Object o:keys){
			String k = o.toString();		
			String v = (String) map.get(k);
			//绑定数据 列名转换/操作符转换/列类型转换  代码表转换/
			if(sql.indexOf("#"+k+"#")!=-1){
				sql = sql.replace("#"+k+"#", CommonTool.getQueryCondSql(request.getBizTag(),k,v));
			}
		} 
		//清除未绑定的标记符
		sql = sql.replaceAll("#\\w+#", "");
		return sql;
	}
	//TODO BUG
	public static String getQueryCondSql(String bizId,String colName,String colValue){
		String cname = colName;
		String cvalue = " '"+colValue+"' ";
		String coper = " = ";
		Map colMap = (HashMap) CommonTool.colMap.get(bizId);
		if(colMap!=null){
			Map colMap2 = (HashMap) colMap.get(colName);
			if(colMap2!=null){
				String c_name = (String) colMap2.get("C_COLUMN");
				String c_type = (String) colMap2.get("CNAME_TYPE");
				String c_op = (String) colMap2.get("OP");
				
				if(c_name!=null)
					cname = c_name;
				if(c_op!=null){
					coper = c_op;
					if("like".equals(c_op.toLowerCase())){
						cvalue = "'%"+colValue+"%'";
					}else if("num_between".equals(c_op.toLowerCase())){
						coper = " between ";
						cvalue = colValue.split(",")[0]+" and "+colValue.split(",")[1];
						if("NUMBER".equals(c_type)){
							
						}else if("DATE".equals(c_type) || "TIMESTAMP".equals(c_type)){
							cname = " (trunc(months_between(sysdate,"+cname+") / 12)) ";
						}else if("CHAR_DATE".equals(c_type)){
							cname = " to_date("+cname+",'YYYY-MM-DD') ";
							cname = " (trunc(months_between(sysdate,"+cname+") / 12)) ";
						}else if("CHAR_TIMESTAMP".equals(c_type)){
							cname = " to_date("+cname+",'YYYY-MM-DD HH24:MI:SS') ";
							cname = " (trunc(months_between(sysdate,"+cname+") / 12)) ";
						}
					}else if("date_between".equals(c_op.toLowerCase())){
						coper = " between ";
						if("NUMBER".equals(c_type)){
							cvalue = colValue.split(",")[0]+" and "+colValue.split(",")[1];
						}else if("DATE".equals(c_type)){
							cvalue = " to_date('"+colValue.split(",")[0]+"','YYYY-MM-DD') and to_date('"+colValue.split(",")[1]+"','YYYY-MM-DD') ";
						}else if("TIMESTAMP".equals(c_type)){
							cvalue = " to_date('"+colValue.split(",")[0]+"','YYYY-MM-DD HH24:MI:SS') and to_date('"+colValue.split(",")[1]+"','YYYY-MM-DD HH24:MI:SS') ";
						}else if("CHAR_DATE".equals(c_type)){
							cname = " to_date("+cname+",'YYYY-MM-DD') ";
							cvalue = " to_date('"+colValue.split(",")[0]+"','YYYY-MM-DD') and to_date('"+colValue.split(",")[1]+"','YYYY-MM-DD') ";
						}else if("CHAR_TIMESTAMP".equals(c_type)){
							cname = " to_date("+cname+",'YYYY-MM-DD HH24:MI:SS') ";
							cvalue = " to_date('"+colValue.split(",")[0]+"','YYYY-MM-DD HH24:MI:SS') and to_date('"+colValue.split(",")[1]+"','YYYY-MM-DD HH24:MI:SS') ";
						}
					}else{
						if("NUMBER".equals(c_type)){
							cvalue = colValue;
						}else if("DATE".equals(c_type)){
							cvalue = " to_date('"+colValue+"','YYYY-MM-DD') ";
						}else if("TIMESTAMP".equals(c_type)){
							cvalue = " to_date('"+colValue+"','YYYY-MM-DD HH24:MI:SS') ";
						}else if("CHAR_DATE".equals(c_type)){
							cname = " to_date("+cname+",'YYYY-MM-DD') ";
							cvalue = " to_date('"+colValue+"','YYYY-MM-DD') ";
						}else if("CHAR_TIMESTAMP".equals(c_type)){
							cname = " to_date(SUBSTR("+cname+",0,8),'YYYY-MM-DD') ";
							cvalue = " to_date('"+colValue+"','YYYY-MM-DD') ";
						}
					}
				}else{
					if("CHAR_DATE".equals(c_type)){
						cname = " to_date("+cname+",'YYYY-MM-DD') ";
						cvalue = " to_date('"+colValue+"','YYYY-MM-DD') ";
					}else if("CHAR_TIMESTAMP".equals(c_type)){
						cname = " to_date(SUBSTR("+cname+",0,8),'YYYY-MM-DD') ";
						cvalue = " to_date('"+colValue+"','YYYY-MM-DD') ";
					}
				}
//				if(c_type!=null){
//					if("NUMBER".equals(c_type)){
//						if("num_between".equals(c_op.toLowerCase())){
//							return " and ("+cname+" between "+colValue.split(",")[0]+" and "+colValue.split(",")[1]+" ) ";
//						}if("date_between".equals(c_op.toLowerCase())){
//							return " and ("+cname+" between "+colValue.split(",")[0]+" and "+colValue.split(",")[1]+" ) ";
//						}else{
//							cvalue = colValue;
//						}
//					}else if("DATE".equals(c_type)){
//						if("date_between".equals(c_op.toLowerCase())){
//							return " and ("+cname+" between to_date('"+colValue.split(",")[0]+"','YYYY-MM-DD') and to_date('"+colValue.split(",")[1]+"','YYYY-MM-DD') ) ";
//						}else if("num_between".equals(c_op.toLowerCase())){
//							return " and (trunc(months_between(sysdate,"+cname+") / 12) between "+colValue.split(",")[0]+" and "+colValue.split(",")[1]+") ";
//						}else{
//							cvalue = "to_date('"+colValue+"','YYYY-MM-DD')";
//						}
//					}else if("TIMESTAMP".equals(c_type)){
//						if("date_between".equals(c_op.toLowerCase())){
//							return " and ("+cname+" between to_date('"+colValue.split(",")[0]+"','YYYY-MM-DD HH24:MI:SS') and to_date('"+colValue.split(",")[1]+"','YYYY-MM-DD HH24:MI:SS') ) ";
//						}else if("num_between".equals(c_op.toLowerCase())){
//							return " and (trunc(months_between(sysdate,"+cname+") / 12) between "+colValue.split(",")[0]+" and "+colValue.split(",")[1]+") ";
//						}else{
//							cvalue = "to_date('"+colValue+"','YYYY-MM-DD HH24:MI:SS')";
//						}
//					}
//				}
			}
		}
		String sql = " and "+cname+" "+coper+" "+cvalue;
		return sql;
	}
	//适用于SqlServer数据库
	public static String getQueryCondSql2(String bizId,String colName,String colValue){
		String cname = colName;
		String cvalue = " '"+colValue+"' ";
		String coper = " = ";
		Map colMap = (HashMap) CommonTool.colMap.get(bizId);
		if(colMap!=null){
			Map colMap2 = (HashMap) colMap.get(colName);
			if(colMap2!=null){
				//获取列映射信息
				String c_name = (String) colMap2.get("C_COLUMN");
				String c_type = (String) colMap2.get("CNAME_TYPE");
				String c_op = (String) colMap2.get("OP");
				if(c_name!=null && c_type!=null && c_op!=null){
					if("like".equals(c_op.toLowerCase())){
						cname = c_name;
						coper = c_op;
						cvalue = "'%"+colValue+"%'";
					}else if("num_between".equals(c_op.toLowerCase())){//包括number类型和各种时间类型（字符串时间）
						if("number".equals(c_type.toLowerCase())){
							cname = c_name;
							coper = " between ";
							cvalue = colValue.split(",")[0]+" and "+colValue.split(",")[1];
						}else{
							cname = " DATEPART(yy,"+c_name+") ";
							coper = " between ";
							cvalue = " '"+colValue.split(",")[0]+"' and '"+colValue.split(",")[1]+"' ";
						}
					}else if("date_between".equals(c_op.toLowerCase())){
						cname = c_name;
						coper = " between ";
						cvalue = " '"+colValue.split(",")[0]+"' and '"+colValue.split(",")[1]+"' ";
					}else{
						if("number".equals(c_type.toLowerCase())){
							cname = c_name;
							coper = c_op;
							cvalue = colValue;
						}
					}
				}
			}
		}
		String sql = " and "+cname+" "+coper+" "+cvalue;
		return sql;
	}
	
//	CHAR(8) 20081223
//	CHAR(14) 19920921123256
//	DATE         2008-10-15 13:36:23

	//2011-08-13 备份-------------添加between之前的
//	public static String getQueryCondSql(String bizId,String colName,String colValue){
//		String cname = colName;
//		String cvalue = " '"+colValue+"' ";
//		String coper = " = ";
//		Map colMap = (HashMap) CommonTool.colMap.get(bizId);
//		if(colMap!=null){
//			Map colMap2 = (HashMap) colMap.get(colName);
//			if(colMap2!=null){
//				String c_name = (String) colMap2.get("C_COLUMN");
//				String c_type = (String) colMap2.get("CNAME_TYPE");
//				String c_op = (String) colMap2.get("OP");
//				
//				if(c_name!=null)
//					cname = c_name;
//				if(c_op!=null){
//					coper = c_op;
//					if("like".equals(c_op.toLowerCase())){
//						cvalue = "'%"+colValue+"%'";
//					}
//				}
//				if(c_type!=null){
//					if("NUMBER".equals(c_type)){
//						cvalue = colValue;
//					}else if("DATE".equals(c_type)){
//						cvalue = "to_date('"+colValue+"','YYYY-MM-DD')";
//					}else if("TIMESTAMP".equals(c_type)){
//						cvalue = "to_date('"+colValue+"','YYYY-MM-DD HH24:MI:SS')";
//					}
//				}
//			}
//		}
//		String sql = " and "+cname+" "+coper+" "+cvalue;
//		return sql;
//	}
	
	/**
	 * Description:根据列映射表中的信息：转换列名、转换操作符、转换列值 
	 * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
	 * Date: Jul 12, 2011
	 * @param bizId 业务标识
	 * @param colName 系统列名
	 * @param colValue 系统列值
	 * @return 拼成的sql语句
	 */
	public static String getInsertCondSql(String sql,InsertEnvelop request){
		Map map = request.getDetail();
		if(Constsants.getCJmap(request.getBizTag())){
			map.put("CJSJ", DateTool.getDataTime());
			map.put("RKSJ", DateTool.getDataTime());
			map.put("PCRQ", DateTool.getDataTime());
			map.put("PCSJ", DateTool.getDataTime());
			map.put("HFSJ", DateTool.getDataTime());
			map.put("DJSJ", DateTool.getDataTime());
			map.put("HFSJ", DateTool.getDataTime());
			
		}
		Set set = map.keySet();
		for(Object o:set){
			String k = o.toString();		
			String v = (String) map.get(k);
			//绑定数据 列名转换 类型转换
			sql = sql.replace("#"+k+"#", CommonTool.getInsertCondSql(request.getBizTag(),k,v));
		}
		return sql;
	}
	public static String getInsertCondSql(String bizId,String colName,String colValue){
		String cvalue = " '"+colValue+"' ";
		Map colMap = (HashMap) CommonTool.colMap.get(bizId);
		if(colMap!=null){
			Map colMap2 = (HashMap) colMap.get(colName);
			if(colMap2!=null){
				String c_type = (String) colMap2.get("CNAME_TYPE");
				if(c_type!=null){
					if("NUMBER".equals(c_type)){
						cvalue = colValue;
					}else if("DATE".equals(c_type)){
//						cvalue = "'"+colValue+"'";
						cvalue = "to_date('"+colValue+"','YYYY-MM-DD HH24:MI:SS')";
					}else if("TIMESTAMP".equals(c_type)){
//						cvalue = "'"+colValue+"'";
						cvalue = "to_date('"+colValue+"','YYYY-MM-DD HH24:MI:SS')";
					}
				}
			}
		}
		String sql = cvalue;
		return sql;
	}
	
	public static String getDragonQueryCondSql(String sql,QueryEnvelop request){
		Map map = request.getCondition();
		Set<Object> keys = map.keySet();
		for(Object o:keys){
			String k = o.toString();		
			String v = (String) map.get(k);
			//绑定数据 列名转换/操作符转换/列类型转换  代码表转换/
			if(sql.indexOf("#"+k+"#")!=-1){
				sql = sql.replace("#"+k+"#", CommonTool.getDragonQueryCondSql(request.getBizTag(),k,v));
			}
		} 
		//清除未绑定的标记符
		sql = sql.replaceAll("#\\w+#", "");
		return sql;
	}
	
	public static String getDragonQueryCondSql(String bizId,String colName,String colValue){
		String dname = colName;
		String value = " '"+colValue+"' ";
		String oper = " = ";
		Map colMap = (HashMap) CommonTool.colMap.get(bizId);
		if(colMap!=null){
			Map colMap2 = (HashMap) colMap.get(colName);
			if(colMap2!=null){
				String d_name = (String) colMap2.get("C_COLUMN");
				String d_type = (String) colMap2.get("CNAME_TYPE");
				String op = (String) colMap2.get("OP");
				if(d_name!=null)
					dname = d_name;
				if(op!=null){
					oper = op;
					if("like".equals(op.toLowerCase())){
						value = "'%"+colValue+"%'";
					}else if("num_between".equals(op.toLowerCase())){
						/**处理年龄段**/
						if("NLD".equals(colName.toUpperCase())){
							dname = "to_number(CSRQ)";
							oper = " between ";
							value = "to_number(to_char(add_months(sysdate,-12*"+colValue.split(",")[1]+"),'YYYYmmdd')) and "+
							"to_number(to_char(add_months(sysdate,-12*"+colValue.split(",")[0]+"),'YYYYmmdd'))";
						/**处理年龄段**/
						}else{
							oper = " between ";
							value = colValue.split(",")[0]+" and "+colValue.split(",")[1];
							if("NUMBER".equals(d_type)){
								
							}else if("DATE".equals(d_type) || "TIMESTAMP".equals(d_type)){
								dname = " (trunc(months_between(sysdate,"+dname+") / 12)) ";
							}else if("CHAR_DATE".equals(d_type)){
								dname = " to_date("+dname+",'YYYY-MM-DD') ";
								dname = " (trunc(months_between(sysdate,"+dname+") / 12)) ";
							}else if("CHAR_TIMESTAMP".equals(d_type)){
								dname = " to_date("+dname+",'YYYY-MM-DD HH24:MI:SS') ";
								dname = " (trunc(months_between(sysdate,"+dname+") / 12)) ";
							}
						}
						
					}else if("date_between".equals(op.toLowerCase())){
						oper = " between ";
						if("NUMBER".equals(d_type)){
							value = colValue.split(",")[0]+" and "+colValue.split(",")[1];
						}else if("DATE".equals(d_type)){
							value = " to_date('"+colValue.split(",")[0]+"','YYYY-MM-DD') and to_date('"+colValue.split(",")[1]+"','YYYY-MM-DD') ";
						}else if("TIMESTAMP".equals(d_type)){
							value = " to_date('"+colValue.split(",")[0]+"','YYYY-MM-DD HH24:MI:SS') and to_date('"+colValue.split(",")[1]+"','YYYY-MM-DD HH24:MI:SS') ";
						}else if("CHAR_DATE".equals(d_type)){
							dname = " to_date("+dname+",'YYYY-MM-DD') ";
							value = " to_date('"+colValue.split(",")[0]+"','YYYY-MM-DD') and to_date('"+colValue.split(",")[1]+"','YYYY-MM-DD') ";
						}else if("CHAR_TIMESTAMP".equals(d_type)){
							dname = " to_date("+dname+",'YYYY-MM-DD HH24:MI:SS') ";
							value = " to_date('"+colValue.split(",")[0]+"','YYYY-MM-DD HH24:MI:SS') and to_date('"+colValue.split(",")[1]+"','YYYY-MM-DD HH24:MI:SS') ";
						}
					}else{
						if("NUMBER".equals(d_type)){
							value = colValue;
						}else if("DATE".equals(d_type)){
							value = " to_date('"+colValue+"','YYYY-MM-DD') ";
						}else if("TIMESTAMP".equals(d_type)){
							value = " to_date('"+colValue+"','YYYY-MM-DD HH24:MI:SS') ";
						}else if("CHAR_DATE".equals(d_type)){
							dname = " to_date("+dname+",'YYYY-MM-DD') ";
							value = " to_date('"+colValue+"','YYYY-MM-DD') ";
						}else if("CHAR_TIMESTAMP".equals(d_type)){
							dname = " to_date(SUBSTR("+dname+",0,8),'YYYY-MM-DD') ";
							value = " to_date('"+colValue+"','YYYY-MM-DD') ";
						}
					}
				}else{
					if("CHAR_DATE".equals(d_type)){
						String [] data = colValue.split("-");
						String year = data[0];
						String month = data[1];
						String day = data[2];
						if(Integer.parseInt(month)<10){
							month = "0"+month;
						}
						if(Integer.parseInt(day)<10){
							day = "0"+day;
						}
						value = "'"+year+month+day+"'";
					}else if("CHAR_TIMESTAMP".equals(d_type)){
						dname = " to_date(SUBSTR("+dname+",0,8),'YYYY-MM-DD') ";
						value = " to_date('"+colValue+"','YYYY-MM-DD') ";
					}
				}
//				if(c_type!=null){
//					if("NUMBER".equals(c_type)){
//						if("num_between".equals(c_op.toLowerCase())){
//							return " and ("+cname+" between "+colValue.split(",")[0]+" and "+colValue.split(",")[1]+" ) ";
//						}if("date_between".equals(c_op.toLowerCase())){
//							return " and ("+cname+" between "+colValue.split(",")[0]+" and "+colValue.split(",")[1]+" ) ";
//						}else{
//							cvalue = colValue;
//						}
//					}else if("DATE".equals(c_type)){
//						if("date_between".equals(c_op.toLowerCase())){
//							return " and ("+cname+" between to_date('"+colValue.split(",")[0]+"','YYYY-MM-DD') and to_date('"+colValue.split(",")[1]+"','YYYY-MM-DD') ) ";
//						}else if("num_between".equals(c_op.toLowerCase())){
//							return " and (trunc(months_between(sysdate,"+cname+") / 12) between "+colValue.split(",")[0]+" and "+colValue.split(",")[1]+") ";
//						}else{
//							cvalue = "to_date('"+colValue+"','YYYY-MM-DD')";
//						}
//					}else if("TIMESTAMP".equals(c_type)){
//						if("date_between".equals(c_op.toLowerCase())){
//							return " and ("+cname+" between to_date('"+colValue.split(",")[0]+"','YYYY-MM-DD HH24:MI:SS') and to_date('"+colValue.split(",")[1]+"','YYYY-MM-DD HH24:MI:SS') ) ";
//						}else if("num_between".equals(c_op.toLowerCase())){
//							return " and (trunc(months_between(sysdate,"+cname+") / 12) between "+colValue.split(",")[0]+" and "+colValue.split(",")[1]+") ";
//						}else{
//							cvalue = "to_date('"+colValue+"','YYYY-MM-DD HH24:MI:SS')";
//						}
//					}
//				}
			}
		}
		String sql = " and "+dname+" "+oper+" "+value;
		return sql;
	}
}
