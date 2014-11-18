/**
 * 
 */
package com.kingtone.jw.service.jwoa.xml;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.kingtone.jw.service.jwoa.bean.ArrayOfParameterInfo;
import com.kingtone.jw.service.jwoa.bean.ParameterInfo;
import com.kingtone.jw.service.util.Constsants;

/**
 * 对象转换成XML格式的字符串
 * 
 * @author litengmin
 * @since [产品/模块版本] （必须）
 * @date 2013-8-10
 */

public class GenerateXml {

    public String generateObjToXmlStr(Object obj)
            throws InstantiationException, IllegalAccessException,
            IllegalArgumentException, InvocationTargetException {
        if (obj != null) {
            String tool = " xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" ";
            Class<?> type = obj.getClass();
            Map<String, Object> compMap = Constsants.compMap;

            // 读取对象类型名称
            String typeName = analyzeClassName(type);
            Map<String, Object> objMap = (Map<String, Object>) compMap
                    .get(typeName);

            StringBuilder retuStrXml = new StringBuilder();
            objToXML(retuStrXml, obj);
            String xmlTitle = "<?xml version=\"1.0\" encoding=\"utf-8\"?>";
            String content = retuStrXml.toString();
            int index = 0;
            index = content.indexOf(">");
            if(obj instanceof ArrayOfParameterInfo){
                List<ParameterInfo> list = ((ArrayOfParameterInfo) obj).getList();
                if(list == null || list.size() == 0){
                    index = content.indexOf("/>");
                    String agoCont = content.substring(0,index);
                    String afterCont = "</" + agoCont.substring(1) + ">";
                    return xmlTitle + agoCont + tool + ">" + afterCont;
                }
            }
            String agoCont = content.substring(0,index);
            String afterCont = content.substring(index);
            return xmlTitle + agoCont + tool + afterCont;
        } else {
            return null;
        }
    }

    private void objToXML(StringBuilder retuStrXml, Object obj)
            throws IllegalArgumentException, IllegalAccessException,
            InvocationTargetException {
        Map<String, Object> compMap = Constsants.compMap;
        Class<?> type = obj.getClass();
     // 读取对象类型名称
        String typeName = analyzeClassName(type);
        Map<String, Object> objMap = (Map<String, Object>) compMap.get(typeName);
        retuStrXml.append("<" + typeName);
        StringBuilder childXml = new StringBuilder();// XML的子元素
        StringBuilder fieldXml = new StringBuilder(); // 元素的属性
        Method[] methods = type.getMethods();
        for (Method method : methods) {
            String methodName = method.getName();
            if (methodName.startsWith("get")) {
                String propertyName = toLowerCase(methodName.substring(3));
                if(propertyName.equals("class")){
                    continue;
                }
                Object value = method.invoke(obj, null);
                
                if(value != null){
                    if (Collection.class.isAssignableFrom(value.getClass())) {
                        Collection<?> values = (Collection<?>) value;
                        for (Object childObj : values) {
                            //调用递归
                            objToXML(childXml, childObj);
                        }
                    } else {
                        String proeNameXml = (String) objMap.get(propertyName);
                        fieldXml.append(proeNameXml + "=\"" + value + "\" ");
                    }
                }
            }
        }
        retuStrXml.append(" " + fieldXml);
        if(childXml.toString().trim().length()<=0){
            retuStrXml.append("/>");
        }else{
            retuStrXml.append(">");
            retuStrXml.append(childXml);
            retuStrXml.append("</"+typeName+">");
        }
    }

    /**
     * 读取对象类型名称
     * 
     * @param type
     * @return
     */
    private String analyzeClassName(Class<?> type) {
        String chn = type.getName();
        int chnLastindex = chn.lastIndexOf(".");
        return chn.substring(chnLastindex + 1);
    }

    /**
     * 首字母小写
     * 
     * @param str
     * @return
     */
    private static String toLowerCase(String str) {
        char[] chars = new char[1];
        chars[0] = str.charAt(0);
        String temp = new String(chars);
        if (chars[0] >= 'A' && chars[0] <= 'Z') {
            str = str.replaceFirst(temp, temp.toLowerCase());
        }
        return str;
    }
    
    public static void main(String[] aaa) throws Exception {
        List<ParameterInfo> objList = new ArrayList<ParameterInfo>();
        ParameterInfo obj = new ParameterInfo();
        obj.setDatafield("文件类别");
        obj.setDatatype("VARCHAR");
        obj.setDatavalue("传真电报");
        obj.setFormat("");
        obj.setOperator("like");
        objList.add(obj);
        ArrayOfParameterInfo api = new ArrayOfParameterInfo();
        api.setList(objList);
        GenerateXml gx = new GenerateXml();
//
        System.out.println(gx.generateObjToXmlStr(api));
    }
}
