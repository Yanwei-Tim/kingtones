/**
 * @Title: Test.java
 * @Package com.kingtone.jw.service.jwoa.bean
 * @Description: TODO(用一句话描述该文件做什么)
 * @Copyright: Copyright (c) 2012  西安联合信息技术股份有限公司
 * @author 李刚
 * @date Aug 1, 2013 10:20:17 AM
 * @version V0.5
 */
package com.kingtone.jw.service.jwoa.bean;

import java.beans.XMLDecoder;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName: Test
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author 李刚
 * @date Aug 1, 2013 10:20:17 AM
 *
 */
public class Test {

	/**
	 * @Title: main
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param args
	 * void    返回类型
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	public static List objectXmlDecoder(String objSource)  
	  throws FileNotFoundException,IOException,Exception 
	 { 
	  List objList = new ArrayList();     
	  File fin = new File(objSource); 
	  FileInputStream fis = new FileInputStream(fin); 
	  XMLDecoder decoder = new XMLDecoder(fis); 
	  Object obj = null; 
	  try 
	  { 
	   while( (obj = decoder.readObject()) != null) 
	   { 
	    objList.add(obj); 
	   } 
	  } 
	  catch (Exception e) 
	  { 
	   // TODO Auto-generated catch block     
	  } 
	  fis.close(); 
	  decoder.close();      
	  return objList; 
	 } 


}
