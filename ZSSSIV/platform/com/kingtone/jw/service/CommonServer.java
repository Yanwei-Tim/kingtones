/**
 * 文件名：CommonServer.java
 * 
 * 创建人：邹甲乐 - zoujiale@kingtoneinfo.com
 * 
 * 创建时间：Jun 2, 2011
 * 
 * 版权所有：西安联合信息技术股份有限公司
 */
package com.kingtone.jw.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.rmi.server.UID;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.axis.encoding.Base64;

import com.kingtone.jw.service.abs.BusiServiceAbstract;
import com.kingtone.jw.service.abs.BusiServiceFactory;
import com.kingtone.jw.service.domain.FaceEnvelop;
import com.kingtone.jw.service.domain.GpsConfigEnvelop;
import com.kingtone.jw.service.domain.GpsEnvelop;
import com.kingtone.jw.service.domain.InsertEnvelop;
import com.kingtone.jw.service.domain.QueryEnvelop;
import com.kingtone.jw.service.domain.SynchEnvelop;
import com.kingtone.jw.service.external.dragon.DragonServiceImpl;
import com.kingtone.jw.service.util.CommonTool;
import com.kingtone.jw.service.util.Constsants;
import com.kingtone.jw.service.util.GetConfig;
import com.kingtone.jw.service.util.XmlParseTool;
import com.kingtone.ssi.log.SSILogger;
import com.kingtone.ssi.security.SSISecurityService;
import com.kingtone.ssi.util.IDUtil;

/**
 * 
 * Title:通用服务类 Description:提供附表同步服务、业务交互服务 Author: 邹甲乐
 * -zoujiale@kingtoneinfo.com Date: Jun 2, 2011
 */
public class CommonServer {

	/**
	 * <p>
	 * 
	 * 判断是否同步更新数据
	 * </p>
	 * 
	 * @param xmlStr
	 * @return: String
	 * @author: 朱金华(zhujinhua@kingtoneinfo.com)
	 * @date: Dec 26, 2011
	 */
	public String getIfSycn(String xmlStr) {
		// return "20110813103958";
		try {
			if (!xmlStr.equals("") && xmlStr != null) {
				return CommonTool.synchDAO.queryRoleBizUpdateDate(xmlStr);
			}
			return CommonTool.synchDAO.queryRootBizUpdateDate();
		} catch (Exception e) {
			SSILogger.Bizlogger.error(e, e);
			return null;
		}
	}

	/**
	 * <p>
	 * 返回到期天数
	 * </p>
	 * 
	 * @param xmlStr
	 * @return: String
	 * @author: 朱金华(zhujinhua@kingtoneinfo.com)
	 * @date: Dec 26, 2011
	 */
	public String getSignatureDate(String xmlStr) {
		return String.valueOf(SSISecurityService.getLicenseDaoqiDate());
	}

	/**
	 * Description:获取配置库数据集，包括业务、业务关联、业务代码分类 Author:
	 * 朱金华(zhujinhua@kingtoneinfo.com) Date: Jul 7, 2011
	 * 
	 * @return
	 */
	public String getSycnList(String xmlStr) {
		SynchEnvelop request = new SynchEnvelop();
		SynchEnvelop response = new SynchEnvelop();
		try {
			if (!xmlStr.equals("")) {
				String jwusername = xmlStr.substring(0, xmlStr
						.indexOf("jw_user_name_str_split"));
				xmlStr = xmlStr.substring(xmlStr
						.indexOf("jw_user_name_str_split") + 22);
				if (!xmlStr.equals(""))
					XmlParseTool.toObj(xmlStr, request);
				return XmlParseTool.toXml(CommonTool.synchDAO.querySynchList(
						request, jwusername));
			}
			response = CommonTool.synchDAO.querySynchList(request);
			return XmlParseTool.toXml(response);
		} catch (Exception e) {
			SSILogger.Bizlogger.error(e, e);
			return null;
		}
	}

	/**
	 * Description:获取业务代码数据集 Author: 朱金华(zhujinhua@kingtoneinfo.com) Date: Jul
	 * 7, 2011
	 * 
	 * @param requestXml
	 * @return
	 */
	public String getSycnData(String sqlStr) {
		SynchEnvelop response = new SynchEnvelop();
		try {
			response = CommonTool.bizDAO.querySynchDataList(sqlStr);
			return XmlParseTool.toXml(response);
		} catch (Exception e) {
			SSILogger.Bizlogger.error(e, e);
			return null;
		}
	}

	/**
	 * Description:获取业务代码数据集 Author: 朱金华(zhujinhua@kingtoneinfo.com) Date: Jul
	 * 7, 2011
	 * 
	 * @param string
	 * @return
	 */
	public String getSycnDataStr(String sqlStr) {
		String responsestr;
		try {
			responsestr = CommonTool.bizDAO.querySynchDataStr(sqlStr);
			return responsestr;
		} catch (Exception e) {
			SSILogger.Bizlogger.error(e, e);
			return null;
		}
	}

	/**
	 * <p>
	 * 终端获取用户数据小图片，调用业务数据
	 * </p>
	 * 
	 * @param xmlStr
	 * @return: String
	 * @author: 朱金华(zhujinhua@kingtoneinfo.com)
	 * @date: Dec 26, 2011
	 */
	public String querySImgBytesByQE(String xmlStr) {
		try {
			return CommonTool.attachDAO.querySImgBytesByQE(xmlStr);
		} catch (Exception e) {
			SSILogger.Bizlogger.error(e, e);
			return null;
		}
	}

