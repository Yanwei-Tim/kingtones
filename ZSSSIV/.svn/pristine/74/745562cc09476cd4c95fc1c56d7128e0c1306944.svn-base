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

import org.acegisecurity.intercept.ObjectDefinitionSource;
import org.acegisecurity.intercept.web.FilterSecurityInterceptor;

/**
 * <p>SSI的安全过滤器，根据数据库中配置的资源，找到可访问资源的角色</p>
 *
 * @author 邹甲乐 - zoujiale@kingtoneinfo.com
 * @version 1.0 Created on Aug 29, 2008 10:22:17 PM
 */
public class SSIFilterSecurityInterceptor extends FilterSecurityInterceptor {

	private ObjectDefinitionSource objectDefinitionSource = null;

	/**
	 * <p>获取SSI中定义的资源-角色对应关系。</p>
	 * 
	 * @see org.acegisecurity.intercept.web.FilterSecurityInterceptor#obtainObjectDefinitionSource()
	 * @author: 邹甲乐 - zoujiale@kingtoneinfo.com
	 * @date: Created on Aug 29, 2008 10:28:26 PM
	 */
	public ObjectDefinitionSource obtainObjectDefinitionSource() {
		if (objectDefinitionSource == null) {
			objectDefinitionSource = initObjectDefinitionSource();
		}
		return objectDefinitionSource;
	}

	protected ObjectDefinitionSource initObjectDefinitionSource() {
		return new SSIDBBasedFilterInvocationDefinitionMap();
	}
}
