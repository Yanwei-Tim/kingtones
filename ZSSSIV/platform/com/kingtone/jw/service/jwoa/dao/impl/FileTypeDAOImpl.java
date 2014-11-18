/**
 * @Title: FileTypeDAOImpl.java
 * @Package com.kingtone.jw.service.jwoa.dao.impl
 * @Description: 文件类别数据库访问实现类
 * @Copyright: Copyright (c) 2012  西安联合信息技术股份有限公司
 * @author 王海博
 * @date Jul 30, 2013 10:59:19 AM
 * @version V0.5
 */
package com.kingtone.jw.service.jwoa.dao.impl;

import java.util.List;

import com.kingtone.jw.service.jwoa.dao.FileTypeDAO;
import com.kingtone.jw.service.jwoa.pojo.FileType;
import com.kingtone.jw.service.util.CommonTool;
import com.kingtone.ssi.dao.SSIDAO;

/**
  * @ClassName: FileTypeDAOImpl
  * @Description: 文件类别数据库访问实现类
  * @author 王海博
  * @date Jul 30, 2013 11:00:21 AM
  *
  */
public class FileTypeDAOImpl  extends SSIDAO implements  FileTypeDAO{
    
    public List<FileType> findFileTypeList(FileType fileType){
//        return CommonTool.oaPermissionDAO.getOaCYList(request);
        return null;
    }
}
