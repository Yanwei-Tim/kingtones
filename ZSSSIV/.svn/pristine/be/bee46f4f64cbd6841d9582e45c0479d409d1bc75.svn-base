package com.kingtone.jw.service.zljh;

import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

import org.kobjects.base64.Base64;

/*资料交换数据处理*/
public abstract class ZljhData {
	public static String UPFILE_MARK="UPFILE_MARK";//发送标识
	public static String DFZL="DFZL";//待发资料
	public static String DSZL="DSZL";//待收资料
	public static String YSZL="YSZL";//已收资料
	public static String YFZL="YFZL";//已发资料
	public static String XZZL="XZZL";//下载资料
	public static String UPLOAD_REMOTE="UPLOAD_REMOTE";//使用其它接口上传文件
	public static String SAVE_TYPE="save_type";//使用其它接口上传文件
	public static String REMOTE_FILE="remotefile";//使用其它接口上传文件
	public static int count=2;//每页显示的条数
	protected LinkedHashMap yfzlMap=new LinkedHashMap();
/*	public void setYfzl(Yfzl yfzl){
		yfzl.setID(yfzlMap.size()+1+"");
		yfzlMap.put(yfzl.getID(), yfzl);
	}*/
	
	public String pase(String str){
//		System.out.println("解析上传服务器数据:"+str);
		LinkedHashMap map=new LinkedHashMap();
		str=str.substring(1,str.length()-1);
		String[] strs=str.split(",");
		if(strs[0].equals("null=null")){
			
		}else if(strs[0].startsWith(UPFILE_MARK+"="+UPLOAD_REMOTE)){
			map=getMapByStrs(strs);
			if(strs.length!=1){
				map.put("id", yfzlMap.size()+1);
				yfzlMap.put(yfzlMap.size()+1+"", map);
			}
			if(map.get("save_type")!=null&&map.get("save_type").equals("remotefile"))
				return "remote#"+(String)map.get("fileLength");
				else return "local#"+(String)map.get("fileLength");//保存到本地服务器
		}		
		else if(strs[0].startsWith(UPFILE_MARK+"="+DFZL)){
			String[] userid=getUserID(strs[0].substring((UPFILE_MARK+"="+DFZL).length()));
			if(userid!=null)map.put(userid[0], userid[1]);			
			for(int i=1;i<strs.length;i++){
				String[] strtmp=strs[i].split("=");				
				if(strtmp.length!=1)
					map.put(strtmp[0].trim(), strtmp[1]);
					else
						map.put(strtmp[0].trim(), "");
			}
			//map 中的接收对象用户的ID用#号分开。注意 要转换			
			if(strs.length!=1){
				map.put("id", yfzlMap.size()+1);
			yfzlMap.put(yfzlMap.size()+1+"", map);
//			System.out.println("DFZL上传服务器数据:"+parseMap(yfzlMap));		
			}
//			System.out.println("save_type:"+map.get("save_type")+" = "+map.get("save_type").equals("remote"));		
			//return parseMap(yfzlMap);
			if(map.get("save_type")!=null&&map.get("save_type").equals("remote"))
			return "remote#"+(String)map.get("fileLength");
			else return "local#"+(String)map.get("fileLength");//保存到本地服务器
		}else if(strs[0].startsWith(UPFILE_MARK+"="+YSZL)){			
//			System.out.println("YSZL上传服务器数据:"+parseMap(yfzlMap));		
//			return yfzlMap.toString();		
			return getMapByUserID(strs[0].substring((UPFILE_MARK+"="+YSZL).length()),ZljhDataUtil.Mark_ReceiverUserIDs,YSZL).toString();
		}else if(strs[0].startsWith(UPFILE_MARK+"="+YFZL)){			
//			System.out.println("YFZL上传服务器数据:"+parseMap(yfzlMap));		
//			return yfzlMap.toString();		
			return getMapByUserID(strs[0].substring((UPFILE_MARK+"="+YFZL).length()),"UserID",YFZL).toString();
		}
		else if(strs[0].startsWith(UPFILE_MARK+"="+DSZL)){			
//			System.out.println("DSZL上传服务器数据:"+parseMap(yfzlMap));		
//			return yfzlMap.toString();		
//			return getMapByUserID(strs[0].substring((UPFILE_MARK+"="+DSZL).length()),"jhdx").toString();
//			return parseMap(getMapByUserID(strs[0].substring((UPFILE_MARK+"="+DSZL).length()),"jhdx"));
			return parseMap(getMapByUserID(strs[0].substring((UPFILE_MARK+"="+DSZL).length()),ZljhDataUtil.Mark_ReceiverUserIDs,DSZL));
		}else if(strs[0].startsWith(UPFILE_MARK+"="+XZZL)){	
			Map mmap=new LinkedHashMap();
			/*for(int i=0;i<strs.length;i++){
				mmap.put(strs[i].split("=")[0], strs[i].split("=")[1]);
			}*/
			mmap=getMapByStrs(strs);
//			return new String(getCustomDownFile((String)mmap.get(ZljhDataUtil.Mark_ID),(String)mmap.get(ZljhDataUtil.Mark_UserID),(String)mmap.get(ZljhDataUtil.Mark_Password)));
			return Base64.encode(getCustomDownFile((String)mmap.get(ZljhDataUtil.Mark_ID),(String)mmap.get(ZljhDataUtil.Mark_UserID),(String)mmap.get(ZljhDataUtil.Mark_Password)));
		}
		
		return null;
	}
	
