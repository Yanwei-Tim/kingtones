package org.apache.axis.transport.http;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ksoap2.SoapEnvelope;
import org.ksoap2.serialization.SoapObject;
import org.ksoap2.serialization.SoapSerializationEnvelope;
import org.ksoap2.transport.HttpTransportSE;

import com.kingtone.ssi.log.SSILogger;

public class AxisTest extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AxisTest() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String paraStr = request.getParameter("paras").substring(5, request.getParameter("paras").length());
		String [] paras = paraStr.split("split");
		
		String methodName =request.getParameter("method");
		String serviceUrl = request.getParameter("url");//"http://localhost:8080/yljw/services/CommonServer?wsdl";
		String xmlStr = call(serviceUrl,methodName, paras);
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
//		out.print("    This is ");
		out.print(xmlStr);
//		out.print(this.getClass());
//		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	public static String call(String serviceUrl, String methodName,String[] params) {
		SoapObject request = new SoapObject("http://service", methodName);
		
		String pp = "";
		for(int i=0;i<params.length;i++){
			String paravalue = params[i];
			String []ps = paravalue.split("equals");
			pp+=ps[0]+"="+ps[1];
			request.addProperty(ps[0],ps[1]);
		}
		SoapSerializationEnvelope envelope = new SoapSerializationEnvelope(
				SoapEnvelope.VER11);
		envelope.bodyOut = request;
		HttpTransportSE ht = new HttpTransportSE(serviceUrl);
		try {
			ht.call(null, envelope);
			if (envelope.getResponse() != null) {
				return (String) envelope.getResponse();
			}
		} catch (Exception e) {
			SSILogger.Bizlogger.error(e+"  URL:【"+serviceUrl+"】 方法名：【"+methodName+"】 参数列表：【"+pp+"】", e);
			return e+"";
		}
		return null;
	}
	
	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
//	public void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//
//		response.setContentType("text/html");
//		PrintWriter out = response.getWriter();
//		out
//				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
//		out.println("<HTML>");
//		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
//		out.println("  <BODY>");
//		out.print("    This is ");
//		out.print(this.getClass());
//		out.println(", using the POST method");
//		out.println("  </BODY>");
//		out.println("</HTML>");
//		out.flush();
//		out.close();
//	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
