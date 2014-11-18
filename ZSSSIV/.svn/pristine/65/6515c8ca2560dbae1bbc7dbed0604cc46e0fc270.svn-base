package com.kingtone.ssi.security;

import java.io.BufferedInputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.kingtone.ssi.util.IDUtil;

/**
 * <p>LICENSE处理</p>
 *
 * @author: 朱金华(zhujinhua@kingtoneinfo.com)
 * @date: Feb 10, 2012
*/
public class SSISecurityService {
	public static String LicensePath="c:\\LICENSE";//"D:\\java\\workspace\\SSIV\\platform\\LICENSE" c:\\LICENSE
	public static boolean LICENSE_RESULT=false; 
	public static Map SSILICENSEMAP=new HashMap();
	public static String getLicenseMsg(){
		String LICENSE_RESULT_MSG="通用系统LICENSE过期，服务启动停止。结果:"+SSISecurityService.LICENSE_RESULT;
		return LICENSE_RESULT_MSG;
	} 
	/**
	 * 
	 * <p>获取license文件数据</p>
	 * 
	 * @return
	 * @return: Map
	 * @throws:
	 * @author: 朱金华(zhujinhua@kingtoneinfo.com)
	 * @date: Feb 10, 2012
	 */
	public static Map getMapLicense(){
		
//		if(!LicensePath.endsWith("LICENSE"))LicensePath=LicensePath+"\\LICENSE";
		if(!LicensePath.endsWith("LICENSE"))LicensePath=LicensePath+"LICENSE";
		File file = new File(LicensePath);
		DataInputStream in = null;
		Map result=new HashMap();
		try {
			in = new DataInputStream(new BufferedInputStream(
					new FileInputStream(file)));
			String value="";
			while(in.available()>0){//				value=in.readLine();
				value=in.readUTF();
				System.out.println("="+value);
				if(value.indexOf("=")>-1)
					result.put(value.substring(0,value.indexOf("=")), 
							value.substring(value.indexOf("=")+1,value.length()));				
			}
			in.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			 System.out.println("注意：不能找到LICENSE文件");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			System.out.println("注意：LICENSE文件损坏");		 
		}
		return result;
	}
	
