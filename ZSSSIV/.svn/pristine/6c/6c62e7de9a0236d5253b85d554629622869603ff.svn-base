<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>应用更新</title>
    
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
  <script type="text/javascript" src="<%=path%>/config.js"></script>
   <script type="text/javascript" src="<%=path%>/check.js"></script>
   	<script type="text/javascript" src="<%=path%>/platform/js/ssi_calender.js"></script>


<script type="text/javascript">

 
 
 function validate_required(field,alerttxt)
{
with (field)
  {
  if (value==null||value=="")
    {alert(alerttxt);return false}
  else {return true}
  }
}

function validate_form(thisform)
{


with (thisform)
  {
  if (validate_required(test,"文件不为空!")==false)
    {test.focus();return false}
    else{
  
    
    
     return true;
    
     
    }
   
   
  }
}  

 

     
</script>
    
  </head>
  <body>
  	<form id="form1" action="<%=path%>/commonbiz/updateAC!addJwUpdate.action" onsubmit="return validate_form(this)" method="post" enctype="multipart/form-data">
  	<br>
  	<table>
	  	<colgroup>
	  		<col width="10%" align="right" />
	  		<col width="30%" align="right" />
			<col width="50%" align="left" />
			<col width="10%" align="right" />
	  	</colgroup>
	  <input type="hidden"  id="state" name="jwUpdate.state" size="50%"/>
	  	
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;选择文件：</td><td><input type="file"   id="test" name="test" size="40%" onchange="getFileSize(this);"></td></tr>
	  
	  	
	

  		
	  	<tr><td></td><td></td>
	  		<td align="center"><input  type="submit" id="btn1"  value="确 定"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		<input type="button" id="btn2"  value="取 消" onclick="window.close()"/></td>
	  	</tr>
  	</table>
	</form> 

  </body>
  	<script type="text/javascript">
	function getFileSize(obj) {
	obj.select();  
	var path   = document.selection.createRange().text; 
	$.ajax({
			url: webroot+'/commonbiz/updateAC!checkFileSiez.action',
			type: 'POST',
			data:'path='+path,
			dataType: 'json',
		    error: function(){
				alert("文件出错！");
			},
			success: function(data){
				  if(data.flag=='1'){
				 	 alert("文件大小不能超过10M！");
				 	 document.selection.clear();
				  return false;
				}
			    }
		    }
		);              
	 }
</script>
</html>
