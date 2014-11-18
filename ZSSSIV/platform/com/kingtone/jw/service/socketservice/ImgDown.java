package com.kingtone.jw.service.socketservice;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.kingtone.jw.service.zljh.ZljhCustomData;
import com.kingtone.jw.service.zljh.ZljhData;
import com.kingtone.ssi.log.SSILogger;
/*获取 socket 通信 具体进行文件上传下载操作*/
public class ImgDown extends Thread{
	private Socket client;
	/** 存放文件夹 * */
	private String filepath;

	public ImgDown(Socket client, String filepath) {
		this.client = client;
		this.filepath = filepath;
	}

	/*启动*/
	public void run() {
//		System.out.println("启动..");
		if (client == null) {
//			SSILogger.Bizlogger.info("client is null");
			return;
		}
		/*使用流进行读写操作*/
		DataInputStream in = null;
		DataInputStream reader = null;
		DataOutputStream out = null;
		DataOutputStream upOut=null;
		byte[] buf = null;
		String filestr = null;
		try {
			reader = new DataInputStream(new BufferedInputStream(client
					.getInputStream()));
			String xmlStr=reader.readUTF();
			SSILogger.Bizlogger.info("xmlStr.."+xmlStr);
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			Date startdate=new Date();			
			ZljhData zd=new ZljhCustomData();
			
			if(xmlStr.endsWith("|down+android+file|")){ 
				out = new DataOutputStream(client.getOutputStream());
				String filename=reader.readUTF();			
			String pase_result=zd.pase(filename);
			if(pase_result!=null)out.write(pase_result.getBytes());	
			else{	
			filestr=Server.IMGFILEPATH+filename;
			File file = new File(filestr);
			in = new DataInputStream(new BufferedInputStream(
					new FileInputStream(file)));
//			out = new DataOutputStream(client.getOutputStream());
			int bufferSize = 1024; 
			buf = new byte[bufferSize];
			int read = 0;
			while ((read = in.read(buf)) != -1) {
				out.write(buf, 0, read);
			}
			out.flush();
			}
			//System.out.println("提示:下载结束...");
			}else
			
			//上传
			if(xmlStr.endsWith("|upload+android+file|")){
				String filename=reader.readUTF();
				SSILogger.Bizlogger.info("filename and path="+Server.IMGFILEPATH+filename);
			String property=reader.readUTF();
			SSILogger.Bizlogger.info("property="+property);
			String save_type=zd.pase(property);
			//保存到用户指定接口
			if(save_type!=null&&save_type.startsWith("remote")){
				long remote_length=Long.valueOf(save_type.substring(save_type.indexOf("#")+1));
//				System.out.println("上传文件长度remote_length:"+remote_length);
				ByteArrayOutputStream baout = new ByteArrayOutputStream();
				int bufferSize = 1024; 
				buf = new byte[bufferSize];
				int read = 0;
				int length=0;
				while(true) { 
					read = reader.read(buf);
					baout.write(buf, 0, read);
					baout.flush();
					length=length+read;
					if(read==-1)break;
					if(length >= remote_length&&remote_length!=-1){
						break;
					} 
				}				
//				System.out.println("上传文件长度length:"+length);
				baout.close();
				String result=zd.saveRemoteUploadFile(baout.toByteArray(),length,filename);		
				out = new DataOutputStream(client.getOutputStream());
				out.writeUTF(result);
			}else{
				//保存到本服务器指定地址 save_type=local
			File upfiles=new File(Server.IMGFILEPATH);
			if(!upfiles.isDirectory())upfiles.mkdir();
			
			File upFile=new File(Server.IMGFILEPATH+filename);
			upFile.createNewFile();
			upOut=new DataOutputStream(new BufferedOutputStream(new FileOutputStream(upFile)));
			int bufferSize = 1024; 
			buf = new byte[bufferSize];
			int read = 0;
			while ((read = reader.read(buf)) != -1) {
				upOut.write(buf, 0, read);
			}
			upOut.flush();
			out = new DataOutputStream(client.getOutputStream());
			out.writeUTF("ok");
			}
			} else 
			if(xmlStr.endsWith("|get+down+file|")){
				out = new DataOutputStream(client.getOutputStream());
				String property=reader.readUTF();				
				String pase_result=zd.pase(property);
				if(pase_result!=null)out.writeUTF(pase_result);
				else out.writeUTF(getDownFiles());
			}
			
		} catch (Exception ex) {
			SSILogger.Bizlogger.error("ImgDown run",ex);
			ex.printStackTrace();
		} finally {
			try {				
				if (reader != null)
					reader.close();
				if (in!=null)
					in.close();
				if (out != null)
					out.close();
				if (upOut != null)
					upOut.close();
				if (client != null)
					client.close();
				/*if(filestr!=null){
					File file = new File(filestr); 
					if(file.exists())file.delete();
				}*/
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public String getDownFiles(){
		File upfiles=new File(Server.IMGFILEPATH);
		StringBuffer sb=new StringBuffer();
		if(upfiles.list().length>0){
			for(int i=0;i<upfiles.list().length;i++){
//			System.out.println(i+" downfiles:"+upfiles.list()[i]);	
			sb.append(upfiles.list()[i]);
			if(i!=upfiles.list().length-1)sb.append(",");
			}			
		}else return "|no+file|";
//		System.out.println("downfiles:"+sb.toString());
		return sb.toString();
		
	} 
}
