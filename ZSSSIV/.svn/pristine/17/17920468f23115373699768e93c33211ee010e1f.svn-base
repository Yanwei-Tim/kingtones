/**
 * @Title: AnalyzeXml.java
 * @Package com.kingtone.jw.service.jwoa.xml
 * @Description: TODO(用一句话描述该文件做什么)
 * @Copyright: Copyright (c) 2012  西安联合信息技术股份有限公司
 * @author 王海博
 * @date Aug 2, 2013 9:17:12 AM
 * @version V0.5
 */
package com.kingtone.jw.service.jwoa.xml;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.kingtone.jw.service.jwoa.bean.ReceiptDetail;
import com.kingtone.jw.service.jwoa.bean.ReceiveFile;
import com.kingtone.jw.service.jwoa.bean.TasktableInfo;
import com.kingtone.jw.service.jwoa.bean.UTHistoryProcInfo;
import com.kingtone.jw.service.util.Constsants;
import com.kingtone.jw.service.util.XmlParseTool;

/**
 * @ClassName: AnalyzeXml
 * @Description: XML 解析
 * 
 * @author 王海博
 * @date Aug 2, 2013 9:17:12 AM
 * 
 */
public class AnalyzeXml {

    private DocumentBuilderFactory factory;
    private DocumentBuilder builder;
    private Document document;
    private Element element;
    private InputStream input;

    public AnalyzeXml() {
    }

    /**
     * 初始化AnalyzeXml对象
     * 
     * @param filePath
     *            要读取的XML文件路径
     * @throws Throwable
     */
    public AnalyzeXml(String filePath) throws Throwable {
        input = new FileInputStream(filePath);
        factory = DocumentBuilderFactory.newInstance();
        builder = factory.newDocumentBuilder();
        document = builder.parse(input);
        element = document.getDocumentElement();
    }

    /**
     * @Title: getReceiptListService
     * @Description: 解析收文xml
     * @param xml
     *            返回的收文xml
     * @return List<ReceiveFile> 返回类型
     * @throws IOException
     * @throws SAXException
     */
    public List<ReceiveFile> getReceiptListService(InputStream input)
            throws Exception {

        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document document = builder.parse(input);
        Element element = document.getDocumentElement();
        List<ReceiveFile> list = new ArrayList<ReceiveFile>();

        NodeList bookNodes = element.getElementsByTagName("ds");
        for (int i = 0; i < bookNodes.getLength(); i++) {
            Element bookElement = (Element) bookNodes.item(i);
            ReceiveFile receiveFile = new ReceiveFile();
            NodeList childNodes = bookElement.getChildNodes();
            // System.out.println("*****"+childNodes.getLength());
            for (int j = 0; j < childNodes.getLength(); j++) {
                if (childNodes.item(j).getNodeType() == Node.ELEMENT_NODE) {
                    if ("文件号".equals(childNodes.item(j).getNodeName())) {
                        receiveFile.setFileNumber(childNodes.item(j)
                                .getFirstChild().getNodeValue());
                    } else if ("标题".equals(childNodes.item(j).getNodeName())) {
                        receiveFile.setTitle(childNodes.item(j).getFirstChild()
                                .getNodeValue());
                    } else if ("拟稿日期".equals(childNodes.item(j).getNodeName())) {
                        receiveFile.setDateOfDraft(childNodes.item(j)
                                .getFirstChild().getNodeValue());
                    } else if ("GUID".equals(childNodes.item(j).getNodeName())) {
                        receiveFile.setGuid(childNodes.item(j).getFirstChild()
                                .getNodeValue());
                    } else if ("文件类别".equals(childNodes.item(j).getNodeName())) {
                        receiveFile.setFileType(childNodes.item(j)
                                .getFirstChild().getNodeValue());
                    } else if ("流程状态".equals(childNodes.item(j).getNodeName())) {
                        receiveFile.setStatus(childNodes.item(j)
                                .getFirstChild().getNodeValue());
                    }
                }
            }// end for j
            list.add(receiveFile);
        }// end for i

        return list;
    }

    /**
     * @Title: getReceiptListService
     * @Description: 解析收文xml
     * @param xml
     *            返回的收文xml
     * @return List<ReceiveFile> 返回类型
     * @throws IOException
     * @throws SAXException
     * @author 王海博
     */
    public List getReceiptListService(InputStream input,
            Map<String, String> map, Class<?> ob, String elemName) throws Exception {

        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document document = builder.parse(input);
        Element element = document.getDocumentElement();
        List<Object> list = new ArrayList<Object>();
        NodeList bookNodes = element.getElementsByTagName(elemName);
        for (int i = 0; i < bookNodes.getLength(); i++) {
            Element bookElement = (Element) bookNodes.item(i);
            NodeList childNodes = bookElement.getChildNodes();
            Object pojo = ob.newInstance();
            for (int j = 0; j < childNodes.getLength(); j++) {
                if (childNodes.item(j).getNodeType() == Node.ELEMENT_NODE) {
                    String name = childNodes.item(j).getNodeName();
                    String value = childNodes.item(j).getFirstChild()
                            .getNodeValue();
                    String fieldName = (String) map.get(name);
                    if (null != fieldName) {
                        Field fieldR = ob.getDeclaredField(fieldName);
                        setFieldValue(pojo, value, fieldR);
                    }
                }
            }
            list.add(pojo);
        }

        return list;
    }

