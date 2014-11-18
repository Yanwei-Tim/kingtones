<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
  <head>
    <title>视频采集列表</title>
    <meta http-equiv="x-ua-compatible" content="ie=8" />
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=path%>/flexgrid/css/flexigrid/flexigrid.css"/>
	<script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
	<script type="text/javascript" src="<%=path%>/flexgrid/flexigrid.js"></script>
	<script type="text/javascript" src="<%=path%>/config.js"></script>
	<link rel="stylesheet" href="<%=path%>/ztree/demo/demoStyle/demo.css" type="text/css">
  	<link rel="stylesheet" href="<%=path%>/ztree/demo/zTreeStyle/zTreeStyle.css" type="text/css">
  	<script type="text/javascript" src="<%=path%>/ztree/demo/jquery-ztree-2.5.js"></script>
  	<script type="text/javascript" src="<%=path%>/platform/js/ssi_calender.js"></script>
  	<script type="text/javascript" src="<%=path%>/check.js"></script>
  	<script type="text/javascript" src="<%=path%>/datetime.js"></script> 
<script type="text/javascript">
 $(document).ready(function(){
    $("#btn1").click(function(){
    	
		if(getSelectNode())
    		$("#xzqh").val(getSelectNode().xzqh)
    	refreshGrid2();
    });
          
 }); 
</script>
	<style>
		body
			{
			font-family: Arial, Helvetica, sans-serif;
			font-size: 12px;
			}
		.flexigrid div.fbutton .add
			{
				background: url(<%=path%>/flexgrid/css/images/add.png) no-repeat center left;
			}	
		.flexigrid div.fbutton .delete
			{
				background: url(<%=path%>/flexgrid/css/images/close.png) no-repeat center left;
			}	
	</style>
	
  </head>
  
  <body>
  	<table width="100%">
  		<tr height="5%">
  			<td><span style="font-weight:bolder;">数据采集&gt;&gt;视频采集</span></td>
  		</tr>
  		<tr height="95%" >
  			<td width="15%">
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr height="23px">
						<td class="rtitletdM" valign="bottom" align="left">
							<span style="font-weight: bolder;">单位选择</span>
						</td>
					</tr>
				</table>

  				<table cellpadding="1" cellspacing="1" border="1px">
  					<tr>
  						<td>
  							<ul id="treeDemo" class="tree"></ul>
  						</td>
  					</tr>
  				</table>
  				<table height="100%"></table>
			</td>
  			<td>
  				<table width="850px">
  					<tr height="23px">
						<td class="rtitletdM" valign="bottom" align="left">
							<span style=" font-weight: bolder;">视频列表</span>
						</td>
					</tr>
				</table>
  				<table id="flex1" style="display:none"></table>
  				<table width="850px">
					<tr height="23px">
						<td>
						<form id="form2">
							<input id="xzqh"  type="hidden"  name="Tpcj.xzqh" size="10px"/>
							<input id="dw"  type="hidden"  name="Tpcj.dw" size="10px"/>
							<table >
							  	<tr>
							  		<td>姓名:</td>
							  		<td><input id="xm"  type="text"  name="tpcj.xm" size="10px"/></td>
							  		<td>手机串码:</td>
							  		<td><input id="device_id"  type="text"  name="tpcj.device_id" size="10px"/></td>
							  		<td>日期段:</td>
							  		<td><div><input id="startdate"  type="text"  name="tpcj.startdate" size="10px" onClick="SelectDate(this,'yyyy-MM-dd',0,0)" readonly/></div></td>
							  		<td>-</td>
							  		<td><div><input id="enddate"  type="text"  name="tpcj.enddate" size="10px" onClick="SelectDate(this,'yyyy-MM-dd',0,0)" readonly/></div></td>
							  		<td><input type="button" id="btn1"  value="查 询"/></td>
							  	</tr>
						  	</table>
						  	</form>
						</td>
					</tr>
				</table>
  			</td>
  		</tr>
  	</table>
<script type="text/javascript" src="<%=path%>/biz/common/spcj_mgr_list.js"></script>
  </body>
</html>
