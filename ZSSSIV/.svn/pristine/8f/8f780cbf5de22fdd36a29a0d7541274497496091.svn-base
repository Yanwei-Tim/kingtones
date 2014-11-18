package com.kingtone.jw.biz.service.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import com.kingtone.jw.service.dao.BizDAO;
import com.kingtone.jw.service.dao.ConfDAO;

public class DataBaseHelper{

	/* 当表不存在时创建快捷菜单表 */
	private String CREATE_TABLE = 
		 "CREATE TABLE IF NOT EXISTS SHORTCUT_MENU " +
		 "(id   integer PRIMARY KEY AUTOINCREMENT," +
		 " name varchar(30)," +
		 " icon integer," +
		 " link varchar(30)," +
		 " visible integer)";
	/* 创建系统配置表*/
	private String CREATE_XTPZ_TABLE=
		 "CREATE TABLE IF NOT EXISTS XTPZ_TAB " +
		 "(id   varchar(10) PRIMARY KEY AUTOINCREMENT," +
		 " page varchar(30)," +
		 " port integer," +
		 " number integer)";
	
	/* 当表不存在时创建动态菜单表 */
	private String CREATE_TABLE_MENU = 
		 "CREATE TABLE IF NOT EXISTS DYNAMIC_MENU " +
		 "(row_id   integer PRIMARY KEY AUTOINCREMENT," +
		 " TABLENAME varchar(30)," +
		 " ID integer," +
		 " NAME varchar(50)," +
		 " TYPE varchar(30)," +
		 " SQLDATA varchar(30)," +
		 " VISIBLE integer," +
		 " CODE varchar(30)," +
		 " DATATYPE varchar(50)," +
		 " ISBENULL integer )";
	
	/* 当表不存在时创建动态列表 */
	private String CREATE_TABLE_LIST = 
		 "CREATE TABLE IF NOT EXISTS DYNAMIC_LIST " +
		 "(row_id   integer PRIMARY KEY AUTOINCREMENT," +
		 " TABLENAME varchar(30)," +
		 " ID integer," +
		 " NAME varchar(50)," +
		 " VISIBLE integer," +
		 " CODE varchar(60)," +
		 " TEXTLENGTH integer )";
	
	/* 当表不存在时创建 更新表 */
	private String CREATE_TABLE_UPDATE = 
		" CREATE TABLE IF NOT EXISTS CHECK_UPDATE "+
		" (ID   integer PRIMARY KEY AUTOINCREMENT,"+
		"  TABLENAME   VARCHAR(50) not null,"+
		"  ISUPDATE    integer,"+
		"  VERSIONTIME DATETIME)";
	
	/* 当表不存在时创建业务配置表 BUSINESS_CONFIG*/
	private String CREATE_TABLE_BIZ = 
		 "CREATE TABLE IF NOT EXISTS BUSINESS_CONFIG " +
		 "(" +
		 " B_ID varchar(50) PRIMARY KEY," +
		 " B_NAME varchar(50)," +
		 " B_TYPE varchar(1)," +
		 " IMG_NAME varchar(30)," +
		 " L_SIMPLE_ITEMS varchar(100)," +
		 " D_SIMPLE_ITEMS varchar(1000)," +
		 " B_SQL varchar(10)," +
		 " FATHER_ID varchar(50)," +
		 " FINAL_NODE varchar(10)," +
		 " EDIT_RES_DATE varchar(14)," +
		 " B_ORDERS integer," +
		 " DS varchar(100)," +
		 " VALIDATE_RES varchar(1000)," +
		 " VALIDATE_DES varchar(1000))";
	