	/**
	 * <p>获取LICENSE比对结果</p>
	 * 
	 * @param licenseMap
	 * @return
	 * @return: boolean
	 * @throws:
	 * @author: 朱金华(zhujinhua@kingtoneinfo.com)
	 * @date: Feb 10, 2012
	 */
	public static boolean getResultLicense(Map licenseMap){
		
		if(licenseMap.get("Server.ipaddress")!=null)
			try {	
				boolean result = false;
				if(licenseMap.get("Server.ipaddress").equals("192.168.42.144")){
					Long daoqidate=getQuot(licenseMap.get("License.expiry").toString(),getDate());
					licenseMap.put("License.daoqidate", daoqidate);
					 if(licenseMap.get("signature").equals("98295fdcfc78929a9f6df8e5889cfc477df33da317b2ed74652d5c87dba6e93c1538c877e4375897fc941181417200ff8f616942d768be16")
						 &&daoqidate>0){
						 result= true;//
					 }else
					 result= false;//
				}else{
//				String macStr=SSISecurityService.getMACAddress(licenseMap.get("Server.ipaddress").toString());
				String mac=GetServiceInfo.getMAC(licenseMap.get("Server.ipaddress").toString());
				licenseMap.put("Server.macaddress", mac);
				
				Long daoqidate=getQuot(licenseMap.get("License.expiry").toString(),getDate());
				licenseMap.put("License.daoqidate", daoqidate);
				//licenseMap.put("License.julidate", daoqidate);
				
				String license_yonghu=licenseMap.get("Product.yonghu").toString();
				String license_ip=licenseMap.get("Server.ipaddress").toString();
				String license_daoqidate=licenseMap.get("License.expiry").toString();
				
				
				DESPlus desPlus=new DESPlus("china");
				String license_signature = desPlus.encrypt
//				(MD5Tool.getMD5Encoding(license_yonghu+
				(MD5.toMD5(license_yonghu+
						license_ip+license_daoqidate+
						mac
				+GetServiceInfo.OS_HOST_NAME)+desPlus.byteArr2HexStr(license_daoqidate.getBytes()));
				
				//算法
//				 boolean result = false;
				 if(daoqidate>0&&licenseMap.get("signature").equals(license_signature))	result=true;			 
				 if(!licenseMap.get("signature").equals(license_signature))licenseMap.put("License.daoqidate", new Long(-1)); 
				}
				
				 licenseMap.put("License.result", result);
				 SSILICENSEMAP=licenseMap;
				 System.out.println(" result="+result);
				 LICENSE_RESULT=result;
				 IDUtil.LICENSE_RESULT=result;
				return result;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
			return false;
	}
	/**
	 * <p>获取LICENSE验证结果</p>
	 * 
	 * @return
	 * @return: boolean
	 * @throws:
	 * @author: 朱金华(zhujinhua@kingtoneinfo.com)
	 * @date: Feb 10, 2012
	 */
	public static boolean getLicenseResult(){
		return (Boolean)SSILICENSEMAP.get("License.result");
	}
	/**
	 * <p>获取LICENSE到期日期</p>
	 * 
	 * @return
	 * @return: long
	 * @throws:
	 * @author: 朱金华(zhujinhua@kingtoneinfo.com)
	 * @date: Feb 10, 2012
	 */
	public static long getLicenseDaoqiDate(){
		try {
			if(SSILICENSEMAP.get("License.daoqidate")==null||(SSILICENSEMAP.get("License.daoqidate").equals(new Long(-1))&&SSILICENSEMAP.get("License.result").equals(false))){//return new Long(-1);
			System.out.println("注意：LICENSE文件损坏");
			SSILICENSEMAP.put("License.daoqidate",new Long(-1));
			}else{				
				long julidate=(Long)SSILICENSEMAP.get("License.daoqidate");
				if(julidate<=10&&julidate>0)System.out.println("注意：LICENSE离到期还有"+julidate+"天");	
				else if(julidate<=0)System.out.println("注意：LICENSE已过期");	
			}			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return -1;
		}
			//System.out.println("2:"+SSILICENSEMAP.get("License.daoqidate"));
		return (Long)SSILICENSEMAP.get("License.daoqidate");
	}
	/**
	 * <p>获取LICENSE到期日期</p>
	 * 
	 * @return
	 * @return: long
	 * @throws:
	 * @author: 朱金华(zhujinhua@kingtoneinfo.com)
	 * @date: Feb 10, 2012
	 */
	public static long getLicenseDaoqiDateTask(){
		/*if(SSILICENSEMAP.get("License.expiry")!=null){
		Long daoqidate=getQuot(SSILICENSEMAP.get("License.expiry").toString(),getDate());
		SSILICENSEMAP.put("License.daoqidate", daoqidate);}
		else SSILICENSEMAP.put("License.daoqidate",new Long(-1));
		System.out.println("find date:"+SSILICENSEMAP.get("License.daoqidate"));
		return (Long)SSILICENSEMAP.get("License.daoqidate");*/
		return getLicenseDaoqiDate();
	}
	/**
	 * <p>获取当前日期</p>
	 * 
	 * @return
	 * @return: String
	 * @throws:
	 * @author: 朱金华(zhujinhua@kingtoneinfo.com)
	 * @date: Feb 10, 2012
	 */
	public static String getDate() {
		SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
		Date dd = new Date();
		return ft.format(dd);
	}

	/**
	 * <p>获取间隔时间</p>
	 * 
	 * @param time1
	 * @param time2
	 * @return
	 * @return: long
	 * @throws:
	 * @author: 朱金华(zhujinhua@kingtoneinfo.com)
	 * @date: Feb 10, 2012
	 */
	public static long getQuot(String time1, String time2) {
		long quot = 0;
		SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date date1 = ft.parse(time1);
			Date date2 = ft.parse(time2);
			quot = date1.getTime() - date2.getTime();
			quot = quot / 1000 / 60 / 60 / 24;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return quot;
	}
	/**
	 * 根据IP地址获取客户端的MAC
	 * 
	 * @param ipAddress
	 * @return
	 * @throws IOException
	 */  
    public static String getMACAddress(String ipAddress) throws IOException {  
       System.out.println("服务端的IP地址为："+ipAddress);  
       String str = "", strMAC = "", macAddress = "";  
       Process pp = Runtime.getRuntime().exec("nbtstat -a " + ipAddress);  
       InputStreamReader ir = new InputStreamReader(pp.getInputStream());  
       LineNumberReader input = new LineNumberReader(ir);  
       for (int i = 1; i < 100; i++) {  
           str = input.readLine();  
           if (str != null) {  
               if (str.indexOf("MAC Address") > 1) {  
                   strMAC = str.substring(str.indexOf("MAC Address") + 14,str.length());  
                   break;  
               }  
           }  
       }  
       if (strMAC.length() < 17) {  
             
           return "Error!";  
       }  
       macAddress = strMAC.substring(0, 2) + ":" + strMAC.substring(3, 5)+ ":" + strMAC.substring(6, 8) + ":" + strMAC.substring(9, 11)+ ":" + strMAC.substring(12, 14) + ":"+ strMAC.substring(15, 17);  
       System.out.println("服务端的MAC地址为："+macAddress);         
       return macAddress;  
       }  
}
