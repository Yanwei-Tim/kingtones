package com.kingtone.ssi.security;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
/*获取服务器相关信息*/
public class GetServiceInfo {
	public static String OS_HOST_NAME="";
    public static int getOs(){
    	int resultos=0;//windows
    	try{
			InetAddress s = InetAddress.getLocalHost();
			System.out.println(s.getHostName());
			OS_HOST_NAME=s.getHostName();
			Properties prop = System.getProperties();

			String os = prop.getProperty("os.name");
			System.out.println(os);
			String osname="";
			if(os.startsWith("win") || os.startsWith("Win") )
				osname= "windows操作系统"; 
			else {
				osname= "linux操作系统"; 
				resultos=1;
			}	
			System.out.println(osname);
			
			}		
			catch (Exception e)
			{
			} 
			return resultos;
    }
    
    public static String getLinuxMacAddr() throws IOException {    
        String MacAddr = "";
        String str = "";
        try {
            NetworkInterface NIC = NetworkInterface.getByName("eth0");
            byte[] buf = NIC.getHardwareAddress();
            for (int i = 0; i < buf.length; i++) {
                str = str + byteHEX(buf[i]);
            }
            MacAddr = str.toUpperCase();
        } catch (SocketException e) {
        	//return "Error!";
            //e.printStackTrace();
            //System.exit(-1);
            throw new IOException();  
        }
        return MacAddr;
    }
    
    public static String byteHEX(byte ib) {
        char[] Digit = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a','b', 'c', 'd', 'e', 'f' };
        char[] ob = new char[2];
        ob[0] = Digit[(ib >>> 4) & 0X0F];
        ob[1] = Digit[ib & 0X0F];
        String s = new String(ob);
        return s;
    }
    
	/** 
     * 根据IP地址获取客户端的MAC 
     * @param ipAddress 
     * @return 
     * @throws IOException 
     */  
    public static String getWinMACAddress(String ipAddress) throws IOException {  
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
           throw new IOException();  
           //return "Error!";  
       }  
       macAddress = strMAC.substring(0, 2) + ":" + strMAC.substring(3, 5)+ ":" + strMAC.substring(6, 8) + ":" + strMAC.substring(9, 11)+ ":" + strMAC.substring(12, 14) + ":"+ strMAC.substring(15, 17);  
       System.out.println("服务端的MAC地址为："+macAddress);         
       return macAddress;  
       }  
    
    public static String getMAC(String ip) throws IOException{
    	if(getOs()==1) return getLinuxMacAddr();
    	else return getWinMACAddress(ip);
    }
    
    public static String getDate() {
		SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
		Date dd = new Date();
		return ft.format(dd);
	}

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
	 * @param args
	 */
	public static long getJuliDate(String date1) {
		long day=0;
		String[] datestr= date1.split("-");
		if(datestr.length==3){
			int year=new Integer( datestr[0]);
			int month=new Integer( datestr[1]);
			int date=new Integer( datestr[2]);
			if((year>2000&&year<=2100)&&(month>=1&&month<=12)&&(date>=1&&date<=31))
				{}
			else return -1;
		}
		
		// TODO Auto-generated method stub
		//try {
			  String date2 = getDate();
			  day = getQuot(date1,date2);
			  //System.out.println( "距离 "+date1+" 还有 "+day+" 天" );
		//} catch (IOException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		//}
			  return day;
	}
}

