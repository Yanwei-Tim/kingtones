/**
 * 文件名：SycnDataJob.java
 * 创建人：陈萧如 - chenxiaoru@kingtoneinfo.com
 * 创建时间：Dec 16, 2011
 * 版权所有：西安联合信息技术股份有限公司
 */

package com.kingtone.jw.service.scheduler;

import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.web.context.support.XmlWebApplicationContext;

import com.kingtone.jw.service.scheduler.engine.SynchDBEngine;
import com.kingtone.jw.service.scheduler.util.SynchHelpUtil;
import com.kingtone.jw.service.util.CommonTool;
import com.kingtone.ssi.log.SSILogger;

/**
 * 用于同步服务器端sqlite数据库文件的计划任务。
 * 
 * @author 陈萧如 - chenxiaoru@kingtoneinfo.com
 * @version 1.0 Created on Dec 16, 2011
 */
public class SynchDataJob implements Job {

	// 服务器存放sqlite文件的本地文件夹路径
	private String serverSqliteFolderPath = "";

	// 配置文件中的设置标识值：是否通过角色ID同步数据(1:不需要 0：需要)
	private String sycnByRoleIDFlag = "0";

	// 系统自带的sqlite文件名
	private static String defaultFileName = "police.db";

	// 服务器端sqlite文件统一前缀
	private static String namePrefix = "police_";

	// 文件夹名，用于在服务端存放sqlite文件
	private static String dbFileFolder = "sqlitefile";

	// sqlite文件的后缀名
	private static String sqliteFileExtension = ".db";
	
	// 两种文件同时同步（通过角色ID同步数据和同步非角色ID）
	public static final String SYCN_WITH_TWO = "2";

	// 通过角色ID同步数据
	public static final String SYCN_BY_ROLEID = "0";

	// 同步非角色ID数据
	public static final String SYCN_ALL = "1";
	
	// 记录程序启动入口（true：通过jar执行， false：直接在工程中启动）
	public static boolean isRunByJar = false;
	
	// 记录jar包名
	public static String jarFilePath = "";

	/**
	 * 
	 * 执行同步接口main函数入口
	 * @param args
	 * args[0]：jar包名
	 * args[1]：是否通过角色ID同步数据 （0：是 1：否）
	 * args[2]：存放同步生成的sqlite文件的本地路径
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on: Dec 23, 2011
	 */
	public static void main(String[] args){

		try {
			if(args.length==3){
				isRunByJar = true;
				// 获取jar包的文件路径，用于获取其根目录下的config文件夹下得文件（config文件夹下存放SSI配置文件）
				jarFilePath = "jar:file:/"+System.getProperty("user.dir")+File.separator+args[0]+"!";
				SynchDataJob job = new SynchDataJob(args[1],args[2]);
				// 开始执行同步操作
				job.startSycnData();
			}else{
				System.err.print("传入参数信息不正确！请顺序传入：1.jar包名；2.是否通过角色ID同步数据标识；3.存放生成的sqlite文件的本地路径");
			}
		} catch (Exception e) {
			SSILogger.Bizlogger.error("执行数据同步任务失败！", e);
			e.printStackTrace();
		} 
	}
	
	/**
	 * 构造函数：main函数调用
	 * @param sycnByRoleIDFlag：是否通过角色ID同步数据 （0：是 1：否）
	 * @param serverSqliteFolderPath：存放同步生成的sqlite文件的本地路径
	 */
	public SynchDataJob(String sycnByRoleIDFlag, String serverSqliteFolderPath){
		// 设置是否需要分角色ID同步标识值
		this.sycnByRoleIDFlag = sycnByRoleIDFlag;
		// 设置存放sqlite文件的本地路径
		this.serverSqliteFolderPath = serverSqliteFolderPath;
	}
	
	/**
	 * 计划任务构造函数入口
	 */
	public SynchDataJob(){
		super();
	}
	
	
	public void execute(JobExecutionContext jctx) throws JobExecutionException {
		System.out.println("jjjjjjjjjj-----------------");
		// 通过获取配置文件信息初始化参数
		initSchedulerParams(jctx);
		try {
			// 开始执行同步操作
			startSycnData();
		} catch (Exception e) {
			SSILogger.Bizlogger.error("执行数据同步计划任务错误！", e);
			e.printStackTrace();
		}
	}

