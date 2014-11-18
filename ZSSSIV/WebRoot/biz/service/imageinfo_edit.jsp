<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>图片信息编辑</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
    <script type="text/javascript" src="<%=path%>/check.js"></script>
    <script type="text/javascript" src="<%=path%>/config.js"></script>
<script type="text/javascript">
var parent=this.dialogArguments;
 $(document).ready(function(){
 
 		$.ajax({
		url: webroot+'/biz/serviceAC!queryImageInfoById.action',
		data:'imageInfoId='+parent.selectItemId,
		type: 'POST',
		dataType: 'json',
	    error: function(){
			alert("加载数据失败");
		},
		success: function(data){
			$("#img_name").val(data.imageInfo.img_name);
			$("#img_path").val(data.imageInfo.img_path);
			$("#img_des").val(data.imageInfo.img_des);
			$("#img_show").attr("src",webroot+data.imageInfo.img_path); 
	    }
	});
 
    $("#btn1").click(function(){
		document.getElementById("btn1").disabled =true;
    	postdata();                                              
    });      
    $("#btn2").click(function(){
		window.close();
    });  
 }); 
function postdata(){ 
	
	if(!isNull($("#img_name").val(),"图片名称")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	
	if(!lengthCheck($("#img_name").val(),"图片名称",30)){
	 document.getElementById("btn1").disabled = false;
     return false;
   }
	if(!isNull($("#img_path").val(),"图片路径")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	
	 if(!lengthCheck($("#img_path").val(),"图片路径",255)){
	 document.getElementById("btn1").disabled = false;
     return false;
   }
   
	if(!isNull($("#img_des").val(),"图片描述")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	
	if(!lengthCheck($("#img_des").val(),"图片描述",255)){
	 document.getElementById("btn1").disabled = false;
     return false;
   }

	var postData = $("#form1").serialize();                                    
   	$.post(webroot+'/biz/serviceAC!updateImageInfo.action', postData, function(data){
   			 document.getElementById("btn1").disabled =false;  
		     parent.refreshGrid();
		     window.close();
	}, 'json');    
 }

</script>
  </head>
  <body>
  	<form id="form1">
  	<!--input type="hidden" id="img_name" name="imageInfo.img_name"/-->
  	<br>
  	<table>
	  	<colgroup>
	  		<col width="10%" align="right" />
	  		<col width="30%" align="left" />
			<col width="50%" align="left" />
			<col width="10%" align="right" />
	  	</colgroup>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;图片名称：</td><td><input readonly id="img_name" type="text" name="imageInfo.img_name" size="50%" maxlength="30"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;图片路径：</td><td><input readonly type="text" id="img_path" name="imageInfo.img_path" size="50%" maxlength="255"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;图片描述：</td><td><input type="text" id="img_des" name="imageInfo.img_des" size="50%" maxlength="255"/></td></tr>
	  	<tr><td></td><td></td>
	  		<td align="center"><input type="button" id="btn1"  value="保 存"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		<input type="button" id="btn2"  value="取 消"/></td>
	  	</tr>
	  	<tr><td></td><td>&nbsp;&nbsp;&nbsp;&nbsp;图片显示：</td><td><img alt="" src="" id="img_show" width="100"></td></tr>
  	</table>
	</form>  
  </body>
</html>
