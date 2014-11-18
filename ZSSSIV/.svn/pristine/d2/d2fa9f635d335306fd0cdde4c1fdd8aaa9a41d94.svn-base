/**
 * @Title: JwOAServer.java
 * @Package com.kingtone.jw.service
 * @Description: 终端警务OA 服务  Web Service 
 * @Copyright: Copyright (c) 2012  西安联合信息技术股份有限公司
 * @author 王海博
 * @date Jul 30, 2013 9:47:10 AM
 * @version V0.5
 */
package com.kingtone.jw.service.jwoa.server;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.rpc.holders.IntegerWrapperHolder;
import javax.xml.rpc.holders.StringHolder;

import org.ksoap2.SoapEnvelope;
import org.ksoap2.serialization.SoapObject;
import org.ksoap2.serialization.SoapSerializationEnvelope;
import org.ksoap2.transport.HttpTransportSE;

import sun.misc.BASE64Decoder;

import com.kingtone.activity.oa.receipt.widget.TreeElement;
import com.kingtone.jw.service.jwoa.bean.ArrayOfCheckerInfo;
import com.kingtone.jw.service.jwoa.bean.ArrayOfIssuerInfo;
import com.kingtone.jw.service.jwoa.bean.ArrayOfParameterInfo;
import com.kingtone.jw.service.jwoa.bean.ArrayOfSWCodeRecordInfo;
import com.kingtone.jw.service.jwoa.bean.ArrayOfSuperiorsInfo;
import com.kingtone.jw.service.jwoa.bean.ArrayOfTasktableInfo;
import com.kingtone.jw.service.jwoa.bean.PostingRecord;
import com.kingtone.jw.service.jwoa.bean.ReadInTurnDetail;
import com.kingtone.jw.service.jwoa.bean.ReceiptDetail;
import com.kingtone.jw.service.jwoa.bean.ReceiptRecord;
import com.kingtone.jw.service.jwoa.bean.ReceiveFile;
import com.kingtone.jw.service.jwoa.bean.SuperiorsInfo;
import com.kingtone.jw.service.jwoa.bean.UTIssuedProcessRecord;
import com.kingtone.jw.service.jwoa.bean.UndertakRecord;
import com.kingtone.jw.service.jwoa.envelop.OaEnvelop;
import com.kingtone.jw.service.jwoa.pojo.FileType;
import com.kingtone.jw.service.jwoa.pojo.ReceiptType;
import com.kingtone.jw.service.jwoa.wcf.CommonServices_Service;
import com.kingtone.jw.service.jwoa.wcf.CommonServices_ServiceLocator;
import com.kingtone.jw.service.jwoa.wcf.PerusalService_Service;
import com.kingtone.jw.service.jwoa.wcf.PerusalService_ServiceLocator;
import com.kingtone.jw.service.jwoa.wcf.ReceiptService_Service;
import com.kingtone.jw.service.jwoa.wcf.ReceiptService_ServiceLocator;
import com.kingtone.jw.service.jwoa.wcf.TaskService_Service;
import com.kingtone.jw.service.jwoa.wcf.TaskService_ServiceLocator;
import com.kingtone.jw.service.jwoa.wcf.UndertakeService_Service;
import com.kingtone.jw.service.jwoa.wcf.UndertakeService_ServiceLocator;
import com.kingtone.jw.service.jwoa.xml.AnalyzeXml;
import com.kingtone.jw.service.jwoa.xml.GenerateXml;
import com.kingtone.jw.service.util.CommonTool;
import com.kingtone.jw.service.util.XmlParseTool;
import com.kingtone.ssi.log.SSILogger;

/**
 * @ClassName: JwOAServer
 * @Description: 终端警务OA 服务 Web Service
 * @author 王海博
 * @date Jul 30, 2013 9:47:10 AM
 * 
 */
public class JwOAServer {
    /**
     * @Fields analyzeXml : xml解析类
     */
    private AnalyzeXml analyzeXml = new AnalyzeXml();
    /**
     * @Fields gx : 封装xml格式的参数服务
     */
    private GenerateXml gx = new GenerateXml();
    /**
     * 附件下载接口地址
     */
    private static final String fileDownLoad_serviceUrl = "http://10.44.128.20:8014/FileDwonloadService.asmx";
    
    /**
     * 根据警员号获取当前登录者的信息
     * findPKSysUser
     * @param userId  警员警号
     * @return Map<String,String>
     * USERNAME       警号
     * FULLNAME       姓名
     * REG_NUM        部门名称
     * REG_RUNID      部门编号
     * CORPID         单位编号“zsga”
     * EID            所属分局
     * ...            ...
     * 如果还有需要其他字段的请看文档“中山公安局移动警务办公系统接口规范详细说明文档v1.5.doc”中 “3.1.12  公安局人员列表接口 ”的表说明，表名是sys_user
     * @throws Exception 
     */
    public String findPKSysUser(String userId) throws Exception{
        OaEnvelop rsquest = new OaEnvelop();
        List<Map<String, Object>> list  = CommonTool.oaPermissionDAO.findUserList(userId,"");
        if(list != null&&list.size()>0){
            Map<String, Object> map = new HashMap<String, Object>();
            map.putAll(list.get(0));
            list = new ArrayList<Map<String,Object>>();
            list.add(map);
            rsquest.setList(list);
        }
        return XmlParseTool.toXml(rsquest);
    }
    
    /**
     * @Description: 3.1.1  文件类型（一级）接口
     * @Title: getFileType
     * @return  
     * @throws Exception 
     */
    public String findVFileTypeMList(String queryParamsXml) throws Exception{
        FileType request = new FileType();
        OaEnvelop rsquest = new OaEnvelop();
        XmlParseTool.toObj(queryParamsXml, request);
        List<FileType> fileTypeList = CommonTool.oaPermissionDAO.findVFileTypeMList(request);
        rsquest.setList(fileTypeList);
        return XmlParseTool.toXml(rsquest);
    }
    
    /**
     * @Description: 3.1.2  文件类型（二级）接口
     * @Title: getFileType
     * @return  
     * @throws Exception 
     */
    public String findTowFileTypeList(String queryParamsXml) throws Exception{
        FileType request = new FileType();
        OaEnvelop rsquest = new OaEnvelop();
        XmlParseTool.toObj(queryParamsXml, request);
        List<FileType> fileTypeList = CommonTool.oaPermissionDAO.findTowFileTypeList(request);
        rsquest.setList(fileTypeList);
        return XmlParseTool.toXml(rsquest);
    }
    
    /**
     * 查询收文类别列表，供用户收文时选择
     * @author litengmin
     * @param receiptType
     * @return
     * @throws Exception
     */
    public String findReceiptTypeList(String queryParamsXml) throws Exception{
        ReceiptType receiptType = new ReceiptType();
        OaEnvelop rsquest = new OaEnvelop();
        XmlParseTool.toObj(queryParamsXml, receiptType);
        List<ReceiptType> list = CommonTool.oaPermissionDAO.findReceiptTypeList(receiptType);
        rsquest.setList(list);
        return XmlParseTool.toXml(rsquest);
    }
    
    /**
     * 保密级别列表
     * @author litengmin
     * @return
     * @throws SQLException
     */
    public String findBMlevelList() throws Exception{
        OaEnvelop rsquest = new OaEnvelop();
        List<String> list = CommonTool.oaPermissionDAO.findBMlevelList();
        rsquest.setList(list);
        return XmlParseTool.toXml(rsquest);
    }
    
    /**
     * 紧急程度列表
     * @author litengmin
     * @return
     * @throws SQLException
     */
    public String findjjcdList() throws Exception{
        OaEnvelop rsquest = new OaEnvelop();
        List<String> list = CommonTool.oaPermissionDAO.findjjcdList();
        rsquest.setList(list);
        return XmlParseTool.toXml(rsquest);
    }
    
    /**
     * 主题词
     * @author litengmin
     * @return
     * @throws SQLException
     */
    public String findZTCList() throws Exception{
        OaEnvelop rsquest = new OaEnvelop();
        List<String> list = CommonTool.oaPermissionDAO.findZTCList();
        rsquest.setList(list);
        return XmlParseTool.toXml(rsquest);
    }
    
    /**
     * 常用批示语
     * @author litengmin
     * @return
     * @throws SQLException
     */
    public String findCYPSYList() throws Exception{
        OaEnvelop rsquest = new OaEnvelop();
        List<String> list = CommonTool.oaPermissionDAO.findCYPSYList();
        rsquest.setList(list);
        return XmlParseTool.toXml(rsquest);
    }
    
    /**
     * 根据警号查询该警员常用批示语列表
     * @author litengmin
     * @param userId 警员警号
     * @return
     * @throws SQLException
     */
    public String findUserToCYCList(String userId) throws Exception{
        OaEnvelop rsquest = new OaEnvelop();
        List<String> list = CommonTool.oaPermissionDAO.findUserToCYCList(userId);
        rsquest.setList(list);
        return XmlParseTool.toXml(rsquest);
    }
    
    /**
     * 3.1.9    主送单位列表、抄送单位列表
     * @return
     * @throws Exception
     */
    public String getSelOrgTaxis()throws Exception{
        OaEnvelop rsquest = new OaEnvelop();
        List<TreeElement> treeList = CommonTool.oaPermissionDAO.findSelorgtaxis();
        rsquest.setList(treeList);
        return XmlParseTool.toXml(rsquest);
    }
    
