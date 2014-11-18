<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<% String count4=(String)session.getAttribute("count4");
    
   String count5= (String)session.getAttribute("count5");
   
				          %>
	<head>
		<meta http-equiv="content-type" content="text/html;charset=utf-8" />
		<title>成功页面</title>
		<style type="text/css">
		<!-- 
			#main {
				 width: 100%; 
				 text-align: center;
			 }
			#main .abstract{
				width: 90%;
				height: 120px;
				background-color: #6699CC;
				text-align:left;
				border:2px;
			}
			#main .warn-img {
				padding:20px 60px;float:left
			}
			#main .warn-text {
				position:relative;
				left:130px;
				top:50px;
				color:#FFF;
				font-weight:bold;
				font-size:22px
			} 
			#main .detail{
				width: 90%;
				height: 700px;
				background-color: #E4E4E4;
				text-align: left;
				word-break:break-all;
				visibility:hidden;
				overflow-x:auto;
				overflow-y:auto;
				scrollbar-face-color:#F1F1F1
			}
			pre{
				padding-top:20px
			}
			#seedetail{
				position:relative;
				float:right;
				right:200px;
				top:50px;
				cursor:hand;
				font-size:12px;
				border-width:2px;
				border-color:#666666;
				background-color:#F1F1F1;
				border-style:solid;
				padding:5px 5px 5px 5px;
				border-right-color:black;
				border-left-color:#6699CC
			}
			#goback{
				position:relative;
				float:right;
				right:-80px;
				top:50px;
				cursor:hand;
				font-size:12px;
				border-width:2px;
				border-color:#666666;
				background-color:#F1F1F1;
				border-style:solid;
				padding:5px 5px 5px 5px;
				border-right-color:black;
				border-left-color:#6699CC
			}
		-->
		</style>
	
	</head>
	<body>
	     增加成功！
	       
	       
	      
				      
				<button  onClick="window.opener.refreshGrid(); 
window.open(' ', '_self', ' ');window.close()">关闭</button>
			
	</body>
</html>