	/**
	 * <p>
	 * 查询业务信息列表
	 * </p>
	 * 
	 * @param xmlStr
	 * @return
	 * @author: 邹甲乐(zoujiale@kingtoneinfo.com)
	 * @date: Jan 5, 2012
	 */
	public String getList(String xmlStr) {
		QueryEnvelop request = new QueryEnvelop();
		QueryEnvelop response = new QueryEnvelop();
		try {
			
			XmlParseTool.toObj(xmlStr, request);
			CommonTool.logDAO.InsertQueryLog(request);
			if("S000000013".equals(request.getBizTag())){
				String xml =getTztgList(xmlStr);
				return xml;
			}else if(Constsants.getBidOAmap(request.getBizTag())){
				
				return getOaList(xmlStr);
			}else{
				if(Constsants.getBidQuerymap(request.getBizTag())){
					String value = getInterList(xmlStr);
					return value;
					}else{
						BusiServiceAbstract impl = BusiServiceFactory
						.getBean(BusiServiceFactory.BUSI_SERVICE_TYPE);
						impl.setQueryRequest(request);
						response = impl.getList();
						String test = XmlParseTool.toXml(response);
						return test;
					}
			}
			
		} catch (Exception e) {
			SSILogger.Bizlogger.error(e, e);
			return null;
		}
	}

	/**
	 * 
	 * @param args
	 */
	//接口列表
	public String getInterList(String xmlStr){
		SSILogger.Bizlogger.debug("---------内网webervices查询列表-----------------------------------------");
		QueryEnvelop request = new QueryEnvelop();
		QueryEnvelop response = new QueryEnvelop();
		try {
			XmlParseTool.toObj(xmlStr, request);
			String jkType = request.getJkType();
			CommonTool.logDAO.InsertQueryLog(request);
			DragonServiceImpl dragon = new DragonServiceImpl();
			response = dragon.getList(xmlStr);
			response.setBizTag(request.getBizTag());
			String xml = XmlParseTool.toXml(response);
			return xml;
		} catch (Exception e) {
			SSILogger.Bizlogger.error(e, e);
			return null;
		}
		
	}
	
	/**
	 * <p>
	 * 查询业务信息
	 * </p>
	 * 
	 * @param xmlStr
	 * @return
	 * @author: 邹甲乐(zoujiale@kingtoneinfo.com)
	 * @date: Jan 5, 2012
	 */
	public String getDetail(String xmlStr) {
		QueryEnvelop request = new QueryEnvelop();
		QueryEnvelop response = new QueryEnvelop();
		XmlParseTool.toObj(xmlStr, request);
		try {
			if(Constsants.getBidQuerymap(request.getBizTag())){
				String value = getInterDetail(xmlStr);
				return value;
			}else if(Constsants.getBidOAmap(request.getBizTag())){
				
				return getOaDetail(xmlStr);
			}else{
			CommonTool.logDAO.InsertQueryLog(request);

			BusiServiceAbstract impl = BusiServiceFactory
					.getBean(BusiServiceFactory.BUSI_SERVICE_TYPE);
			impl.setQueryRequest(request);
			response = impl.getDetail();

			return XmlParseTool.toXml(response);
			}
		} catch (Exception e) {
			SSILogger.Bizlogger.error(e, e);
			return null;
		}
	}

	/**
	 * <p>
	 * 添加业务信息：目前支持SQL方式、存储过程两种
	 * </p>
	 * 
	 * @param xmlStr
	 * @return
	 * @author: 邹甲乐(zoujiale@kingtoneinfo.com)
	 * @date: Jan 5, 2012
	 */
	public String addDetail(String xmlStr) {
		InsertEnvelop request = new InsertEnvelop();
		try {
			XmlParseTool.toObj(xmlStr, request);
			CommonTool.logDAO.InsertAddLog(request);

			BusiServiceAbstract impl = BusiServiceFactory
					.getBean(BusiServiceFactory.BUSI_SERVICE_TYPE);
			impl.setInsertRequest(request);
			impl.addDetail();

			return "success";
		} catch (Exception e) {
			SSILogger.Bizlogger.error(e, e);
			return null;
		}
	}

	/**
	 * <p>
	 * 在线统计-终端触发器记录用户在线状态
	 * </p>
	 * 
	 * @param username
	 * @author: 邹甲乐(zoujiale@kingtoneinfo.com)
	 * @date: Jan 4, 2012
	 */
	public void addLoadtime(String username) {
		BusiServiceAbstract impl = BusiServiceFactory
				.getBean(BusiServiceFactory.BUSI_SERVICE_TYPE);
		try {
			impl.addLoadtime(username);
		} catch (Exception e) {
			SSILogger.Bizlogger.error(e, e);
		}
	}

	/**
	 * <p>
	 * apk包版本检测
	 * </p>
	 * 
	 * @param:currentVersion 终端当前版本号
	 * @return：版本下载URL 或者 返回not字符串
	 * @author: 邹甲乐(zoujiale@kingtoneinfo.com)
	 * @date: Jan 4, 2012
	 */
	public String checkUpdate(String currentVersion) {
		return CommonTool.apkCheckBS.checkApk(currentVersion);
	}

