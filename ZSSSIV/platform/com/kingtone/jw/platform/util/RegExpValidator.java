package com.kingtone.jw.platform.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 正则表达式验证
 * 
 * @author 姚黎明
 * 
 */
public final class RegExpValidator {
	/**
	 * 身份证验证
	 * 
	 * @param idnum
	 * @return
	 */
	public static boolean isIDNumber(String idnum) {
		String regex = "(^\\d{17}[\\dxX]|\\d{15}$)";
		String regEx1 = "[`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]";
		if (match(regex, idnum) && !match(regEx1, idnum)) {
			return true;
		}
		return false;
	}

	/**
	 * 空字符验证
	 * 
	 * @param str
	 * @return
	 */
	public static boolean isNull(String str) {
		// String regex = "";
		if (str == null || str.equals("")) {

			// String aa="fsdfsdf";
			// String bb = aa;
			// System.out.println("-----------------false");
			return false;

		} else {
			// System.out.println("-----------------true");
			return true;
		}

	}

	/**
	 * 电话号码验证
	 * 
	 * @param num
	 * @return
	 */
	public static boolean IsTelephone(String num) {
		String regex = "^(\\d{3,4}-)?\\d{6,8}$";
		return match(regex, num);
	}

	/**
	 * 手机号码验证
	 * 
	 * @param str
	 * @return
	 */
	public static boolean IsMobile(String str) {
		String regex = "^[1]+[3,5,8]+\\d{9}$";
		return match(regex, str);
	}

	/**
	 * 验证日期时间
	 * 
	 * @param 待验证的字符串
	 * @return 如果是符合网址格式的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 */
	public static boolean isDate(String str) {
		String regex = "^((((1[6-9]|[2-9]\\d)\\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\\d|3[01]))|(((1[6-9]|[2-9]\\d)\\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\\d|30))|(((1[6-9]|[2-9]\\d)\\d{2})-0?2-(0?[1-9]|1\\d|2[0-8]))|(((1[6-9]|[2-9]\\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-)) (20|21|22|23|[0-1]?\\d):[0-5]?\\d:[0-5]?\\d$";
		return match(regex, str);
	}

	/**
	 * 验证只为数字
	 * 
	 * @param str
	 */
	public static boolean isNumber(String str) {
		String regex = "^[0-9_]+$";
		return match(regex, str);
	}

	/**
	 * 特殊字符验证
	 */
	public static boolean isSpecialCharacters(String str) {
		String regEx = "[`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]";
		if (match(regEx, str)) {
			return false;
		}
		return true;
	}

	/**
	 * @param regex
	 *            正则表达式字符串
	 * @param str
	 *            要匹配的字符串
	 * @return 如果str 符合 regex的正则表达式格式,返回true, 否则返回 false;
	 */
	private static boolean match(String regex, String str) {
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(str);
		return matcher.matches();
	}

}
