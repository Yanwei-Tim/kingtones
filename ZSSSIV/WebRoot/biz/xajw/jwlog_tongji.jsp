<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>使用用户日志统计</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
  <script type="text/javascript" src="<%=path%>/config.js"></script>
   <script type="text/javascript" src="<%=path%>/check.js"></script>
   	<script type="text/javascript" src="<%=path%>/platform/js/ssi_calender.js"></script>
   	<script type="text/javascript" src="<%=path%>/common.js"></script>
   		<script type="text/javascript" src="<%=path%>/datetime.js"></script> 
<script type="text/javascript">
var parent=this.dialogArguments;
 $(document).ready(function(){
 	getJwjzCodeList("jz","jz","jwUser.jz","100");
 	
    $("#btn1").click(function(){
    	
    	
    	postdata(); 
    	                                             
    });
    $("#btn3").click(function(){
	    if(!isNull($("#biz_id").val(),"业务模块")) {
			document.getElementById("btn1").disabled = false;
			return;
		}  
		if(!isNull($("#op_time1").val(),"起始时间")) {
			document.getElementById("btn1").disabled = false;
			return;
		}  
		if(!isNull($("#op_time").val(),"截至时间")) {
			document.getElementById("btn1").disabled = false;
			return;
		} 
		
		if(!dateCheck($("#op_time1").val(),$("#op_time").val()))
				return;
    var postData = $("#form1").serialize();  
	 window.location=webroot+'/xajw/jwLogAC!excelDoOut1.action?'+postData
    });       
    $("#btn2").click(function(){
		window.close();
    });  
     $("#biz_name").click(function(){
    	url=webroot+"/biz/xajw/selectbiz_boxtree.jsp?type=f";
        window.showModalDialog(url,window,'status:false;dialogWidth:200px;dialogHeight:500px;dialogLeft:300px;dialogTop:230px;center:yes');
    }); 
 }); 
 
function postdata(){ 
	if(!isNull($("#biz_id").val(),"业务模块")) {
		document.getElementById("btn1").disabled = false;
		return;
	}  
	if(!isNull($("#op_time1").val(),"起始时间")) {
		document.getElementById("btn1").disabled = false;
		return;
	}  
	if(!isNull($("#op_time").val(),"截至时间")) {
		document.getElementById("btn1").disabled = false;
		return;
	} 
	
	if(!dateCheck($("#op_time1").val(),$("#op_time").val()))
			return;
	
	var user_id=$("#user_id").val()
	var biz_id=$("#biz_id").val()
	var op_time1=$("#op_time1").val()
	var op_time2=$("#op_time").val()
	
	if(user_id==""){
	url=webroot+"/biz/xajw/jwlogtongji_mgr_list.jsp?biz_id="+biz_id+"&op_time1="+op_time1+"&op_time2="+op_time2;
    window.showModalDialog(url,window,'status:false;dialogWidth:800px;dialogHeight:600px;dialogLeft:300px;dialogTop:230px;center:yes');	                         
 }else{
  url=webroot+"/biz/xajw/jwlogtongjiuser_mgr_list.jsp?biz_id="+biz_id+"&op_time1="+op_time1+"&op_time2="+op_time2+"&user_id="+user_id;
    window.showModalDialog(url,window,'status:false;dialogWidth:800px;dialogHeight:600px;dialogLeft:300px;dialogTop:230px;center:yes');
 }

 }	
  function setColumns(Columns,type){
	if(type=="f")$("#biz_id").val(Columns);
  }   
  
  function setBizID(bizId){
	$("#biz_id").val(bizId);
  }
  function setBizName(bizName){
	$("#biz_name").val(bizName);
  }
</script>
 
    
  </head>
  <body>
  	<form id="form1">
  	<input  type="hidden" id= "biz_id" name="jwLog.biz_id" size="50%"/>
  	<br>
  	<table>
	  	<colgroup>
	  		<col width="10%" align="right" />
	  		<col width="30%" align="right" />
			<col width="50%" align="left" />
			<col width="10%" align="right" />
	  	</colgroup>
	  
	
	  	<tr><td></td><td>用户账号:</td><td><input  type="text" id= "user_id" name="jwLog.User_id" size="50%"/></td></tr>
	  	
	  	<tr><td></td><td>业务模块:</td><td><input  type="text" id= "biz_name" name="jwLog.biz_name" size="50%" readonly/></td></tr>
	  	<tr><td></td><td>起始时间:</td><td><input  type="text" id= "op_time1" name="jwLog.op_time1" onClick="SelectDate(this,'yyyy-MM-dd',0,0)"  size="20%" readonly/></td></tr>
	  	<tr><td></td><td>截至时间:</td><td><input  type="text" id= "op_time" name="jwLog.op_time2" onClick="SelectDate(this,'yyyy-MM-dd',0,0)"  size="20%" readonly/></td></tr>
	  	
  		
	  	<tr><td></td><td></td>
	  		<td ><input type="button" id="btn1"  value="查 看"/>&nbsp;&nbsp;&nbsp;<input type="button" id="btn3"  value="导 出"/>&nbsp;&nbsp;
	  		<input type="button" id="btn2"  value="取 消"/></td>
	  	</tr>
  	</table>
	</form>  
  </body>
</html>
