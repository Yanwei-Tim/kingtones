<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="com.kingtone.ssi.util.SSISecurityUtil;"%>
<%@ taglib uri="http://acegisecurity.org/authz" prefix="authz"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head id="Head1">
		<title>Top头部份</title>
		<link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
		<script language="javascript" type="text/javascript" src="<%=path%>/platform/images/js/left.js" />
		<script language="javascript" type="text/javascript">
    </script>

		<script language="javascript" type="text/javascript"> 
var __sto = setTimeout;    
window.setTimeout = function(callback,timeout,param)    
{    
    var args = Array.prototype.slice.call(arguments,2);    
    var _cb = function()    
    { 
       try
       {
           callback.apply(null,args);
       }
       catch(ee)
       {
       
       }   
    }    
   
    __sto(_cb,timeout);    
}
 
 
//设置cookie   
function setCookie(value, seconds) {   
 seconds = seconds || 0;   //seconds有值就直接赋值，没有为0，这个根php不一样。   
 var expires = "";   
 if (seconds != 0 ) {      //设置cookie生存时间   
 var date = new Date();   
 date.setTime(date.getTime()+(seconds*1000));   
 expires = "; expires="+date.toGMTString();   
 }  
 document.cookie = "Police_UserID="+escape(value)+expires+"; path=/";   //转码并赋值   
} 
 
 
function SetSessionID(UserID)
{
alert("123123");
   setCookie(UserID, 120);//有较时间2分钟
   window.setTimeout(SetSessionID,6000,UserID);
}
 
function GetCookieStr()
{   var pStr="Police_UserID";
    var strcookie=document.cookie;
    //将多cookie切割为多个名/值对
    var arrcookie=strcookie.split("; ");
    var str;
    for(var i=0;i<arrcookie.length;i++){
         str=arrcookie[i].split("=");
        if(str[0]==pStr)
        {
           alert( str[1]);
        }
    }
}
</script>

	</head>
	<body onload="SetSessionID('admin')">
		<form name="form1" method="post" action="tt.jsp" id="form1">
			<div>
				<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE"
					value="/wEPDwULLTE5MDc3MDQyNTcPZBYCAgEPZBYCAgEPDxYCHgRUZXh0BQ/ns7vnu5/nrqHnkIblkZhkZGSMWeCM5JTFHur6O9kj5xnUSMqcZA==" />
			</div>

			<table width="100%" height="102" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td class="topbj_bgimage">
						<table height="100" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td colspan="3" class="topbk_bgimage" width="1024px" height="69"></td>
							</tr>
							<tr>
								<td class="top2_bgimage" style="width: 217px">
									<table width="217px" height="31" border="0" cellpadding="0"
										cellspacing="0">
										<tr>
											<td height="3" colspan="2"></td>
										</tr>
										<tr>
											<td width="30">
												<div align="center">
													<img src="<%=path%>/platform/images/top/bar_00.gif" width="16" height="16"/>
												</div>
											</td>
											<td>
												『当前用户：
												<b> <span id="lblSignIn"><%=
												SSISecurityUtil.getUsername()
												%>=<authz:authentication operation="username"/>  
												</span> </b>』
											</td>
										</tr>
									</table>
								</td>
								<td width="732px" class="top3_bgimage">
									<table width="100%" height="31" border="0" cellpadding="0"
										cellspacing="0">
										<tr>
											<td>
												<table width=100% height="31" border="0" cellpadding="0"
													cellspacing="0">
													<tr>
														<td rowspan="2" class="top3_bgimage" width="100%"
															height="31">
															版本：1.6.2
														</td>
														<td height="8">
															<FONT face="宋体"></FONT>
														</td>
													</tr>
													<tr>
														<td width="39">

														</td>
													</tr>
												</table>
											</td>
											<td>
												<table height="31" border="0" cellpadding="0"
													cellspacing="0">
													<tr>
														<td rowspan="2" class="top4_bgimage" width="39"
															height="31"></td>
														<td height="8"></td>
													</tr>
													<tr>
														<td>
															<a href="javascript:history.go(-1)" target="main">后退</a>
														</td>
													</tr>
												</table>
											</td>
											<td>
												<table height="31" border="0" cellpadding="0"
													cellspacing="0">
													<tr>
														<td rowspan="2" class="top4_bgimage" width="39"
															height="31"></td>
														<td height="8"></td>
													</tr>
													<tr>
														<td>
															<a href="javascript:history.go(+1)" target="main">前进</a>
														</td>
													</tr>
												</table>
											</td>
											<td>
												<table height="31" border="0" cellpadding="0"
													cellspacing="0">
													<tr>
														<td rowspan="2" class="top4_bgimage" width="39"
															height="31"></td>
														<td height="8"></td>
													</tr>
													<tr>
														<td>
															<a href="#"
																onclick="if (!window.confirm('您确认要切换用户吗？')){return false;}else{parent.window.location.href='dd.jsp?logout=1';}">切换用户</a>
														</td>
													</tr>
												</table>
											</td>
											<td>
												<table height="31" border="0" cellpadding="0"
													cellspacing="0">
													<tr>
														<td rowspan="2" class="top4_bgimage" width="39"
															height="31"></td>
														<td height="8"></td>
													</tr>
													<tr>
														<td>
<!--															<a href="#" target="_top" onClick="if (!window.confirm('您确认要退出当前系统吗？')){return false;}else{window.parent.close();}">退出</a>-->
															<a href="#"
																onclick="if (!window.confirm('您确认要退出当前系统吗？')){return false;}else{parent.window.location.href='<%=path%>/j_acegi_logout';}">退出</a>
														</td>
													</tr>
												</table>
											</td>
											<td>
												<table height="31" border="0" cellpadding="0"
													cellspacing="0">
													<tr>
														<td width="39" rowspan="2" class="top4_bgimage"
															height="31"></td>
														<td height="8"></td>
													</tr>
													<tr>
														<td>
															<img src="<%=path%>/platform/images/top/bar_07.gif" width="16" height="16"
																onclick="if(parent.topset.rows!='27,*'){parent.topset.rows='27,*';window.scroll(0,102);this.src='<%=path%>/platform/images/top/bar_011.gif';}else{parent.topset.rows='102,*';;this.src='images/top/bar_07.gif';};"
																style="CURSOR: hand" title="点击隐藏顶部" alt="点击这里可以隐藏/显示顶部" />


														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
								<td width="75" class="top5_bgimage" height="31"></td>
							</tr>
						</table>
					</td>

				</tr>

			</table>
		</form>
	</body>
</html>



