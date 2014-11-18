<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
<script type="text/javascript"> 
function toggle(){
	$(".panel").slideToggle("slow");//$(selector).slideToggle(speed,callback);
}

</script>
 
	<style type="text/css"> 
		div.panel
		{
			margin:0px;
			padding:5px;
			text-align:center;
			background:#e5eecc;
			border:solid 1px #c3c3c3;
		}
		div.panel
		{
			height:350px;
			display:none;
		}
		#adiv{
			border-bottom:1px solid #E6E6E6;			
			height:185px;
			width:450px;
			overflow:auto;
		}
		#bdiv{
			border-bottom:1px solid #E6E6E6;			
			height:60px;
			width:450px;
			overflow:auto;
		}
	</style>
</head>
 
<body onload="toggle()">
 
<div class="panel">
	<table style="BORDER-TOP-STYLE: solid; BORDER-RIGHT-STYLE: solid; BORDER-LEFT-STYLE: solid; BORDER-BOTTOM-STYLE: solid"
	   align="center" bgColor=#ffffff border=2 height=40  width=80% >
   		<tr >
   			<td colSpan=2 style="font-size: 18px">警情人员管理</td>
   		</tr>
   		<tr>
   			<td style="font-size: 14px">警情(请选择警情！)</td>
   			<td style="font-size: 14px">人员(请选择警员！)</td>
   		</tr>
   		<tr>
   			<td>
   				<div id="adiv">
   					<input type="radio" />警情aaaaaaaaaa<br> 
	   				<input type="radio" />警情aaaaaaaaaa<br> 
	   				<input type="radio" />警情aaaaaaaaaa<br> 
	   				<input type="radio" />警情aaaaaaaaaa<br> 
	   				<input type="radio" />警情aaaaaaaaaa<br> 
	   				<input type="radio" />警情aaaaaaaaaa<br> 
	   				<input type="radio" />警情aaaaaaaaaa<br> 
	   				<input type="radio" />警情aaaaaaaaaa<br> 
	   				<input type="radio" />警情aaaaaaaaaa<br> 
	   				<input type="radio" />警情aaaaaaaaaa<br>   				
   				</div>
			</td>
   			<td>
   				<div id="adiv">
   					<input type="checkbox" />警员test1<br/>
   					<input type="checkbox" />警员test1<br/>
   					<input type="checkbox" />警员test1<br/>
   					<input type="checkbox" />警员test1<br/>
   					<input type="checkbox" />警员test1<br/>
   					<input type="checkbox" />警员test1<br/>
   					<input type="checkbox" />警员test1<br/>
   					<input type="checkbox" />警员test1<br/>
   					<input type="checkbox" />警员test1<br/>
   					<input type="checkbox" />警员test1<br/>
   				</div>
			</td>
   		</tr>
   		<tr>
   			<td>
   				<div id="bdiv">
   				<font color="red">已选择：</font><br>
   					警情aaaaaaaaaa  
   				</div>
   			</td>
   			<td>
   				<div id="bdiv">
   				<font color="red">已选择：</font><br>
   					警员test1<br/>
   					警员test1<br/>
   				</div>
			</td>
   		</tr>
   		<tr >
   			<td colSpan=2 style="font-size: 18px">
   			<input type="button" value="确定">
   			</td>
   		</tr>
   	</table>
</div>
 
<button onclick="toggle()">请点击这里</button>
 
</body>
</html>