	/**
	 * <p>
	 * 生成UUID
	 * </p>
	 * 
	 * @return
	 * @author: 邹甲乐(zoujiale@kingtoneinfo.com)
	 * @date: Jan 4, 2012
	 */
	public String getUUID() {
		String id = new UID().toString();
		// id = id.replaceAll(":|-", "");
		return id;
	}

	/**
	 * @param xmlStr
	 * @return 写入gps数据到数据库
	 */
	public String insertGPS(String xmlStr) {
		GpsEnvelop request = new GpsEnvelop();
		try {
			XmlParseTool.toObj(xmlStr, request);
			CommonTool.gpsDAO.InsertGPS(request);
			return "success";
		} catch (Exception e) {
			SSILogger.Bizlogger.error(e, e);
			return null;
		}
	}

	public String getOnOffStateByDeviceId(String deviceId) {
		try {
			GpsConfigEnvelop res = CommonTool.gpsDAO
					.getOnOffStateByDeviceId(deviceId);
			String s = XmlParseTool.toXml(res);
			return s + "";
		} catch (Exception e) {
			SSILogger.Bizlogger.error(e, e);
			return null;
		}
	}

	/**
	 * 验证用户登录信息。
	 * 
	 * @param xmlStr
	 * @return
	 * @CODE_001: SQL语句异常或数据库连接异常！
	 * @CODE_002: 用户帐号不存在！
	 * @CODE_003: 请输入匹配的注册手机信息！
	 * @CODE_004: 用户密码错误！
	 * @CODE_009: 该用户已被锁定，不能登录！
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on: Dec 6, 2011
	 */
	@SuppressWarnings("unchecked")
	public String loginValidate(String xmlStr) {
		return CommonTool.loginBS.loginValidate(xmlStr);
	}

	/**
	 * @deprecated: 更新用户密码 ( 修改自废弃方法：executeSQLforUpdate(String sql) )。
	 * @param userAccount:用户帐号
	 * @param oldPassword:旧密码
	 * @param newPassword:新密码
	 * 
	 * @return
	 * @CODE_001: SQL语句异常或数据库连接异常！
	 * @CODE_005: 密碼修改成功！
	 * @CODE_006: 更新密码验证失败，用户名或原密码错误！
	 */
	public String changePssword(String userAccount, String oldPassword,
			String newPassword) {
		return CommonTool.loginBS.changePssword(userAccount, oldPassword,
				newPassword);
	}

	public String getTztgList(String xmlStr) {

		QueryEnvelop request = new QueryEnvelop();
		QueryEnvelop response = null;
		try {
			XmlParseTool.toObj(xmlStr, request);
			response = CommonTool.tztgListDAO.findtztg(request);
			return XmlParseTool.toXml(response);
		} catch (Exception e) {
			SSILogger.Bizlogger.error(e, e);
			return null;
		}
	}
	
	public void setTztgUpdate(String id) throws Exception{
		CommonTool.tztgListDAO.setTztgUpdate(id);
	}
	
	public void pnReceive(String account,String message_id) throws Exception{
		CommonTool.platDAO.delNotice(account, message_id);
	}
	/**
	 * 文件下载
	 * 
	 * @param fileName
	 * @return
	 */
	public String downloadFile(String fileName) {
		try {
			String fileDir = "";
			String type = fileName.substring(fileName.lastIndexOf(".") + 1);
			if ("jpg".equals(type) || "jpeg".equals(type) || "ico".equals(type)
					|| "bmp".equals(type)) {
				fileDir = GetConfig.GetConfigByKey("pic_path");
			} else if ("avi".equals(type) || "mpeg".equals(type)
					|| "rmvb".equals(type) || "3gp".equals(type)) {
				fileDir = GetConfig.GetConfigByKey("vedio_path");
			} else {
				fileDir = GetConfig.GetConfigByKey("other_path");
			}
			String dataStream = "";
			byte[] byteStream = null;

			FileInputStream stream = new FileInputStream(fileDir + fileName);
			byteStream = new byte[stream.available()];

			stream.read(byteStream, 0, stream.available());
			dataStream = Base64.encode(byteStream);
			return dataStream;
		} catch (Exception e) {
			System.out.println(e.toString());
			e.printStackTrace();
			return "";
		}

	}

