package com.kingtone.ssi.util.encoder;

/** 
 * 邹甲乐：
 * 加密工具类
 */ 
public class EncodeTool {
	
	/** 
	 * 混淆码 
	 */ 
	public static String salt = "000";
	/** 
	 * MD5加密事例 
	 */ 
	private static PwdEncoder md5 = null;
	
	public static PwdEncoder getMd5EncoderInstance(){
		if(md5==null){
			md5 = new Md5PwdEncoder();
		}
		return md5;
	}
	
	/**
	 * 测试代码
	 */
	public static void main(String[] args) {
		Md5PwdEncoder md5 = new Md5PwdEncoder();
		System.out.println(md5.encodePassword("123"));
		System.out.println(md5.encodePassword("123", "000"));
		System.out.println(md5.isPasswordValid("202cb962ac59075b964b07152d234b70", "123"));
		System.out.println(md5.isPasswordValid("ecb21819b4d0139e56058e350c7cae7e", "123","000"));
		
	}
	
}
