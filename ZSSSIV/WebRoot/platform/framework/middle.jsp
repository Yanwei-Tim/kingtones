<%@ page language="java" pageEncoding="gb2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<%
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://"
				+ request.getServerName() + ":" + request.getServerPort()
				+ path + "/";
	%>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>无标题文档</title>
		<script type="text/javascript"
			src="<%=path%>/flexgrid/lib/jquery/jquery.js">
</script>
	</head>
	<script>
function show_hide() {
	var fs = window.parent.document.getElementsByTagName("frameset");
	if (fs[1].cols != "0,18,*") {
		fs[1].cols = "0,18,*";
		$("#middleImage").attr("src",
				"<%=path%>/platform/images/middle/zhong.gif");
	} else if (fs[1].cols != "200,18,*") {
		fs[1].cols = "200,18,*";
		$("#middleImage").attr("src",
				"<%=path%>/platform/images/middle/zhong2.gif");
	}
}
</script>
<body style="position:relative" LEFTMARGIN=0   TOPMARGIN=0   MARGINWIDTH=0   MARGINHEIGHT=0>

<table width="100" height="100%" border="0" 
		cellspacing="0" align="left" background="<%=path%>/platform/images/middle/middle_bk.JPG">
		<tr>
			<td valign=middle height="100%" width="100%" align="center">
				<img id="middleImage"
					src="<%=path%>/platform/images/middle/zhong2.gif"
					onclick="show_hide();" style="cursor:pointer;position:absolute;left:3px;top:110px">
			</td>
		</tr>
	</table>

</body>
	