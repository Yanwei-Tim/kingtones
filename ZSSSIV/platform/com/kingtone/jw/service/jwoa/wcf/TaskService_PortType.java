/**
 * TaskService_PortType.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.kingtone.jw.service.jwoa.wcf;

public interface TaskService_PortType extends java.rmi.Remote {
    public void getDBListService(java.lang.Integer pageSize, java.lang.Integer pageIndex, java.lang.String userName, java.lang.String corpId, javax.xml.rpc.holders.StringHolder getDBListServiceResult, javax.xml.rpc.holders.IntegerWrapperHolder recordCount) throws java.rmi.RemoteException;
    public void getCYListService(java.lang.Integer pageSize, java.lang.Integer pageIndex, java.lang.String userName, java.lang.String corpId, javax.xml.rpc.holders.StringHolder getCYListServiceResult, javax.xml.rpc.holders.IntegerWrapperHolder recordCount) throws java.rmi.RemoteException;
}
