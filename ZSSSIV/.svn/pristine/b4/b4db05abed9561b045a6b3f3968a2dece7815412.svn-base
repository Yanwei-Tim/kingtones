<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>单位信息编辑</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
    <script type="text/javascript" src="<%=path%>/config.js"></script>
     <script type="text/javascript" src="<%=path%>/check.js"></script>
<script type="text/javascript">
var parent=this.dialogArguments;
 $(document).ready(function(){
 
 		$.ajax({
		url: webroot+'/platform/unitAC!queryUnitByID.action',
		data:'unitID='+parent.selectItemId,
		
		type: 'POST',
		dataType: 'json',
	    error: function(){
			alert("加载数据失败");
		},
		success: function(data){
			    $("#pid").val(data.unit_bak.parent_id);
		    	$("#id").val(data.unit_bak.unit_id);
		    	$("#parent_name").val(data.unit_bak.parent_name);
		    	$("#name").val(data.unit_bak.unit_name);
		    	$("#desc").val(data.unit_bak.description);
		    	$("#xzqh").val(data.unit_bak.xzqh);
		    	$("#orderid").val(data.unit_bak.orderid);
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
      if(!isNull($("#name").val(),"单位名称")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	if(!lengthCheck($("#name").val(),"单位名称",128)){
		document.getElementById("btn1").disabled = false; // Add by 陈萧如 bug40对应
     	return false;
   } 
	if(!isNull($("#xzqh").val(),"行政区划")) {
		document.getElementById("btn1").disabled = false;
		return;
	}  
	if(!lengthCheck($("#xzqh").val(),"行政区划",128)){
      	document.getElementById("btn1").disabled = false; // Add by 陈萧如 bug40对应
     	return false;
   } 
	if(!isNull($("#desc").val(),"描述信息")) {
		document.getElementById("btn1").disabled = false;
		return;
	} 
	if(!lengthCheck($("#description").val(),"描述信息",128)){
		document.getElementById("btn1").disabled = false; // Add by 陈萧如 bug40对应
     	return false;
   }  
	if(!isNull($("#orderid").val(),"排列顺序")) {
		document.getElementById("btn1").disabled = false;
		return;
	}  
	if(!isNumber($("#orderid").val(),"排列顺序")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	if(!lengthCheck($("#orderid").val(),"排列顺序",30)){
	 document.getElementById("btn1").disabled = false; // Add by 陈萧如 bug40对应
     alert("排列顺序不能超过30个字符！");
     return false;
   } 

	var postData = $("#form1").serialize(); 
	                                 
   $.ajax({
		url: webroot+'/platform/unitAC!editUnit.action',
		type: 'POST',
		data:postData,
		dataType: 'json',
	    error: function(){
	    	document.getElementById("btn1").disabled = false;
			alert("修改失败");
		},
		success: function(data){
			document.getElementById("btn1").disabled = false;
			if(data.xzinfo=='1'){
				alert("行政区划不能重复！");
				// Delete by 陈萧如 start bug38对应
				//parent.refreshGrid();
				//parent.refreshNode();
				// Delete by 陈萧如 end
			}
			else{
				parent.refreshGrid();
				parent.refreshNode();
	        	window.close();
				}
			
			
	    }
	});              
 }
	

</script>
  </head>
  <body>
  	<form id="form1">
  	
  	<br>
  	<table>
	  	<colgroup>
	  		<col width="10%" align="right" />
	  		<col width="30%" align="right" />
			<col width="50%" align="left" />
			<col width="10%" align="right" />
	  	</colgroup>
	  	
	  	<tr><td></td><td></td><td><input type="hidden" id="id" name="unit_bak.unit_id" size="50%"/></td></tr>
	  	<tr><td></td><td>&nbsp;&nbsp;&nbsp;&nbsp;父级单位:</td><td><input type="text" id="parent_name" name="unit_bak.parent_name" size="50%" readonly/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;单位名称:</td><td><input type="text" id="name" name="unit_bak.unit_name" size="50%"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;行政区划:</td><td><input type="text" id="xzqh" name="unit_bak.xzqh" size="50%"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;描述信息:</td><td><input type="text" id="desc" name="unit_bak.description" size="50%"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;排列顺序:</td><td><input id="orderid"  type="text" name="unit_bak.orderid" size="50%"/></td></tr>
	  	<tr><td></td><td></td><td><input type="hidden" id="pid" name="unit_bak.parent_id" size="50%"/></td></tr>
	  
	  	<tr><td></td><td></td>
	  		<td align="center"><input type="button" id="btn1"  value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		<input type="button" id="btn2"  value="取 消"/></td>
	  	</tr>
  	</table>
	</form>  
  </body>
</html>
