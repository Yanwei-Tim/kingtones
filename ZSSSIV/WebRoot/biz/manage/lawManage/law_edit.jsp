<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>用户信息添加</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
  <script type="text/javascript" src="<%=path%>/config.js"></script>
   <script type="text/javascript" src="<%=path%>/check.js"></script>
   	<script type="text/javascript" src="<%=path%>/platform/js/ssi_calender.js"></script>
   	
<script type="text/javascript">
var parent= window.opener;//this.dialogArguments;


var tel=/^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/;
var mobile=/^((\(\d{2,3}\))|(\d{3}\-))?(13|15|18)\d{9}$/;

var mail=/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
 $(document).ready(function(){
 
 	 $.ajax({
	    	url: webroot+'/manage/lawAC!findLawByLawID.action',
	    	data:'addID='+parent.selectItemId,
		    dataType: 'json',
		    timeout: 1000,
		    error: function(){
		       alert('Error loading XML document');
		    },
		    success: function(data){
		    	$("#LAW_ID").val(data.law.LAW_ID);
		    	$("#LAW_CODE").val( data.law.LAW_CODE);	
		    	
		    	$("#LAW_NAME").val(data.law.LAW_NAME);
		    	$("#ADMINISTRATION").val(data.law.ADMINISTRATION);
		    	$("#IRREGULARITYACTION").val(data.law.IRREGULARITYACTION);
		    	$("#LAW_TYPE").val(data.law.LAW_TYPE);
		    	
		    	
		    }
		});
    $("#btn1").click(function(){
    	//window.opener.disable = true;
		
		//给隐藏域赋值    	
    	postdata(); 
    	                                             
    });      
    $("#btn2").click(function(){
		window.close();
    });  
 }); 
function postdata(){ 

	
  if(!isNull($("#LAW_CODE").val(),"法规代码")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
  if(!lengthCheck($("#LAW_CODE").val(),"法规代码",50)){
     return false;
   }
	if(!isNull($("#LAW_NAME").val(),"法规名称")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
  if(!lengthCheck($("#LAW_NAME").val(),"法规名称",50)){
     return false;
   }
   
   if($("ADMINISTRATION" != null)){
   		 if(!lengthCheck($("#ADMINISTRATION").val(),"颁布事件",200)){
		     return false;
		   }
   }
   
   if($("IRREGULARITYACTION" != null)){
   		 if(!lengthCheck($("#IRREGULARITYACTION").val(),"法规内容",500)){
     return false;;
   }
   }
   if(!isNull($("#LAW_TYPE").val(),"法规类型")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	
	
  if(!lengthCheck($("#LAW_TYPE").val(),"法规类型",4)){
     return false;
   }
	
	var postData = $("#form1").serialize();  
	
		                         
   $.ajax({
		url: webroot+'/manage/lawAC!updateLaw.action',
		type: 'POST',
		data:postData,
		dataType: 'json',
	    error: function(){
	    	document.getElementById("btn1").disabled = false;
			alert("更新失败");
		},
		success: function(data){
			if(data.dateInfo=="1"){
			    alert("用户已经存在了！")
			}else{	
			 alert("更新成功！")
			 parent.refreshGrid();
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
	    <input type="hidden"  id="LAW_ID" name="law.LAW_ID"/>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;法规代码：</td><td><input  type="text" id= "LAW_CODE" name="law.LAW_CODE" size="50%" maxlength="10" readonly/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;法规名称：</td><td><input  type="text" id= "LAW_NAME" name="law.LAW_NAME" size="50%"/></td></tr>
	  	<tr><td></td><td>&nbsp;&nbsp;&nbsp;&nbsp;颁布事件：</td><td><input  type="text" id= "ADMINISTRATION" name="law.ADMINISTRATION" size="50%"/></td></tr>
	  	<tr><td></td><td>&nbsp;&nbsp;&nbsp;&nbsp;法规内容：</td><td><input  type="text" id= "IRREGULARITYACTION" name="law.IRREGULARITYACTION" size="50%"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;法规类型：</td><td><input  type="text" id= "LAW_TYPE" name="law.LAW_TYPE" size="50%"/></td></tr>
	  	<tr><td></td><td></td>
	  		<td align="center"><input type="button" id="btn1"  value="修 正"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		<input type="button" id="btn2"  value="取 消"/></td>
	  	</tr>
  	</table>
  	
	</form>  
  </body>
</html>
