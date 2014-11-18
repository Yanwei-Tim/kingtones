/**
 * ReceiptService_ServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.kingtone.jw.service.jwoa.wcf;

import com.kingtone.jw.service.util.GetConfig;

public class ReceiptService_ServiceLocator extends org.apache.axis.client.Service implements com.kingtone.jw.service.jwoa.wcf.ReceiptService_Service {

    public ReceiptService_ServiceLocator() {
    }


    public ReceiptService_ServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public ReceiptService_ServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for BasicHttpBinding_ReceiptService
    private java.lang.String BasicHttpBinding_ReceiptService_address = GetConfig.GetConfigByKey("service_address")+"/ReceiptService.svc/ReceiptService.svc";

    public java.lang.String getBasicHttpBinding_ReceiptServiceAddress() {
        return BasicHttpBinding_ReceiptService_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String BasicHttpBinding_ReceiptServiceWSDDServiceName = "BasicHttpBinding_ReceiptService";

    public java.lang.String getBasicHttpBinding_ReceiptServiceWSDDServiceName() {
        return BasicHttpBinding_ReceiptServiceWSDDServiceName;
    }

    public void setBasicHttpBinding_ReceiptServiceWSDDServiceName(java.lang.String name) {
        BasicHttpBinding_ReceiptServiceWSDDServiceName = name;
    }

    public com.kingtone.jw.service.jwoa.wcf.ReceiptService_PortType getBasicHttpBinding_ReceiptService() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(BasicHttpBinding_ReceiptService_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getBasicHttpBinding_ReceiptService(endpoint);
    }

    public com.kingtone.jw.service.jwoa.wcf.ReceiptService_PortType getBasicHttpBinding_ReceiptService(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.kingtone.jw.service.jwoa.wcf.BasicHttpBinding_ReceiptServiceStub _stub = new com.kingtone.jw.service.jwoa.wcf.BasicHttpBinding_ReceiptServiceStub(portAddress, this);
            _stub.setPortName(getBasicHttpBinding_ReceiptServiceWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setBasicHttpBinding_ReceiptServiceEndpointAddress(java.lang.String address) {
        BasicHttpBinding_ReceiptService_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.kingtone.jw.service.jwoa.wcf.ReceiptService_PortType.class.isAssignableFrom(serviceEndpointInterface)) {
                com.kingtone.jw.service.jwoa.wcf.BasicHttpBinding_ReceiptServiceStub _stub = new com.kingtone.jw.service.jwoa.wcf.BasicHttpBinding_ReceiptServiceStub(new java.net.URL(BasicHttpBinding_ReceiptService_address), this);
                _stub.setPortName(getBasicHttpBinding_ReceiptServiceWSDDServiceName());
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
        if ("BasicHttpBinding_ReceiptService".equals(inputPortName)) {
            return getBasicHttpBinding_ReceiptService();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://tempuri.org/", "ReceiptService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://tempuri.org/", "BasicHttpBinding_ReceiptService"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("BasicHttpBinding_ReceiptService".equals(portName)) {
            setBasicHttpBinding_ReceiptServiceEndpointAddress(address);
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