    /**
     * 3.1.9    主送单位列表、抄送单位列表
     * @return
     * @throws Exception
     */
    public String findSelusertaxis(String area)throws Exception{
        OaEnvelop rsquest = new OaEnvelop();
        List<TreeElement> treeList = CommonTool.oaPermissionDAO.findSelusertaxis(area);
        rsquest.setList(treeList);
        return XmlParseTool.toXml(rsquest);
    }
    
    /**
     * 3.1.11   公安局组织架构列表
     * @return
     * @throws Exception
     */
    public String findOrgTree(String area)throws Exception{
        OaEnvelop rsquest = new OaEnvelop();
        List<TreeElement> treeList = CommonTool.oaPermissionDAO.findOrgTree(area,false);
        rsquest.setList(treeList);
        String result = XmlParseTool.toXml(rsquest);
        return result;
    }
    
    /**
     * 3.1.12   公安局人员列表
     * @param orgId 部门ID
     * @return List<Map<String,String>> key请注意大小写
     *          key        |          value
     *          USERNAME    |       警员警号
     *          FULLNAME    |       警员姓名
     * @throws Exception
     */
    public String findUserList(String orgId) throws Exception{
        OaEnvelop rsquest = new OaEnvelop();
        List<Map<String, String>> userList = CommonTool.oaPermissionDAO.findUserList(orgId);
        List<Map<String, String>> resultList = new ArrayList<Map<String,String>>();
        Map<String, String> map1 = null;
        for (Map<String, String> map : userList) {
            map1 = new HashMap<String, String>();
            map1.putAll(map);
            resultList.add(map1);
        }
        rsquest.setList(resultList);
        return XmlParseTool.toXml(rsquest);
    }
    
    /**
     * 3.1.12   公安局人员列表
     * @param area 分局代码
     * @return 
     * @throws Exception
     */
    public String findOrgToUserList(String area) throws Exception{
        OaEnvelop rsquest = new OaEnvelop();
        List<TreeElement> treeList = CommonTool.oaPermissionDAO.findOrgTree(area,true);
        rsquest.setList(treeList);
        String result = XmlParseTool.toXml(rsquest);
        return result;
    }
    
    /**
     * 拟办人检索接口
     * @param userId
     * @param userName
     * @return
     * @throws Exception
     */
    public String findUserListOfSeach(String userId, String userName)throws Exception{
        ArrayOfSuperiorsInfo result = new ArrayOfSuperiorsInfo();
        List<SuperiorsInfo> infoList = new ArrayList<SuperiorsInfo>();
        result.setSuperiorsInfoList(infoList);
        SuperiorsInfo info = null;
        OaEnvelop rsquest = new OaEnvelop();
        List<Map<String, Object>> list  = CommonTool.oaPermissionDAO.findUserList(userId, userName);
        for (Map map : list) {
            info = new SuperiorsInfo();
            //代办事宜中的人员选择查询列表 modify by yangzm
            info.setUsername(map.get("userno").toString());
            info.setFullname(map.get("fullname").toString());
            info.setOrg(map.get("orgname").toString());
            infoList.add(info);
        }
        rsquest.setList(result.getSuperiorsInfoList());
        return XmlParseTool.toXml(rsquest);
    }
    /**
     * 获取发文签发员列表
     * @param area
     * @return
     * @throws Exception
     */
    public String findIssuingUserList(String area) throws Exception{
        OaEnvelop rsquest = new OaEnvelop();
        List<Map<String, Object>> list  = CommonTool.oaPermissionDAO.findIssuingUserList(area);
        if(list != null&&list.size()>0){
            List<Map<String, Object>> list1 = new ArrayList<Map<String,Object>>();
            Map<String, Object> map = null;
            for (Map<String, Object> map1 : list) {
                map = new HashMap<String, Object>();
                map.putAll(map1);
                list1.add(map);
            }
            rsquest.setList(list1);
        }
        return XmlParseTool.toXml(rsquest);
    }
    
    /**
     * @Title: getCheckerListService
     * @Description: 核稿人列表接口
     * @param fullName
     *            用户姓名，可为空
     * @param area
     *            当前用户所属分局
     * @param flag
     *            用户组类型--1为核稿人,2为批办人
     * @return String 返回类型 xml
     *         格式的核稿人对象（com.kingtone.jw.service.jwoa.bean.CheckerInfo）
     * @throws Exception 
     * 
     */
    public String getCheckerListService(String fullName, String area, String flag) throws Exception {
        OaEnvelop rsquest = new OaEnvelop();
        CommonServices_Service service = new CommonServices_ServiceLocator();
        String response = service.getBasicHttpBinding_CommonServices().getCheckerListService(fullName, area, Integer.parseInt(flag));
        InputStream input = new ByteArrayInputStream(getBytesUTF8(response));
        ArrayOfCheckerInfo list = (ArrayOfCheckerInfo)analyzeXml.getReceiptService(input,ArrayOfCheckerInfo.class);
        rsquest.setList(list.getCheckerInfoList());
        return XmlParseTool.toXml(rsquest);
    }

    /**
     * @Title: getSuperiorsListService
     * @Description: 上级领导列表
     * @param userName
     *            用户警号
     * @return String 返回类型 xml
     *         格式的核稿人对象（com.kingtone.jw.service.jwoa.bean.SuperiorsInfo）
     */
    public String getSuperiorsListService(String userName) throws Exception {
        OaEnvelop rsquest = new OaEnvelop();
        CommonServices_Service service = new CommonServices_ServiceLocator();
        String response = service.getBasicHttpBinding_CommonServices().getSuperiorsListService(userName);
        InputStream input = new ByteArrayInputStream(getBytesUTF8(response));
        ArrayOfSuperiorsInfo list = (ArrayOfSuperiorsInfo)analyzeXml.getReceiptService(input,ArrayOfSuperiorsInfo.class);
        rsquest.setList(list.getSuperiorsInfoList());
        return XmlParseTool.toXml(rsquest);
    }

    /**
     * @Title: getIssuerListService
     * @Description: 分发人列表
     * @param area
     *            用户所属分局
     * @return String 返回类型 xml
     *         格式的核稿人对象（com.kingtone.jw.service.jwoa.bean.IssuerInfo）
     */
    public String getIssuerListService(String area) throws Exception {
        OaEnvelop rsquest = new OaEnvelop();
        CommonServices_Service service = new CommonServices_ServiceLocator();
        String response = service.getBasicHttpBinding_CommonServices().getIssuerListService(area);
        InputStream input = new ByteArrayInputStream(getBytesUTF8(response));
        ArrayOfIssuerInfo list = (ArrayOfIssuerInfo)analyzeXml.getReceiptService(input,ArrayOfIssuerInfo.class);
        rsquest.setList(list.getIssuerInfoList());
        return XmlParseTool.toXml(rsquest);
    }
    
    /**
     * @Description 收文号列表接口
     * @param refGuid
     * @param year
     * @return String 返回类型 xml
     *         格式的核稿人对象（com.kingtone.jw.service.jwoa.bean.SWCodeRecordInfo
     * @throws Exception
     */
    public String getSWFileNoListService(String refGuid, int year) throws Exception{
        OaEnvelop rsquest = new OaEnvelop();
        CommonServices_Service service = new CommonServices_ServiceLocator();
        String response = service.getBasicHttpBinding_CommonServices().getSWFileNoListService(refGuid, year);
        InputStream input = new ByteArrayInputStream(getBytesUTF8(response));
        ArrayOfSWCodeRecordInfo list = (ArrayOfSWCodeRecordInfo)analyzeXml.getReceiptService(input, ArrayOfSWCodeRecordInfo.class);
        rsquest.setList(list.getSWCodeRecordInfoList());
        return XmlParseTool.toXml(rsquest);
    }
    
    
    /**
     * @Title: getReceiptListService
     * @Description: 收文记录检索
     * @param queryParamsXml
     *            查询条件组成的参数配置字符串
     * @param userName
     *            当前用户编号
     * @param corpId
     *            企业编号：zsga
     * @return String 返回类型
     * @throws Exception
     */
    public String getReceiptListService(String queryParamsXml) throws Exception {
        SSILogger.Bizlogger
                .debug("---------内网webervices查询列表-----------------------------------------");
        OaEnvelop request = new OaEnvelop();
        OaEnvelop rsquest = new OaEnvelop();
        XmlParseTool.toObj(queryParamsXml, request);
        // 解析参数
        ArrayOfParameterInfo arrayPI = new ArrayOfParameterInfo();
        arrayPI.setList(request.getCondition());
        String formXml = gx.generateObjToXmlStr(arrayPI);

        int pageSize = request.getPageSize();
        int pageIndex = request.getPageIndex();
        String userName = request.getUserAccount();// 操作人账号
        String corpId = request.getCorpId(); // 单位编号
        // 返回参数
        javax.xml.rpc.holders.StringHolder getReceiptListServiceResult = new StringHolder();
        javax.xml.rpc.holders.IntegerWrapperHolder recordCount = new IntegerWrapperHolder();

        ReceiptService_Service client = new ReceiptService_ServiceLocator();
        client.getBasicHttpBinding_ReceiptService().getReceiptListService(
                formXml, pageSize, pageIndex, userName, corpId,
                getReceiptListServiceResult, recordCount);
        // 解析接口返回的XML文件
        InputStream input = new ByteArrayInputStream(
                this.getBytesUTF8(getReceiptListServiceResult.value));
        Map<String, String> dd = new HashMap<String, String>();
        dd.put("文件号", "fileNumber");
        dd.put("标题", "title");
        dd.put("拟稿日期", "dateOfDraft");
        dd.put("GUID", "guid");
        dd.put("文件类别", "fileType");
        dd.put("流程状态", "status");
        dd.put("附件", "hasFile");
        dd.put("ROW_NUMBER", "rowNumber");
        
        List<ReceiveFile> list = analyzeXml.getReceiptListService(input, dd,
                ReceiveFile.class, "ReceiptInfo");
        rsquest.setList(list);
        rsquest.setRecordCount(recordCount.value);
        return XmlParseTool.toXml(rsquest);
    }

