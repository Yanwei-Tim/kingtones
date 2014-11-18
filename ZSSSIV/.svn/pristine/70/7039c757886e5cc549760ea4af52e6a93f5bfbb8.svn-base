package com.kingtone.jw.service.dao.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.kingtone.jw.service.domain.AddressList;
import com.kingtone.jw.service.util.CommonTool;
/************
 * 
 * 同步oa系统和警务系统的通讯录数据库表。
 * @author YLP
 *
 */
public class SynchOaTable implements Job{
	public static Connection conn;    
	public static PreparedStatement ps;    
	public static ResultSet rs;    
	public static Statement st ;  

	private static java.util.Properties p = null;
	
	public static Connection getConnection(){   //获取自己连接	
		try {       
			//System.out.println(new File(".").getAbsolutePath()); //查看一下当前目录是什么
			
			p = new Properties();	
			p.load(new FileInputStream("../webapps/ZSSSIV/WEB-INF/config/synchConfig.ini"));			
			//p.load(new FileInputStream("WebRoot/WEB-INF/config/synchConfig.ini"));
			
			Class.forName(p.getProperty("driver"));        
			conn=DriverManager.getConnection(p.getProperty("url"), p.getProperty("user"), p.getProperty("password")); 
		} catch (Exception e) {        
			e.printStackTrace();    
		}
		return conn;
	}  
//	public static Connection getConnectionOther(){   //获取对方连接
//		try {       
//			p = new Properties();
//			p.load(new FileInputStream("../webapps/ZSSSIV/WEB-INF/config/synchConfig.ini"));			
//			//p.load(new FileInputStream("WebRoot/WEB-INF/config/synchConfig.ini"));			
//			Class.forName(p.getProperty("otherdriver"));        
//			conn=DriverManager.getConnection(p.getProperty("otherurl"), p.getProperty("otheruser"), p.getProperty("otherpassword")); 
//		} catch (Exception e) {        
//			e.printStackTrace();    
//		}
//		return conn;
//	} 

	public static List<AddressList> queryOaUser(){ //查询对方人员信息
		List<AddressList> listoa = new ArrayList();
		try {  			
			
			List<Map<String, Object>> resultList = CommonTool.oaPermissionDAO.findOAUser();
			for(Map<String, Object> mapOrg :resultList) { 
				AddressList address = new AddressList();				
				
				address.setId(mapOrg.get("USERNAME")==null?null:mapOrg.get("USERNAME").toString());
				address.setName(mapOrg.get("FULLNAME")==null?null:mapOrg.get("FULLNAME").toString());
				address.setPrivatephone(mapOrg.get("MOBILEPHONE")==null?null:mapOrg.get("MOBILEPHONE").toString());
				address.setOrg_id(mapOrg.get("REG_RUNID")==null?null:mapOrg.get("REG_RUNID").toString());				
				address.setAccount(mapOrg.get("USERNO")==null?null:mapOrg.get("USERNO").toString());
				address.setTelephone(mapOrg.get("TELEPHONE")==null?null:mapOrg.get("TELEPHONE").toString());
				address.setDuty(mapOrg.get("TITLEOFPOST")==null?null:mapOrg.get("TITLEOFPOST").toString());
			 								
				conn = getConnection();//获取jwt_conf的用户警务通电话
				ps = (PreparedStatement) conn.prepareStatement(
						"select t.sjhm,t.account from jwt_conf.jw_user t");  
				rs = ps.executeQuery(); 
				while(rs.next()) { 					
					if(rs.getString("account").equals(mapOrg.get("USERNO"))){//判断OA通讯录的警号和JW的警号是否相等
						address.setPolicePhone(rs.getString("sjhm"));
					}					
				}  

				listoa.add(address); 
			}  						
		} catch (Exception e) {  
			e.printStackTrace();  
		} finally {  
			meclose();
		} 
		return listoa;
	}
	public static List<AddressList> queryOaOrgan(){ //查询对方机构信息
		List<AddressList> listoa = new ArrayList();
		
		try {  								
			List<Map<String, Object>> resultList = CommonTool.oaPermissionDAO.findOAOrganization();
			for(Map<String, Object> mapOrg :resultList) { 
				AddressList address = new AddressList();
				address.setOid(mapOrg.get("ORGID")==null?null:mapOrg.get("ORGID").toString());
				address.setOrgName(mapOrg.get("ORGNAME")==null?null:mapOrg.get("ORGNAME").toString());
				address.setOsupOrg(mapOrg.get("SUPORGID")==null?null:mapOrg.get("SUPORGID").toString());				
				listoa.add(address); 
			}  
		} catch (Exception e) {  
			e.printStackTrace();  
		} finally {  
			meclose();
		} 
		return listoa;
	}

