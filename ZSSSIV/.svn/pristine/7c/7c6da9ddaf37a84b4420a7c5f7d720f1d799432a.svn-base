package com.kingtone.jw.service.external.trafficpolice;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.kingtone.jw.service.util.CommonTool;

public class TrafficPoliceParseAdapter {

	// @SuppressWarnings("unchecked")
	public List<HashMap<String, String>> xmlAnalytic(String bizId, String xml) {
		List<HashMap<String, String>> resultList = new ArrayList<HashMap<String, String>>();

		try {
			HashMap<String, String> hs = null;
			Document doc = null;
			String dataCode = "";
			String dataContent = "";
			doc = DocumentHelper.parseText(xml);
			Element rootElt = doc.getRootElement();
			Iterator<Element> headIter = rootElt.elementIterator("head");
			while (headIter.hasNext()) {
				Element headEle = headIter.next();
				Iterator<Element> codeIter = headEle.elementIterator("code");
				while (codeIter.hasNext()) {
					Element codeEle = codeIter.next();
					String code = codeEle.getName();
					// code值0代表失败，1代表成功
					if ("code".equals(code) && "0".equals(codeEle.getText())) {
						// 查询失败返回
						return resultList;
					}
				}
			}

			// 获取根节点
			Iterator<Element> iter = rootElt.elementIterator("body"); // 获取根节点下的子节点body
			// 遍历body节点
			while (iter.hasNext()) {
				Element recordEle = iter.next();
				Iterator<Element> iters = recordEle
						.elementIterator("vioSurveil");
				while (iters.hasNext()) {
					Element itemEle = iters.next();
					List<Element> list = itemEle.elements();
					hs = new HashMap<String, String>();
					for (Iterator<Element> it = list.iterator(); it.hasNext();) {
						Element attr = it.next();
						dataCode = attr.getName();
						dataContent = attr.getText();
						// dataCode = getColumn(CommonTool.cColumnMap, bizId,
						// dataCode);
						// 字典转义
						dataContent = getContent(dataCode, dataContent);
						// 存放<数据项,业务数据内容>
						hs.put(dataCode, dataContent);
					}
					resultList.add(hs);
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
			HashMap hs_B_id = (HashMap) hs.get(b_id);
			HashMap hs_c_column = (HashMap) hs_B_id.get(c_column);
			String column = (String) hs_c_column.get("COLUMNS");
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

	public String read() throws FileNotFoundException {
		File filename = new File("D://test.xml");
		FileReader fileread = new FileReader(filename);
		BufferedReader read = new BufferedReader(fileread);
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
				fileread.close();
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

		TrafficPoliceParseAdapter tp = new TrafficPoliceParseAdapter();
		try {
			String s = tp.read();
			List result = tp.xmlAnalytic("", s);
			System.out.println("list-----" + result);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
