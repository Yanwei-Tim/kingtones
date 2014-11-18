/**
 * 文件名：SSIAction.java
 * 
 * 创建人：邹甲乐 - zoujiale@kingtoneinfo.com
 * 
 * 创建时间：Apr 2, 2011
 * 
 * 版权所有：西安联合信息技术股份有限公司
 */
package com.kingtone.ssi.security;

import java.util.Iterator;
import java.util.List;
import java.util.Vector;
import java.util.regex.Pattern;

import org.acegisecurity.ConfigAttribute;
import org.acegisecurity.ConfigAttributeDefinition;
import org.acegisecurity.SecurityConfig;
import org.acegisecurity.intercept.web.AbstractFilterInvocationDefinitionSource;
import org.acegisecurity.intercept.web.FilterInvocationDefinition;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.kingtone.jw.platform.domain.*;
import com.kingtone.jw.platform.util.OrgUtils;
import com.kingtone.ssi.log.SSILogger;
import com.kingtone.ssi.util.SSISecurityUtil;

/**
 * <p>[描述信息：说明类的基本功能]</p>
 *
 * @author 邹甲乐 - zoujiale@kingtoneinfo.com
 * @version 1.0 Created on Aug 30, 2008 1:33:03 PM
 */
public class SSIDBBasedFilterInvocationDefinitionMap extends AbstractFilterInvocationDefinitionSource implements
		FilterInvocationDefinition {

	private static final Log logger = LogFactory.getLog(SSIDBBasedFilterInvocationDefinitionMap.class);

	private boolean convertUrlToLowercaseBeforeComparison = false;

	/**
	 * <p>根据访问的URL查找可访问此资源的角色信息。</p>
	 * 
	 * @see org.acegisecurity.intercept.web.AbstractFilterInvocationDefinitionSource#lookupAttributes(java.lang.String)
	 * @author: 邹甲乐 - zoujiale@kingtoneinfo.com
	 * @date: Created on Aug 30, 2008 1:33:03 PM
	 */
	@SuppressWarnings("unchecked")
	public ConfigAttributeDefinition lookupAttributes(String url) {
		if (isConvertUrlToLowercaseBeforeComparison()) {
			String temp = url;
			url = temp.toLowerCase();
			if (logger.isDebugEnabled()) {
				logger.debug("Converted URL to lowercase, from: '" + temp + "'; to: '" + url + "'");
			}
		}
		ConfigAttributeDefinition cad = new ConfigAttributeDefinition();
		Iterator<EntryHolder> itor = null;
		try {
			itor = loadRequestList().iterator();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		while (itor.hasNext()) {
			EntryHolder entryHolder = (EntryHolder) itor.next();
			boolean matched = entryHolder.getCompiledPattern().matcher(url).matches();
			if (logger.isDebugEnabled()) {
				logger.debug("Candidate is: '" + url + "'; pattern is " + entryHolder.getCompiledPattern().pattern()
						+ "; matched=" + matched);
			}
			if (matched) {
				Iterator<ConfigAttribute> caItor = entryHolder.getConfigAttributeDefinition().getConfigAttributes();
				while (caItor.hasNext()) {
					ConfigAttribute ca = caItor.next();
					cad.addConfigAttribute(ca);
				}
			}
		}
		if (cad.getConfigAttributes().hasNext())
			return cad;
		return null;
	}

	public Iterator getConfigAttributeDefinitions() {
		return null;
	}

	public void addSecureUrl(String expression, ConfigAttributeDefinition attr) {
		if (logger.isDebugEnabled()) {
			logger.debug("Skip addSecureUrl execution");
		}
	}

	public boolean isConvertUrlToLowercaseBeforeComparison() {
		return convertUrlToLowercaseBeforeComparison;
	}

	public void setConvertUrlToLowercaseBeforeComparison(boolean convertUrlToLowercaseBeforeComparison) {
		this.convertUrlToLowercaseBeforeComparison = convertUrlToLowercaseBeforeComparison;
	}

	private List<EntryHolder> loadRequestList() throws Exception {
			List<EntryHolder> requestList = new Vector<EntryHolder>();
			/* 重要：定义一个静态容器，加载所有资源列表、每个资源对应的角色列表 只加载一次 */
			if(mappingList==null || mappingList.size()==0 ||SSISecurityUtil.reLoadResRoleList ==true){
				SSILogger.Bizlogger.info("---------重新加载角色资源映射列表---开始");
				mappingList = buildResourceRoleMappingList();
				SSISecurityUtil.reLoadResRoleList = false;
				SSILogger.Bizlogger.info("---------重新加载角色资源映射列表---结束");
			}
			List<ResourceRoleMapping> resRoleMappingList = mappingList;//buildResourceRoleMappingList();
			for (ResourceRoleMapping mapping : resRoleMappingList) {
				EntryHolder eh = makeEntryHolder(mapping.getResource(), mapping.getRoleList());
				requestList.add(eh);
			}
			return requestList;
	}
	/* 重要：定义一个静态容器，加载所有资源列表、每个资源对应的角色列表 只加载一次 */
	public static List<ResourceRoleMapping> mappingList = null;
	protected List<ResourceRoleMapping> buildResourceRoleMappingList() throws Exception{
		mappingList = new Vector<ResourceRoleMapping>();
		List<ResourceRoleMapping> mappingList = new Vector<ResourceRoleMapping>();
		// 获取所有资源的列表
		OrgUtils orgUtils = OrgUtils.getInstance();
		List<Resource> resourceList = orgUtils.queryResourceList();
		for (Resource res : resourceList) {
			String resId = res.getResource_id();
			// 获取资源对应的角色列表
			List<Role> roleList = orgUtils.queryRoleListOfResource(resId);
			// 添加资源和角色列表的对应关系
			mappingList.add(new ResourceRoleMapping(res, roleList));
		}
		return mappingList;
	}

	protected EntryHolder makeEntryHolder(Resource resource, List<Role> roleList) {
		ConfigAttributeDefinition configDefinition = new ConfigAttributeDefinition();
		for (Role role : roleList) {
			configDefinition.addConfigAttribute(new SecurityConfig(role.getRole_id()));
		}
		String urlPattern = resource.getUrl();
		Pattern compiledPattern = Pattern.compile(urlPattern);
		return new EntryHolder(compiledPattern, configDefinition);
	}

	protected class ResourceRoleMapping {

		private List<Role> roleList = new Vector<Role>();

		private Resource resource = new Resource();

		public ResourceRoleMapping(Resource resource, List<Role> roleList) {
			this.resource = resource;
			this.roleList = roleList;
		}

		public List<Role> getRoleList() {
			return roleList;
		}

		public Resource getResource() {
			return resource;
		}
	}

	protected class EntryHolder {

		private ConfigAttributeDefinition configAttributeDefinition;

		private Pattern compiledPattern;

		public EntryHolder(Pattern compiledPattern, ConfigAttributeDefinition attr) {
			this.compiledPattern = compiledPattern;
			this.configAttributeDefinition = attr;
		}

		protected EntryHolder() {
			throw new IllegalArgumentException("Cannot use default constructor");
		}

		public Pattern getCompiledPattern() {
			return compiledPattern;
		}

		public ConfigAttributeDefinition getConfigAttributeDefinition() {
			return configAttributeDefinition;
		}
	}
}
