<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String type =(String) request.getAttribute("type");
	if( request.getAttribute("msg1")!=null){
		out.print("<script> var msg1='"+request.getAttribute("msg1")+"';</script>");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 
<html xmlns="http://www.w3.org/1999/xhtml" >
<head><title>
	中山市公安局移动警务通WAP综合查询管理平台
</title>
        <style type="text/css"> 
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.style1 {font-size: 12px}
-->
</style>
<script language="JavaScript" type="text/JavaScript">

//解决火狐浏览器回车登陆
document.onkeydown=keyListener;      
function keyListener(e){ 
	try{
		if(e.keyCode){
			 if(e.keyCode == 13){      
		        document.getElementById("imgLoad").click();
		        return false;     
		    }  
		}
	}catch(e){
	
	}   
} 

var type = <%=type%> ;
var msg1;
if(type==0){
	alert("用户或密码错误!");
} 
if(type==-1){
	alert(""+msg1+"");
} 
<!--
function picover(pid,imgName)
{
    var sub = document.getElementById(pid);
    sub.src = "images/"+imgName;
}
 
function picout(pid,imgName)
{
    var sub = document.getElementById(pid);
    sub.src = "images/"+imgName;
}
function loadDefault()
{
    var e=event.srcElement;
    if(event.keyCode==13)
    {
        document.getElementById("imgLoad").click();
        return false;
    }
}
function CheckForm()
{
  if(document.getElementById("j_username").value=="")
  {
    alert("用户名不能为空！");
    document.getElementById("j_password").focus();
    return (false);
  }
  else if(document.getElementById("j_password").value=="")
  {
    alert("用户密码不能为空！");
    document.getElementById("j_password").focus();
    return (false);
  }
  document.form1.submit();
}
function setfocus()
{
    document.getElementById("j_username").focus();
}
 
function reset_1()
{
   document.getElementById("j_password").value="";
   document.getElementById("j_username").value="";
}
//-->
</script>
</head>
<body leftmargin="0" scroll="no" topmargin="0" onload="setfocus();"; onkeyup="return loadDefault();" style="overflow:hidden;">
<form name="form1" method="post" action="<%=path%>/platform/j_acegi_security_check" id="form1">
<div>

</div>

<table width="1024" border="0" align="center" cellpadding="0" cellspacing="0">
 <tr>
    <td><img src="<%=path%>/platform/images/login/logon2_01.png" width="100%" height="28"></td>
  </tr>
  <tr>
    <td><img src="<%=path%>/platform/images/login/logon2_02.png" width="100%" height="44"></td>
  </tr>
  <tr>
    <td><img src="<%=path%>/platform/images/login/logon2_03.png" width="100%" height="38"></td>
  </tr>
  <tr>
    <td><img src="<%=path%>/platform/images/login/logon2_04.png" width="100%" height="52"></td>
  </tr>
  <tr>
    <td><img src="<%=path%>/platform/images/login/logon2_05.png" width="100%" height="99"></td>
  </tr>
  <tr>
    <td><img src="<%=path%>/platform/images/login/logon2_06.png" width="100%" height="51"></td>
  </tr>
  
  <tr>
    <td height="40" width="100%" background="<%=path%>/platform/images/login/logon2_07.png">
        <div style="text-align:center"> <input name="j_username" type="text" value="admin" id="j_username" size="18" style="width:120px" /></div>
                </td>
  </tr>
 
  <tr>
    <td><img src="<%=path%>/platform/images/login/logon2_08.png" width="100%" height="16"></td>
  </tr>
 
  
  <tr>
    <td height="35" width="100%" background="<%=path%>/platform/images/login/logon2_09.png">
   <div style="text-align:center"><input name="j_password" type="password" id="j_password" value="1" size="18" style="width:120px" /></div> </td>
  </tr>
  <tr>
    <td><img src="<%=path%>/platform/images/login/logon2_10.png" width="100%" height="22"></td>
  </tr>
  <tr>
    <td height="61" width="100%" background="<%=path%>/platform/images/login/logon2_11.png">
   <div style="text-align:center">
   <img  onmouseout="this.src='<%=path%>/platform/images/login/button1.png'" onmouseover="this.src='<%=path%>/platform/images/login/button2.png'" src="<%=path%>/platform/images/login/button1.png" id="imgLoad" name="imgLoad" onclick="return CheckForm();" height="50" border="0"/>
   <img  onmouseout="this.src='<%=path%>/platform/images/login/button3.png'" onmouseover="this.src='<%=path%>/platform/images/login/button4.png'" src="<%=path%>/platform/images/login/button3.png" name="imgReset" onclick="return reset_1();" height="50" border="0"/>
   </div> </td>
  </tr>
  <tr>
    <td><img src="<%=path%>/platform/images/login/logon2_12.png" width="100%" height="37"></td>
  </tr>
  <tr>
    <td><img src="<%=path%>/platform/images/login/logon2_13.png" width="100%" height="60"></td>
  </tr>
  <tr>
    <td><img src="<%=path%>/platform/images/login/logon2_14.png" width="100%" height="40"></td>
  </tr>
  <tr>
    <td><img src="<%=path%>/platform/images/login/logon2_15.png" width="100%" height="40"></td>
  </tr>
  <tr>
    <td><img src="<%=path%>/platform/images/login/logon2_16.png" width="100%" height="37"></td>
  </tr>
  
</table>
 
<div>
 
	

</div></form>
</body>
</html>
 

