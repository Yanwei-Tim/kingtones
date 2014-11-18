/**
 * 
 */
package com.kingtone.jw.service.jwoa.bean;

import java.util.List;

/**
 * 历史处理过程
 * @author     litengmin
 * @since      [产品/模块版本] （必须）
 * @date 2013-8-6
 */

public class UTHistoryProcInfo {
    private String gId;//GID="22336210" 承办下发流水号
    private String nodeName;//NODENAME="签收" 处理步骤
    private String procName;//PROCNAME="签收" 流程节点名称
    private String userList;//USERLIST="李思华" 处理人列表
    private String note;//NOTE="领导批" 处理意见
    private String orgList;//ORGLIST="情报信息中心" 处理部门列表
    private String procTime;//PROCTIME="2013-7-19 9:50:00"处理时间
    private List<UTIssuedInfo> UTIssuedInfoList;//承办下发记录列表
    public String getgId() {
        return gId;
    }
    public void setgId(String gId) {
        this.gId = gId;
    }
    public String getNodeName() {
        return nodeName;
    }
    public void setNodeName(String nodeName) {
        this.nodeName = nodeName;
    }
    public String getProcName() {
        return procName;
    }
    public void setProcName(String procName) {
        this.procName = procName;
    }
    public String getUserList() {
        return userList;
    }
    public void setUserList(String userList) {
        this.userList = userList;
    }
    public String getNote() {
        return note;
    }
    public void setNote(String note) {
        this.note = note;
    }
    public String getOrgList() {
        return orgList;
    }
    public void setOrgList(String orgList) {
        this.orgList = orgList;
    }
    public String getProcTime() {
        return procTime;
    }
    public void setProcTime(String procTime) {
        this.procTime = procTime;
    }
    public List<UTIssuedInfo> getUTIssuedInfoList() {
        return UTIssuedInfoList;
    }
    public void setUTIssuedInfoList(List<UTIssuedInfo> uTIssuedInfoList) {
        UTIssuedInfoList = uTIssuedInfoList;
    }
}
