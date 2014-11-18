/**
 * 
 */
package com.kingtone.jw.service.jwoa.server;

import javax.xml.rpc.ServiceException;

import com.kingtone.jw.service.jwoa.wcf.PostingService_PortType;
import com.kingtone.jw.service.jwoa.wcf.PostingService_Service;
import com.kingtone.jw.service.jwoa.wcf.PostingService_ServiceLocator;

/**
 * @ClassName: JwOAPostingServer
 * @Description: 终端警务OA 发文流程服务 Web Service
 * @author 李腾敏
 * @date 2013-09-25
 */
public class JwOAPostingServer {
    /**
     * 获取发文的webService服务
     * @throws ServiceException 
     */
    public static PostingService_PortType getBasicHttpBinding_PostingService() throws ServiceException{
        PostingService_Service client = new PostingService_ServiceLocator();
        return client.getBasicHttpBinding_PostingService();
    }
}
