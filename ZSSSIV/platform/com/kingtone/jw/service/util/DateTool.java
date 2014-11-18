package com.kingtone.jw.service.util;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.text.DateFormat;
import java.text.ParseException;
public class DateTool {
	 /**
     * <p>Method：strToDate
     * <p>Description:时间字符串按照指定格式专程Date对象
     * @return Date 说明
     * @param  类型 参数中文释义（多个参数用<br>分隔）
     * @exception 抛出例外全称（多个例外用<br>分隔），如：java.io.IOException 
     *<p>
     *---------------------------------------------------------<br>
     * 创建日期：May 31, 2009<br>
     * 修改履历：
     *        <li> 2009-01-01 *** 修改了***
     *<br>---------------------------------------------------------<br>
     *</p>
     */
    public static Date strToDate(String dateStr, String fomat) {
        DateFormat df = new SimpleDateFormat(fomat);
        try {
            Date sd = df.parse(dateStr);
            return sd;
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * <p>Method：getDateYear
     * <p>Description : 获取给定日期中的年
     * @return int 年
     * @param  date Date类型的日期 
     *<p>
     *---------------------------------------------------------<br>
     * 创建日期：2009-4-18<br>
     * 修改履历：
     *        <li> 2009-04-18 lichj@neusoft.com 完善注释信息
     *<br>---------------------------------------------------------<br>
     *</p>
     */
    public static int getDateYear(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        return calendar.get(Calendar.YEAR);
    }

    /**
     * <p>Method：getDateMonth
     * <p>Description : 获取给定日期中的月
     * @return int 年
     * @param  date Date类型的日期 
     *<p>
     *---------------------------------------------------------<br>
     * 创建日期：2009-4-18<br>
     * 修改履历：
     *        <li> 2009-04-18 lichj@neusoft.com 完善注释信息
     *<br>---------------------------------------------------------<br>
     *</p>
     */
    public static int getDateMonth(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        return calendar.get(Calendar.MONTH);// + 1;
    }

    /**
     * <p>Method：getDateDay
     * <p>Description : 获取给定日期中的天
     * @return int 天
     * @param  date Date类型的日期 
     *<p>
     *---------------------------------------------------------<br>
     * 创建日期：2009-4-18<br>
     * 修改履历：
     *        <li> 2009-04-18 lichj@neusoft.com 完善注释信息
     *<br>---------------------------------------------------------<br>
     *</p>
     */
    public static int getDateDay(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        return calendar.get(Calendar.DATE);
    }
    
    public static String getDataTime() {
		Calendar c = Calendar.getInstance();
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = (f.format(c.getTime()));
		return time;
	}
}
