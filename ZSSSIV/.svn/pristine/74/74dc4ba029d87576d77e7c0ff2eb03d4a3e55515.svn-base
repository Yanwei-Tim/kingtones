package com.kingtone.jw.service.util;

import java.io.IOException;
import java.util.List;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;

public class ReadXML {

	public static String[] readFile(String xmlString) {
		String[] codeAndPath = new String[2];
		SAXBuilder sb = new SAXBuilder();
		Document doc;
		try {
			doc = sb.build(xmlString);
			// 构造文档对象
			Element root = doc.getRootElement(); // 获取根元素
			List list = root.getChildren("Apk");// 取名字为Apk的所有元素

			for (int i = 0; i < list.size(); i++) {
				Element element = (Element) list.get(i);
				codeAndPath[0] = element.getChildText("versionCode");
				codeAndPath[1] = element.getChildText("filePath");
			}
		} catch (JDOMException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return codeAndPath;
	}

}