	/**
	 * 
	 * 开始执行同步数据计划任务。
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @throws Exception
	 * @date: Created on: Dec 15, 2011
	 */
	@SuppressWarnings("unchecked")
	protected void startSycnData() throws Exception {
		SSILogger.Bizlogger.info("SycnDataJob --- 开始执行数据同步计划任务！");
		// 判断同步方式（不需要根据角色ID更新 或 根据角色ID更新 或 更新两种方式所有数据）
		if(sycnByRoleIDFlag.equals(SYCN_ALL) || sycnByRoleIDFlag.equals(SYCN_WITH_TWO)) {
			// 不需要分角色ID更新
			updateDBFile(null);
		}
		if (sycnByRoleIDFlag.equals(SYCN_BY_ROLEID) || sycnByRoleIDFlag.equals(SYCN_WITH_TWO)) {
			// 获取数据库里所有角色ID
			List<Object> roleIdList = getRoleIdList();
			for (Object item : roleIdList) {
				String roleId = ((Map<String, String>) item).get("ROLE_ID");
				// 更新角色ID对应数据库文件
				updateDBFile(roleId);
			}
		} 
		SSILogger.Bizlogger.info("SycnDataJob --- 本次数据同步计划任务执行完成！");
		System.out.println();
	}

	/**
	 * 
	 * 通过计划任务配置信息获取服务器的本地路径及角色ID同步数据标识flag。
	 * 
	 * @param jctx:
	 *            计划任务容器
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on: Dec 16, 2011
	 */
	private void initSchedulerParams(JobExecutionContext jctx) {
		// 获取计划任务的参数Map
		Map dataMap = jctx.getJobDetail().getJobDataMap();
		// 获取配置文件中的设置标识值：是否通过角色ID同步数据(1:不需要 0：需要)
		sycnByRoleIDFlag = (String) dataMap.get("sycnByRoleIDFlag");
		// 取得Spring的ApplicationContext
		XmlWebApplicationContext ctx = (XmlWebApplicationContext) dataMap
				.get("applicationContext");
		ServletContext servletContext = ctx.getServletContext();
		// 获取在服务端存放sqlite文件文件夹路径。
		serverSqliteFolderPath = servletContext.getRealPath("/") + dbFileFolder;
	}

	/**
	 * 
	 * 获取所有不重复的警务角色ID。
	 * 
	 * @return 存放警务角色MAP的列表
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @throws Exception
	 * @date: Created on: Dec 15, 2011
	 */
	protected List<Object> getRoleIdList() throws Exception {
		String sql = "select distinct ROLE_ID from jw_role";
		List<Object> roleList = CommonTool.loginDAO.findListBySQL(sql);
		return roleList;
	}

	/**
	 * 
	 * 更新角色ID对应的sqlite数据库文件。
	 * 
	 * @param roleId：警务角色ID
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @throws IOException
	 * @throws URISyntaxException
	 * @date: Created on: Dec 15, 2011
	 */
	protected void updateDBFile(String roleId) throws Exception {
		// 获取服务器端”sqlitefile“文件夹下对应的的sqlite文件， 如果不存在则创建
		File dbFile = getSqliteFile(serverSqliteFolderPath,
				getDBFileName(roleId));
		// 同步数据文件。
		if(dbFile.exists()){
			sycnDBFileData(dbFile, roleId);
		}
	}

	/**
	 * 
	 * 根据角色ID和服务器数据库中最新版本时间获取sqlite文件名（格式：police_id_date.db）
	 * 
	 * @param roleId：角色ID
	 * @return sqlite文件名
	 * @throws Exception
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on: Dec 21, 2011
	 */
	private String getDBFileName(String roleId) throws Exception {
		String fileName = "";
		// 获取数据库里最新版本时间
		String databaseVersionDate = SynchHelpUtil.getSynchDateFromDB(roleId);
		// 1.如果角色ID为空，更新police_all_更新时间.db数据文件
		// 2.如果角色ID不为空，更新police_xxx_更新时间.db数据文件（xxx为过滤掉无效字符的角色ID）
		if (roleId == null)
			fileName = namePrefix + "all" + "_" + databaseVersionDate + sqliteFileExtension;
		else
			fileName = namePrefix + roleId + "_" + databaseVersionDate
					+ sqliteFileExtension;
		return SynchHelpUtil.formatFileName(fileName);
	}

