/**
 * 
 */
package com.kingtone.jw.service.jwoa.bean;

/**
 * 分发人
 * @author     litengmin
 * @see         [相关类/方法]（可选）
 * @since      [产品/模块版本] （必须）
 * @date 2013-8-30
 */

public class IssuerInfo {
    private String username;//分发人用户名
    private String fullname;//分发人姓名
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getFullname() {
        return fullname;
    }
    public void setFullname(String fullname) {
        this.fullname = fullname;
    }
    
}
