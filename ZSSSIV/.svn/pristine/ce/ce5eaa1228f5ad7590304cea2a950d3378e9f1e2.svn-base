package com.kingtone.jw.service.zljh;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.LinkedHashMap;

import org.kobjects.base64.Base64;

import com.kingtone.jw.service.socketservice.Server;
/*资料交换用接口对接*/
/*把测试数据部分修改成调用用户接口的方式*/
public class ZljhCustomData extends ZljhData {

	/*获取已发数据*/
	/*测试数据*///yfzlMap 里面的格式: 2={UserID=李四, xzzl=tabbar_top.png, jhdx=张三, srmm=222, UpLoadTime=2011-12-07 07:49:53, id=2}
	/*参数:page:第几页，lable:条件标志, value:条件标志对应值 返回查询的数据*/
	@Override
	public int getYfzlData(int page,String lable,
			String value){
		/*比如：调用用户接口，参数向下面对应放入。 在yfzlMap中存入查询出的数据（数据格式像下面的例子一样。）最后返回总记录数。
		FS_GetSendFileList(page,6,value); */
		
		System.out.println("调用客户端...getYfzlData page:"+page+" lable:"+lable+" value:"+value);
		LinkedHashMap temp1 = new LinkedHashMap();
		temp1.put("UserID", "张三");//上传人 必填
		temp1.put("xzzl", "tabbar_top.png");//标题（文件名称）必填
		temp1.put("jhdx", "李四");
		temp1.put("srmm", "111");
		temp1.put("UpLoadTime", "2011-12-07 07:49:53");//上传时间 必填
		temp1.put("id", "1");//记录ID 必填
		yfzlMap.put("1", temp1);//key 从数字1开始
		
		LinkedHashMap temp = new LinkedHashMap();
		temp.put("UserID", "李四");
		temp.put("xzzl", "培训需求调查表.doc");
		temp.put("jhdx", "张三");
		temp.put("srmm", "223");
		temp.put("UpLoadTime", "2011-12-07 07:49:53");
		temp.put("id", "2");
		yfzlMap.put("2", temp);		
		
		LinkedHashMap temp3 = new LinkedHashMap();
		temp3.put("UserID", "李四");
		temp3.put("xzzl", "tabbar_top.png");
		temp3.put("jhdx", "张三");
		temp3.put("srmm", "333");
		temp3.put("UpLoadTime", "2011-12-07 07:49:53");
		temp3.put("id", "3");
		yfzlMap.put("3", temp3);	
		return setFirstDataAndGetCount(page,lable,value);
	}

	/*参数:page:第几页，lable:条件标志, value:条件标志对应值 返回查询的总数*/
	public int setFirstDataAndGetCount(int page,String lable,
			String value) {
		// TODO Auto-generated method stub
		//page=1;
		return -1;
	}
	
	/*根据记录ID，用户ID，下载密码返回文件流*/
	/*调用客户端上传数据接口*/
	@Override
	public byte[] getCustomDownFile(String ID, String UserID, String password) {
		System.out.println("调用客户端下载数据...ID:"+ID+" UserID:"+UserID
				+" password:"+password);	
		// TODO Auto-generated method stub
	
		return null;
	}

