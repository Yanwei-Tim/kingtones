package axis;
import java.net.MalformedURLException;
import java.net.URL;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;

import javax.xml.namespace.QName;
import javax.xml.rpc.ServiceException;

import org.apache.axis.client.Call;
import org.apache.axis.client.Service;
import org.apache.axis.encoding.ser.BeanDeserializerFactory;
import org.apache.axis.encoding.ser.BeanSerializerFactory;
public class test {

    /**
     * Description:TODO 方法用途描述
     * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
     * Date: May 6, 2011
     * @param args
     * @throws ServiceException 
     * @throws MalformedURLException 
     * @throws RemoteException 
     */
    public static void main(String[] args) throws ServiceException, MalformedURLException, RemoteException {

        String targetEendPoint =  "http://192.168.42.210:8443/WebService.asmx/QueryByDGGACH_XT800?where=&tableName=QueryQGJSY";//"http://localhost:8088/SSI/services/MyService" ;   
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
    }

}