    /**
     * 3.4.4    收文记录已阅操作接口
     * @param queryParamsXml
     * @return 处理结果信息 格式：
     * <table>
     *   <tr><td>错误编码</td><td>|</td><td>错误信息</td></tr>
     *   <tr><td>1001</td><td>|</td><td>参数非空错误</td></tr>
     *   <tr><td>2001</td><td>|</td><td>表单信息提取失败（formXml）</td></tr>
     *   <tr><td>3001</td><td>|</td><td>信息保存失败</td></tr>
     *   <tr><td>3002</td><td>|</td><td>流程信息生成失败</td></tr>
     *   <tr><td>900X</td><td>|</td><td>操作成功后，返回的信息</td></tr>
     * </table>
     * @throws Exception
     */
    public String setReceivingReadStatusService(String queryParamsXml) throws Exception {
        OaEnvelop request = new OaEnvelop();
        XmlParseTool.toObj(queryParamsXml, request);
        // 获取参数
        String guid = request.getGuid();
        String userName = request.getUserAccount();
        String corpId = request.getCorpId();
        
        ReceiptService_Service client = new ReceiptService_ServiceLocator();
        return client.getBasicHttpBinding_ReceiptService().setReceivingReadStatusService(guid, userName, corpId);
    }
    
    /**
     * @Title: getReceiptDetailService
     * @Description: 收文记录明细
     * @param guid
     *            收文记录的GUID编号
     * @param userName
     *            当前用户编号
     * @param corpId
     *            企业编号：zsga
     * @return String 返回类型
     */
    public String getReceiptDetailService(String queryParamsXml)
            throws Exception {
        OaEnvelop request = new OaEnvelop();
        OaEnvelop rsquest = new OaEnvelop();
        XmlParseTool.toObj(queryParamsXml, request);
        // 获取参数
        String guid = request.getGuid();
        String userName = request.getUserAccount();
        String corpId = request.getCorpId();
        // 调用OA系统提供的web Service
        ReceiptService_Service client = new ReceiptService_ServiceLocator();
        String response = client.getBasicHttpBinding_ReceiptService()
                .getReceiptDetailService(guid, userName, corpId);
        // 将返回的XML格式的字符串转换成流
        InputStream input = new ByteArrayInputStream(
                this.getBytesUTF8(response));
        // 解析XML字符流
        ReceiptDetail obj = (ReceiptDetail) analyzeXml.getReceiptService(input,
                ReceiptDetail.class);
        rsquest.setDetail(obj);
        return XmlParseTool.toXml(rsquest);
        
    }

    /**
     * 收文签收
     * 
     * @param queryParamsXml
     * @return
     *格式： 错误编码 | 错误信息
     *          1001|参数非空错误
     *          2001|表单信息提取失败（formXml）
     *          3001|信息保存失败
     *          3002|流程信息生成失败
     *          900X|操作成功后，返回的信息
     * @throws Exception
     */
    public String setReceivingSignService(String queryParamsXml)
            throws Exception {
        OaEnvelop request = new OaEnvelop();
        OaEnvelop rsquest = new OaEnvelop();
        XmlParseTool.toObj(queryParamsXml, request);
        // 解析参数
        ReceiptRecord arrayPI = (ReceiptRecord)request.getCondition().get(0);
        
        String formXml = gx.generateObjToXmlStr(arrayPI);
        Integer wfId = request.getWfId(); // 流程编号
        Integer noteId = request.getNoteId(); // 流程节点编号
        Integer proId = request.getProId(); // 处理编号
        String procName = request.getProcName();// 当前处理步骤名称
        String userName = request.getUserAccount();// 当前用户编号
        String corpId = request.getCorpId();// 企业编号：zsga

        ReceiptService_Service client = new ReceiptService_ServiceLocator();
        String response = client.getBasicHttpBinding_ReceiptService()
                .setReceivingSignService(formXml, wfId, noteId, proId,
                        procName, userName, corpId);
        rsquest.setDetail(response);
        return XmlParseTool.toXml(rsquest);
    }

    /**
     * （收文拟办）再次拟办接口
     * 
     * @param queryParamsXml
     * @return
     *格式： 错误编码 | 错误信息
     *          1001|参数非空错误
     *          2001|表单信息提取失败（formXml）
     *          3001|信息保存失败
     *          3002|流程信息生成失败
     *          900X|操作成功后，返回的信息
     * @throws Exception
     */
    public String setReceivingRedraftOPService(String queryParamsXml)
            throws Exception {
        OaEnvelop request = new OaEnvelop();
        OaEnvelop rsquest = new OaEnvelop();
        XmlParseTool.toObj(queryParamsXml, request);
        // 解析参数
        ReceiptRecord arrayPI = (ReceiptRecord)request.getCondition().get(0);

        String formXml = gx.generateObjToXmlStr(arrayPI);
        Integer wfId = request.getWfId();
        Integer noteId = request.getNoteId();
        Integer proId = request.getProId();
        String procName = request.getProcName();
        String userName = request.getUserAccount();
        String corpId = request.getCorpId();
        ReceiptService_Service client = new ReceiptService_ServiceLocator();
        String response = client.getBasicHttpBinding_ReceiptService()
                .setReceivingRedraftOPService(formXml, wfId, noteId, proId,
                        procName, userName, corpId);
        rsquest.setDetail(response);
        return XmlParseTool.toXml(rsquest);
    }

    /**
     * （收文拟办）给批办接口
     * 
     * @param queryParamsXml
     * @return
     *格式： 错误编码 | 错误信息
     *          1001|参数非空错误
     *          2001|表单信息提取失败（formXml）
     *          3001|信息保存失败
     *          3002|流程信息生成失败
     *          900X|操作成功后，返回的信息
     * @throws Exception
     */
    public String setReceiptApprovalOPService(String queryParamsXml)
            throws Exception {
        OaEnvelop request = new OaEnvelop();
        OaEnvelop rsquest = new OaEnvelop();
        XmlParseTool.toObj(queryParamsXml, request);
        // 解析参数
        ReceiptRecord arrayPI = (ReceiptRecord)request.getCondition().get(0);
        String formXml = gx.generateObjToXmlStr(arrayPI);
        Integer wfId = request.getWfId();
        Integer noteId = request.getNoteId();
        Integer proId = request.getProId();
        String procName = request.getProcName();
        String userName = request.getUserAccount();
        String corpId = request.getCorpId();
        ReceiptService_Service client = new ReceiptService_ServiceLocator();
        String response = client.getBasicHttpBinding_ReceiptService()
                .setReceiptApprovalOPService(formXml, wfId, noteId, proId,
                        procName, userName, corpId);
        rsquest.setDetail(response);
        return XmlParseTool.toXml(rsquest);
    }

    /**
     * （收文拟办）收文归档接口
     * 
     * @param queryParamsXml
     * @return
     *格式： 错误编码 | 错误信息
     *          1001|参数非空错误
     *          2001|表单信息提取失败（formXml）
     *          3001|信息保存失败
     *          3002|流程信息生成失败
     *          900X|操作成功后，返回的信息
     * @throws Exception
     */
    public String setFilingStatusOPService(String queryParamsXml)
            throws Exception {
        OaEnvelop request = new OaEnvelop();
        OaEnvelop rsquest = new OaEnvelop();
        XmlParseTool.toObj(queryParamsXml, request);
        // 解析参数
        ReceiptRecord arrayPI = (ReceiptRecord)request.getCondition().get(0);
        String formXml = gx.generateObjToXmlStr(arrayPI);
        Integer wfId = request.getWfId();
        Integer noteId = request.getNoteId();
        Integer proId = request.getProId();
        String procName = request.getProcName();
        String userName = request.getUserAccount();
        String corpId = request.getCorpId();
        ReceiptService_Service client = new ReceiptService_ServiceLocator();
        String response = client.getBasicHttpBinding_ReceiptService()
                .setFilingStatusOPService(formXml, wfId, noteId, proId,
                        procName, userName, corpId);
        rsquest.setDetail(response);
        return XmlParseTool.toXml(rsquest);
    }

    /**
     * （收文拟办）承办下发接口
     * 
     * @param queryParamsXml
     * @return
     *格式： 错误编码 | 错误信息
     *          1001|参数非空错误
     *          2001|表单信息提取失败（formXml）
     *          3001|信息保存失败
     *          3002|流程信息生成失败
     *          900X|操作成功后，返回的信息
     * @throws Exception
     */
    public String setReceivingUndertakeOPService(String queryParamsXml)
            throws Exception {
        OaEnvelop request = new OaEnvelop();
        OaEnvelop rsquest = new OaEnvelop();
        XmlParseTool.toObj(queryParamsXml, request);
        // 解析参数
        ReceiptRecord arrayPI = (ReceiptRecord)request.getCondition().get(0);
        String formXml = gx.generateObjToXmlStr(arrayPI);
        Integer wfId = request.getWfId();
        Integer noteId = request.getNoteId();
        Integer proId = request.getProId();
        String procName = request.getProcName();
        String userName = request.getUserAccount();
        String corpId = request.getCorpId();
        ReceiptService_Service client = new ReceiptService_ServiceLocator();
        String response = client.getBasicHttpBinding_ReceiptService()
                .setReceivingUndertakeOPService(formXml, wfId, noteId, proId,
                        procName, userName, corpId);
        rsquest.setDetail(response);
        return XmlParseTool.toXml(rsquest);
    }

