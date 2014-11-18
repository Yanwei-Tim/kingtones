/**
 * PostingService_ServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.kingtone.jw.service.jwoa.wcf;

import com.kingtone.jw.service.util.GetConfig;

public class PostingService_ServiceLocator extends org.apache.axis.client.Service implements com.kingtone.jw.service.jwoa.wcf.PostingService_Service {

    public PostingService_ServiceLocator() {
    }


    public PostingService_ServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public PostingService_ServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for BasicHttpBinding_PostingService
    private java.lang.String BasicHttpBinding_PostingService_address = GetConfig.GetConfigByKey("service_address")+"/PostingService.svc/PostingService.svc";

    public java.lang.String getBasicHttpBinding_PostingServiceAddress() {
        return BasicHttpBinding_PostingService_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String BasicHttpBinding_PostingServiceWSDDServiceName = "BasicHttpBinding_PostingService";

    public java.lang.String getBasicHttpBinding_PostingServiceWSDDServiceName() {
        return BasicHttpBinding_PostingServiceWSDDServiceName;
    }

    public void setBasicHttpBinding_PostingServiceWSDDServiceName(java.lang.String name) {
        BasicHttpBinding_PostingServiceWSDDServiceName = name;
    }

    public com.kingtone.jw.service.jwoa.wcf.PostingService_PortType getBasicHttpBinding_PostingService() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(BasicHttpBinding_PostingService_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getBasicHttpBinding_PostingService(endpoint);
    }

    public com.kingtone.jw.service.jwoa.wcf.PostingService_PortType getBasicHttpBinding_PostingService(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.kingtone.jw.service.jwoa.wcf.BasicHttpBinding_PostingServiceStub _stub = new com.kingtone.jw.service.jwoa.wcf.BasicHttpBinding_PostingServiceStub(portAddress, this);
            _stub.setPortName(getBasicHttpBinding_PostingServiceWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setBasicHttpBinding_PostingServiceEndpointAddress(java.lang.String address) {
        BasicHttpBinding_PostingService_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.kingtone.jw.service.jwoa.wcf.PostingService_PortType.class.isAssignableFrom(serviceEndpointInterface)) {
                com.kingtone.jw.service.jwoa.wcf.BasicHttpBinding_PostingServiceStub _stub = new com.kingtone.jw.service.jwoa.wcf.BasicHttpBinding_PostingServiceStub(new java.net.URL(BasicHttpBinding_PostingService_address), this);
                _stub.setPortName(getBasicHttpBinding_PostingServiceWSDDServiceName());
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
        if ("BasicHttpBinding_PostingService".equals(inputPortName)) {
            return getBasicHttpBinding_PostingService();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://tempuri.org/", "PostingService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://tempuri.org/", "BasicHttpBinding_PostingService"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("BasicHttpBinding_PostingService".equals(portName)) {
            setBasicHttpBinding_PostingServiceEndpointAddress(address);
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
