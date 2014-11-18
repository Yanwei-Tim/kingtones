package com.kingtone.jw.service.dao.impl;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.rmi.server.UID;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.imageio.ImageIO;

import org.kobjects.base64.Base64;
import org.springframework.jdbc.core.RowMapper;

import com.kingtone.jw.service.dao.AttachDAO;
import com.kingtone.jw.service.domain.QueryEnvelop;
import com.kingtone.jw.service.util.CommonTool;
import com.kingtone.jw.service.util.GetConfig;
import com.kingtone.jw.service.util.XmlParseTool;
import com.kingtone.ssi.dao.SSIDAO;
import com.kingtone.ssi.log.SSILogger;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGEncodeParam;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
/**
 * 
 * Title:附件相关处理--DAO类
 * Description:提供附件相关处理等功能
 * Author: 朱金华 - zhujinhua@kingtoneinfo.com
 * Date: Jun 2, 2011
 */
public class AttachDAOImpl extends SSIDAO implements AttachDAO {
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
	public class LoadRowMaperBlob implements RowMapper {
		String colName = "";
		public LoadRowMaperBlob(String colName){
			this.colName = colName;
		}
		public String mapRow(ResultSet rs, int rowNum) throws SQLException {
//				return writeImgFileByBlob(rs.getBlob(colName).getBinaryStream());
			if(rs.getBlob(colName)==null||rs.getBlob(colName).equals(""))return null;else		
			return Base64.encode(createSImgFileByBlob(rs.getBlob(colName).getBinaryStream()));
		}
	}
	
	public String queryImgBlobColnum(String bizId) throws Exception {
		// TODO Auto-generated method stub
		String sql="select C_COLUMN from column_map where b_id='"+bizId+"' and columns ='IMG' and CNAME_TYPE='BLOB'";
		return (String) this.queryForObject(sql,  new LoadRowMaper("C_COLUMN"));
	}
	
	/*根据查询信封处理图片,并返回图片临时存放地址*/
	public String queryImgByQE(QueryEnvelop queryEnvelop) throws Exception {
		String img_temp_Path=null;
		String bizId=queryEnvelop.getBizTag();
		String sql="select * from column_map where b_id='"+bizId+"' and columns ='IMG'";	
		String ccol=null;
		String imgflag=null;
//		String ccol=(String) this.queryForObject(sql,  new LoadRowMaper("C_COLUMN"));
		List<HashMap<String, String>> bizList = this.query(sql, new LoadListRowMaper());

		if(bizList!=null&&bizList.size()==1){
			ccol=bizList.get(0).get("C_COLUMN");
			imgflag=bizList.get(0).get("CNAME_TYPE");
		}else return img_temp_Path;
		String bidsql="select t.d_sql from business_config t where t.b_id='"+bizId+"'";
		String dsql=(String) this.queryForObject(bidsql,  new LoadRowMaper("D_SQL"));
		if(dsql==null||dsql.equals(""))return img_temp_Path;
		dsql=dsql.replace("@", ccol);
		String imgsql=CommonTool.getQueryCondSql(dsql,queryEnvelop);
		if(imgflag!=null&&imgflag.equals("BLOB")){
//		Blob imgblob=(Blob)this.queryForObject(imgsql, new LoadRowMaperBlob(ccol));
		String isimgstr=(String)this.queryForObject(imgsql, new LoadRowMaperBlob(ccol));
//		img_temp_Path=writeImgFileByBlob(imgblob);
		img_temp_Path=isimgstr;
		}else if(imgflag!=null&&!imgflag.equals("")){
		String imgstr=(String)this.queryForObject(imgsql, new LoadRowMaper(ccol));
		img_temp_Path=writeImgFileByStr(imgstr);
		}		
		return img_temp_Path;
	}
	
	/*图片临时存放目录*/
	private String img_temp_path=CommonTool.IMGFILEPATH;
	
	/*根据图片路径获取图片,并处理,返回临时图片地址*/
	private String writeImgFileByStr(String imgstr) throws Exception {
		img_temp_path=CommonTool.IMGFILEPATH;
		String img_path = imgstr;
		String newid=newID()+".jpg";	
		File file = new File(img_temp_path,newid);
		file.createNewFile();
		File readfile = new File(img_path);
		DataInputStream in = new DataInputStream(new BufferedInputStream(
				new FileInputStream(readfile)));
		DataOutputStream out = new DataOutputStream(new BufferedOutputStream(
				new FileOutputStream(file)));
		simpleImg(out,in);
		out.flush();
		in.close();
		out.close();
		return img_temp_path+newid;
	}
	
