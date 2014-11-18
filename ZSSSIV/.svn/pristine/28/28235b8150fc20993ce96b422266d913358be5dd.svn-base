package com.kingtone.jw.service.util;
import java.lang.reflect.InvocationTargetException;  
import java.lang.reflect.Method;  
import java.util.HashMap;  
import java.util.Map;  

import sun.reflect.annotation.ExceptionProxy;

/**
 * @author 李腾敏 E-mail: litengmin@kingtone.com
 * @version 创建时间：Jul 30, 2012 9:43:48 PM
 * 类说明 javaBean相互转换Map<String,Object>，其中map中的key值和javaBean中的属性名完全相同
 */
public class ConvertUtil {  
  
    public static final String setMethodModify = "set";  
    public static final String getMethodModify = "get";
    
    public static Object convert2Bean(Map<String, Object> map, Object obj) {  
        Class class1 = obj.getClass();  
        Method[] methods = class1.getMethods();  
        for (Method method : methods) {  
            String methodName = method.getName();  
            if (methodName.startsWith(ConvertUtil.setMethodModify)) {  
                String propertyName =  toLowerCase(methodName.substring(3));  
                Object value = map.get(propertyName);  
                try {  
                    method.invoke(obj, value);  
                } catch (IllegalArgumentException e) {  
                    e.printStackTrace();  
                } catch (IllegalAccessException e) {  
                    e.printStackTrace();  
                } catch (InvocationTargetException e) {  
                    e.printStackTrace();  
                }  
            }  
        }  
        return obj;  
    }  
    public static Map<String, Object> beanToConvert(Object obj) {
    	if(obj == null){
    		return null;
    	}
    	Map<String, Object> map = new HashMap<String, Object>();
        Class class1 = obj.getClass();  
        Method[] methods = class1.getMethods();  
        for (Method method : methods) {  
            String methodName = method.getName();  
            if (methodName.startsWith(ConvertUtil.getMethodModify)) {  
                String propertyName = toLowerCase(methodName.substring(3));  
                try {  
                	Object value = method.invoke(obj, null);
                	map.put(propertyName, value);  
                } catch (IllegalArgumentException e) {  
                    e.printStackTrace();  
                } catch (IllegalAccessException e) {  
                    e.printStackTrace();  
                } catch (InvocationTargetException e) {  
                    e.printStackTrace();  
                }  
            }  
        }  
        return map;  
    }  
    /**
     * 首字母小写
     * @param str
     * @return
     */
    private static String toLowerCase(String str){
    	char[] chars=new char[1];
		chars[0]=str.charAt(0);
		String temp=new String(chars);
		if(chars[0]>='A'  &&  chars[0]<='Z')
		{
			str = str.replaceFirst(temp,temp.toLowerCase());
		}
    	return str;
    }
}  