    /**
     * （收文拟办）结果反馈接口
     * 
     * @param queryParamsXml
     * @return
     *格式： 错误编码 | 错误信息
     *          1001|参数非空错误
     *          2001|表单信息提取失败（formXml）
     *          3001|信息保存失败
     *          3002|流程信息生成失败
     *          900X|操作成功后，返回的信息
     * @throws Exception
     */
    public String setReceivingFeekbackService(String queryParamsXml)
            throws Exception {
        OaEnvelop request = new OaEnvelop();
        OaEnvelop rsquest = new OaEnvelop();
        XmlParseTool.toObj(queryParamsXml, request);
        // 解析参数
        ReceiptRecord receReco = new ReceiptRecord();
        receReco = (ReceiptRecord)request.getCondition().get(0);

        String formXml = gx.generateObjToXmlStr(receReco);
        Integer wfId = request.getWfId();
        Integer noteId = request.getNoteId();
        Integer proId = request.getProId();
        String procName = request.getProcName();
        String userName = request.getUserAccount();
        String corpId = request.getCorpId();
        ReceiptService_Service client = new ReceiptService_ServiceLocator();
        String response = client.getBasicHttpBinding_ReceiptService()
                .setReceivingFeekbackService(formXml, wfId, noteId, proId,
                        procName, userName, corpId);
        rsquest.setDetail(response);
        return XmlParseTool.toXml(rsquest);
    }

    /**
     * 批办完成处理接口
     * 
     * @param queryParamsXml
     * @return
     *格式： 错误编码 | 错误信息
     *          1001|参数非空错误
     *          2001|表单信息提取失败（formXml）
     *          3001|信息保存失败
     *          3002|流程信息生成失败
     *          900X|操作成功后，返回的信息
     * @throws Exception
     */
    public String setReceiptApprovalStatusService(String queryParamsXml)
            throws Exception {
        OaEnvelop request = new OaEnvelop();
        OaEnvelop rsquest = new OaEnvelop();
        XmlParseTool.toObj(queryParamsXml, request);
        // 解析参数
        ReceiptRecord receReco = new ReceiptRecord();
        receReco = (ReceiptRecord)request.getCondition().get(0);

        String formXml = gx.generateObjToXmlStr(receReco);
        Integer wfId = request.getWfId();
        Integer noteId = request.getNoteId();
        Integer proId = request.getProId();
        String procName = request.getProcName();
        String userName = request.getUserAccount();
        String corpId = request.getCorpId();
        ReceiptService_Service client = new ReceiptService_ServiceLocator();
        String response = client.getBasicHttpBinding_ReceiptService()
                .setReceiptApprovalStatusService(formXml, wfId, noteId, proId,
                        procName, userName, corpId);
        rsquest.setDetail(response);
        return XmlParseTool.toXml(rsquest);
    }

    /**
     * （收文拟办）收文传阅接口
     * 
     * @param queryParamsXml
     * @return
     *格式： 错误编码 | 错误信息
     *          1001|参数非空错误
     *          2001|表单信息提取失败（formXml）
     *          3001|信息保存失败
     *          3002|流程信息生成失败
     *          900X|操作成功后，返回的信息
     * @throws Exception
     */
    public String setReadInTurnOPService(String queryParamsXml)
            throws Exception {
        OaEnvelop request = new OaEnvelop();
        OaEnvelop rsquest = new OaEnvelop();
        XmlParseTool.toObj(queryParamsXml, request);
        String taskId = request.getTaskId();//收文流程编号，收文表的GUID
        String sendList = request.getSendList();//收阅人编号字符串（多个收阅人时，用“,”半角逗号字符分隔）
        String circulatedOpinion = request.getCirculatedOpinion();//传阅意见
        boolean sendSMS = request.isSendSMS();//是否短信通知
        String userName = request.getUserAccount();
        String corpId = request.getCorpId();
        ReceiptService_Service client = new ReceiptService_ServiceLocator();
        String response = client.getBasicHttpBinding_ReceiptService()
                .setReadInTurnOPService(taskId, sendList, circulatedOpinion,
                        sendSMS, userName, corpId);
        rsquest.setDetail(response);
        return XmlParseTool.toXml(rsquest);
    }

    /**
     * @Title: getDBListService
     * @Description: 在移动OA中，当前用户进行查看待办事宜列表
     * @param queryParamsXml
     *            查询条件组成的参数配置字符串
     * @return String 返回类型
     */
    public String getDBListService(String queryParamsXml) throws Exception {
        OaEnvelop request = new OaEnvelop();
        OaEnvelop rsquest = new OaEnvelop();
        XmlParseTool.toObj(queryParamsXml, request);
        CommonTool.logDAO.InsertOALog(request);// add by yangzm for oa log
        
        int pageSize = request.getPageSize();
        int pageIndex = request.getPageIndex();
        String userName = request.getUserAccount();
        String corpId = request.getCorpId();
        StringHolder getDBListServiceResult = new StringHolder();
        IntegerWrapperHolder recordCount = new IntegerWrapperHolder();
        
        TaskService_Service client = new TaskService_ServiceLocator();
        client.getBasicHttpBinding_TaskService().getDBListService(pageSize, pageIndex, userName, corpId, getDBListServiceResult, recordCount);
        InputStream input = new ByteArrayInputStream(getBytesUTF8(getDBListServiceResult.value));
        ArrayOfTasktableInfo list = (ArrayOfTasktableInfo) analyzeXml
                .getReceiptService(input, ArrayOfTasktableInfo.class);
        rsquest.setList(list.getTasktableInfoList());
        rsquest.setRecordCount(recordCount.value);
        return XmlParseTool.toXml(rsquest);

    }

    /**
     * @Title: getCYListService
     * @Description:查询未签收的传阅公文列表
     * @param queryParamsXml查询条件组成的参数配置字符串
     * @return String 返回类型
     * @throws Exception
     */
    public String getCYListService(String queryParamsXml) throws Exception {
        OaEnvelop request = new OaEnvelop();
        OaEnvelop rsquest = new OaEnvelop();
         XmlParseTool.toObj(queryParamsXml, request);
         CommonTool.logDAO.InsertOALog(request);// add by yangzm for oa log
         
         //获取参数
         int pageSize = request.getPageSize();
         int pageIndex = request.getPageIndex();
         String userName = request.getUserAccount();
         String corpId = request.getCorpId();
         //定义返回参数
         StringHolder getCYListServiceResult = new StringHolder();
         IntegerWrapperHolder recordCount = new IntegerWrapperHolder();
         //调用webService接口
         TaskService_Service client = new TaskService_ServiceLocator();
         client.getBasicHttpBinding_TaskService().getCYListService(pageSize, pageIndex, userName, corpId, getCYListServiceResult, recordCount);
         
         InputStream input = new ByteArrayInputStream(getBytesUTF8(getCYListServiceResult.value));
         
        ArrayOfTasktableInfo list = (ArrayOfTasktableInfo) analyzeXml.getReceiptService(input, ArrayOfTasktableInfo.class);
        rsquest.setList(list.getTasktableInfoList());
        rsquest.setRecordCount(recordCount.value);
        return XmlParseTool.toXml(rsquest);
    }
    
    /**
     * 收文承办记录明细接口
     * @param queryParamsXml
     * @return
     * @throws Exception
     */
    public String getUndertakeDetailService(String queryParamsXml) throws Exception {
        OaEnvelop request = new OaEnvelop();
        OaEnvelop rsquest = new OaEnvelop();
        XmlParseTool.toObj(queryParamsXml, request);
        // 获取参数
        String guid = request.getGuid();
        String userName = request.getUserAccount();
        String corpId = request.getCorpId();
        UndertakeService_Service client = new UndertakeService_ServiceLocator();
        String response = client.getBasicHttpBinding_UndertakeService().getUndertakeDetailService(guid, userName, corpId);
        InputStream input = new ByteArrayInputStream(getBytesUTF8(response));
        
        UndertakRecord obj = (UndertakRecord)analyzeXml.getReceiptService(input, UndertakRecord.class);
        rsquest.setDetail(obj);
        return XmlParseTool.toXml(rsquest);
    }
    
    /**
     * 3.5.2    承办处理过程追索接口GetProcessListService
     * @param queryParamsXml
     * @return
     * @throws Exception
     */
    public String getProcessListService(String queryParamsXml) throws Exception{
        OaEnvelop request = new OaEnvelop();
        OaEnvelop rsquest = new OaEnvelop();
        XmlParseTool.toObj(queryParamsXml, request);
        // 获取参数
        String guid = request.getGuid();
        String corpId = request.getCorpId();
        UndertakeService_Service client = new UndertakeService_ServiceLocator();
        String response = client.getBasicHttpBinding_UndertakeService().getProcessListService(guid, corpId);
        InputStream input = new ByteArrayInputStream(getBytesUTF8(response));
        UTIssuedProcessRecord obj = (UTIssuedProcessRecord)analyzeXml.getReceiptService(input, UTIssuedProcessRecord.class);
        rsquest.setList(obj.getUTHistoryProcInfoList());
        return XmlParseTool.toXml(rsquest);
    }
    