	private LinkedHashMap getMapByStrs(String[] strs){
		LinkedHashMap map=new LinkedHashMap();
		for(int i=1;i<strs.length;i++){
			String[] strtmp=strs[i].split("=");				
			if(strtmp.length!=1)
				map.put(strtmp[0].trim(), strtmp[1]);
				else
					map.put(strtmp[0].trim(), "");
		}
		return map;
	}
	
//	上传成功返回"ok" 错误返回"error" 否则返回其它
	public String saveRemoteUploadFile(byte[] uploadFile,int length,String filename){
		LinkedHashMap map=(LinkedHashMap)yfzlMap.get(yfzlMap.size()+"");
//		System.out.println("上传文件map:"+map);
		if(map!=null&&map.get("save_type").equals("remote")){
			String receiverUserIDs=(String)map.get(ZljhDataUtil.Mark_ReceiverUserIDs);
			receiverUserIDs=receiverUserIDs.replace("#", ",");
			String password=(String)map.get(ZljhDataUtil.Mark_Password);
			if(password.equals("null")&&password!=null)password="";
			String UserID=(String)map.get(ZljhDataUtil.Mark_UserID);	
		String result=saveCustomUploadFile(uploadFile,length+"",filename,receiverUserIDs,password,
				UserID);
		return result;
		}else if(map!=null&&map.get(SAVE_TYPE).equals(REMOTE_FILE)){
			String result=saveCustomUploadFile(uploadFile,length+"",filename);
			return result;
		}
		else return "error";
	}
	//上传文件
	public abstract String saveCustomUploadFile(byte[] fileBytes,String fileLength,String filename);
	//上传文件
	public abstract String saveCustomUploadFile(byte[] fileBytes,String fileLength,String filename,String receiverUserIDs,String password,
			String UserID);
	//获取下载文件
	public abstract byte[] getCustomDownFile(String ID,String UserID,
			String password);
	
	//userstr= jhdx(接收对象) UserID(发送用户)
	private LinkedHashMap getMapByUserID(String str,String userstr,String type){
		int page_temp=1;
		LinkedHashMap temp_result=new LinkedHashMap();
		if(str.startsWith("#")){
			str=str.substring(1);
			String[] strs=str.split("=");
			if(str.indexOf("#")>0){
				String[] strs_page=str.split("#");
				String nowpage=strs_page[1].split("=")[1];
				strs=strs_page[0].split("=");
				try {
					page_temp = new Integer(nowpage);
				} catch (Exception e) {
					// TODO: handle exception
				}
			}	 
			
			temp_result=getCustomData(page_temp,userstr,strs[1],type);
		}	
//		System.out.println("返回结果："+parseMap(temp_result));
		return temp_result;
	}
	
