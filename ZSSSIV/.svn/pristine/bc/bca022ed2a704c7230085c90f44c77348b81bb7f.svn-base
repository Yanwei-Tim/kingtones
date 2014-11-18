/**
 * TaskService_ServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.kingtone.jw.service.jwoa.wcf;

import com.kingtone.jw.service.util.GetConfig;

public class TaskService_ServiceLocator extends org.apache.axis.client.Service implements com.kingtone.jw.service.jwoa.wcf.TaskService_Service {

    public TaskService_ServiceLocator() {
    }


    public TaskService_ServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public TaskService_ServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for BasicHttpBinding_TaskService
    private java.lang.String BasicHttpBinding_TaskService_address = GetConfig.GetConfigByKey("service_address")+"/TaskService.svc/TaskService.svc";

    public java.lang.String getBasicHttpBinding_TaskServiceAddress() {
        return BasicHttpBinding_TaskService_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String BasicHttpBinding_TaskServiceWSDDServiceName = "BasicHttpBinding_TaskService";

    public java.lang.String getBasicHttpBinding_TaskServiceWSDDServiceName() {
        return BasicHttpBinding_TaskServiceWSDDServiceName;
    }

    public void setBasicHttpBinding_TaskServiceWSDDServiceName(java.lang.String name) {
        BasicHttpBinding_TaskServiceWSDDServiceName = name;
    }

    public com.kingtone.jw.service.jwoa.wcf.TaskService_PortType getBasicHttpBinding_TaskService() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(BasicHttpBinding_TaskService_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getBasicHttpBinding_TaskService(endpoint);
    }

    public com.kingtone.jw.service.jwoa.wcf.TaskService_PortType getBasicHttpBinding_TaskService(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.kingtone.jw.service.jwoa.wcf.BasicHttpBinding_TaskServiceStub _stub = new com.kingtone.jw.service.jwoa.wcf.BasicHttpBinding_TaskServiceStub(portAddress, this);
            _stub.setPortName(getBasicHttpBinding_TaskServiceWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setBasicHttpBinding_TaskServiceEndpointAddress(java.lang.String address) {
        BasicHttpBinding_TaskService_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.kingtone.jw.service.jwoa.wcf.TaskService_PortType.class.isAssignableFrom(serviceEndpointInterface)) {
                com.kingtone.jw.service.jwoa.wcf.BasicHttpBinding_TaskServiceStub _stub = new com.kingtone.jw.service.jwoa.wcf.BasicHttpBinding_TaskServiceStub(new java.net.URL(BasicHttpBinding_TaskService_address), this);
                _stub.setPortName(getBasicHttpBinding_TaskServiceWSDDServiceName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            return getPort(serviceEndpointInterface);
        }
        java.lang.String inputPortName = portName.getLocalPart();
        if ("BasicHttpBinding_TaskService".equals(inputPortName)) {
            return getBasicHttpBinding_TaskService();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://tempuri.org/", "TaskService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://tempuri.org/", "BasicHttpBinding_TaskService"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("BasicHttpBinding_TaskService".equals(portName)) {
            setBasicHttpBinding_TaskServiceEndpointAddress(address);
        }
        else 
{ // Unknown Port Name
            throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
        }
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        setEndpointAddress(portName.getLocalPart(), address);
    }

}