	/**
	 * 
	 * 获取指定文件夹下得对应的sqlite文件，如果不存在则创建。
	 * 
	 * @param folderPath：文件夹路径
	 * @param fileName：sqlite文件名
	 * @return sqlite文件
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @throws URISyntaxException
	 * @throws IOException
	 * @date: Created on: Dec 21, 2011
	 */
	private File getSqliteFile(String folderPath, String fileName)
			throws IOException, URISyntaxException {
		// 获取在服务端对应的文件路径。
		String filepath = folderPath + File.separator + fileName;
		File dbFolder = new File(folderPath);
		File dbFile = new File(filepath);
		if (!dbFile.exists()) {
			// 如果对应的文件夹不存在，创建。
			if (!dbFolder.exists()) {
				dbFolder.mkdir();
				SSILogger.Bizlogger
						.info("SycnDataJob --- 在服务器端创建sqlitefile文件夹。");
			}
			// 在服务器端创建该文件
			createBDFile(dbFile);
		}
		return dbFile;
	}

	/**
	 * 
	 * 根据角色ID同步当前sqlite数据文件。
	 * 
	 * @param sqliteFile：角色ID对应的sqlite文件
	 * @param roleId：警务角色ID
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @throws Exception 
	 * @date: Created on: Dec 15, 2011
	 */
	private void sycnDBFileData(File sqliteFile, String roleId) throws Exception {
		// 开始同步数据库数据
		SynchDBEngine engine = new SynchDBEngine(sqliteFile, roleId);
		engine.startSynchronous();
		// 同步数据文件完成后删除旧sqlite文件
		deleteOldSqliteFile(sqliteFile);
	}

	/**
	 * 
	 * 根据最新的sqlite文件，删除服务器端的旧版本的sqlite文件
	 * @param sqliteFile：最新的sqlite文件
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @date: Created on: Dec 21, 2011
	 */
	private void deleteOldSqliteFile(File sqliteFile) {
		// 文件过滤器，过滤出于指定文件同一sqlite数据库的旧版本文件
		SqliteFileFilter filter = new SqliteFileFilter(sqliteFile);
		// 服務端存放sqlite文件的文件夾
		File sqlitefolder = new File(serverSqliteFolderPath);
		File[] files = sqlitefolder.listFiles(filter);
		// 循环删除旧版本文件
		for(File deleteFile : files){
			if(deleteFile.exists())
				if(deleteFile.delete()){
					SSILogger.Bizlogger.info("SycnDataJob --- 删除旧版本文件：" + deleteFile.getPath() + "成功！");;
				}
		}
	}

	/**
	 * 
	 * 内部类：sqlite文件名过滤器，过滤与传入文件一致的文件
	 *
	 * @author 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @version 1.0 Created on Dec 21, 2011
	 */
	class SqliteFileFilter implements FilenameFilter {
		
		// sqlite最新版本文件
		private File latestFile;
		
		public SqliteFileFilter(File sqliteFile){
			latestFile = sqliteFile;
		}
		
		
		public boolean accept(File dir, String path) {
			// 需要比较的当前文件
			File file = new File(path);
			String fileName = file.getName();
			// 获取sqlite最新版本文件名
			String latestFileName = latestFile.getName();
			int index = latestFileName.lastIndexOf("_");
			// 获取sqlite文件名日期串前的部分
			String prefix = latestFileName.substring(0, index+1);
			// 判断是否和传入的最新版本的的sqlite文件名一致（除了版本时间字符串不同）
			return fileName.indexOf(prefix)==0&&fileName.endsWith(sqliteFileExtension)&&!fileName.equals(latestFileName);
		}
	}
	
	/**
	 * 
	 * 创建sqlite数据库文件。
	 * 
	 * @param sqliteFile：需要创建的sqlite文件
	 * 
	 * @author: 陈萧如 - chenxiaoru@kingtoneinfo.com
	 * @throws IOException 
	 * @throws IOException
	 * @throws URISyntaxException
	 * @date: Created on: Dec 15, 2011
	 */
	private void createBDFile(File sqliteFile) throws IOException {
		SSILogger.Bizlogger.info("SycnDataJob --- 在服务器端创建:"
				+ sqliteFile.getPath() + " 默认文件！");
			// 加载工程内置默认数据库文件流
		InputStream defaultDBStream = this.getClass().getResourceAsStream(defaultFileName);  
		if(defaultDBStream!=null){
			SynchHelpUtil.conyFile(defaultDBStream,sqliteFile);
		}
	}
	
}


