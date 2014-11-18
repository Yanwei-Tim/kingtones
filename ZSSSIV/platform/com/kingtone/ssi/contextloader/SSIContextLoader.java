/**
 * 文件名：SSIContextLoader.java
 * 
 * 创建人：邹甲乐 - zoujiale@kingtoneinfo.com
 * 
 * 创建时间：Apr 2, 2011
 * 
 * 版权所有：西安联合信息技术股份有限公司
 */
package com.kingtone.ssi.contextloader;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.commons.digester.Digester;
import org.apache.commons.digester.Rule;
import org.apache.commons.digester.RuleSetBase;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextException;
import org.springframework.util.StringUtils;
import org.springframework.web.context.ConfigurableWebApplicationContext;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;
import org.xml.sax.SAXException;


/**
 * Title:TODO 类的简单标题
 * Description:TODO 类的功能简述
 * Copyright:Copyright 2011 KingToneInfo
 * Author: 邹甲乐 - zoujiale@kingtoneinfo.com
 * Date: Apr 2, 2011
 * History:
 * his1:
 */
public class SSIContextLoader extends ContextLoader {

	private static Digester d = null;

	protected WebApplicationContext createWebApplicationContext(ServletContext servletContext, ApplicationContext parent)
			throws BeansException {
		/* modify by yangzm
		   if(!IDUtil.LICENSE_RESULT)
			{
			System.out.println(IDUtil.getLicenseMsg());
			return new StaticWebApplicationContext();
			}
		   */
		   
		//System.exit(0);
		
		Class contextClass = determineContextClass(servletContext);
		if (!ConfigurableWebApplicationContext.class.isAssignableFrom(contextClass)) {
			throw new ApplicationContextException("Custom context class [" + contextClass.getName()
					+ "] is not of type [" + ConfigurableWebApplicationContext.class.getName() + "]");
		}
		ConfigurableWebApplicationContext wac = (ConfigurableWebApplicationContext) BeanUtils
				.instantiateClass(contextClass);
		wac.setParent(parent);
		wac.setServletContext(servletContext);
		// 添加获取配置文件路径的方法
		String configFilePath = servletContext.getInitParameter(CONFIG_LOCATION_PARAM);
		// 将配置文件中的内容组装成 spring 实际加载的信息
		String[] configLocations = parseConfigLocations(servletContext, configFilePath);
		if (configLocations != null) {
			wac.setConfigLocations(configLocations);
		}
		try{
		wac.refresh();
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		// 将ApplicationContext放入全局变量中
		SSIApplicationContextUtils.getInstance().setApplicationContext(wac);
		return wac;
	}

	protected String[] parseConfigLocations(ServletContext servletContext, String configFilePath) {
		Digester dParser = initDigester();
		String realPath = servletContext.getRealPath(configFilePath);
		
		//TODO: 使用 servlet 的上下文环境获取文件流，避免使用直接路径
		File inputFile = new File(realPath);
		try {
			List list = (List) dParser.parse(inputFile);
			List locations = new ArrayList();
			for (int i = 0; i < list.size(); i++) {
				String[] s = StringUtils.tokenizeToStringArray((String) list.get(i),
						ConfigurableWebApplicationContext.CONFIG_LOCATION_DELIMITERS);
				for (int j = 0; j < s.length; j++)
					locations.add(s[j]);
			}
			String[] result = new String[locations.size()];
			return (String[]) locations.toArray(result);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		}
		return null;
	}

	protected Digester initDigester() {
		if (d != null)
			return d;

		d = new Digester();
		d.setNamespaceAware(true);
		d.setValidating(false);
		d.setUseContextClassLoader(true);
		d.push(new ArrayList());
		d.addRuleSet(new RuleSetBase() {
			public void addRuleInstances(final Digester parser) {
				parser.addRule("packages/package/configuration-files", new Rule() {
					public void body(String namespace, String name, String text) throws Exception {
						List configs = (List) parser.peek();
						configs.add(text);
					}
				});
			}
		});
		return d;
	}
}
