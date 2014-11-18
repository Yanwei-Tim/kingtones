<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>系统代码编辑</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
    <script type="text/javascript" src="check.js"></script>
    <script type="text/javascript" src="<%=path%>/config.js"></script>
    
<script type="text/javascript">
	

var parent=this.dialogArguments;
 $(document).ready(function(){
 
 		$.ajax({
		url: webroot+'/biz/serviceAC!queryCodeById.action',
		data:'codeId='+parent.selectItemId,
		type: 'POST',
		dataType: 'json',
	    error: function(){
			alert("加载数据失败");
		},
		success: function(data){
			$("#key").val(data.code.key);
			$("#type").val(data.code.type);
			$("#value").val(data.code.value);
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
	if(!isNull($("#key").val(),"代码键")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	if(!isNull($("#value").val(),"代码值")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	if($("#value").val().getBytes()>50) {
		alert("代码值不能超过50字符");
		document.getElementById("btn1").disabled = false;
		return ;
	}
	if(!isNull($("#type").val(),"代码分类")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	var postData = $("#form1").serialize();                                    
   	$.post(webroot+'/biz/serviceAC!updateCode.action', postData, function(data){
   			 document.getElementById("btn1").disabled =false;  
		     //window.opner.refreshGrid();
		     parent.refreshGrid();
		     window.close();
	}, 'json');    
 }
 String.prototype.getBytes = function() {    
    var cArr = this.match(/[^\x00-\xff]/ig);    
    return this.length + (cArr == null ? 0 : cArr.length);    
 }
//function getBytes(car) {    
//    var cArr = car.match(/[^\x00-\xff]/ig);    
//    return car.length + (cArr == null ? 0 : cArr.length);    
//}
</script>
  </head>
  <body>
  	<form id="form1">
  	<!--input type="hidden" id="key" name="code.key"/>
  	<input type="hidden" id="type" name="code.type"/-->
  	<br>
  	<table>
	  	<colgroup>
	  		<col width="10%" align="right" />
	  		<col width="30%" align="left" />
			<col width="50%" align="left" />
			<col width="10%" align="right" />
	  	</colgroup>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;代码分类：</td><td><input readonly id="type" type="text" name="code.type" size="50%" maxlength="30"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;代码键：</td><td><input readonly id="key" type="text" name="code.key" size="50%" maxlength="50"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;代码值：</td><td><input type="text" id="value" name="code.value" size="50%" maxlength="50"/></td></tr>
	  	<tr><td></td><td></td>
	  		<td align="center"><input type="button" id="btn1"  value="保 存"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		<input type="button" id="btn2"  value="取 消"/></td>
	  	</tr>
  	</table>
	</form>  
  </body>
</html>
