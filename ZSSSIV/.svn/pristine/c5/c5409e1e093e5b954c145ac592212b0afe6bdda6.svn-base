<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>业务代码编辑</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
    <script type="text/javascript" src="check.js"></script>
    <script type="text/javascript" src="<%=path%>/config.js"></script>
    <script type="text/javascript" src="<%=path%>/common.js"></script>
<script type="text/javascript">
var parent=this.dialogArguments;
 $(document).ready(function(){
 		getSysCodeValueList("datasource","ds","codeType.ds","100");
 		$.ajax({
		url: webroot+'/biz/serviceAC!queryCodeTypeById.action',
		data:'codeTypeId='+parent.selectItemId,
		type: 'POST',
		dataType: 'json',
	    error: function(){
			alert("加载数据失败");
		},
		success: function(data){
			$("#res_id").val(data.codeType.res_id);
			$("#res_name").val(data.codeType.res_name);
			$("#source").val(data.codeType.source);
			$("#change_date").val(data.codeType.change_date);
			$("#ds").val(data.codeType.ds);
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
 }); 
function postdata(){ 
	
	if(!isNull($("#res_id").val(),"分类id")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	if(!isNull($("#res_name").val(),"分类名称")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	if(!isNull($("#source").val(),"代码SQL")) {
		document.getElementById("btn1").disabled = false;
		return;
	}

	var postData = $("#form1").serialize();                                    
   	$.post(webroot+'/biz/serviceAC!updateCodeType.action', postData, function(data){
   			 document.getElementById("btn1").disabled =false;  
		     //window.opner.refreshGrid();
		     parent.refreshGrid();
		     window.close();
	}, 'json');    
 }

</script>
  </head>
  <body>
  	<form id="form1">
  	<!--input type="hidden" id="res_id" name="codeType.res_id"/-->
  	<br>
  	<table>
	  <colgroup>
	  		<col width="10%" align="right" />
	  		<col width="30%" align="left" />
			<col width="50%" align="left" />
			<col width="10%" align="right" />
	  	</colgroup>
	  	<tr><td></td><td>&nbsp;&nbsp;&nbsp;&nbsp;分类id：</td><td><input readonly id="res_id" type="text" name="codeType.res_id" size="50%" maxlength="50"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;分类名称：</td><td><input type="text" id="res_name" name="codeType.res_name" size="50%" maxlength="30"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;代码SQL：</td><td><input type="text" id="source" name="codeType.source" size="50%" maxlength="400"/></td></tr>
	  	<tr><td></td><td>&nbsp;&nbsp;&nbsp;&nbsp;更新日期：</td><td><input disabled type="text" id="change_date" name="codeType.change_date" size="50%" maxlength="30"/></td></tr>
	  	<tr><td></td><td>&nbsp;&nbsp;&nbsp;&nbsp;数据源：</td><td><div id="datasource_div"></div></td></tr>
	  	<tr><td></td><td></td>
	  		<td align="center"><input type="button" id="btn1"  value="保 存"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		<input type="button" id="btn2"  value="取 消"/></td>
	  	</tr>
  	</table>
	</form>  
  </body>
</html>
