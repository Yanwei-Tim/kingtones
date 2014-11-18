/**
 * PrimaryServiceComImplLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package org.tempuri;

import java.util.ResourceBundle;

public class PrimaryServiceComImplLocator extends org.apache.axis.client.Service implements org.tempuri.PrimaryServiceComImpl {

    public PrimaryServiceComImplLocator() {
    }


    public PrimaryServiceComImplLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public PrimaryServiceComImplLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for BasicHttpBinding_PrimaryService
    private java.lang.String BasicHttpBinding_PrimaryService_address = ResourceBundle.getBundle("configes").getString(
			"face_address");//"http://10.40.29.36:6805/PrimaryService";

    public java.lang.String getBasicHttpBinding_PrimaryServiceAddress() {
        return BasicHttpBinding_PrimaryService_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String BasicHttpBinding_PrimaryServiceWSDDServiceName = "BasicHttpBinding_PrimaryService";

    public java.lang.String getBasicHttpBinding_PrimaryServiceWSDDServiceName() {
        return BasicHttpBinding_PrimaryServiceWSDDServiceName;
    }

    public void setBasicHttpBinding_PrimaryServiceWSDDServiceName(java.lang.String name) {
        BasicHttpBinding_PrimaryServiceWSDDServiceName = name;
    }

    public com.poya.service.PrimaryService getBasicHttpBinding_PrimaryService() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(BasicHttpBinding_PrimaryService_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getBasicHttpBinding_PrimaryService(endpoint);
    }

    public com.poya.service.PrimaryService getBasicHttpBinding_PrimaryService(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.poya.service.BasicHttpBinding_PrimaryServiceStub _stub = new com.poya.service.BasicHttpBinding_PrimaryServiceStub(portAddress, this);
            _stub.setPortName(getBasicHttpBinding_PrimaryServiceWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setBasicHttpBinding_PrimaryServiceEndpointAddress(java.lang.String address) {
        BasicHttpBinding_PrimaryService_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.poya.service.PrimaryService.class.isAssignableFrom(serviceEndpointInterface)) {
                com.poya.service.BasicHttpBinding_PrimaryServiceStub _stub = new com.poya.service.BasicHttpBinding_PrimaryServiceStub(new java.net.URL(BasicHttpBinding_PrimaryService_address), this);
                _stub.setPortName(getBasicHttpBinding_PrimaryServiceWSDDServiceName());
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
        if ("BasicHttpBinding_PrimaryService".equals(inputPortName)) {
            return getBasicHttpBinding_PrimaryService();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://tempuri.org/", "PrimaryServiceComImpl");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://tempuri.org/", "BasicHttpBinding_PrimaryService"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("BasicHttpBinding_PrimaryService".equals(portName)) {
            setBasicHttpBinding_PrimaryServiceEndpointAddress(address);
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
