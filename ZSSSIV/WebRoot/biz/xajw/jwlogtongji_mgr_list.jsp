<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
  <head>
    <title>业务列表页面</title>
    <meta http-equiv="x-ua-compatible" content="ie=8" />
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=path%>/flexgrid/css/flexigrid/flexigrid.css"/>
	<script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
	<script type="text/javascript" src="<%=path%>/flexgrid/flexigrid.js"></script>
	<script type="text/javascript" src="<%=path%>/config.js"></script>
	
	<style>
		body
			{
			font-family: Arial, Helvetica, sans-serif;
			font-size: 12px;
			}
		.flexigrid div.fbutton .select
			{
				background: url(<%=path%>/flexgrid/css/images/down.gif) no-repeat center left;
			}
		.flexigrid div.fbutton .add
			{
				background: url(<%=path%>/flexgrid/css/images/new.gif) no-repeat center left;
			}
		.flexigrid div.fbutton .edit
			{
				background: url(<%=path%>/flexgrid/css/images/edit.gif) no-repeat center left;
			}
		.flexigrid div.fbutton .relate
			{
				background: url(<%=path%>/flexgrid/css/images/relate.gif) no-repeat center left;
			}	
		.flexigrid div.fbutton .delete
			{
				background: url(<%=path%>/flexgrid/css/images/delete.gif) no-repeat center left;
			}
	</style>
	
  </head>
  
  <body>
  		<table>
  			<tr>
  				<td>&nbsp &nbsp &nbsp &nbsp</td>
  				<td><table id="flex1" style="display:none"></table></td>
  			</tr>
  		<table>
  		   		 <%
String biz_id = (String)request.getParameter("biz_id");



String op_time1 = (String)request.getParameter("op_time1");

String op_time2 = (String)request.getParameter("op_time2");

String postData="jwLog.biz_id="+biz_id+"&jwLog.op_time1="+op_time1+"&jwLog.op_time2="+op_time2;
%> 
		<script type="text/javascript" >
		//----------------【定义flexgrid开始】--------------------------------------------------------------------------
	var postData='<%=postData%>';
	
	
	$("#flex1").flexigrid(
	{  
		url: webroot+'/xajw/jwLogAC!tongJiJwLog.action?'+postData,
		dataType: 'json',
		colModel : [
		
			{display: '用户姓名', name : 'name', width : 100, align: 'center',hide:true},
			{display: '用户账号', name : 'account', width : 100,align: 'left',hide:false},
			{display: '手机号码', name : 'sjhm', width : 100,align: 'left',hide:true},
			{display: '手机串码', name : 'sjcm', width : 100,align: 'left',hide:false},
			{display: '行政区划', name : 'xzqh', width : 100,align: 'left',hide:false},
			{display: '登录模块', name : 'bizname', width : 150, align: 'center',hide:false},
			{display: '登录次数', name : 'count', width : 150, align: 'center',hide:false}
			
			],
		buttons : [
		//{name: '反选',bclass:'select',  onpress : btn_even},
			//{name: '使用用户统计', bclass:'delete', onpress : btn_even},
			//{separator: true},
			//{name: '未使用用户统计', bclass:'delete', onpress : btn_even},
			//{separator: true},
			//{name: 'Excel导出', bclass:'delete', onpress : btn_even},
			//{separator: true}
			
			],
		
		sortname: "iso",
		sortorder: "asc",
		usepager: true,
		useRp: true,
		rp: 10,
		title:'日志列表',
		showTableToggleBtn: true,
		resizable:true,  //窗口伸缩
		onSubmit: addFormData,
		width:800,
		height: 400
		}
		);	
	function addFormData()
	{
		return true;
	}
	//刷新列表	
	function refreshGrid(){
		$('#flex1').flexOptions({params: [{ name: 'null', value: 'null'}]}).flexReload();
	}	
	
	function btn_even(com,grid){
		selectItemId = $('.trSelected',grid).find("td:first").eq(0).text();
		 if (com=='Excel导出')
		{
			 window.location=webroot+'/xajw/jwLogAC!excelDoOut1().action?'+postData
		}
					
	}
	
	
	
		</script>
  </body>
</html>
