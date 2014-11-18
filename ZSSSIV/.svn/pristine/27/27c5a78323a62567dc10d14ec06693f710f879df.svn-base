package com.kingtone.ssi.contextloader;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.Validate;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.kingtone.jw.service.scheduler.SynchDataJob;

/**
 * 
 * <p>
 * 初始化测试环境
 * </p>
 * 
 */
public class SSIApplicationContext {
    private static ApplicationContext ctx = null;
    
    public static ApplicationContext getContext(){
    	if(ctx==null){
    		setMoudlePathAndInit("");
    	}
    	return ctx;
    }

    // 系统路径和平台的 Spring 配置路径(通常为固定值)
    // 位置由".classpath"配置文件中的[<classpathentry kind="output" path=""/>]属性决定
    private static String classPath;
    
    // 拦截字符串: 用于对系统路径进行有效的截取。
    private static String interceptorString;
    
    // 平台系统路径： 即所需的 Srping 公共配置文件所在路径
    private static String sysConfigPath;
    
    // 模块路径:需要测试环境传入的模块路径
    private static String[] moudlePath;

    public static Object getBean(String beanName) {
        return ctx.getBean(beanName);
    }

    // 暴露方法，以供自测试用
    private static String getSysConfigPath() {
        return decodePath(sysConfigPath);
    }
    
    /**
     * <p>
     * 设定单个路径和初始化配置
     * </p>
     * 从"WEB-INF/conf/"下一级开始写，需要结束分隔符。例如:
     * "report/"
     * @param moudlePath
     */
    private static void setMoudlePathAndInit(String moudlePath) {
        setMoudlePathAndInit(new String[] { moudlePath });
    }
    /**
     * <p>
     * 设定多个路径和初始化配置
     * </p>
     * @param moudlePath
     */
    private static void setMoudlePathAndInit(String[] moudlePath) {
        // 未被初始化过
        if (ctx == null) {
            Validate.notNull(moudlePath, "模块子目录不能为空！");
            Validate.notEmpty(moudlePath, "模块子目录不能为空！");
            SSIApplicationContext.moudlePath = moudlePath;
            init();
        }
    }

    /**
     * 如果磁盘路径有空格,"-"等特殊字符，则可能需要进行转码 否则无法保证得到正确的绝对路径
     * 
     * @param path
     */
    private static String decodePath(String path) {
        String pathDecodeded = "";
        try {
            pathDecodeded = URLDecoder.decode(path, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return pathDecodeded;
    }

    private static void init() {
        
        initPath();
        
        // 不同模块请在此处添加或修改基本配置文件
        List<String> configPathList = new ArrayList<String>();
        sysConfigPath = decodePath(sysConfigPath);
        configPathList.add(sysConfigPath + "dao-app-context.xml");
        configPathList.add(sysConfigPath + "datasource-app-context.xml");
        configPathList.add(sysConfigPath + "transaction-app-context.xml");
        configPathList.add(sysConfigPath + "platform/dpn/bs-app-context.xml");
        configPathList.add(sysConfigPath + "platform/dpn/dao-app-context.xml");
        configPathList.add(sysConfigPath + "platform/service/dao-app-context.xml");
        // Add by 陈萧如 2012-01-04 start
        configPathList.add(sysConfigPath + "platform/service/bs-app-context.xml");
        // Add by 陈萧如 2012-01-04 end
        
        
        // log配置不是必须的
        // configPathList.add(sysConfigPath+"log-app-context.xml");

        for (String path : moudlePath) {
            // 合成配置文件实际路径
            String moudleConfigPath = sysConfigPath + path;
//            configPathList.add(moudleConfigPath + "*-context.xml");
        }
        // 初始化Spring环境
        ctx = new FileSystemXmlApplicationContext(toStringArray(configPathList));
    }
    
    /**
     *  合成配置文件所在的路径
     */
    private static void initPath() {
    	// Modify by 陈萧如 start (当工程通过jar包执行时，SSIApplicationContext.class.getResource("")为空)
    	if(SynchDataJob.isRunByJar){
    	    sysConfigPath = SynchDataJob.jarFilePath+"/config/";
    	}else{
    		classPath = decodePath(SSIApplicationContext.class.getResource("").toString());
            interceptorString = "/classes";
            sysConfigPath = classPath.substring(0, classPath.lastIndexOf(interceptorString)) + "/config/";
    	}
    	// Modify by 陈萧如 end
    }

    private static String[] toStringArray(List<String> list) {
        String[] resultArr = new String[list.size()];
        int i = 0;
        for (Object ls : list) {
            resultArr[i] = (String) ls;
            i++;
        }
        return resultArr;
    }
    
    public static void main(String args[]) {
//        SSIApplicationContext.ctx.getBean("reportDataSource");
        initPath();
        System.out.println(SSIApplicationContext.getSysConfigPath());
        SSIApplicationContext.setMoudlePathAndInit("");

//        SSIApplicationContext.getBean("reportDataSource");
//        SSIApplicationContext.getBean("reportTransactionManager");
    }
}
