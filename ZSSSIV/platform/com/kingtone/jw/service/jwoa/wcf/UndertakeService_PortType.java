/**
 * UndertakeService_PortType.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.kingtone.jw.service.jwoa.wcf;

public interface UndertakeService_PortType extends java.rmi.Remote {
    public java.lang.String getUndertakeDetailService(java.lang.String guid, java.lang.String userName, java.lang.String corpId) throws java.rmi.RemoteException;
    public java.lang.String getProcessListService(java.lang.String guid, java.lang.String corpId) throws java.rmi.RemoteException;
    public java.lang.String setUndertakeFeekbackService(java.lang.String formXml, java.lang.Integer wfId, java.lang.Integer noteId, java.lang.Integer proId, java.lang.String procName, java.lang.String userName, java.lang.String corpId) throws java.rmi.RemoteException;
    public java.lang.String setUndertakeIssuedService(java.lang.String formXml, java.lang.Integer wfId, java.lang.Integer noteId, java.lang.Integer proId, java.lang.String procName, java.lang.String userName, java.lang.String corpId) throws java.rmi.RemoteException;
}