    /**
     * 3.5.3    （收文承办）办结返回接口
     * @param queryParamsXml
     * @return
     * @throws Exception
     */
    public String setUndertakeFeekbackService(String queryParamsXml) throws Exception{
        OaEnvelop request = new OaEnvelop();
        OaEnvelop rsquest = new OaEnvelop();
        XmlParseTool.toObj(queryParamsXml, request);
        String formXml = gx.generateObjToXmlStr(request.getCondition().get(0));
        Integer wfId = request.getWfId();
        Integer noteId = request.getNoteId();
        Integer proId = request.getProId();
        String procName = request.getProcName();
        String userName = request.getUserAccount();
        String corpId = request.getCorpId();
        UndertakeService_Service client = new UndertakeService_ServiceLocator();
        String response = client.getBasicHttpBinding_UndertakeService().setUndertakeFeekbackService(formXml, wfId, noteId, proId, procName, userName, corpId);
        rsquest.setDetail(response);
        return XmlParseTool.toXml(rsquest);
    }
    
    /**
     * 3.5.4    （收文承办）承办下发接口
     * @param queryParamsXml
     * @return
     * @throws Exception
     */
    public String setUndertakeIssuedService(String queryParamsXml) throws Exception{
        OaEnvelop request = new OaEnvelop();
        OaEnvelop rsquest = new OaEnvelop();
        XmlParseTool.toObj(queryParamsXml, request);
        String formXml = gx.generateObjToXmlStr(request.getCondition().get(0));
        Integer wfId = request.getWfId();
        Integer noteId = request.getNoteId();
        Integer proId = request.getProId();
        String procName = request.getProcName();
        String userName = request.getUserAccount();
        String corpId = request.getCorpId();
        UndertakeService_Service client = new UndertakeService_ServiceLocator();
        String response = client.getBasicHttpBinding_UndertakeService().setUndertakeIssuedService(formXml, wfId, noteId, proId, procName, userName, corpId);
        rsquest.setDetail(response);
        return XmlParseTool.toXml(rsquest);
    }
    
    /**
     * 传阅记录检索接口
     * 
     * @param queryParamsXml
     * @return
     * @throws Exception
     */
    public String getReadInTurnListService(String queryParamsXml)
            throws Exception {
        OaEnvelop request = new OaEnvelop();
        OaEnvelop rsquest = new OaEnvelop();
         XmlParseTool.toObj(queryParamsXml, request);
         
         // 解析参数
         ArrayOfParameterInfo arrayPI = new ArrayOfParameterInfo();
         arrayPI.setList(request.getCondition());
         
         String formXml = gx.generateObjToXmlStr(arrayPI);
         int pageSize = request.getPageSize();
         int pageIndex = request.getPageIndex();
         String userName = request.getUserAccount();// 操作人账号
         String corpId = request.getCorpId(); // 单位编号
         // 返回参数
         javax.xml.rpc.holders.StringHolder getReadInTurnListServiceResult = new StringHolder();
         javax.xml.rpc.holders.IntegerWrapperHolder recordCount = new IntegerWrapperHolder();
        // 调用OA接口GetReadInTurnListService
        PerusalService_Service client = new PerusalService_ServiceLocator();
        client.getBasicHttpBinding_PerusalService().getReadInTurnListService(formXml, pageSize, pageIndex, userName, corpId, getReadInTurnListServiceResult, recordCount);
        // 解析接口返回的XML文件
        InputStream input = new ByteArrayInputStream(
                this.getBytesUTF8(getReadInTurnListServiceResult.value));
         
        Map<String, String> dd = new HashMap<String, String>();
        dd.put("文件类别", "fileType");
        dd.put("文件号", "fileNumber");
        dd.put("标题", "title");
        dd.put("GUID", "guid");
        dd.put("传阅日期", "dateOfDraft");
        dd.put("流程状态", "status");
        dd.put("附件", "hasFile");
        dd.put("ROW_NUMBER", "rowNumber");
        List<ReceiveFile> list = analyzeXml.getReceiptListService(input, dd,
                ReceiveFile.class, "CirculationInfo");
        rsquest.setList(list);
        rsquest.setRecordCount(recordCount.value);
        return XmlParseTool.toXml(rsquest);
    }

    /**
     * GetReadInTurnDetailService
     * 
     * @Description 传阅记录明细接口
     * @param queryParamsXml
     * @return
     * @throws Exception
     */
    public String getReadInTurnDetailService(String queryParamsXml)
            throws Exception {
        OaEnvelop request = new OaEnvelop();
        OaEnvelop rsquest = new OaEnvelop();
        XmlParseTool.toObj(queryParamsXml, request);
        // 获取参数
        String guid = request.getGuid();
        String userName = request.getUserAccount();
        String corpId = request.getCorpId();
        //调用web Service OA接口GetReadInTurnDetailService
        PerusalService_Service client = new PerusalService_ServiceLocator();
        String response = client.getBasicHttpBinding_PerusalService().getReadInTurnDetailService(guid, userName, corpId);
        //解析返回结果
        InputStream input = new ByteArrayInputStream(this.getBytesUTF8(response));
        
        ReadInTurnDetail readInTurnDetail = (ReadInTurnDetail)analyzeXml.getReceiptService(input, ReadInTurnDetail.class);
        rsquest.setDetail(readInTurnDetail);
        return XmlParseTool.toXml(rsquest);
    }

    /**
     * setReadStatusService 传阅记录已阅操作
     * 
     * @param queryParamsXml
     * @return  
     * 格式：错误编码 | 错误信息
     *          1001|参数非空错误
     *          2001|表单信息提取失败（formXml）
     *          3001|信息保存失败
     *          3002|流程信息生成失败
     *          900X|操作成功后，返回的信息
     * @throws Exception
     */
    public String setReadStatusService(String queryParamsXml) throws Exception {
        OaEnvelop request = new OaEnvelop();
        OaEnvelop rsquest = new OaEnvelop();
        XmlParseTool.toObj(queryParamsXml, request);
        // 获取参数
        String guid = request.getGuid();
        String userName = request.getUserAccount();
        String corpId = request.getCorpId();
        //调用web Service OA接口SetReadStatusService
        PerusalService_Service client = new PerusalService_ServiceLocator();
        String response = client.getBasicHttpBinding_PerusalService().setReadStatusService(guid, userName, corpId);
        rsquest.setDetail(response);
        return XmlParseTool.toXml(rsquest);
    }
    
    /**
     * 获取附件地址
     * @param guid 发文记录、收文记录、承办记录、传阅记录的GUID编号 
     * @param fileName文件名
                    若是附件列表，则为附件的名称；
                    若是“浏览正文”，则固定指定“正文.doc”
                    若是“浏览Excel”，则固定指定“正文.xls”
     * @return 格式：
     * <table>
     *   <tr><th>错误编码</th><th>|</th><th>错误信息</th></tr>
     *   <tr><td>1000</td><td>|</td><td>传入参数含有非法字符.</td></tr>
     *   <tr><td>1001</td><td>|</td><td>参数非空错误</td></tr>
     *   <tr><td>1002</td><td>|</td><td>获取文件路径时发生异常：异常信息</td></tr>
     *   <tr><td>9000</td><td>|</td><td>返回文件的相对路径</td></tr>
     *   <tr><td>9001</td><td>|</td><td>找不到附件.</td></tr>
     * </table>
     * @throws Exception
     */
    public String getArtchment(String guid, String fileName) throws Exception{
        CommonServices_Service client = new CommonServices_ServiceLocator();
        String response = client.getBasicHttpBinding_CommonServices().getArtchment(guid, fileName);
        return response;
    }
    
    /**
     * 文件下载接口
     * @param guid 发文记录、收文记录、承办记录、传阅记录的GUID编号 
     * @param fileName文件名
                    若是附件列表，则为附件的名称；
                    若是“浏览正文”，则固定指定“正文.doc”
                    若是“浏览Excel”，则固定指定“正文.xls”
     * @return byte[] 
     * @throws Exception
     */
    public byte[] fileDownLoad(String guid, String fileName) throws Exception{
        String path = getArtchment(guid, fileName);
        if("9000".equals(path.substring(0, 4))){
            path = path.substring(5);
            return callByNet(fileDownLoad_serviceUrl, "FileDownLoad", path);
        }else{
            return null;
        }
    }
    
    //发文流程接口--开始
    /**
     * 发文信息明细
     * 调用信灵OA接口
     * String GetPostingDetailService(string guid, string userName,string corpId)
     * 得到xml并封装成PostingRecord类型再通过信封类封装成客户端能够解析的XML
     * @param guid 发文记录的GUID编号
     * @param userName 当前用户编号(警员号)
     * @param corpId  企业编号：zsga
     * @return 返回一个信封类封装的XML格式的字符串
     * @throws Exception
     */
    public String getPostingDetailService(String guid, String userName,String corpId)
            throws Exception {
        OaEnvelop rsquest = new OaEnvelop();
        //调用OA的webservice接口
        String xml = JwOAPostingServer.getBasicHttpBinding_PostingService().getPostingDetailService(guid, userName, corpId);
        //解析接口返回的XML
        InputStream input = new ByteArrayInputStream(getBytesUTF8(xml));
        PostingRecord obj = (PostingRecord) analyzeXml.getReceiptService(input, PostingRecord.class);
        rsquest.setDetail(obj);
        return XmlParseTool.toXml(rsquest);
    }
    
