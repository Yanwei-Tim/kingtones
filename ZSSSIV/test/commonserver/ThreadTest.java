package commonserver;

import com.kingtone.jw.service.test;

public class ThreadTest extends Thread{
	
	private String url;
	private String method;
	private String xml;

	public ThreadTest(String url,String method,String xml){
		this.url = url;
		this.method = method ;
		this.xml = xml;
	}
	public void run(){
		String str = test.call(url,method,xml);
		System.out.println(xml.length()+"=="+str.length());	
	}
}
