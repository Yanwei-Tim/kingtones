/**
 * 
 */
package com.kingtone.jw.service.jwoa.bean;

import java.util.List;

/**
 * 传阅记录明细
 * @author     litengmin
 * @see         [相关类/方法]（可选）
 * @since      [产品/模块版本] （必须）
 * @date 2013-9-23
 */

public class ReadInTurnDetail {
    private List<CirculationInfo> circulationInfoList;
    private List<SysAdtionInfo> sysAdtionInfoList;
    private List<ReceiptCommentInfo> receiptCommentInfoList;
    private List<ProcInfo> procInfoList;
    public List<CirculationInfo> getCirculationInfoList() {
        return circulationInfoList;
    }
    public void setCirculationInfoList(List<CirculationInfo> circulationInfoList) {
        this.circulationInfoList = circulationInfoList;
    }
    public List<SysAdtionInfo> getSysAdtionInfoList() {
        return sysAdtionInfoList;
    }
    public void setSysAdtionInfoList(List<SysAdtionInfo> sysAdtionInfoList) {
        this.sysAdtionInfoList = sysAdtionInfoList;
    }
    public List<ReceiptCommentInfo> getReceiptCommentInfoList() {
        return receiptCommentInfoList;
    }
    public void setReceiptCommentInfoList(
            List<ReceiptCommentInfo> receiptCommentInfoList) {
        this.receiptCommentInfoList = receiptCommentInfoList;
    }
    public List<ProcInfo> getProcInfoList() {
        return procInfoList;
    }
    public void setProcInfoList(List<ProcInfo> procInfoList) {
        this.procInfoList = procInfoList;
    }
    
}