	public static void deleORinsert() { // 使用事物
		System.out.println("---------------进入同步OA系统通讯录模块---------------------");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		
		File f = new File("C://testlog.log");
		FileWriter fw = null;
		try {
			if (!f.exists()) {
				f.createNewFile();
			}
			fw = new FileWriter(f, true);
			fw.write("[" + df.format(cal.getTime()) + "] 进入同步OA系统通讯录模块" + "\n");

			List<AddressList> listoauser = queryOaUser();
			
			fw.write("[" + df.format(cal.getTime()) + "] listoauser.size = "+listoauser.size() + "\n");
			if (listoauser != null && listoauser.size() > 0) {
				for(AddressList user : listoauser){
				fw.write("[" + df.format(cal.getTime()) + "] user = ["+user.getAccount()+","+user.getName()+ "]\n");
				}
			}
			List<AddressList> listoaorgan = queryOaOrgan();			
			
			fw.write("[" + df.format(cal.getTime()) + "] listoaorgan.size = "+listoaorgan.size() + "\n");
			if (listoaorgan != null && listoaorgan.size() > 0) {
				for(AddressList org : listoaorgan){
				fw.write("[" + df.format(cal.getTime()) + "] user = ["+org.getOid()+","+org.getOrgName()+ "]\n");
				}
			}
			conn = getConnection(); // 首先要获取连接，即连接到数据库
			
			fw.write("[" + df.format(cal.getTime()) + "] conn初始化成功" + "\n");

			conn.setAutoCommit(false);// 更改JDBC事务的默认提交方式
			String sqlo1 = "delete from sys_org where 1=1";
			String sqlo2 = "insert into sys_org(orgid,orgname,suporgid)"
					+ " values (?,?,?)";
			String sqlu1 = "delete from sys_user where 1=1 ";
			String sqlu2 = "insert into sys_user(username,fullname,mobilephone,reg_runid,userno,telephone,titleofpost,policephone)"
					+ " values (?,?,?,?,?,?,?,?)";

			st = (Statement) conn.createStatement();

			st.executeUpdate(sqlo1);// 删除机构
			st.executeUpdate(sqlu1);// 删除用户
			
			fw.write("[" + df.format(cal.getTime()) + "] 删除本地库" + "\n");

			ps = conn.prepareStatement(sqlo2); // 添加机构
			for (int i = 0; i < listoaorgan.size(); i++) {
				ps.setString(1, listoaorgan.get(i).getOid());
				ps.setString(2, listoaorgan.get(i).getOrgName());
				ps.setString(3, listoaorgan.get(i).getOsupOrg());
				ps.execute();
			}

			fw.write("[" + df.format(cal.getTime()) + "] 添加机构成功" + "\n");
			ps = conn.prepareStatement(sqlu2); // 添加用户
			for (int i = 0; i < listoauser.size(); i++) {
				ps.setString(1, listoauser.get(i).getId());
				ps.setString(2, listoauser.get(i).getName());
				ps.setString(3, listoauser.get(i).getPrivatephone());
				ps.setString(4, listoauser.get(i).getOrg_id());
				ps.setString(5, listoauser.get(i).getAccount());
				ps.setString(6, listoauser.get(i).getTelephone());
				ps.setString(7, listoauser.get(i).getDuty());
				ps.setString(8, listoauser.get(i).getPolicePhone());
				ps.execute();
			}
			
			fw.write("[" + df.format(cal.getTime()) + "] 添加人员成功" + "\n");
			conn.commit();// 提交JDBC事务
			conn.setAutoCommit(true);// 恢复JDBC事务的默认提交方式
			System.out.println("--------success数据库同步成功---------");
		} catch (Exception e) {
			e.printStackTrace();
			if (fw != null) {
				try {
					fw.write("[" + df.format(cal.getTime())
							+ "] #### 出现异常 #### \n");
					fw.write("[" + df.format(cal.getTime()) + "] "
							+ e.getMessage() + " \n");
				} catch (IOException ioe) {
					ioe.printStackTrace();
				}
			}
			try {
				conn.rollback();// 回滚JDBC事务
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
			System.out.println("--------error数据库同步失败-----------");
			meclose();
		} finally {
			if (fw != null) {
				try {
					fw.flush();
					fw.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			meclose();
		}
	}

	public static void meclose(){//关闭
		try {  
			if(rs != null) {  
				rs.close();  
				rs = null;  
			}  
			if(st != null) {  
				st.close();  
				st = null;  
			} 
			if(ps != null) {  
				ps.close();  
				ps = null;  
			} 
			if(conn != null) {  
				conn.close();  
				conn = null;  
			}  
		} catch (SQLException e) {  
			e.printStackTrace();  
		}   
	}
	public static void main(String[] args) {  
		
		deleORinsert();
	}
	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		deleORinsert();		
	}
}
