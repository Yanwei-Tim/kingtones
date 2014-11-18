/**
 * 
 */
package com.kingtone.jw.service.jwoa.bean;

import java.util.List;

/**
 * 发文信息明细
 * @author     litengmin
 * @since      [产品/模块版本] （必须）
 * @date 2013-8-10
 */

public class PostingRecord {
    private List<PostingInfo> postingInfoList;
    private List<SysAdtionInfo> sysAdtionInfoList;
    private List<PostingCommentInfo> postingCommentInfoList;
    private List<ProcInfo> procInfoList;
    private List<ReceiptFileInfo> receiptFileInfoList;
    public List<PostingInfo> getPostingInfoList() {
        return postingInfoList;
    }
    public void setPostingInfoList(List<PostingInfo> postingInfoList) {
        this.postingInfoList = postingInfoList;
    }
    public List<SysAdtionInfo> getSysAdtionInfoList() {
        return sysAdtionInfoList;
    }
    public void setSysAdtionInfoList(List<SysAdtionInfo> sysAdtionInfoList) {
        this.sysAdtionInfoList = sysAdtionInfoList;
    }
    public List<PostingCommentInfo> getPostingCommentInfoList() {
        return postingCommentInfoList;
    }
    public void setPostingCommentInfoList(
            List<PostingCommentInfo> postingCommentInfoList) {
        this.postingCommentInfoList = postingCommentInfoList;
    }
    public List<ProcInfo> getProcInfoList() {
        return procInfoList;
    }
    public void setProcInfoList(List<ProcInfo> procInfoList) {
        this.procInfoList = procInfoList;
    }
    public List<ReceiptFileInfo> getReceiptFileInfoList() {
        return receiptFileInfoList;
    }
    public void setReceiptFileInfoList(List<ReceiptFileInfo> receiptFileInfoList) {
        this.receiptFileInfoList = receiptFileInfoList;
    }
}