	/*根据图片BLOB获取图片,并处理,返回临时图片地址*/
	private String writeImgFileByBlob(InputStream is) throws SQLException {
		String newid= null;	
		DataInputStream in = null;
		DataOutputStream out= null;
		try {
			img_temp_path = CommonTool.IMGFILEPATH;
			newid = newID() + ".jpg";
			File file_path = new File(img_temp_path);
			if(!file_path.exists())file_path.mkdir();
			File file = new File(img_temp_path, newid);			
			file.createNewFile();
			in = new DataInputStream(new BufferedInputStream(is));
			out = new DataOutputStream(new BufferedOutputStream(
					new FileOutputStream(file)));
			simpleImg(out,in);
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			try {
				if (is != null)
					is.close();
				if (in != null)
					in.close();
				if (out != null)
					out.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}	
		}
		if(newid==null)return null;
		return img_temp_path+newid;
	}
	public String querySImgBytesByQE(String sqlStr)throws Exception{
		String[] sqls = sqlStr.split("split");
		String ds = CommonTool.confDAO.queryColValue_Res(sqls[0], "ds");
		QueryEnvelop request = new QueryEnvelop();
		XmlParseTool.toObj(sqls[1], request);
		return querySImgByQE(request,ds);
	}
	
	/*根据查询信封处理图片,并返回图片数据*/
	public String querySImgByQE(QueryEnvelop queryEnvelop,String ds) throws Exception {
		String img_temp_Path=null;
		String bizId=queryEnvelop.getBizTag();
		//根据业务id获取 查询详细sql语句
		String d_sql = CommonTool.confDAO.queryColValue_Biz(bizId, "d_sql");
		d_sql = CommonTool.getQueryCondSql(d_sql, queryEnvelop);	
		
		String sql="select * from jwt_conf.column_map where b_id='"+bizId+"' and columns ='IMG'";	
		String ccol=null;
		String imgflag=null;
		String table_name=null;
		String col=null;
//		String ccol=S(String) this.queryForObject(sql,  new LoadRowMaper("C_COLUMN"));
		List<HashMap<String, String>> bizList = this.query(sql, new LoadListRowMaper());

		if(bizList!=null&&bizList.size()==1){
			ccol=bizList.get(0).get("C_COLUMN");//bizList.get(0).get("TABLE_NAME")+"."+
			imgflag=bizList.get(0).get("CNAME_TYPE");
			table_name=bizList.get(0).get("TABLE_NAME");
			col=bizList.get(0).get("COLUMNS");
		}else return img_temp_Path;
		if(d_sql==null||d_sql.equals(""))return img_temp_Path;
		d_sql=d_sql.replace("@", ccol);	
		d_sql=d_sql.substring(0, d_sql.indexOf("from")+4)+" "+table_name+" "+d_sql.substring(d_sql.indexOf("where"));		
		String imgsql=d_sql;
		String zpStr = (String)ccol.substring(ccol.lastIndexOf(".")+1, ccol.length());
		if(imgflag!=null&&imgflag.equals("BLOB")){
			List list=CommonTool.bizDAO.queryCodeList(ds,imgsql, new LoadRowMaperBlob(ccol));
			if(list!=null&&list.size()>0){
				img_temp_Path=(String)list.get(0);
			}
		}else if(imgflag!=null&&!imgflag.equals("")){			
		String imgstr=(String)this.queryForObject(imgsql, new LoadRowMaper(zpStr));
		byte[] poto=createSImgFileByStr(imgstr);
		if(imgstr!=null&&!imgstr.equals("") && poto!=null)
		img_temp_Path=Base64.encode(poto);		
		}		
		return img_temp_Path;
	}
	
	/*根据查询信封处理图片,并返回图片临时存放地址*/
	public String querySImgPathByQE(QueryEnvelop queryEnvelop,String ds) throws Exception {
		String img_temp_Path=null;
		String bizId=queryEnvelop.getBizTag();
		String sql="select * from column_map where b_id='"+bizId+"' and columns ='IMG'";	
		String ccol=null;
		String imgflag=null;
		String table_name=null;
//		String ccol=(String) this.queryForObject(sql,  new LoadRowMaper("C_COLUMN"));
		List<HashMap<String, String>> bizList = this.query(sql, new LoadListRowMaper());

		if(bizList!=null&&bizList.size()==1){
			ccol=bizList.get(0).get("C_COLUMN");//bizList.get(0).get("TABLE_NAME")+"."+
			imgflag=bizList.get(0).get("CNAME_TYPE");
			table_name=bizList.get(0).get("TABLE_NAME");
		}
		String bidsql="select t.d_sql D_SQL from fw_conf_xa.business_config t where t.b_id='"+bizId+"'";
		String dsql=(String) this.queryForObject(bidsql,  new LoadRowMaper("D_SQL"));		 
//		dsql=dsql.replace("@", ccol);
//		dsql="select t.myimg MYIMG from fw_conf_xa.test_img t";
		dsql="select "+ccol+"  from "+table_name;
		String imgsql=CommonTool.getQueryCondSql(dsql,queryEnvelop);
		if(imgflag!=null&&imgflag.equals("BLOB")){
//		Blob imgblob=(Blob)this.queryForObject(imgsql, new LoadRowMaperBlob(ccol));
//		String isimgstr=(String)this.queryForObject(imgsql, new LoadRowMaperBlob(ccol));		
		String isimgstr=(String)(CommonTool.bizDAO.queryCodeList(ds,dsql, new LoadRowMaperBlob(ccol)).get(0));
//		img_temp_Path=writeImgFileByBlob(imgblob);
//		img_temp_Path=new String(createSImgFileByStr(isimgstr));
//		img_temp_Path = new String(Base64.encode(createSImgFileByStr(isimgstr)));
		img_temp_Path=isimgstr;
		}else if(imgflag!=null&&!imgflag.equals("")){
		String imgstr=(String)this.queryForObject(imgsql, new LoadRowMaper(ccol));
		img_temp_Path=Base64.encode(createSImgFileByStr(imgstr));
		}		
		return img_temp_Path;
	}
	
