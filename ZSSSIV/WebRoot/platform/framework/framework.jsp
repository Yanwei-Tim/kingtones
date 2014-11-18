<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>中山市公安局移动警务通WAP综合查询管理平台</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
<frameset rows="102,*" frameborder="NO" border="0" framespacing="0" name="topset" id="topset">
    <frame id="top" name="top" scrolling="NO" frameborder="1" noresize="noresize" src="<%=path%>/platform/framework/top.jsp">
    <frameset rows="*" cols="200,18,*" framespacing="0" frameborder="no" border="0" name="middleset">
        <frame id="left" name="left" scrolling="auto" frameborder="0" noresize="noresize" src="<%=path%>/platform/framework/left.jsp" />
        <frame  name="middle" scrolling="No" noresize="noresize" id="flag" title="flag" src="<%=path%>/platform/framework/middle.jsp"/>
        <frame id="right" name="right" scrolling="auto" frameborder="0" noresize="noresize" src="<%=path%>/platform/framework/right.jsp" />
    </frameset>
</frameset>
<noframes>
    <body bgcolor="#FFFFFF" text="#000000">
    </body>
</noframes>
</html>