<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>通讯录编辑</title>
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
	    	url: webroot+'/manage/addressAC!findAddressByAddID.action',
	    	data:'addID='+parent.selectItemId,
		    dataType: 'json',
		    type: 'POST',
		    error: function(){
		       alert('Error loading XML document');
		    },
		    success: function(data){
		    	$("#ADDID").val(data.address.ADDID);
		    	$("#NAME").val( data.address.NAME);	
		    	
		    	$("#DEPTID").val(data.address.DEPTID);
		    	$("#MOBILE").val(data.address.MOBILE);
		    	$("#UNITTEL").val(data.address.UNITTEL);
		    	$("#HOMETEL").val(data.address.HOMETEL);
		    	$("#REMARK").val(data.address.REMARK);
		    	$("#DUTY").val(data.address.DUTY);
		    	$("#SORT").val(data.address.SORT);
		    	$("#MOBILE2").val(data.address.MOBILE2);
		    	$("#UNITTEL2").val(data.address.UNITTEL2);
		    	$("#DEPTNAMES").val(data.address.DEPTNAMES);
		    	$("#EMAIL").val(data.address.EMAIL);
		    	
		    	
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
 
  
function openDeptTree(url){
	window.showModalDialog(url,window,'status:false;dialogWidth:200px;dialogHeight:450px;dialogLeft:300px;dialogTop:230px;center:yes');
}
 
function setUnitName(unitName){
	$("#DEPTNAMES").val(unitName);
}

function setUnitXzqh(unitID){
	$("#DEPTID").val(unitID);
}
 
function postdata(){ 

	
 if(!isNull($("#NAME").val(),"人员姓名")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
   if(!lengthCheck($("#NAME").val(),"人员姓名",10)){
     return false;
   }
	
	if(!isNull($("#DEPTID").val(),"单位编号")) {
		document.getElementById("btn1").disabled = false;
		return;
	} 
	
	 if(isNaN($("#DEPTID").val())){
      alert("单位编号不是数字，请输入正确的单位编号！");
     return false;
   } 
	if(!isNull($("#MOBILE").val(),"手机号码")) {
		document.getElementById("btn1").disabled = false;
		return;
	} 
	 if(!mobile.test($("#MOBILE").val())){
      alert("请输入正确的手机号码！");
     return false;
   }  
   
   
    if(!lengthCheck($("#MOBILE").val(),"手机号码",11)){
     return false;
   }
 
   if(!isNull($("#UNITTEL").val(),"单位电话")) {
		document.getElementById("btn1").disabled = false;
		return;
	} 
	 if(!tel.test($("#UNITTEL").val())){
      alert("请输入正确的单位电话！如：010-xxxxxxxx");
     return false;
   }  
   
   if(!isNull($("#HOMETEL").val(),"家庭电话")) {
		document.getElementById("btn1").disabled = false;
		return;
	} 
	 if(!tel.test($("#HOMETEL").val())){
      alert("请输入正确的家庭电话！如：010-xxxxxxxx");
     return false;
   }
   
    if(!isNull($("#SORT").val(),"排序号")) {
			document.getElementById("btn1").disabled = false;
			return;
		} 
	 if(isNaN($("#SORT").val())){
      alert("排序号不是数字，请输入正确的排序号！");
     return false;
	   } 
	    
	   if($("#MOBILE2").val()!=''){
	   		 if(!mobile.test($("#MOBILE2").val())){
			      alert("请输入正确的手机号码2！");
			     return false;
			   }  
	   }
   
   if($("#UNITTEL2").val()!=''){
   		if(!tel.test($("#UNITTEL2").val())){
		      alert("请输入正确的单位电话2！如：010-xxxxxxxx");
		     return false;
		   }  
   }
    if($("#EMAIL").val()!=''){
    	if(!mail.test($("#EMAIL").val())){
    		 alert("请输入正确的邮箱地址！");
		     return false;
    	}
    }
	
	 // Add by 陈萧如 bug对应
	//if(document.getElementById("REMARK").value==''){
    //		 alert("请输入备注！");
	//	     return false;
    //}
	if(!lengthCheck($("#REMARK").val(),"备注",100)){
		return false;
	}
	
	var postData = $("#form1").serialize();  
	
		                         
   $.ajax({
		url: webroot+'/manage/addressAC!updateAddress.action',
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
	    <input type="hidden"  id="ADDID" name="address.ADDID"/>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;人员姓名：</td><td><input  type="text" id= "NAME" name="address.NAME" size="50%" maxlength="10"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;单位名称：</td><td><input  type="text" id= "DEPTNAMES" name="address.DEPTNAMES" size="50%" onclick="openDeptTree('<%=path%>/platform/org/unit_tree_xzqh.jsp')" readonly /></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;单位编号：</td><td><input  type="text" id= "DEPTID" name="address.DEPTID" size="50%" readonly/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;手机号码：</td><td><input  type="text" id= "MOBILE" name="address.MOBILE" size="50%" /></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;单位电话：</td><td><input  type="text" id= "UNITTEL" name="address.UNITTEL" size="50%"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;家庭电话：</td><td><input  type="text" id= "HOMETEL" name="address.HOMETEL" size="50%"/></td></tr>
	  	<tr><td></td><td>&nbsp;&nbsp;&nbsp;&nbsp;职    务：</td><td><input  type="text" id= "DUTY" name="address.DUTY" size="50%"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;排 序 号：</td><td><input  type="text" id= "SORT" name="address.SORT" size="50%"/></td></tr>
	  	<tr><td></td><td>&nbsp;&nbsp;&nbsp;&nbsp;手机号码2：</td><td><input  type="text" id= "MOBILE2" name="address.MOBILE2" size="50%"/></td></tr>
	  	<tr><td></td><td>&nbsp;&nbsp;&nbsp;&nbsp;单位电话2：</td><td><input  type="text" id= "UNITTEL2" name="address.UNITTEL2" size="50%"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;邮    件：</td><td><input  type="text" id= "EMAIL" name="address.EMAIL" size="50%"/></td></tr>
	  	<tr><td></td><td>&nbsp;&nbsp;&nbsp;&nbsp;备    注：</td><td><textarea id= "REMARK" name="address.REMARK" rows= "3"> </textarea></td></tr>
	  	<tr><td></td><td></td>
	  		<td align="center"><input type="button" id="btn1"  value="修 正"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		<input type="button" id="btn2"  value="取 消"/></td>
	  	</tr>
  	</table>
  	
	</form>  
  </body>
</html>