    private void setFieldValue(Object obj, Object value, Field fieldR)
            throws IllegalAccessException {
        if (!fieldR.isAccessible()) {
            fieldR.setAccessible(true);
        }
        Class<?> typeClazz = fieldR.getType();
        if (typeClazz == Long.class || typeClazz == long.class) {
            value = Long.parseLong(value.toString());
        }
        if (typeClazz == Integer.class || typeClazz == int.class) {
            value = Integer.parseInt(value.toString());
        }
        if (typeClazz == Float.class || typeClazz == float.class) {
            value = Float.parseFloat(value.toString());
        }
        fieldR.set(obj, value);
    }

    /**
     * 收文记录明细
     * 
     * @param input
     *            XML流
     * @return
     * @throws FileNotFoundException
     */
    public Object getReceiptService(InputStream input, Class<?> obj)
            throws Exception {
        factory = DocumentBuilderFactory.newInstance();
        builder = factory.newDocumentBuilder();
        document = builder.parse(input);
        element = document.getDocumentElement();
        NodeList books = element.getChildNodes();
        return priXml(books, obj);
    }

    /**
     * 解析并反射成对象
     * 
     * @param books
     * @param type
     * @param compMap
     * @return
     * @throws InstantiationException
     * @throws IllegalAccessException
     * @throws SecurityException
     * @throws NoSuchFieldException
     */
    private Object priXml(NodeList books, Class<?> type)
            throws InstantiationException, IllegalAccessException,
            SecurityException, NoSuchFieldException {
        Map<String, Object> compMap = Constsants.compMap;
        if (books == null) {
            books = element.getChildNodes();
        }
        // 先定义一堆临时变量
        Object obj = type.newInstance();
        List<Object> objList = new ArrayList<Object>();
        String bookName = "";
        Map<String, Object> typeMap = null;
        Map<String, Class> typeMap2 = analysisType(type);

        for (int i = 0; i < books.getLength(); i++) {
            Node book = books.item(i);
            if (book.getNodeType() == Node.ELEMENT_NODE) {

                if (bookName == "") { // 第一次进入，初始化临时变量
                    bookName = book.getNodeName();
                    System.out.println(bookName + "=" + book.getNodeValue());
                    typeMap = (Map<String, Object>) compMap.get(bookName);
                    tempMe(bookName, typeMap2, book, typeMap, compMap, objList);

                    Field[] fields = type.getDeclaredFields();
                    for (Field field : fields) {
                        if (field.getName().replaceAll("List", "")
                                .equalsIgnoreCase(bookName)) {
                            type.getDeclaredField(field.getName());
                            setFieldValue(obj, objList, field);
                            break;
                        }
                    }
                    continue;
                } else if (bookName == book.getNodeName()) {// bookName未发生变化，继续往里面装载
                    tempMe(bookName, typeMap2, book, typeMap, compMap, objList);
                    continue;
                }

                objList = new ArrayList<Object>();
                bookName = book.getNodeName();
                System.out.println(bookName + "=" + book.getNodeValue());
                typeMap = (Map<String, Object>) compMap.get(bookName);
                tempMe(bookName, typeMap2, book, typeMap, compMap, objList);

                Field[] fields = type.getDeclaredFields();
                for (Field field : fields) {
                    if (field.getName().replaceAll("List", "")
                            .equalsIgnoreCase(bookName)) {
                        type.getDeclaredField(field.getName());
                        setFieldValue(obj, objList, field);
                        break;
                    }
                }
            }
        }
        return obj;
    }

