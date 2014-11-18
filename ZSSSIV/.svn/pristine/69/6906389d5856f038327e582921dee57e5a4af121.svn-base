<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.io.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">   
    <title>图片显示</title>
  </head>
  <body>
<%

    //String path = (String)(request.getParameter("path"));
     String picpath = (String)(session.getAttribute("fileUrl"));
    response.reset();
        
    ServletOutputStream output = response.getOutputStream();
    InputStream in =null;
//   try {
   in = new FileInputStream(picpath);
//    } catch (Exception e) {
//		out.println("系统找不到指定的路径!请检查。");
//	}
	if(in!=null){
    byte tmp[] = new byte[256];

    int i=0;
    while ((i = in.read(tmp)) != -1) {
        output.write(tmp, 0, i);
    }
    in.close();
    output.flush(); //强制清出缓冲区                
    output.close();
	out.clear();
	out = pageContext.pushBody();
	}
%>


  </body>
</html>