	/*获取待收数据*/ 	
	@Override
	public int getDszlData(int page, String lable, String value) {
		System.out.println("调用客户端...getDszlData page:"+page+" lable:"+lable+" value:"+value);
		// TODO Auto-generated method stub
		LinkedHashMap temp1 = new LinkedHashMap();
		temp1.put("UserID", "张三");
		temp1.put("xzzl", "tabbar_top.png");//标题（文件名称 必填
		temp1.put("jhdx", "李四");//上传人 必填
		temp1.put("srmm", "dszl1");//下载密码 必填
		temp1.put("UpLoadTime", "2011-12-07 07:49:53");//上传时间 必填
		temp1.put("id", "1");//记录ID 必填
		yfzlMap.put("1", temp1);
		
		LinkedHashMap temp = new LinkedHashMap();
		temp.put("UserID", "李四");
		temp.put("xzzl", "培训需求调查表.doc");
		temp.put("jhdx", "张三");
		temp.put("srmm", "dszl2");
		temp.put("UpLoadTime", "2011-12-07 07:49:53");
		temp.put("id", "2");
		yfzlMap.put("2", temp);		
		
		LinkedHashMap temp3 = new LinkedHashMap();
		temp3.put("UserID", "李四");
		temp3.put("xzzl", "tabbar_top.png");
		temp3.put("jhdx", "张三");
		temp3.put("srmm", "");//dszl3
		temp3.put("UpLoadTime", "2011-12-07 07:49:53");
		temp3.put("id", "3");
		yfzlMap.put("3", temp3);
		LinkedHashMap temp4 = new LinkedHashMap();
		temp4.put("UserID", "李四");
		temp4.put("xzzl", "音乐.mp3");
		temp4.put("jhdx", "张三");
		temp4.put("srmm", "");//dszl3
		temp4.put("UpLoadTime", "2011-12-07 07:49:53");
		temp4.put("id", "4");
		yfzlMap.put("4", temp4);
		LinkedHashMap temp5 = new LinkedHashMap();
		temp5.put("UserID", "222");
		temp5.put("xzzl", "培训需求调查表.doc");
		temp5.put("jhdx", "222");
		temp5.put("srmm", "");//dszl3
		temp5.put("UpLoadTime", "2011-12-07 07:49:53");
		temp5.put("ID", "5");
		yfzlMap.put("5", temp5);
		return -1;
	}

	/*获取已收数据*/
	@Override
	public int getYszlData(int page, String lable, String value) {
		System.out.println("调用客户端...getYszlData"+page+" lable:"+lable+" value:"+value);
		// TODO Auto-generated method stub
		LinkedHashMap temp1 = new LinkedHashMap();
		temp1.put("UserID", "张三");
		temp1.put("xzzl", "tabbar_top.png");//标题（文件名称 必填
		temp1.put("jhdx", "李四");//上传人 必填
		temp1.put("srmm", "yszl1");
		temp1.put("UpLoadTime", "2011-12-07 07:49:53");//下载时间 必填
		temp1.put("id", "1");//记录ID 必填
		yfzlMap.put("1", temp1);
		
		LinkedHashMap temp = new LinkedHashMap();
		temp.put("UserID", "李四");
		temp.put("xzzl", "培训需求调查表.doc");
		temp.put("jhdx", "张三");
		temp.put("srmm", "yszl2");
		temp.put("UpLoadTime", "2011-12-07 07:49:53");
		temp.put("id", "2");
		yfzlMap.put("2", temp);		
		
		LinkedHashMap temp3 = new LinkedHashMap();
		temp3.put("UserID", "李四");
		temp3.put("xzzl", "tabbar_top.png");
		temp3.put("jhdx", "张三");
		temp3.put("srmm", "yszl3");
		temp3.put("UpLoadTime", "2011-12-07 07:49:53");
		temp3.put("id", "3");
		yfzlMap.put("3", temp3);
		
		LinkedHashMap temp4 = new LinkedHashMap();
		temp4.put("UserID", "李四");
		temp4.put("xzzl", "tabbar_top.png");
		temp4.put("jhdx", "张三");
		temp4.put("srmm", "yszl4");
		temp4.put("UpLoadTime", "2011-12-07 07:49:53");
		temp4.put("ID", "44");
		yfzlMap.put("4", temp4);
		return 11;
	}

	/*调用客户端上传数据接口*/
	@Override
	public String saveCustomUploadFile(byte[] fileBytes, String fileLength,
			String filename, String receiverUserIDs, String password,
			String UserID) {
		System.out.println("调用客户端上传数据...fileLength:"+fileLength+" filename:"+filename
				+" receiverUserIDs:"+receiverUserIDs+" password:"+password+" UserID:"+UserID);
		return "ok";
	}

	@Override
	public String saveCustomUploadFile(byte[] fileBytes, String fileLength,
			String filename) {
		// TODO Auto-generated method stub
		return null;
	}
}