	/*根据图片路径获取图片,并处理,返回临时图片地址*/
	private byte[] createSImgFileByStr(String imgstr) throws Exception {
		DataInputStream in = null;
		ByteArrayOutputStream out= null;
		try {
		String img_path = GetConfig.GetConfigByKey("pic_path").toString()+imgstr;
		File readfile = new File(img_path);
		if(!readfile.exists()){
			return null;
		}
		in = new DataInputStream(new BufferedInputStream(
				new FileInputStream(readfile)));
		out = new ByteArrayOutputStream();
		simpleImg(out,in);
		
		/*int bufferSize = 1024; 
		byte[] buf = new byte[bufferSize];
		int read = 0;
		while ((read = in.read(buf)) != -1) {
			out.write(buf, 0, read);
		}*/
		
		out.flush();
		return out.toByteArray();
		} catch (Exception e) {
			e.printStackTrace();
			SSILogger.Bizlogger.error("获取图片错误", e);
			// TODO: handle exception
		}finally{
			try {
				if (in != null)
					in.close();
				if (out != null)
					out.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}	
		}
		return null;
	}
	
	/*根据图片BLOB获取图片,并处理,返回临时图片地址*/
	private byte[] createSImgFileByBlob(InputStream is) throws SQLException {
		String newid= null;	
		DataInputStream in = null;
		ByteArrayOutputStream out= null;
		try {
			
			out = new ByteArrayOutputStream();
			simpleImg(out,is);
			
		/*	in = new DataInputStream(new BufferedInputStream(is));
			int bufferSize = 1024; 
			byte[] buf = new byte[bufferSize];
			int read = 0;
			while ((read = in.read(buf)) != -1) {
				out.write(buf, 0, read);
			}*/
			
			out.flush();
			return out.toByteArray();
		} catch (Exception e) {
			e.printStackTrace();
			SSILogger.Bizlogger.error("获取图片错误", e);
			// TODO: handle exception
		}finally{
			try {
				if (is != null)
					is.close();
				if (in != null)
					in.close();
				if (out != null)
					out.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}	
		}
		return null;
	}
	/*获取ID*/
	private static String newID() {
		String id = new UID().toString();
		id = id.replaceAll(":|-", "");
		return id;
	}
		
	/*图片处理*/
	private boolean simpleImg(OutputStream out, InputStream in) throws Exception {
		 int width=CommonTool.IMGWIDTH,height=CommonTool.IMGWIDTH;
		Image srcFile = ImageIO.read(in);
		int new_w = 0, new_h = 0;
		int h = (int) srcFile.getHeight(null); 
		int w = (int) srcFile.getWidth(null);
			double rate = 0;  
			//宽度大于等于高度   
			if (w >= h) {
				rate = ((double) w) / (double) width;
			}
			//宽度小于高度   
			else if (h > w) {
				rate = ((double) h) / (double) height;
			}
			//构造新的比例的图片高度与宽度值   
			new_w = (int) (((double) w) / rate);
			new_h = (int) (((double) h) / rate);
			
			if(rate<1){
				new_w=w;
				new_h=h;
			}			
			
			/** 宽,高设定 */
			BufferedImage tag = new BufferedImage(new_w, new_h,
					BufferedImage.TYPE_INT_RGB);
			tag.getGraphics().drawImage(srcFile, 0, 0, new_w, new_h, null);

			JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
			JPEGEncodeParam jep = JPEGCodec.getDefaultJPEGEncodeParam(tag);
			jep.setQuality(1, true);
			encoder.encode(tag, jep);
			srcFile.flush();

		return true;
	}
}
