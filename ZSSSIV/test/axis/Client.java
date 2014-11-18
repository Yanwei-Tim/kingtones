package axis;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.xml.namespace.QName;

import org.apache.axis.client.Call;
import org.apache.axis.client.Service;
import org.apache.axis.encoding.ser.BeanDeserializerFactory;
import org.apache.axis.encoding.ser.BeanSerializerFactory;

public class Client {

	public static void main(String [] args) throws Exception { 

	    
	    String targetEendPoint =  "http://localhost:8088/SSI/services/MyService" ;   
	      Service service =  new  Service();   
	      Call call = (Call) service.createCall(); 
	     
	      QName qn = new QName("http://localhost:8088/SSI/services/MyService","processService3");
	      call.registerTypeMapping(User.class, qn,
	        new BeanSerializerFactory(User.class,qn),
	        new BeanDeserializerFactory(User.class,qn));
	     
	      call.setReturnType(qn,User.class);
	      call.setTargetEndpointAddress( new  URL(targetEendPoint));   
	      call.setOperationName( qn);
	      //call.addParameter("user", qn, javax.xml.rpc.ParameterMode.IN);
	     
	      User s = (User) call.invoke( new  Object[]{}); 
	     
	      System.out.println(s.id+ " ’s id is: "  + s.name);  
	      
	      
	      
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
//        // 指锟斤拷service锟斤拷锟斤拷URL 
//
//        String endpoint = "http://localhost:" + "8088" + "/SSI/services/MyService"; 
//
//        // 锟斤拷锟斤拷一锟斤拷锟斤拷锟�(service)锟斤拷锟斤拷(call) 
//
//        Service service = new Service(); 
//
//        Call call = (Call) service.createCall();// 通锟斤拷service锟斤拷锟斤拷call锟斤拷锟斤拷 
//
//        // 锟斤拷锟斤拷service锟斤拷锟斤拷URL 
//
//        call.setTargetEndpointAddress(new java.net.URL(endpoint)); 
//
//        // 锟斤拷锟斤拷锟斤拷(processService)锟斤拷MyService.java锟斤拷锟斤拷锟斤拷锟揭伙拷锟� 
//
//        call.setOperationName("processService2"); 
//
//        // Object 锟斤拷锟斤拷锟阶帮拷瞬锟斤拷锟斤拷锟斤拷为"This is Test!",锟斤拷锟斤拷processService(String arg) 
//
//        Object ret =  call.invoke(new Object[]{"This is Test!"}); 
//
//        User list = (User) ret;
//        
//        System.out.println(list); 

    } 



}