	/**
	 * @return http文件上传(拍照，视频上传)
	 */
	public String uploadFile(String SdfilePath,String fileName, String dataStream, String userName,
			String deviceId, String fileSize,String description,String unUpId) {
		FileOutputStream data_fos = null;
		String tag = "S";
		String fileDir = "";
		String sql = "";
		String type = fileName.substring(fileName.lastIndexOf(".") + 1);
		try {
			if ("jpg".equals(type) || "jpeg".equals(type) || "ico".equals(type)
					|| "bmp".equals(type)) {
				fileDir = GetConfig.GetConfigByKey("upload_path");
			} else if ("avi".equals(type) || "mpeg".equals(type)
					|| "rmvb".equals(type) || "3gp".equals(type)) {
				fileDir = GetConfig.GetConfigByKey("upload_path");
			} else {
				fileDir = GetConfig.GetConfigByKey("other_path");
			}
			File newfileDir = new File(fileDir);
			if (!newfileDir.exists()) {
				newfileDir.mkdirs();
			}
			File filePath = new File(fileDir + fileName);
			if (!filePath.exists()) {
					filePath.createNewFile();
			}
			byte[] bytes = Base64.decode(dataStream);
			data_fos = new FileOutputStream(filePath);
			data_fos.write(bytes);
			data_fos.flush();
			try {
				if ("jpg".equals(type) || "jpeg".equals(type)
						|| "ico".equals(type) || "bmp".equals(type)) {
					sql = "insert into jw_tpcj(id,picturename,device_Id,createtime,createuserid,description) values(PK_T_TPCJ.NEXTVAL,'"
							+ fileName
							+ "','"
							+ deviceId
							+ "',"
							+ "sysdate,'"
							+ userName + "','" + description + "')";

				} else if ("avi".equals(type) || "mpeg".equals(type)
						|| "rmvb".equals(type) || "3gp".equals(type)) {
					sql = "insert into jw_spcj(id,videoname,device_Id,createtime,length,description) values(PK_T_SPCJ.NEXTVAL,'"
							+ fileName
							+ "','"
							+ deviceId
							+ "',"
							+ "sysdate,'"
							+ fileSize + "','" + description + "')";
				} else {
					List tableList = CommonTool.confDAO
							.queryFileList("select t.* from jw_file_info t where t.filename='"
									+ fileName + "'");
					if (tableList == null
							|| "[[]]".equals(tableList.toString())) {
						sql = "insert into jw_file_info(filename,username,uploaddate)values('"
								+ fileName
								+ "','"
								+ userName
								+ "',"
								+ "sysdate)";
					} else {
						sql = "update jw_file_info set username ='" + userName
								+ "',uploaddate = sysdate where filename = '"
								+ fileName + "'";
					}
				}
				String delSql = "delete upload_fail where deviceid='"+deviceId+"' and name='"+fileName+"'";
				CommonTool.confDAO.delUnUpFile(delSql);
				CommonTool.confDAO.insertFileInfo(sql);
			} catch (Exception e) {
				e.printStackTrace();
				tag = "F";
			}
//			CommonTool.confDAO.insertFileInfo(sql);
			if(null!=unUpId&&!"".equals(unUpId)){
				String delSql = "delete upload_fail where id='"+unUpId+"'";
				CommonTool.confDAO.delUnUpFile(delSql);
			}
			tag = "S";
		} catch (Exception e) {
			if ("jpg".equals(type) || "jpeg".equals(type) || "ico".equals(type)
					|| "bmp".equals(type)) {
				sql = "insert into upload_fail(id,name,deviceid,sd_url,type,filesize,description) values('"+IDUtil.newID()+"','"
						+ fileName
						+ "','"
						+ deviceId
						+ "','"
						+ SdfilePath
						+ "','图片','"
						+fileSize +"','"
						+description+"')";

			} else if ("avi".equals(type) || "mpeg".equals(type)
					|| "rmvb".equals(type) || "3gp".equals(type)) {
				sql = "insert into upload_fail(id,name,deviceid,sd_url,type,filesize,description) values('"+IDUtil.newID()+"','"
						+ fileName
						+ "','"
						+ deviceId
						+ "','"
						+ SdfilePath
						+ "','视频','"
						+fileSize +"','"
						+description+"')";
			}else{
				sql = "insert into upload_fail(id,name,deviceid,sd_url,type,filesize,description) values('"+IDUtil.newID()+"','"
						+ fileName
						+ "','"
						+ deviceId
						+ "','"
						+ SdfilePath
						+ "','文件','"
						+fileSize +"','"
						+description+"')";
			}
			try {
				CommonTool.confDAO.insertFileInfo(sql);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} finally {
			try {
				data_fos.close();
			} catch (IOException e) {
				tag = "F";
				e.printStackTrace();
			}
		}
		return tag;
	}

	/**
	 * @return 文件上传
	 */
	/* 文件上传 图片采集和视频采集 */
	 public String uploadFile(String fileName, String dataStream, String userName) {
		FileOutputStream data_fos = null;
		String tag = "F";
		String fileDir = "";
		String type = fileName.substring(fileName.lastIndexOf(".") + 1);
		try {
			if ("jpg".equals(type) || "jpeg".equals(type) || "ico".equals(type)
					|| "bmp".equals(type)) {
				fileDir = GetConfig.GetConfigByKey("pic_path");
			} else if ("avi".equals(type) || "mpeg".equals(type)
					|| "rmvb".equals(type) || "3gp".equals(type)) {
				fileDir = GetConfig.GetConfigByKey("vedio_path");
			} else {
				fileDir = GetConfig.GetConfigByKey("other_path");
			}
			File newfileDir = new File(fileDir);
			if (!newfileDir.exists()) {
				newfileDir.mkdirs();
			}
			File filePath = new File(fileDir + fileName);
			if (!filePath.exists()) {
				filePath.createNewFile();
			}
			System.out.println("filePath--------" + filePath);
			byte[] bytes = Base64.decode(dataStream);
			data_fos = new FileOutputStream(filePath);
			data_fos.write(bytes);
			data_fos.flush();
			List tableList = CommonTool.confDAO
					.queryFileList("select t.* from jw_file_info t where t.filename='"
							+ fileName + "'");
			if (tableList == null || "[[]]".equals(tableList.toString())) {
				CommonTool.confDAO
						.insertFileInfo("insert into jw_file_info(filename,username,uploaddate)values('"
								+ fileName
								+ "','"
								+ userName
								+ "',"
								+ "sysdate)");
			} else {
				CommonTool.confDAO
						.insertFileInfo("update jw_file_info set username ='"
								+ userName
								+ "',uploaddate = sysdate where filename = '"
								+ fileName + "'");
			}
			tag = "S";
		} catch (Exception e) {
			System.out.println("uploadFile:" + e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				data_fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return tag;
	}

	/**
	 * <p>
	 * 文件上传信息录入
	 * </p>
	 * 
	 * @param xmlStr
	 * @return
	 * @author: 阎浩(yanhao@kingtoneinfo.com)
	 * @date: Jan 17, 2012
	 */
	public String entryUploadFileInfo(String fileName, String userName,
			String deviceId, String fileSize, String description) {
		// String tag = "F";
		// try {
		// List tableList = CommonTool.confDAO
		// .queryFileList("select t.* from jw_file_info t where t.filename='"
		// + fileName + "'");
		// if (tableList == null || "[[]]".equals(tableList.toString())) {
		// CommonTool.confDAO
		// .insertFileInfo("insert into
		// jw_file_info(filename,username,uploaddate)values('"
		// + fileName
		// + "','"
		// + userName
		// + "',"
		// + "sysdate)");
		// } else {
		// CommonTool.confDAO
		// .insertFileInfo("update jw_file_info set username ='"
		// + userName
		// + "',uploaddate = sysdate where filename = '"
		// + fileName + "'");
		// }
		// tag = "S";
		// } catch (Exception e) {
		// System.out.println("entryUploadFileInfo:" + e.getMessage());
		// e.printStackTrace();
		// }
		String tag = "F";
		String sql = "";
		String type = fileName.substring(fileName.lastIndexOf(".") + 1);
		try {
//			if ("jpg".equals(type) || "jpeg".equals(type) || "ico".equals(type)
//					|| "bmp".equals(type)) {
//				sql = "insert into jw_tpcj(id,picturename,device_Id,createtime,createuserid) values(PK_T_TPCJ.NEXTVAL,'"
//						+ fileName
//						+ "','"
//						+ deviceId
//						+ "',"
//						+ "sysdate,'"
//						+ userName + "')";
//
//			} else if ("avi".equals(type) || "mpeg".equals(type)
//					|| "rmvb".equals(type) || "3gp".equals(type)) {
//				sql = "insert into jw_spcj(id,videoname,device_Id,createtime,length) values(PK_T_SPCJ.NEXTVAL,'"
//						+ fileName
//						+ "','"
//						+ deviceId
//						+ "',"
//						+ "sysdate,'"
//						+ fileSize + "')";
//			}
			
			if ("jpg".equals(type) || "jpeg".equals(type)
					|| "ico".equals(type) || "bmp".equals(type)) {
				sql = "insert into jw_tpcj(id,picturename,device_Id,createtime,createuserid,description) values(PK_T_TPCJ.NEXTVAL,'"
						+ fileName
						+ "','"
						+ deviceId
						+ "',"
						+ "sysdate,'"
						+ userName + "','" + description + "')";

			} else if ("avi".equals(type) || "mpeg".equals(type)
					|| "rmvb".equals(type) || "3gp".equals(type)) {
				sql = "insert into jw_spcj(id,videoname,device_Id,createtime,length,description) values(PK_T_SPCJ.NEXTVAL,'"
						+ fileName
						+ "','"
						+ deviceId
						+ "',"
						+ "sysdate,'"
						+ fileSize + "','" + description + "')";
			}
			CommonTool.confDAO.insertFileInfo(sql);
			tag = "S";
		} catch (Exception e) {
			System.out.println("entryUploadFileInfo:" + e.getMessage());
			e.printStackTrace();
		}
		return tag;
	}

	public String UnUploadFile(String deviceId){
		QueryEnvelop response = new QueryEnvelop();
		String sql = "select type,name,sd_url,description from upload_fail where deviceid='"+deviceId+"' order by id";
		List list =null;
		try {
			list = CommonTool.confDAO.queryFileList(sql);
			List resultList = (List)list.get(0);
			response.setList(resultList);
			String xml = XmlParseTool.toXml(response);
			return xml;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return XmlParseTool.toXml(response);
	}
	/**
	 * <p>
	 * 查询业务信息列表
	 * </p>
	 * 
	 * @param xmlStr
	 * @return
	 * @author: 邹甲乐(zoujiale@kingtoneinfo.com)
	 * @date: Jan 5, 2012
	 */
	public String getOAUserList(String xmlStr) {

		QueryEnvelop request = new QueryEnvelop();
		QueryEnvelop response = new QueryEnvelop();
		try {
			XmlParseTool.toObj(xmlStr, request);
			// CommonTool.logDAO.InsertQueryLog(request);

			// BusiServiceAbstract impl = BusiServiceFactory
			// .getBean(BusiServiceFactory.BUSI_SERVICE_TYPE);
			// impl.setQueryRequest(request);
			// response = impl.getList();
			if (request != null
					&& request.getCondition().get("QUserName") != null
					&& (!request.getCondition().get("QUserName").equals(""))) {
				Map map1 = new HashMap();
				map1.put("UserID", "0011");
				map1.put("Name", "张三1");
				map1.put("DeptName", "科室11");
				map1.put("FilName", "部门11");
				response.getList().add(map1);
			}
			return XmlParseTool.toXml(response);
		} catch (Exception e) {
			SSILogger.Bizlogger.error(e, e);
			return null;
		}
	}

	/**
	 * 
	 * 获取对应角色ID的sqlite文件最新版本信息
	 * @param roleId：用户角色ID
	 * @return 对应角色ID的sqlite文件最新版本信息
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on: Dec 27, 2011
	 */
	public String getSqliteSynchListByRoleId(String roleId) {
		QueryEnvelop qe = new QueryEnvelop();
		try {
			List sqliteSynch = CommonTool.synchDAO.querySqliteSynchListByRoleId(roleId);
			qe.setList(sqliteSynch);
		} catch (Exception e) {
			SSILogger.Bizlogger.error(e, e);
		}
		return XmlParseTool.toXml(qe);
	}
	
	/**
	 * 
	 * 获取警务用户的角色ID
	 * @param userAccount：用户账号
	 * @return 用户角色ID
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on: Dec 27, 2011
	 */
	public String getRoleIdByUserName(String userAccount) {
		String roleId = null;
		try {
			roleId = CommonTool.synchDAO.queryRoleIdByUserName(userAccount);
		} catch (Exception e) {
			SSILogger.Bizlogger.error(e, e);
		}
		return roleId;
	}
	
	/**
	 * 更具设备串码更新用户密码。
	 * 
	 * @param sjcm
	 * @param newPassword
	 * @return
	 * @CODE_001: SQL语句异常或数据库连接异常！
	 * @CODE_005: 密碼修改成功！
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on: 2012-03-19
	 */
	public String changePsswordBySJCM(String sjcm, String newPassword){
		return CommonTool.loginBS.changePsswordBySJCM(sjcm, newPassword);
	}
	
	/**
	 * 
	 * 获取通知公告列表数据信息
	 * @return 通知公告数据
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on: March 28, 2012
	 */
	public String getNoticeList() {
		QueryEnvelop qe = new QueryEnvelop();
		try {
			String sql = "select t.id, t.title from jw_tztg t where t.sendstatus = \'1\'";
			List queryList = CommonTool.confDAO.queryFileList(sql);
			qe.setList(queryList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return XmlParseTool.toXml(qe);
	}
	
	
	
	//接口详细
	public String getInterDetail(String xmlStr) {
		QueryEnvelop request = new QueryEnvelop();
		QueryEnvelop response = new QueryEnvelop();
		try {
			XmlParseTool.toObj(xmlStr, request);
			CommonTool.logDAO.InsertQueryLog(request);
			DragonServiceImpl dragon = new DragonServiceImpl();
			response = dragon.getDetail(xmlStr);
			response.setJkType("Y");
			response.setBizTag(request.getBizTag());
				String xml = XmlParseTool.toXml(response);
				System.out.print(xml);
				return xml;
		} catch (Exception e) {
			SSILogger.Bizlogger.error(e, e);
			return null;
		}
	}
	
	
	//OA　列表返回
	public String getOaList(String xlmStr){
		QueryEnvelop request = new QueryEnvelop();
		QueryEnvelop response = new QueryEnvelop();
		try {
			XmlParseTool.toObj(xlmStr, request);
			CommonTool.logDAO.InsertQueryLog(request);
			String b_id = request.getBizTag();
			List list = new ArrayList();
			if("B201100062".equals(b_id)){
//				list = CommonTool.oaPermissionDAO.getOaGList(request.getUserID());
				list = CommonTool.oaPermissionDAO.getOaGList(request);
//				Map map = CommonTool.oaPermissionDAO.getGDetail("c5d108aa-ec43-40c1-8f4e-b1cb56f50c91");
			}else {
				list = CommonTool.oaPermissionDAO.getOaCYList(request);
			}
			response.setBizTag(request.getBizTag());
			response.setList(list);
			response.setTotalNum(list.size());
		response.setTotalPage(request.getTotalPage());
				String xml = XmlParseTool.toXml(response);
				System.out.print(xml);
				return xml;
		} catch (Exception e) {
			SSILogger.Bizlogger.error(e, e);
			return null;
		}
	}
	//OA详细返回
	public String getOaDetail(String xmlStr){
		QueryEnvelop request = new QueryEnvelop();
		QueryEnvelop response = new QueryEnvelop();
		try {
			XmlParseTool.toObj(xmlStr, request);
			CommonTool.logDAO.InsertQueryLog(request);
			Map condition = request.getCondition();
			String uid = condition.get("TASKID").toString();
			Map map = new HashMap();
			//B201100062浠ｅ姙锛孊201100063浼犻槄
			if("B201100062".equals(request.getBizTag())){
				map = CommonTool.oaPermissionDAO.getGDetail(uid);
			}else{
				map = CommonTool.oaPermissionDAO.getCyDetail(uid);
			}
			response.setBizTag(request.getBizTag());
			response.setDetail(map);
				String xml = XmlParseTool.toXml(response);
				System.out.print(xml);
				return xml;
		} catch (Exception e) {
			SSILogger.Bizlogger.error(e, e);
			return null;
		}
	}
	//OA去步骤和意见
	public String getOaMind(String xmlStr){
		QueryEnvelop response = new QueryEnvelop();
		QueryEnvelop request = new QueryEnvelop();
		try {
			List list = new ArrayList();
			XmlParseTool.toObj(xmlStr, request);
			Map condition = request.getCondition();
			String uid = condition.get("TASKID").toString();
			if("B201100062".equals(request.getBizTag())){
				list = CommonTool.oaPermissionDAO.getMindList(uid);
			}else{
				list = CommonTool.oaPermissionDAO.getHisMindList(uid);
			}
			response.setBizTag(request.getBizTag());
			response.setList(list);
				String xml = XmlParseTool.toXml(response);
				System.out.print(xml);
				return xml;
		} catch (Exception e) {
			SSILogger.Bizlogger.error(e, e);
			return null;
		}
	}
	//预警上报提醒
	public void setAlarm(String value){
		new AlarmEvent(value);
	}
	
	/**
	 * 获取通讯录部门信息
	 * @param xmlStr
	 * @return
	 */
	public String getDepartment(String xmlStr) {
		String result = null;
		try {
			QueryEnvelop request = new QueryEnvelop();
			XmlParseTool.toObj(xmlStr, request);
			CommonTool.logDAO.InsertQueryLog(request);

			QueryEnvelop response = CommonTool.contactsDAO.getDepartment(request);
			
			result = XmlParseTool.toXml(response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 获取通讯录人员信息
	 * @param xmlStr
	 * @return
	 */
	public String getEmployeeByDepId(String xmlStr) {
		
		String result = null;
		try {
			QueryEnvelop request = new QueryEnvelop();
			XmlParseTool.toObj(xmlStr, request);
			
			CommonTool.logDAO.InsertQueryLog(request);
			QueryEnvelop response = CommonTool.contactsDAO.getEmployeeByDepId(request);
			
			result = XmlParseTool.toXml(response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 人脸识别查询
	 * @param xmlStr
	 * @return
	 */
	public String queryFace(String xmlStr) {
		String result = null;
		try {
			FaceEnvelop request = new FaceEnvelop();
			XmlParseTool.toObj(xmlStr, request);
			CommonTool.logDAO.InsertFaceLog(request);
			FaceEnvelop response = CommonTool.faceService.queryFace(request);
			result = XmlParseTool.toXml(response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 获取法律法规目录
	 * @param xmlStr
	 * @return
	 */
	public String queryLawDirectory(String xmlStr){
		String result = null;
		try {
			QueryEnvelop request = new QueryEnvelop();
			XmlParseTool.toObj(xmlStr, request);
			CommonTool.logDAO.InsertQueryLog(request);
			
			QueryEnvelop response = CommonTool.lawService.queryLawDirectory(request);
			result = XmlParseTool.toXml(response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	/**
	 * 获取法律法规内容
	 * @param xmlStr
	 * @return
	 */
	public String queryLawContent(String xmlStr){
		String result = null;
		try {
			QueryEnvelop request = new QueryEnvelop();
			XmlParseTool.toObj(xmlStr, request);
			CommonTool.logDAO.InsertQueryLog(request);
			
			QueryEnvelop response = CommonTool.lawService.queryLawContent(request);
			result = XmlParseTool.toXml(response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 插入布控人员
	 * @param xmlStr
	 * @return
	 */
	public String queryControlUser(String xmlStr){
		String result = null;
		try {
			QueryEnvelop request = new QueryEnvelop();
			
//			Map<String, String> condition = new HashMap();
//			condition.put("IDCARD", "12346");	
//			condition.put("NAME", "www36");	
//			condition.put("GPSX", "12336");	
//			request.setCondition(condition);
			
			XmlParseTool.toObj(xmlStr, request);
			CommonTool.logDAO.InsertQueryLog(request);			
			QueryEnvelop response =CommonTool.controlService.queryControlUser(request);
			result = XmlParseTool.toXml(response);
		} catch (Exception e) {
			e.printStackTrace();
		}			
		return result;
	}
	/**
	 * 插入布控车辆
	 * @param xmlStr
	 * @return
	 */
	public void queryControlCar(String xmlStr){
		try {
			QueryEnvelop request = new QueryEnvelop();
			XmlParseTool.toObj(xmlStr, request);
			CommonTool.logDAO.InsertQueryLog(request);						
			CommonTool.controlService.queryControlCar(request);			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		
		new CommonServer().queryControlUser("11");
		
		//String str = CommonTool.apkCheckBS.checkApk("1.0");
		//System.out.println(str);
		// String filter = "XM,XB,JG,SFZH";
		// filter = filter.replaceAll(" ", "");
		// String[] filters = filter.split(",");
		// System.out.println(filter);
		// System.out.println(CommonTool.getRetColSql(filter, "B20110011"));

		// try {
		// new CommonServer().commonServerDAO.loadColMap();
		// new CommonServer().commonServerDAO.loadResMap();
		// System.out.println(new
		// CommonServer().commonServerDAO.queryBizSql("B20110011"));
		// } catch (Exception e) {
		// e.printStackTrace();
		// }

		//		
		// QueryEnvelop commonEnvelop = new QueryEnvelop();
		// Map condMap = new HashMap();
		// // condMap.put("RYBH", "A10000000000000068");
		// // condMap.put("YRYBH", "53193");
		// // condMap.put("SWRQ", "2011-07-11");
		// commonEnvelop.setCondition(condMap);
		// commonEnvelop.setBizTag("B20110011");
		// commonEnvelop.setPageNum(3);
		// String cond = XmlParseTool.toXml(commonEnvelop);
		//		
		// String serviceUrl =
		// "http://localhost:8088/yljw/services/CommonServer?wsdl";
		// String methodName = "getList";
		// String str = test.call(serviceUrl,methodName,cond);
		//		
		// commonEnvelop = new QueryEnvelop();
		// XmlParseTool.toObj(str, commonEnvelop);
		// Map detail = commonEnvelop.getDetail();
		// System.out.println("commonEnvelop.getRetDetail()"+commonEnvelop.getDetail());
		// List list = commonEnvelop.getList();
		// System.out.println("commonEnvelop.getRetList().size()"+commonEnvelop.getList().size());
		// for (Object o : list) {
		// Map map = (HashMap) o;
		// System.out.print(map.get("RN"));
		// }

		// InsertEnvelop commonEnvelop = new InsertEnvelop();
		// Map condMap = new HashMap();
		// // condMap.put("ACCOUNT_ID", "110010001");
		// condMap.put("name", "123");
		// condMap.put("psw", "123");
		// condMap.put("des", "123");
		// commonEnvelop.setDetail(condMap);
		// commonEnvelop.setBizTag("B20110013");
		// String cond = XmlParseTool.toXml(commonEnvelop);
		//		
		// String serviceUrl =
		// "http://localhost:8088/yljw/services/CommonServer?wsdl";
		// String methodName = "addDetail";
		// String str = test.call(serviceUrl,methodName,cond);
		//		
		// System.out.println(str);

		// InsertEnvelop ie = new InsertEnvelop();
		// ie.setBizTag("bizId");
		// ie.setUserID("userId");
		// try {
		// CommonTool.logDAO.InsertAddLog(ie);
		// } catch (Exception e) {
		// e.printStackTrace();
		// }

		// String serviceUrl =
		// "http://localhost:8088/SSIV/services/CommonServer?wsdl";
		// String methodName = "getList";
		// String xmlStr = "<com.kingtone.jw.service.domain.QueryEnvelop>"+
		// "<bizTag>B201100015</bizTag>"+
		// "<condition/>"+
		// "<detail/>"+
		// "<list/>"+
		// "<userID>3</userID>"+
		// "<pageSize>6</pageSize>"+
		// "<totalNum>-1</totalNum>"+
		// "<totalPage>-1</totalPage>"+
		// "<pageNum>1</pageNum>"+
		// "</com.kingtone.jw.service.domain.QueryEnvelop>";
		// String str = test.call(serviceUrl,methodName,xmlStr);
		// System.out.println(str);
		//		
		// String xmlStr2 = "<com.kingtone.jw.service.domain.QueryEnvelop>"+
		// "<bizTag>B201100017</bizTag>"+
		// "<condition/>"+
		// "<detail/>"+
		// "<list/>"+
		// "<userID>3</userID>"+
		// "<pageSize>6</pageSize>"+
		// "<totalNum>-1</totalNum>"+
		// "<totalPage>-1</totalPage>"+
		// "<pageNum>1</pageNum>"+
		// "</com.kingtone.jw.service.domain.QueryEnvelop>";
		// String str2 = test.call(serviceUrl,methodName,xmlStr2);
		// System.out.println(str2);

		// String serviceUrl =
		// "http://localhost:8080/SSIV/services/CommonServer?wsdl";
		// String methodName = "insertGPS";
		// String xmlStr = "<com.kingtone.jw.service.domain.GpsEnvelop>"+
		// "<diviceId>aaaaaaaa</diviceId>"+
		// "<x>14.123</x>"+
		// "<y>14.345</y>"+
		// "</com.kingtone.jw.service.domain.GpsEnvelop>";
		// String str = test.call(serviceUrl,methodName,xmlStr);
		// System.out.println(str);

		// String serviceUrl =
		// "http://localhost:8080/SSIV/services/CommonServer?wsdl";
		// String methodName = "findFileListBySQL";
		// String sql="select * from jw_gps_config where deviceid='123' ";
		// String str = test.call(serviceUrl,methodName,sql);
		// System.out.println(str);

		// String serviceUrl =
		// "http://localhost:8080/SSIV/services/CommonServer?wsdl";
		// String methodName = "getOnOffStateByDeviceId";
		//
		// String str = test.call(serviceUrl, methodName, "123111230012276");
		// System.out.println(str);
		// CommonServer cs=new CommonServer();
		// System.out.println(cs.getOnOffStateByDeviceId("123111230012276"));
		// CommonServer cs=new CommonServer();
		// System.out.println(cs.getOnOffStateByDeviceId("354711040263554"));

		// LoginEnvelop le = new LoginEnvelop();
		// le.setPsw("111");
		// le.setUserID("88");
		// Map expantionValid = new HashMap<String, String>();
		// expantionValid.put("SJHM", "88");
		// expantionValid.put("SJCM", "88");
		// expantionValid.put("JMKH", "88");
		// le.setDetail(expantionValid);
		// String str = XmlParseTool.toXml(le);
		// try {
		// CommonServer cs = new CommonServer();
		// String loginValidate = cs.loginValidate(str);
		// System.out.print(loginValidate);
		// } catch (Exception e) {
		// e.printStackTrace();
		// }
	}

}
