package axis;
import org.ksoap2.SoapEnvelope;
import org.ksoap2.serialization.SoapObject;
import org.ksoap2.serialization.SoapSerializationEnvelope;
import org.ksoap2.transport.HttpTransportSE;

public class Client2 {

	public static void main(String[] args) throws Exception {

//		String wsdlUrl = "http://localhost:8088/SSI/services/MyService2?wsdl";
//
//		String nameSpaceUri = "http://localhost:8088/SSI/services/MyService2";
//
//		String serviceName = "MyService2Service";
//
//		ServiceFactory serviceFactory = ServiceFactory.newInstance();
//
//		javax.xml.rpc.Service service = serviceFactory.createService(new URL(wsdlUrl), new QName(nameSpaceUri, serviceName));
//
//		String portName = "http://localhost:8088/SSI/services/MyService2";
//		MyServiceInterface2 proxy = (MyServiceInterface2)service.getPort(new QName(nameSpaceUri, portName),MyServiceInterface2.class);
//		System.out.println("This is "
//				+ proxy.processService("Dynamic Proxy test!"));
	    String nameSpace = "http://service";
	    String methodName = "findOrgTree";
	    String SOAP_ACTION = nameSpace + methodName;         
	    boolean response=false;        
	    SoapObject request=new SoapObject(nameSpace,methodName);       
	    // boolean request=false;         
	    SoapSerializationEnvelope envelope=new SoapSerializationEnvelope(SoapEnvelope.VER11);
	    envelope.dotNet=false; //.net 支持                 
	           
	    //此处为修改前的源码，参数名与服务器端保持一致，但不成功
	    //request.addProperty("user","test");
	    //request.addProperty("passwd","test");
	     
	    request.addProperty("area","test");
	     
	    envelope.bodyOut=request;    
	    envelope.setOutputSoapObject(request);           
	    HttpTransportSE androidHttpTrandsport=new HttpTransportSE("http://192.168.137.101:8080/ZSSSIV/services/JwOAServer");  
	    androidHttpTrandsport.call(SOAP_ACTION, envelope); 

	}

}