	/* 当表不存在时创建业务资源配置 BUSINESS_RES_CONFIG*/
	private String CREATE_TABLE_BIZCOMPONET = 
		 "CREATE TABLE IF NOT EXISTS BUSINESS_RES_CONFIG " +
		 "(" +
		 " W_ID integer," +
		 " B_ID varchar(50)," +
		 " NAME varchar(50)," +
		 " TYPE varchar(30)," +
		 " RES_ID varchar(50)," +
		 " VISIBLE integer," +
		 " VALIDATE_TYPE varchar(2)," +
		 " VALIDATE_DES varchar(255)," +
		 " CODE varchar(30)," +
		 " DATATYPE varchar(50)," +
		 " ISBENULL integer," +
		 " ORDERS integer," +
		 " TABGROUP integer ,primary key(W_ID,B_ID))";
	
	/* 当表不存在时创建业务关联表 BUSINESS_RELATED BizRelate*/
	private String CREATE_TABLE_BIZRELATE = 
		 "CREATE TABLE IF NOT EXISTS BUSINESS_RELATED " +
		 "(" +
		 " B_ID varchar(50)," +
		 " R_ID varchar(50)," +
		 " R_COLUMN varchar(50)," +
		 " R_TYPE varchar(1) )";
	
	/* 当表不存在时创建系统资源配置表 SYSTEM_RES_CONFIG*/
	private String CREATE_TABLE_RES = 
		 "CREATE TABLE IF NOT EXISTS SYSTEM_RES_CONFIG " +
		 "(" +
		 " RES_ID varchar(50) PRIMARY KEY," +
		 " RES_NAME varchar(30)," +
		 " SOURCE varchar(400)," +
		 " CHANGE_DATE varchar(30), " +
		 " DS varchar(100))";
	
	/* 当表不存在时创建选项卡信息表 TAB_INFO SelCard*/
	private String CREATE_TABLE_SELCARD = 
		 "CREATE TABLE IF NOT EXISTS TAB_INFO " +
		 "(" +
		 " TAB_ID integer," +
		 " B_ID varchar(50)," +
		 " TAB_NAME varchar(30) ,primary key(TAB_ID,B_ID))";
	
	/* 当表不存在时创建资源数据信息表 SYSTEM_MAP*/
	private String CREATE_TABLE_RESDATA = 
		 "CREATE TABLE IF NOT EXISTS SYSTEM_MAP " +
		 "(" +
		 " KEY varchar(50)," +
		 " VALUE varchar(50)," +
		 " TYPE varchar(30))";
	/*是否需同步*/
	private String CREATE_TABLE_IFNEEDSYNCH = 
		 "CREATE TABLE IF NOT EXISTS SYSTEM_SYNCH " +
		 "(" +
		 " SYNCH varchar(50))";
	
	


	public void CreateDB(Statement db) throws Exception{
		//同步数据创建表
		db.executeUpdate(CREATE_TABLE_BIZ);
		db.executeUpdate(CREATE_TABLE_BIZCOMPONET);
		db.executeUpdate(CREATE_TABLE_BIZRELATE);
		db.executeUpdate(CREATE_TABLE_RES);
		db.executeUpdate(CREATE_TABLE_SELCARD);
		db.executeUpdate(CREATE_TABLE_RESDATA);
		db.executeUpdate(CREATE_TABLE_IFNEEDSYNCH);
				
	}
	
	public void createPoliceDB() throws Exception{
		Class.forName("org.sqlite.JDBC");
	    Connection conn =
	      DriverManager.getConnection("jdbc:sqlite:police.db");
	    Statement stat = conn.createStatement();
	    CreateDB(stat);
	    CreatePoliceDB cp=new CreatePoliceDB(stat,bizDAO,confDAO);
	    try {
			cp.insertSynchMenu();
		} catch (Exception e) {
			// TODO: handle exception
			throw e;
		}finally{
			if(conn!=null)conn.close();
		}		
	}

	
	public DataBaseHelper(BizDAO tbizDAO, ConfDAO tconfDAO){
		this.bizDAO=tbizDAO;
		this.confDAO=tconfDAO;
	}
	private BizDAO bizDAO;
	private ConfDAO confDAO;
}
