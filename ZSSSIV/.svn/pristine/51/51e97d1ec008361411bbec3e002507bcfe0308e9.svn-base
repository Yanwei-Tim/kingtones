<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String paraNameStr = request.getParameter("para").trim();
String [] paraNames =paraNameStr.split("split"); //参数数组
String method = request.getParameter("method");//方法名
String url = request.getParameter("url");//URL
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>Axis method test page</title>

		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<script type="text/javascript">
	function test(paraNameStr){
		var paras = paraNameStr.split("split");
		var parasss="";
		for(var i in paras) { // 这个是关键
			if(paras[i]!=""){
				parasss+="split"+paras[i]+ "equals"+document.getElementById(paras[i]+"").value;
			}
		}
		document.location = "AxisTest?paras="+parasss+"&method="+'<%=method%>'+"&url="+'<%=url%>';
	}
	
	</script>

	</head>

	<body>
		Axis method test page
		<br>
		<form>
			<%for(int i=0;i<paraNames.length;i++){ %>
				<%if(!("".equals(paraNames[i]))){%>
				<b>参数【<%=paraNames[i]%>】值</b>
				<input type="text" id='<%=paraNames[i]%>' />
				<%} %>
			<% }%>
			<br>
			<br>
			<br>
			<button type="button" onclick="test('<%=paraNameStr%>');">
				提   交
			</button>
		</form>


	</body>
</html>
