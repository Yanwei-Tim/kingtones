package com.kingtone.jw.service.socketservice;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import com.kingtone.jw.service.util.GetConfig;
import com.kingtone.ssi.log.SSILogger;

/*socket服务 提供文件上传下载功能*/
public class Server extends HttpServlet {

	private static final long serialVersionUID = 1L;
	/** Socket 服务端端口 * */
	public int port = 9010;
	private static ServerSocket server = null;
	/* 压缩图片文件夹 */
	public static String IMGFILEPATH = "D:\\simpleimg\\";

	/**
	 * 
	 * 启动socket服务
	 */
	public void startSocket() {
		new Thread() {
			@Override
			public void run() {
				super.run();
				if (server == null) {
					// SSILogger.Bizlogger.info("创建socket服务...");
					try {
						// port =CommonTool.socketport;
						// IMGFILEPATH=CommonTool.IMGFILEPATH;
						server = new ServerSocket(port);
					} catch (IOException e) {
						// SSILogger.Bizlogger.error("startSocket",e);
						e.printStackTrace();
					}
				}
				SSILogger.Bizlogger.info("SocketServer Create seccess...");

				while (true) {
					try {
						Socket client = server.accept();
						if (client == null || client.isClosed())
							continue;
						new ImgDown(client, IMGFILEPATH).start();
					} catch (IOException ex) {
						SSILogger.Bizlogger.error("Socket while(true)", ex);
						ex.printStackTrace();
					}
				}
			};
		}.start();

	}

	public void init() throws ServletException {
		try {
			port = new Integer(GetConfig.GetConfigByKey("upload_socketport"));
			IMGFILEPATH = GetConfig.GetConfigByKey("upload_path");
		} catch (Exception e) {
			// TODO: handle exception
			SSILogger.Bizlogger.error("Socket port or path set error", e);
		}
		startSocket();
	}

	public static void main(String[] args) {
		Server s = new Server();
		try {
			s.init();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}