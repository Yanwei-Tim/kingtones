package com.kingtone.jw.service.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.kingtone.jw.service.jwoa.xml.AnalyzeXml;

/**
 *  社区采集、比对
 * @author Administrator
 *
 */
public class Constsants {
  
  public static Map<String ,String> Bidmap=null;//采集
  public static Map<String ,String> BidQuerymap=null;//查询
  public static Map<String ,String> BidBiduimap=null;//比对
  public static Map<String ,String> BidOAmap=null;//比对
  public static Map<String ,String> BidCJmap=null;
  public static Map<String, Object> compMap = null;
  static{
	  try {
		compMap = new AnalyzeXml().parserXml("com\\kingtone\\jw\\service\\jwoa\\bean\\getReceiptDetailService.xml");
	} catch (ParserConfigurationException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  
  }
  
	
  /**
   *  采集
   * @return
   */
  public static Map<String ,String> getBid(){
    Bidmap=new HashMap<String,String>();  
    Bidmap.put("A201100100", "A201100100");//高危见面采集
    Bidmap.put("A201100101", "A201100101");//户主信息采集
    Bidmap.put("A201100102", "A201100102");//房屋信息采集
    Bidmap.put("A201100103", "A201100103");//托管人采集
    Bidmap.put("A201100104", "A201100104");//租客采集
    Bidmap.put("A201100105", "A201100105");//常住人口采集
    Bidmap.put("A201100106", "A201100106");//暂住人口采集
    Bidmap.put("A201100107", "A201100107");//重点人口采集
    Bidmap.put("A201100108", "A201100108");//物品信息采集
    Bidmap.put("A201100109", "A201100109");//车辆盘查采集
    Bidmap.put("A201100110", "A201100110");//人员盘查采集
    Bidmap.put("A201100111", "A201100111");//娱服巡查采集
    Bidmap.put("A201100113", "A201100113");//境外回访采集
    Bidmap.put("A201100114", "A201100104");//暂住回访采集
    
    return Bidmap;
  }
  public static boolean getBidmap(String bid){
    if(getBid().containsKey(bid)){
      return true;
    }
           return false;
  }

  /**
   * 采集盘查
   * @return
   */
  public static Map<String ,String> getCJBid(){
	  BidCJmap=new HashMap<String,String>();  
	  BidCJmap.put("A201100100", "A201100100");//高危查询
	  BidCJmap.put("A201100101", "A201100101");//户主信息查询
	  BidCJmap.put("A201100102", "A201100102");//房屋信息查询
	  BidCJmap.put("A201100103", "A201100103");//托管人查询
	  BidCJmap.put("A201100104", "A201100104");//租客查询
	  BidCJmap.put("A201100105", "A201100105");//常住人口查询
	  BidCJmap.put("A201100106", "A201100106");//暂住人口查询
	  BidCJmap.put("A201100107", "A201100107");//重点人口查询
	  BidCJmap.put("A201100108", "A201100108");//物品信息查询
	  BidCJmap.put("A201100109", "A201100109");//车辆盘查查询
	  BidCJmap.put("A201100110", "A201100110");//人员盘查查询
	  BidCJmap.put("A201100111", "A201100111");//娱服巡查查询
	  BidCJmap.put("A201100113", "A201100113");//境外回访查询
	  BidCJmap.put("A201100114", "A201100104");//暂住回访查询
	    
	    return BidCJmap;
	  }
	  public static boolean getCJmap(String bid){
	    if(getCJBid().containsKey(bid)){
	      return true;
	    }
	           return false;
	  }
	  
	  public static Map<String ,String> getQueryBid(){
		  BidQuerymap=new HashMap<String,String>();  
		  BidQuerymap.put("Q201100100", "Q201100100");//高危查询
		  BidQuerymap.put("Q201100101", "Q201100101");//户主信息查询
		  BidQuerymap.put("Q201100102", "Q201100102");//房屋信息查询
		  BidQuerymap.put("Q201100103", "Q201100103");//托管人查询
		  BidQuerymap.put("Q201100104", "Q201100104");//租客查询
		  BidQuerymap.put("Q201100105", "Q201100105");//常住人口查询
		  BidQuerymap.put("Q201100106", "Q201100106");//暂住人口查询
		  BidQuerymap.put("Q201100107", "Q201100107");//重点人口查询
		  BidQuerymap.put("Q201100108", "Q201100108");//物品信息查询
		  BidQuerymap.put("Q201100109", "Q201100109");//车辆盘查查询
		  BidQuerymap.put("Q201100110", "Q201100110");//人员盘查查询
		  BidQuerymap.put("Q201100111", "Q201100111");//娱服巡查查询
		  BidQuerymap.put("Q201100113", "Q201100113");//境外回访查询
		  BidQuerymap.put("Q201100114", "Q201100104");//暂住回访查询
		  
		  return BidQuerymap;
	  }
	  public static boolean getQueryBidmap(String bid){
		  if(getQueryBid().containsKey(bid)){
			  return true;
		  }
		  return false;
	  }
	  
	  
	  
	  
	  /**
	   * 比对盘查
	   * @return
	   */

	  public static Map<String ,String> BidQuerymap(){
		  BidQuerymap=new HashMap<String,String>();  
		  BidQuerymap.put("B201100115", "B201100115");//全国常住人口
		  BidQuerymap.put("B201100016", "B201100016");//中山流动人口
		  BidQuerymap.put("B201100017", "B201100017");//中山驾驶员
		  BidQuerymap.put("B201100038", "B201100038");//国内旅客
		  BidQuerymap.put("B201100015", "B201100015");//常住人口查询
		  BidQuerymap.put("B201100022", "B201100022");//全国在逃查询
		  BidQuerymap.put("B201100127", "B201100127");//全国到枪车辆查询
		  BidQuerymap.put("B201100027", "B201100027");//到枪中山车辆查询
		  BidQuerymap.put("B201100131", "B201100131");//全国机动车查询
		  BidQuerymap.put("B201100031", "B201100031");//中山机动车查询
		    return BidQuerymap;
		  }
		  public static boolean getBidQuerymap(String bid){
		    if(BidQuerymap().containsKey(bid)){
		      return true;
		    }
		           return false;
		  }
		  
		  
		  public static Map<String ,String> BidOAmap(){
			  BidOAmap=new HashMap<String,String>();  
			  BidOAmap.put("B201100062", "B201100062");
			  BidOAmap.put("B201100063", "B201100063");
			    return BidOAmap;
			  }
			  public static boolean getBidOAmap(String bid){
			    if(BidOAmap().containsKey(bid)){
			      return true;
			    }
			           return false;
			  }
	  
}