    /**
     * 发文记录检索
     * 调用信灵OA接口
     * String GetPostingListService(string queryParamsXml，int pageSize, int pageIndex, string userName, string corpId, out int recordCount) 
     * 得到xml并封装成PostingRecord类型再通过信封类封装成客户端能够解析的XML
     * @param queryParamsXml 由信封类OaEnvelop封装成的xml字符串
     *  <br> formXML 查询条件组成的参数配置字符串，保存在信封类的condition属性中。
     *  <br>格式：
     *  <table>
     *  <tr><th>元素名称</th><th>说明</th><th>备注</th></tr>
     *  <tr><td>datafield</td><td>查询字段名称  非空；</td><td>可选择字段名称：文件类别、文件号、标题、拟稿日期、主题词</td></tr>
     *  <tr><td>operator</td><td>比较符 非空；</td><td><、<=、=、>=、>、!=、like</td></tr>
     *  <tr><td>datavalue</td><td>字段条件值   非空；</td><td></td></tr>
     *  <tr><td>datatype</td><td>数据类型    非空；</td><td>Date（日期型）、Num（数值型）、Varchar（字符型）</td></tr>
     *  <tr><td>format</td><td>格式  可空；</td><td>指定日期型数据的转换格式，如：to_date({0},'yyyy-MM-dd')</td></tr>
     *  </table>
     *  <br>pageSize 每页显示记录数
     *  <br>pageIndex 页码
     *  <br>userName 封装在userAccount属性中， 当前用户编号
     *  <br>corpId 企业编号：zsga
     * @return 返回一个信封类封装的XML格式的字符串 信封类的属性list里面存放的是查询到的数据，recordCount里面存放的是总数据数。
     * @throws Exception
     */
    public String getPostingListService(String queryParamsXml) throws Exception {
        OaEnvelop rsquest = new OaEnvelop();
        OaEnvelop request = new OaEnvelop();
      //解析参数
        XmlParseTool.toObj(queryParamsXml, request);
        ArrayOfParameterInfo arrayPI = new ArrayOfParameterInfo();
        arrayPI.setList(request.getCondition());
        String formXML = gx.generateObjToXmlStr(arrayPI);
        Integer pageSize = new Integer(request.getPageSize());
        Integer pageIndex = new Integer(request.getPageIndex());
        String userName = request.getUserAccount();
        String corpId = request.getCorpId();
        // 返回参数
        StringHolder getPostingListServiceResult = new StringHolder();
        IntegerWrapperHolder recordCount = new IntegerWrapperHolder();
        // 调用OA的webservice接口
        JwOAPostingServer.getBasicHttpBinding_PostingService().getPostingListService(formXML,
                pageSize, pageIndex, userName, corpId,
                getPostingListServiceResult, recordCount);
        //解析xml
        InputStream input = new ByteArrayInputStream(
                getBytesUTF8(getPostingListServiceResult.value));
        Map<String, String> dd = new HashMap<String, String>();
        dd.put("文件号", "fileNumber");
        dd.put("标题", "title");
        dd.put("拟稿日期", "dateOfDraft");
        dd.put("GUID", "guid");
        dd.put("流程状态", "status");
        dd.put("附件", "hasFile");
        dd.put("ROW_NUMBER", "rowNumber");
        
        List<ReceiveFile> list = analyzeXml.getReceiptListService(input, dd, ReceiveFile.class, "PostingInfo");
        //封装信封类
        rsquest.setList(list);
        rsquest.setRecordCount(recordCount.value);
        return XmlParseTool.toXml(rsquest);
    }
    
    /**
     * 3.3.10   （发文签发）再次签发操作接口
     * @param queryParamsXml由信封类OaEnvelop封装成的xml字符串
     *  formXml 封装在condition属性中， 发文记录表单信息XML 包含以下信息内容：1）  发文记录信息<PostingInfo … />,2）  发文审批意见信息< PostingCommentInfo …/>
     *  wfId  流程编号
     *  noteId    处理编号
     *  proId 流程节点编号
     *  procName  当前处理步骤名称
     *  userName 封装在userAccount属性中， 当前用户编号
     *  corpId    企业编号：zsga
     * @return 处理结果信息
     * <table>
     *   <tr><td>错误编码</td><td>|</td><td>错误信息</td></tr>
     *   <tr><td>1001</td><td>|</td><td>参数非空错误</td></tr>
     *   <tr><td>2001</td><td>|</td><td>表单信息提取失败（formXml）</td></tr>
     *   <tr><td>3001</td><td>|</td><td>信息保存失败</td></tr>
     *   <tr><td>3002</td><td>|</td><td>流程信息生成失败</td></tr>
     *   <tr><td>900X</td><td>|</td><td>操作成功后，返回的信息</td></tr>
     * </table>
     * @throws Exception
     */
    public String setToReIssueOPService (String queryParamsXml) throws Exception {
        OaEnvelop request = new OaEnvelop();
        //解析参数
        XmlParseTool.toObj(queryParamsXml, request);
        String formXml = gx.generateObjToXmlStr(request.getCondition().get(0));
        Integer wfId = new Integer(request.getWfId());
        Integer noteId = new Integer(request.getNoteId());
        Integer proId = new Integer(request.getProId());
        String procName = request.getProcName();
        String userName = request.getUserAccount();
        String corpId = request.getCorpId();
        //调用接口
        return JwOAPostingServer.getBasicHttpBinding_PostingService().setToReIssueOPService(formXml, wfId, noteId, proId, procName, userName, corpId);
    }
    
    /**
     * 3.3.11  （发文签发）退回操作接口
     *   String SetToSendBackCheckOPService(string formXml, int wfId, int noteId, int proId, string procName, string userName, string corpId)
     * @param queryParamsXml由信封类OaEnvelop封装成的xml字符串
     *  formXml 封装在condition属性中， 发文记录表单信息XML 包含以下信息内容：1）  发文记录信息<PostingInfo … />,2）  发文审批意见信息< PostingCommentInfo …/>
     *  wfId  流程编号
     *  noteId    处理编号
     *  proId 流程节点编号
     *  procName  当前处理步骤名称
     *  userName 封装在userAccount属性中， 当前用户编号
     *  corpId    企业编号：zsga
     * @return 处理结果信息
     * <table>
     *   <tr><td>错误编码</td><td>|</td><td>错误信息</td></tr>
     *   <tr><td>1001</td><td>|</td><td>参数非空错误</td></tr>
     *   <tr><td>2001</td><td>|</td><td>表单信息提取失败（formXml）</td></tr>
     *   <tr><td>3001</td><td>|</td><td>信息保存失败</td></tr>
     *   <tr><td>3002</td><td>|</td><td>流程信息生成失败</td></tr>
     *   <tr><td>900X</td><td>|</td><td>操作成功后，返回的信息</td></tr>
     * </table>
     * @throws Exception
     */
    public String setToSendBackCheckOPService(String queryParamsXml) throws Exception{
        OaEnvelop request = new OaEnvelop();
        //解析参数
        XmlParseTool.toObj(queryParamsXml, request);
        String formXml = gx.generateObjToXmlStr(request.getCondition().get(0));
        Integer wfId = new Integer(request.getWfId());
        Integer noteId = new Integer(request.getNoteId());
        Integer proId = new Integer(request.getProId());
        String procName = request.getProcName();
        String userName = request.getUserAccount();
        String corpId = request.getCorpId();
      //调用接口
        return JwOAPostingServer.getBasicHttpBinding_PostingService().setToSendBackCheckOPService(formXml, wfId, noteId, proId, procName, userName, corpId);
    }
    
    /**
     * 3.3.12  （发文签发）完成签发操作接口
     *  String SetIssueCompleteStatusOPService (string formXml, int wfId, int noteId, int proId, string procName, string userName, string corpId)
     * @param queryParamsXml由信封类OaEnvelop封装成的xml字符串
     *  formXml 封装在condition属性中， 发文记录表单信息XML 包含以下信息内容：1）  发文记录信息<PostingInfo … />,2）  发文审批意见信息< PostingCommentInfo …/>
     *  wfId  流程编号
     *  noteId    处理编号
     *  proId 流程节点编号
     *  procName  当前处理步骤名称
     *  userName 封装在userAccount属性中， 当前用户编号
     *  corpId    企业编号：zsga
     * @return 处理结果信息
     * <table>
     *   <tr><td>错误编码</td><td>|</td><td>错误信息</td></tr>
     *   <tr><td>1001</td><td>|</td><td>参数非空错误</td></tr>
     *   <tr><td>2001</td><td>|</td><td>表单信息提取失败（formXml）</td></tr>
     *   <tr><td>3001</td><td>|</td><td>信息保存失败</td></tr>
     *   <tr><td>3002</td><td>|</td><td>流程信息生成失败</td></tr>
     *   <tr><td>900X</td><td>|</td><td>操作成功后，返回的信息</td></tr>
     * </table>
     * @throws Exception
     */
    public String setIssueCompleteStatusOPService (String queryParamsXml) throws Exception{
        OaEnvelop request = new OaEnvelop();
        //解析参数
        XmlParseTool.toObj(queryParamsXml, request);
        String formXml = gx.generateObjToXmlStr(request.getCondition().get(0));
        Integer wfId = new Integer(request.getWfId());
        Integer noteId = new Integer(request.getNoteId());
        Integer proId = new Integer(request.getProId());
        String procName = request.getProcName();
        String userName = request.getUserAccount();
        String corpId = request.getCorpId();
      //调用接口
        return JwOAPostingServer.getBasicHttpBinding_PostingService().setIssueCompleteStatusOPService(formXml, wfId, noteId, proId, procName, userName, corpId);
    }

