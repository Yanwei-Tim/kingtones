/**
 * 
 */
package com.kingtone.jw.service.jwoa.bean;

/**
 * 收文号信息
 * 
 * @author litengmin
 * @see [相关类/方法]（可选）
 * @since [产品/模块版本] （必须）
 * @date 2013-8-30
 */

public class SWCodeRecordInfo {
    private String refCodeGuId; // REFCODEGUID 文件号的GUID
    private Integer year;// YEAR 年份
    private String fileNO;// FILENO 文件号
    private String createTime;// CREATETIME 生成文件号日期
    private String id;// ID
    private Integer currentCount;// CURRENTCOUNT 当前数量
    private Integer isUsed;// ISUSED 是否使用0
    private String title;// TITLE 标题
    private String refDocGuId;// REFDOCGUID 引用公文的GUID
    private String refDocTName;// REFDOCTNAME 引用公文的表名

    public String getRefCodeGuId() {
        return refCodeGuId;
    }

    public void setRefCodeGuId(String refCodeGuId) {
        this.refCodeGuId = refCodeGuId;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public String getFileNO() {
        return fileNO;
    }

    public void setFileNO(String fileNO) {
        this.fileNO = fileNO;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getCurrentCount() {
        return currentCount;
    }

    public void setCurrentCount(Integer currentCount) {
        this.currentCount = currentCount;
    }

    public Integer getIsUsed() {
        return isUsed;
    }

    public void setIsUsed(Integer isUsed) {
        this.isUsed = isUsed;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getRefDocGuId() {
        return refDocGuId;
    }

    public void setRefDocGuId(String refDocGuId) {
        this.refDocGuId = refDocGuId;
    }

    public String getRefDocTName() {
        return refDocTName;
    }

    public void setRefDocTName(String refDocTName) {
        this.refDocTName = refDocTName;
    }

}
