/**
 * PerusalService_PortType.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.kingtone.jw.service.jwoa.wcf;

public interface PerusalService_PortType extends java.rmi.Remote {
    public void getReadInTurnListService(java.lang.String queryParamsXml, java.lang.Integer pageSize, java.lang.Integer pageIndex, java.lang.String userName, java.lang.String corpId, javax.xml.rpc.holders.StringHolder getReadInTurnListServiceResult, javax.xml.rpc.holders.IntegerWrapperHolder recordCount) throws java.rmi.RemoteException;
    public java.lang.String getReadInTurnDetailService(java.lang.String guid, java.lang.String userName, java.lang.String corpId) throws java.rmi.RemoteException;
    public java.lang.String setReadStatusService(java.lang.String guid, java.lang.String userName, java.lang.String corpId) throws java.rmi.RemoteException;
}
