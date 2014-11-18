<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>手机信息录入页面</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
    <script type="text/javascript" src="check.js"></script>
    <script type="text/javascript" src="<%=path%>/config.js"></script>
    <script type="text/javascript" src="<%=path%>/common.js"></script>
<script type="text/javascript">
var parent=this.dialogArguments;
 $(document).ready(function(){
 	 	getSysCodeList("haveres","is_res","colMapping.is_res","100");
 		getSysCodeList("cname_type","cname_type","colMapping.cname_type","100");
 		getSysCodeList("condition","op","colMapping.op","100");
 		getResCodeList("res_id","res_id","colMapping.res_id","100");
 		
 		$.ajax({
		url: webroot+'/biz/serviceAC!queryColMappingById.action',
		data:'colMappingId='+parent.selectItemId,
		type: 'POST',
		dataType: 'json',
	    error: function(){
			alert("加载数据失败");
		},
		success: function(data){
			$("#columns").val(data.colMapping.columns);
			$("#b_id").val(data.colMapping.b_id);
			$("#cname").val(data.colMapping.cname);
			$("#table_name").val(data.colMapping.table_name);
			$("#c_column").val(data.colMapping.c_column);
			$("#cname_type").val(data.colMapping.cname_type);
			$("#is_res").val(data.colMapping.is_res);
			$("#res_id").val(data.colMapping.res_id);
			$("#op").val(data.colMapping.op);
	    }
	});
 
    $("#btn1").click(function(){
    	//window.opener.disable = true;
		document.getElementById("btn1").disabled =true;
    	postdata();                                              
    });      
    $("#btn2").click(function(){
		window.close();
    });  
    /*$("#b_id").click(function(){
    	url=webroot+"/biz/service/selectbiz_boxtree.jsp?type=f";
        window.showModalDialog(url,window,'status:false;dialogWidth:200px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
    });*/ 
 }); 
function postdata(){ 
	
	if(!isNull($("#columns").val(),"系统字段")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	/*if(!isNull($("#b_id").val(),"业务id")) {
		document.getElementById("btn1").disabled = false;
		return;
	}*/
	if(!isNull($("#cname").val(),"系统字段名")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	/*
	if(!isNull($("#table_name").val(),"客户表名")) {
		document.getElementById("btn1").disabled = false;
		return;
	}*/
	/*if(!isNull($("#c_column").val(),"客户字段")) {
		document.getElementById("btn1").disabled = false;
		return;
	}*/
	if(!isNull($("#cname_type").val(),"客户字段类型")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	/*if(!isNull($("#res_id").val(),"资源id")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	if(!isNull($("#op").val(),"操作符")) {
		document.getElementById("btn1").disabled = false;
		return;
	}*/
	var postData = $("#form1").serialize();                                    
   	$.post(webroot+'/biz/serviceAC!updateColMapping.action', postData, function(data){
   			 document.getElementById("btn1").disabled =false;  
		     //window.opner.refreshGrid();
		     parent.refreshGrid();
		     window.close();
	}, 'json');    
 }
function setColumns(Columns,type){
	if(type=="f")$("#b_id").val(Columns);
}
</script>
  </head>
  <body>
  	<form id="form1">
  	<!--input type="hidden" id="columns" name="colMapping.columns"/-->
  	<input type="hidden" id="b_id" name="colMapping.b_id"/>
  	<br>
  	<table>
	  	<colgroup>
	  		<col width="10%" align="right" />
	  		<col width="30%" align="left" />
			<col width="50%" align="left" />
			<col width="10%" align="right" />
	  	</colgroup>
	  	<tr><td></td><td>系统字段</td><td><input readonly id="columns" type="text" name="colMapping.columns" size="50%" maxlength="20"/></td></tr>
	  	
	  	<tr><td></td><td>系统字段名</td><td><input type="text" id="cname" name="colMapping.cname" size="50%" maxlength="30"/></td></tr>
	  	<tr><td></td><td>客户表名</td><td><input type="text" id="table_name" name="colMapping.table_name" size="50%" maxlength="30"/></td></tr>
	  	<tr><td></td><td>客户字段</td><td><input type="text" id="c_column" name="colMapping.c_column" size="50%" maxlength="30"/></td></tr>
	  	<tr><td></td><td>客户字段类型</td><td>
	  	<div id="cname_type_div"/>
	  	<!-- <input type="text" id="cname_type" name="colMapping.cname_type" size="50%" maxlength="30"/> --></td></tr>
	  	<tr><td></td>
	  		<td>是否有资源</td>
	  		<td>
	  			<div id="haveres_div"/><!-- 
	  			<select id="is_res" name="colMapping.is_res" style="width:100%">
		    		<option value="0">否</option>
		         	<option value="1">是</option>
	    		</select> -->
	  		</td>
	  	</tr>
	  	<tr><td></td><td>资源id</td><td>
	  	<div id="res_id_div"/>
	  	<!--<input type="text" id="res_id" name="colMapping.res_id" size="50%" maxlength="20"/>-->
	  	</td></tr>
	  	<tr><td></td><td>操作符</td><td>
	  	<div id="condition_div"/>
	  	<!--<input type="text" id="op" name="colMapping.op" size="50%" maxlength="20"/>-->
	  	</td></tr>
	  	<tr><td></td><td></td>
	  		<td align="center"><input type="button" id="btn1"  value="保 存"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		<input type="button" id="btn2"  value="取 消"/></td>
	  	</tr>
  	</table>
	</form>  
  </body>
</html>