    /**
     * 3.3.13  发文校对接口
     *  String SetProofreadCompletedService (string formXml, int wfId, int noteId, int proId, string procName, string userName, string corpId)
     * @param queryParamsXml由信封类OaEnvelop封装成的xml字符串
     *  formXml 封装在condition属性中， 发文记录表单信息XML 包含以下信息内容：1）  发文记录信息<PostingInfo … />,2）  发文审批意见信息< PostingCommentInfo …/>
     *  wfId  流程编号
     *  noteId    处理编号
     *  proId 流程节点编号
     *  procName  当前处理步骤名称
     *  userName 封装在userAccount属性中， 当前用户编号
     *  corpId    企业编号：zsga
     * @return 处理结果信息
     * <table>
     *   <tr><td>错误编码</td><td>|</td><td>错误信息</td></tr>
     *   <tr><td>1001</td><td>|</td><td>参数非空错误</td></tr>
     *   <tr><td>2001</td><td>|</td><td>表单信息提取失败（formXml）</td></tr>
     *   <tr><td>3001</td><td>|</td><td>信息保存失败</td></tr>
     *   <tr><td>3002</td><td>|</td><td>流程信息生成失败</td></tr>
     *   <tr><td>900X</td><td>|</td><td>操作成功后，返回的信息</td></tr>
     * </table>
     * @throws Exception
     */
    public String setProofreadCompletedService (String queryParamsXml) throws Exception{
        OaEnvelop request = new OaEnvelop();
        //解析参数
        XmlParseTool.toObj(queryParamsXml, request);
        String formXml = gx.generateObjToXmlStr(request.getCondition().get(0));
        Integer wfId = new Integer(request.getWfId());
        Integer noteId = new Integer(request.getNoteId());
        Integer proId = new Integer(request.getProId());
        String procName = request.getProcName();
        String userName = request.getUserAccount();
        String corpId = request.getCorpId();
      //调用接口
        return JwOAPostingServer.getBasicHttpBinding_PostingService().setProofreadCompletedService(formXml, wfId, noteId, proId, procName, userName, corpId);
    }
    
    /**
     * 3.3.7    （发文核稿）退回审核操作接口
     *  String SetToSendBackAuditOPService (string formXml, int wfId, int noteId, int proId, string procName, string userName, string corpId)
     * @param queryParamsXml由信封类OaEnvelop封装成的xml字符串
     *  formXml 封装在condition属性中， 发文记录表单信息XML 包含以下信息内容：1）  发文记录信息<PostingInfo … />,2）  发文审批意见信息< PostingCommentInfo …/>
     *  wfId  流程编号
     *  noteId    处理编号
     *  proId 流程节点编号
     *  procName  当前处理步骤名称
     *  userName 封装在userAccount属性中， 当前用户编号
     *  corpId    企业编号：zsga
     * @return 处理结果信息
     * <table>
     *   <tr><td>错误编码</td><td>|</td><td>错误信息</td></tr>
     *   <tr><td>1001</td><td>|</td><td>参数非空错误</td></tr>
     *   <tr><td>2001</td><td>|</td><td>表单信息提取失败（formXml）</td></tr>
     *   <tr><td>3001</td><td>|</td><td>信息保存失败</td></tr>
     *   <tr><td>3002</td><td>|</td><td>流程信息生成失败</td></tr>
     *   <tr><td>900X</td><td>|</td><td>操作成功后，返回的信息</td></tr>
     * </table>
     * @throws Exception
     */
    public String setToSendBackAuditOPService (String queryParamsXml) throws Exception{
        OaEnvelop request = new OaEnvelop();
        //解析参数
        XmlParseTool.toObj(queryParamsXml, request);
        String formXml = gx.generateObjToXmlStr(request.getCondition().get(0));
        Integer wfId = new Integer(request.getWfId());
        Integer noteId = new Integer(request.getNoteId());
        Integer proId = new Integer(request.getProId());
        String procName = request.getProcName();
        String userName = request.getUserAccount();
        String corpId = request.getCorpId();
        //调用接口
        return JwOAPostingServer.getBasicHttpBinding_PostingService().setToSendBackAuditOPService(formXml, wfId, noteId, proId, procName, userName, corpId);
    }
    
    /**
     *  3.3.8   （发文核稿）再次核稿操作接口
     *  String SetToRecheckOPService  (string formXml, int wfId, int noteId, int proId, string procName, string userName, string corpId)
     * @param queryParamsXml由信封类OaEnvelop封装成的xml字符串
     *  formXml 封装在condition属性中， 发文记录表单信息XML 包含以下信息内容：1）  发文记录信息<PostingInfo … />,2）  发文审批意见信息< PostingCommentInfo …/>
     *  wfId  流程编号
     *  noteId    处理编号
     *  proId 流程节点编号
     *  procName  当前处理步骤名称
     *  userName 封装在userAccount属性中， 当前用户编号
     *  corpId    企业编号：zsga
     * @return 处理结果信息
     * <table>
     *   <tr><td>错误编码</td><td>|</td><td>错误信息</td></tr>
     *   <tr><td>1001</td><td>|</td><td>参数非空错误</td></tr>
     *   <tr><td>2001</td><td>|</td><td>表单信息提取失败（formXml）</td></tr>
     *   <tr><td>3001</td><td>|</td><td>信息保存失败</td></tr>
     *   <tr><td>3002</td><td>|</td><td>流程信息生成失败</td></tr>
     *   <tr><td>900X</td><td>|</td><td>操作成功后，返回的信息</td></tr>
     * </table>
     * @throws Exception
     */
    public String setToRecheckOPService (String queryParamsXml) throws Exception{
        OaEnvelop request = new OaEnvelop();
        //解析参数
        XmlParseTool.toObj(queryParamsXml, request);
        String formXml = gx.generateObjToXmlStr(request.getCondition().get(0));
        Integer wfId = new Integer(request.getWfId());
        Integer noteId = new Integer(request.getNoteId());
        Integer proId = new Integer(request.getProId());
        String procName = request.getProcName();
        String userName = request.getUserAccount();
        String corpId = request.getCorpId();
        //调用接口
        return JwOAPostingServer.getBasicHttpBinding_PostingService().setToRecheckOPService (formXml, wfId, noteId, proId, procName, userName, corpId);
    }
    
    /**
     *   3.3.9   （发文核稿）送往签发操作接口
     *  String SetToIssueOPService   (string formXml, int wfId, int noteId, int proId, string procName, string userName, string corpId)
     * @param queryParamsXml由信封类OaEnvelop封装成的xml字符串
     *  formXml 封装在condition属性中， 发文记录表单信息XML 包含以下信息内容：1）  发文记录信息<PostingInfo … />,2）  发文审批意见信息< PostingCommentInfo …/>
     *  wfId  流程编号
     *  noteId    处理编号
     *  proId 流程节点编号
     *  procName  当前处理步骤名称
     *  userName 封装在userAccount属性中， 当前用户编号
     *  corpId    企业编号：zsga
     * @return 处理结果信息
     * <table>
     *   <tr><td>错误编码</td><td>|</td><td>错误信息</td></tr>
     *   <tr><td>1001</td><td>|</td><td>参数非空错误</td></tr>
     *   <tr><td>2001</td><td>|</td><td>表单信息提取失败（formXml）</td></tr>
     *   <tr><td>3001</td><td>|</td><td>信息保存失败</td></tr>
     *   <tr><td>3002</td><td>|</td><td>流程信息生成失败</td></tr>
     *   <tr><td>900X</td><td>|</td><td>操作成功后，返回的信息</td></tr>
     * </table>
     * @throws Exception
     */
    public String setToIssueOPService (String queryParamsXml) throws Exception{
        OaEnvelop request = new OaEnvelop();
        //解析参数
        XmlParseTool.toObj(queryParamsXml, request);
        String formXml = gx.generateObjToXmlStr(request.getCondition().get(0));
        Integer wfId = new Integer(request.getWfId());
        Integer noteId = new Integer(request.getNoteId());
        Integer proId = new Integer(request.getProId());
        String procName = request.getProcName();
        String userName = request.getUserAccount();
        String corpId = request.getCorpId();
        //调用接口
        return JwOAPostingServer.getBasicHttpBinding_PostingService().setToIssueOPService  (formXml, wfId, noteId, proId, procName, userName, corpId);
    }
    
