package com.kingtone.jw.service.external.dragon;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.kingtone.jw.service.util.CommonTool;

public class DragonXmlParseAdapter {

	/**
	 * 巨龙接口解析
	 * 
	 * @param xml
	 * @return
	 */
	public List<HashMap<String, String>> xmlAnalytic(String bizId, String xml) {
		List<HashMap<String, String>> resultList = new ArrayList<HashMap<String, String>>();
		try {
			HashMap<Integer, String> hashMap = new HashMap<Integer, String>();
			HashMap<String, String> hs = null;
			Document doc = null;
			String dataCode = "";
			String dataContent = "";
			doc = DocumentHelper.parseText(xml);
			Element rootElt = doc.getRootElement();
			// 获取根节点
			Iterator iter = rootElt.elementIterator("Method"); // 获取根节点下的子节点Method
			int num=0;
			int cnt = 0;
			// 遍历Method节点
			while (iter.hasNext()) {
				Element recordEle = (Element) iter.next();
				Iterator iters = recordEle.elementIterator("Items");
				while (iters.hasNext()) {
					Element itemEle = (Element) iters.next();
					Iterator item00 = itemEle.elementIterator("Item");
					while (item00.hasNext()) {
						Element itemEle00 = (Element) item00.next();
						Iterator item01 = itemEle00.elementIterator("Value");
						while (item01.hasNext()) {
							Element itemEle02 = (Element) item01.next();
							cnt = itemEle02.elements("Row").size();
							
							Iterator item02 = itemEle02.elementIterator("Row");
							while (item02.hasNext()) { 
								Element itemEle03 = (Element) item02.next();
								Iterator item03 = itemEle03.elementIterator("Data");
								hs = new HashMap<String, String>();
								// cnt==0时报文取第一个<ROW>中数据，为返回成功或异常的标志位，(暂不处理)
								 if (num==0) {
									 while (item03.hasNext()) {// 循环读取<DATA>内容
									 Element itemEle04 = (Element) item03.next();
									 String falgValue = itemEle04.getText();
										 if(!falgValue.equals("000") && cnt ==1){
											return null;
											}else{
												num = 2;
												 cnt=1; 
												 break;
											 }
									}
								 }
								if (cnt >0) {
									int countData = 0;
									while (item03.hasNext()) {// 循环读取<DATA>内容
										Element itemEle04 = (Element) item03.next();
										switch (cnt) {
										case 1:
											break;
										case 2:
											// 存放<标识、数据项>
											String nameVlaue = itemEle04.getText();
											if(nameVlaue.equals("")){
												continue;
											}
											hashMap.put(countData, itemEle04
													.getText());
											countData++;
											break;
										default:
											String col = (String) hashMap.get(countData);
										if(col==null){
											continue;
										}
											dataCode = getColumn(
													CommonTool.cColumnMap,
													bizId, (String) hashMap
															.get(countData));
											// 字典转义
											dataContent = getContent(dataCode,
													itemEle04.getText());
											// 存放<数据项,业务数据内容>
											hs.put(dataCode, dataContent);
											countData++;
											break;
										}
									}
									if (cnt > 2) {// 将业务数据放入集合
										resultList.add(hs);
									}
								}
								cnt++;
							}
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultList;
	}

	/**
	 * 获取对应的column
	 * 
	 * @param hs
	 * @param b_id
	 * @param c_column
	 * @return String
	 */
	public String getColumn(Map hs, String b_id, String c_column) {
		try {
			String column = "";
			HashMap hs_B_id = (HashMap) hs.get(b_id);
			HashMap hs_c_column = (HashMap) hs_B_id.get(c_column);
			if(null!=hs_c_column)
				column = (String) hs_c_column.get("COLUMNS");
			return column;
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}

	/**
	 * 字典转义
	 */
	public String getContent(String column, String key) {
		String content = key;
		HashMap map = (HashMap) CommonTool.resMap.get(column);
		if (map != null) {
			content = (String) map.get(key);
		}
		return content;
	}

	public String read() throws Exception {
		File filename = new File("D://return.xml");
//		FileReader fileread = new FileReader(filename);
		BufferedReader read = new BufferedReader(new InputStreamReader(new FileInputStream(filename), "UTF-8"));
		String line = "";
		StringBuffer str = new StringBuffer();
		String a = "";
		try {
			// read.readLine();
			// 去掉xml第一行<?xml version="1.0" encoding="utf-8"?>
			while ((line = read.readLine()) != null) {
				str.append(line + "\n");
			}
			// a = new String(str.toString().getBytes("gbk"), "utf-8");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} finally {
			try {
//				fileread.close();
				read.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return str.toString();
		// return str.
	}

	public static void main(String[] arg) {
		try {
			CommonTool.confDAO.loadD_ColumnMap();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		DragonXmlParseAdapter tp = new DragonXmlParseAdapter();
		try {
			String s = tp.read();
			List result = tp.xmlAnalytic("B201100018", s);
			System.out.println("list-----" + result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