	public LinkedHashMap getCustomData(int page_temp, String userstr,
			String value,String type) {
		// TODO Auto-generated method stub
		LinkedHashMap temp_result = new LinkedHashMap();
		LinkedHashMap temp = new LinkedHashMap();
		int n = 0;
		int data_count=setYfzlTestData(page_temp,userstr,value,type);
		Iterator iter = yfzlMap.keySet().iterator();
		while (iter.hasNext()) {
			String i = (String) iter.next();
			
/*			  System.out.println("key："+i);
			  System.out.println("strs[1]："+value);
			  System.out.println(userstr+"strs[1]："+((LinkedHashMap)yfzlMap.get(i)).get(userstr));
			  System.out.println("="+value.equals(((LinkedHashMap)yfzlMap.get(i)).get(userstr)));*/
			 
			if (value.equals(((LinkedHashMap) yfzlMap.get(i)).get(userstr))) {
				n++;
				int count_temp = n;
				/*if (count_temp > ((page_temp - 1) * count)
						&& count_temp <= ((page_temp) * count))*///自测时可打开 关闭后使用用户的分页
					temp.put("" + (count_temp),
							((LinkedHashMap) yfzlMap.get(i)));
			}
		}
		if(data_count!=-1)n=data_count;
//		setFirstDataAndGetCount(page_temp,userstr,value);
		temp_result.put("" + 0, getFirst(n, page_temp));

		Iterator iter_temp = temp.keySet().iterator();
		while (iter_temp.hasNext()) {
			String row_id = (String) iter_temp.next();
			temp_result.put(row_id, temp.get(row_id));
		}
		return temp_result;
	}
//	public abstract LinkedHashMap getCustomData(int page,String label,String value);
	public int setYfzlTestData(int page,String lable,
			String value,String type){
		if(type.trim().equals(this.YFZL)){
			return getYfzlData(page,lable,value);
		}else if(type.trim().equals(this.YSZL)){
			return getYszlData(page,lable,value);
		}else if(type.trim().equals(this.DSZL)){
			return getDszlData(page,lable,value);
		} 		
		return 0;
	}
	public abstract int getYfzlData(int page,String lable,
			String value);
	public abstract int getYszlData(int page,String lable,
			String value);
	public abstract int getDszlData(int page,String lable,
			String value);
//	public abstract int setFirstDataAndGetCount(int page,String userstr,
//			String value);
	
	protected LinkedHashMap getFirst(int totalNum,int page){
		LinkedHashMap temp=new LinkedHashMap();
		temp.put("totalNum", totalNum);
		int totalPage=totalNum/count;
		if((totalNum%count)>0){
			totalPage=totalPage+1;
		}
		temp.put("totalPage", totalPage);
		temp.put("page", page);
		return temp;
	}
	
	private static String[] getUserID(String str){	
		if(str.startsWith("#")){
			return str.substring(1).split("=");
		}
		return null;
	}
	private static String parseMap(LinkedHashMap properyMap){
//		System.out.println("properyMap:"+properyMap);
		StringBuffer sb=new StringBuffer();
		sb.append("{");
		Iterator iter=properyMap.keySet().iterator();
		while(iter.hasNext()){
			String str=(String)iter.next();
			sb.append(str).append("=").append(properyMap.get(str)).append(",");
		}
//		System.out.println("1sb.toString():"+sb.toString());
//		System.out.println("1sb length::"+sb.length()+","+sb.lastIndexOf(","));
		
		if(sb.length()>2)
			{ String aa=sb.substring(0, sb.length()-1)+"}";//sb.length()-1	
//			System.out.println("aa:"+aa);
			return aa;
			}
//		System.out.println("2sb.toString():"+sb.toString());
		sb.append("}");
//		System.out.println("sb.toString():"+sb.toString());
		return sb.toString();
	}
}