    private void tempMe(String bookName, Map<String, Class> typeMap2,
            Node book, Map<String, Object> typeMap,
            Map<String, Object> compMap, List<Object> objList)
            throws InstantiationException, IllegalAccessException,
            SecurityException, NoSuchFieldException {
        // 分析type类型,并实例化当前子类行
        Class childType = typeMap2.get(bookName);
        Object childObj = childType.newInstance();

        if (book.hasAttributes()) {
            NamedNodeMap nodeMap = book.getAttributes();
            for (int j = 0; j < nodeMap.getLength(); j++) {
                Node node = nodeMap.item(j);
                Set<Map.Entry<String, Object>> set = typeMap.entrySet();
                for (Iterator<Map.Entry<String, Object>> it = set.iterator(); it
                        .hasNext();) {
                    Map.Entry<String, Object> entry = (Map.Entry<String, Object>) it
                            .next();
                    if (node.getNodeName().equals(entry.getValue())) {
                        String key = entry.getKey();
                        Field field = childType.getDeclaredField(key);
                        setFieldValue(childObj, node.getNodeValue(), field);
                        break;
                    }
                }
            }
        }

        if (book.hasChildNodes()) {// 如果有子元素
            NodeList nodes = book.getChildNodes();
            Field[] fields = childType.getDeclaredFields();
            //递归调用
            Object childObj2 = priXml(nodes, childType);

            for (Field field : fields) {
                for (int i = 0; i < nodes.getLength(); i++) {
                    if (field.getName().replaceAll("List", "")
                            .equalsIgnoreCase(nodes.item(i).getNodeName())) {
                        childType.getDeclaredField(field.getName());
                        setFieldValue(
                                childObj,
                                getFieldValueByName(field.getName(), childObj2),
                                field);
                        break;
                    }
                }
            }
        }
        objList.add(childObj);
    }

    /**
     * 根据属性名获取属性值
     * */
    private Object getFieldValueByName(String fieldName, Object o) {
        try {
            String firstLetter = fieldName.substring(0, 1).toUpperCase();
            String getter = "get" + firstLetter + fieldName.substring(1);
            Method method = o.getClass().getMethod(getter, new Class[] {});
            Object value = method.invoke(o, new Object[] {});
            return value;
        } catch (Exception e) {
            return null;
        }
    }

    // 分析type类型
    private Map<String, Class> analysisType(Class<?> type) {
        Map<String, Class> typeMap = new HashMap<String, Class>();
        // 分析type类型
        Field[] fields = type.getDeclaredFields();
        Class childType = null;
        for (Field field : fields) {
            if (Collection.class.isAssignableFrom(field.getType())) {// 判断该属性是不是集合类型
                childType = (Class) ((ParameterizedType) field.getGenericType())
                        .getActualTypeArguments()[0];
            } else {
                childType = field.getType();
            }
            String chn = childType.getName();
            int chnLast = chn.lastIndexOf(".");
            String childTypeName = chn.substring(chnLast + 1);
            typeMap.put(childTypeName, childType);
        }
        return typeMap;
    }

    /**
     * 读取对照文件
     * 
     * @param fileName
     * @return map Map<String, Object> key为类名 value为一个Map<String,
     *         String>类型表示属性名和对应的XML中的属性名 key为bean类型中的属性名 value为对应XML文件中的节点或属性名
     * @throws ParserConfigurationException
     */
    public Map<String, Object> parserXml(String fileName)
            throws ParserConfigurationException {
        String classesPath = this.getClass().getResource("/").getPath();
        Map<String, Object> resultMap = new HashMap<String, Object>();
        try {
            FileInputStream inputXml = new FileInputStream(classesPath
                    + fileName);
            factory = DocumentBuilderFactory.newInstance();
            builder = factory.newDocumentBuilder();
            document = builder.parse(inputXml);
            element = document.getDocumentElement();
            NodeList books = element.getChildNodes();
            resultMap = hasContent(books);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (SecurityException e) {
            e.printStackTrace();
        } catch (SAXException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (NoSuchFieldException e) {
            e.printStackTrace();
        }
        return resultMap;
    }

    /**
     * 读取对照文件的递归方法
     * 
     * @return
     */
    private Map<String, Object> hasContent(NodeList books)
            throws InstantiationException, IllegalAccessException,
            SecurityException, NoSuchFieldException {
        Map<String, Object> resultMap = new HashMap<String, Object>();// 初始化返回结果
        String bookName = "";

        for (int i = 0; i < books.getLength(); i++) {
            Node node = books.item(i);
            if (node.getNodeType() == Node.ELEMENT_NODE) {
                if (bookName == "") {
                    bookName = node.getNodeName();
                } else if (bookName != node.getNodeName()) {
                    bookName = node.getNodeName();
                }
                if (node.hasChildNodes()) {
                    boolean b = false;
                    NodeList nodeChilds = node.getChildNodes();
                    for (int j = 0; j < nodeChilds.getLength(); j++) {
                        Node n = nodeChilds.item(j);
                        if (n.getNodeType() == Node.ELEMENT_NODE) {
                            b = true;
                        }
                    }
                    if (b) {
                        resultMap.put(bookName,
                                hasContent(node.getChildNodes()));
                    } else {
                        resultMap.put(bookName, node.getNodeValue()/* modify by yangzm .getTextContent().trim()*/);
                    }
                }
            }

        }
        return resultMap;
    }

    public static void main(String[] aa) {
        try {

        } catch (Throwable e) {
            e.printStackTrace();
        }
    }
}
