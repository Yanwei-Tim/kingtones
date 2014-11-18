/**
 * UndertakeService_ServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.kingtone.jw.service.jwoa.wcf;

import com.kingtone.jw.service.util.GetConfig;

public class UndertakeService_ServiceLocator extends org.apache.axis.client.Service implements com.kingtone.jw.service.jwoa.wcf.UndertakeService_Service {

    public UndertakeService_ServiceLocator() {
    }


    public UndertakeService_ServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public UndertakeService_ServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for BasicHttpBinding_UndertakeService
    private java.lang.String BasicHttpBinding_UndertakeService_address = GetConfig.GetConfigByKey("service_address")+"/UndertakeService.svc/UndertakeService.svc";

    public java.lang.String getBasicHttpBinding_UndertakeServiceAddress() {
        return BasicHttpBinding_UndertakeService_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String BasicHttpBinding_UndertakeServiceWSDDServiceName = "BasicHttpBinding_UndertakeService";

    public java.lang.String getBasicHttpBinding_UndertakeServiceWSDDServiceName() {
        return BasicHttpBinding_UndertakeServiceWSDDServiceName;
    }

    public void setBasicHttpBinding_UndertakeServiceWSDDServiceName(java.lang.String name) {
        BasicHttpBinding_UndertakeServiceWSDDServiceName = name;
    }

    public com.kingtone.jw.service.jwoa.wcf.UndertakeService_PortType getBasicHttpBinding_UndertakeService() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(BasicHttpBinding_UndertakeService_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getBasicHttpBinding_UndertakeService(endpoint);
    }

    public com.kingtone.jw.service.jwoa.wcf.UndertakeService_PortType getBasicHttpBinding_UndertakeService(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.kingtone.jw.service.jwoa.wcf.BasicHttpBinding_UndertakeServiceStub _stub = new com.kingtone.jw.service.jwoa.wcf.BasicHttpBinding_UndertakeServiceStub(portAddress, this);
            _stub.setPortName(getBasicHttpBinding_UndertakeServiceWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setBasicHttpBinding_UndertakeServiceEndpointAddress(java.lang.String address) {
        BasicHttpBinding_UndertakeService_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.kingtone.jw.service.jwoa.wcf.UndertakeService_PortType.class.isAssignableFrom(serviceEndpointInterface)) {
                com.kingtone.jw.service.jwoa.wcf.BasicHttpBinding_UndertakeServiceStub _stub = new com.kingtone.jw.service.jwoa.wcf.BasicHttpBinding_UndertakeServiceStub(new java.net.URL(BasicHttpBinding_UndertakeService_address), this);
                _stub.setPortName(getBasicHttpBinding_UndertakeServiceWSDDServiceName());
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
        if ("BasicHttpBinding_UndertakeService".equals(inputPortName)) {
            return getBasicHttpBinding_UndertakeService();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://tempuri.org/", "UndertakeService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://tempuri.org/", "BasicHttpBinding_UndertakeService"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("BasicHttpBinding_UndertakeService".equals(portName)) {
            setBasicHttpBinding_UndertakeServiceEndpointAddress(address);
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
