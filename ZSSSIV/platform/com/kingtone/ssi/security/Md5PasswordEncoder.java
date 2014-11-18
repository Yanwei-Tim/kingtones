package com.kingtone.ssi.security;

import org.acegisecurity.providers.encoding.PasswordEncoder;
import org.springframework.dao.DataAccessException;

import com.kingtone.ssi.util.encoder.EncodeTool;

/** 
 * 邹甲乐：
 * acegi密码加密扩展 
 */ 
public class Md5PasswordEncoder implements  PasswordEncoder{

	/** 
     * 密码加密 
     * @param rawPass   未加密密码，null作为空串 
     * @param salt      混淆码 
     * @return 
     */  
	public String encodePassword(String rawPass, Object salt)
			throws DataAccessException {
		return EncodeTool.getMd5EncoderInstance().encodePassword(rawPass);
	}
	/** 
     * 验证密码是否正确 
     * @param encPass   加密密码 
     * @param rawPass   未加密密码，null作为空串 
     * @param salt      混淆码 
     * @return          true:密码正确；false:密码错误 
     */  
	public boolean isPasswordValid(String encPass, String rawPass, Object salt)
			throws DataAccessException {
		return EncodeTool.getMd5EncoderInstance().isPasswordValid(encPass, rawPass);
	}

}