    /**
     *   3.3.6  （发文草拟）提交操作接口
     *  String SetToSubmitOPService   (string formXml, int wfId, int noteId, int proId, string procName, string userName, string corpId)
     * @param queryParamsXml由信封类OaEnvelop封装成的xml字符串
     *  formXml 封装在condition属性中， 发文记录表单信息XML 包含以下信息内容：1）  发文记录信息<PostingInfo … />,2）  发文审批意见信息< PostingCommentInfo …/>
     *  wfId  流程编号
     *  noteId    处理编号
     *  proId 流程节点编号
     *  procName  当前处理步骤名称
     *  userName 封装在userAccount属性中， 当前用户编号
     *  corpId    企业编号：zsga
     * @return 处理结果信息
     * <table>
     *   <tr><td>错误编码</td><td>|</td><td>错误信息</td></tr>
     *   <tr><td>1001</td><td>|</td><td>参数非空错误</td></tr>
     *   <tr><td>2001</td><td>|</td><td>表单信息提取失败（formXml）</td></tr>
     *   <tr><td>3001</td><td>|</td><td>信息保存失败</td></tr>
     *   <tr><td>3002</td><td>|</td><td>流程信息生成失败</td></tr>
     *   <tr><td>900X</td><td>|</td><td>操作成功后，返回的信息</td></tr>
     * </table>
     * @throws Exception
     */
    public String setToSubmitOPService (String queryParamsXml) throws Exception{
        OaEnvelop request = new OaEnvelop();
        //解析参数
        XmlParseTool.toObj(queryParamsXml, request);
        String formXml = gx.generateObjToXmlStr(request.getCondition().get(0));
        Integer wfId = new Integer(request.getWfId());
        Integer noteId = new Integer(request.getNoteId());
        Integer proId = new Integer(request.getProId());
        String procName = request.getProcName();
        String userName = request.getUserAccount();
        String corpId = request.getCorpId();
        //调用接口
        return JwOAPostingServer.getBasicHttpBinding_PostingService().setToSubmitOPService(formXml, wfId, noteId, proId, procName, userName, corpId);
    }
    
    /**
     *   3.3.5  退回草拟操作接口
     *  String SetToSendBackDraftOPService(string formXml, int wfId, int noteId, int proId, string procName, string userName, string corpId)
     * @param queryParamsXml由信封类OaEnvelop封装成的xml字符串
     *  formXml 封装在condition属性中， 发文记录表单信息XML 包含以下信息内容：1）  发文记录信息<PostingInfo … />,2）  发文审批意见信息< PostingCommentInfo …/>
     *  wfId  流程编号
     *  noteId    处理编号
     *  proId 流程节点编号
     *  procName  当前处理步骤名称
     *  userName 封装在userAccount属性中， 当前用户编号
     *  corpId    企业编号：zsga
     * @return 处理结果信息
     * <table>
     *   <tr><td>错误编码</td><td>|</td><td>错误信息</td></tr>
     *   <tr><td>1001</td><td>|</td><td>参数非空错误</td></tr>
     *   <tr><td>2001</td><td>|</td><td>表单信息提取失败（formXml）</td></tr>
     *   <tr><td>3001</td><td>|</td><td>信息保存失败</td></tr>
     *   <tr><td>3002</td><td>|</td><td>流程信息生成失败</td></tr>
     *   <tr><td>900X</td><td>|</td><td>操作成功后，返回的信息</td></tr>
     * </table>
     * @throws Exception
     */
    public String setToSendBackDraftOPService  (String queryParamsXml) throws Exception{
        OaEnvelop request = new OaEnvelop();
        //解析参数
        XmlParseTool.toObj(queryParamsXml, request);
        String formXml = gx.generateObjToXmlStr(request.getCondition().get(0));
        Integer wfId = new Integer(request.getWfId());
        Integer noteId = new Integer(request.getNoteId());
        Integer proId = new Integer(request.getProId());
        String procName = request.getProcName();
        String userName = request.getUserAccount();
        String corpId = request.getCorpId();
        //调用接口
        return JwOAPostingServer.getBasicHttpBinding_PostingService().setToSendBackDraftOPService(formXml, wfId, noteId, proId, procName, userName, corpId);
    }
    
    /**
     * 3.3.3   （发文审核）送往核稿处理接口
     *  String SetToCheckDraftOPService (string formXml, int wfId, int noteId, int proId, string procName, string userName, string corpId)
     * @param queryParamsXml由信封类OaEnvelop封装成的xml字符串
     *  formXml 封装在condition属性中， 发文记录表单信息XML 包含以下信息内容：1）  发文记录信息<PostingInfo … />,2）  发文审批意见信息< PostingCommentInfo …/>
     *  wfId  流程编号
     *  noteId    处理编号
     *  proId 流程节点编号
     *  procName  当前处理步骤名称
     *  userName 封装在userAccount属性中， 当前用户编号
     *  corpId    企业编号：zsga
     * @return 处理结果信息
     * <table>
     *   <tr><td>错误编码</td><td>|</td><td>错误信息</td></tr>
     *   <tr><td>1001</td><td>|</td><td>参数非空错误</td></tr>
     *   <tr><td>2001</td><td>|</td><td>表单信息提取失败（formXml）</td></tr>
     *   <tr><td>3001</td><td>|</td><td>信息保存失败</td></tr>
     *   <tr><td>3002</td><td>|</td><td>流程信息生成失败</td></tr>
     *   <tr><td>900X</td><td>|</td><td>操作成功后，返回的信息</td></tr>
     * </table>
     * @throws Exception
     */
    public String setToCheckDraftOPService(String queryParamsXml) throws Exception{
        OaEnvelop request = new OaEnvelop();
        //解析参数
        XmlParseTool.toObj(queryParamsXml, request);
        String formXml = gx.generateObjToXmlStr(request.getCondition().get(0));
        Integer wfId = new Integer(request.getWfId());
        Integer noteId = new Integer(request.getNoteId());
        Integer proId = new Integer(request.getProId());
        String procName = request.getProcName();
        String userName = request.getUserAccount();
        String corpId = request.getCorpId();
        //调用接口
        return JwOAPostingServer.getBasicHttpBinding_PostingService().setToCheckDraftOPService(formXml, wfId, noteId, proId, procName, userName, corpId);
    }
    
    /**
     * 3.3.4    （发文审核）再次审核操作接口
     *  String SetToReAuditOPService(string formXml, int wfId, int noteId, int proId, string procName, string userName, string corpId)
     * @param queryParamsXml由信封类OaEnvelop封装成的xml字符串
     *  formXml 封装在condition属性中， 发文记录表单信息XML 包含以下信息内容：1）  发文记录信息<PostingInfo … />,2）  发文审批意见信息< PostingCommentInfo …/>
     *  wfId  流程编号
     *  noteId    处理编号
     *  proId 流程节点编号
     *  procName  当前处理步骤名称
     *  userName 封装在userAccount属性中， 当前用户编号
     *  corpId    企业编号：zsga
     * @return 处理结果信息
     * <table>
     *   <tr><td>错误编码</td><td>|</td><td>错误信息</td></tr>
     *   <tr><td>1001</td><td>|</td><td>参数非空错误</td></tr>
     *   <tr><td>2001</td><td>|</td><td>表单信息提取失败（formXml）</td></tr>
     *   <tr><td>3001</td><td>|</td><td>信息保存失败</td></tr>
     *   <tr><td>3002</td><td>|</td><td>流程信息生成失败</td></tr>
     *   <tr><td>900X</td><td>|</td><td>操作成功后，返回的信息</td></tr>
     * </table>
     * @throws Exception
     */
    public String setToReAuditOPService(String queryParamsXml) throws Exception{
        OaEnvelop request = new OaEnvelop();
        //解析参数
        XmlParseTool.toObj(queryParamsXml, request);
        String formXml = gx.generateObjToXmlStr(request.getCondition().get(0));
        Integer wfId = new Integer(request.getWfId());
        Integer noteId = new Integer(request.getNoteId());
        Integer proId = new Integer(request.getProId());
        String procName = request.getProcName();
        String userName = request.getUserAccount();
        String corpId = request.getCorpId();
        //调用接口
        return JwOAPostingServer.getBasicHttpBinding_PostingService().setToReAuditOPService(formXml, wfId, noteId, proId, procName, userName, corpId);
    }
    
  //发文流程接口--结束
    /**
     * 将string类型的参数转换成Bytes[]，编码格式是UTF-8
     * @param str
     * @return
     * @throws UnsupportedEncodingException
     */
    private byte[] getBytesUTF8(String str) throws UnsupportedEncodingException {
        if (str == null)
            return null;
        else
            return str.getBytes("utf-8");
    }
    
    /**
     * 公用的.NET版http://sini.cn/类型的WebService接口客户端调用方法。
     * 业务处理：调用信灵提供的OA文件下载接口，主要用来处理OA中的附件获取功能，输入
     * 一个文件地址（注意：此处的地址是没有文件后缀的地址），接口返回一个字符数组类型的文件。
     * @param: WebService接口地址——serviceUrl
     * @param: WebService接口方法名称——methodName
     * @param: WebService接口方法入参这里只有一个参数（即：文件路径）——request
     * @return: 返回一个文件数据流——byte[]
     * @author: tony.zhang(zhangtao@kingtoneinfo.com)
     * @date: 2013-9-24
     */
    public byte[] callByNet(String serviceUrl,String methodName,String request) {
        String namespace = "http://sini.cn/";
        String SOAP_ACTION =  namespace+methodName;
        SoapObject so = new SoapObject(namespace, methodName);
        so.addProperty("path", request);
        SoapSerializationEnvelope envelope = new SoapSerializationEnvelope(
                SoapEnvelope.VER11);
        envelope.dotNet=true; 
        envelope.bodyOut=so;
        envelope.setOutputSoapObject(so);
        HttpTransportSE ht = new HttpTransportSE(serviceUrl);
        System.out.println("post: " + so);
        try {
            ht.call(SOAP_ACTION, envelope);
            if (envelope.getResponse() != null) {
//              System.out.println(envelope.getResponse());
                BASE64Decoder base = new BASE64Decoder();
                Object ret = (Object)envelope.getResult();
                String retString = String.valueOf(ret);
                byte[] retByte = base.decodeBuffer(retString); 
                return retByte;
            }
        } catch (Exception e) {
            System.out.println(e);
            e.printStackTrace();
            return null;
        }
        return null;
    }

}