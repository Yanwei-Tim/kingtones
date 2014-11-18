<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="content-type" content="text/html;charset=utf-8" />
		<title>异常页面</title>
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
		<script>
			var isShow = 0;
			function showdetail(){
				if(isShow ==0){
					isShow = 1
					document.getElementById("seedetail").innerText = '隐藏详细错误信息';
					document.getElementById("detail").style.visibility = 'visible';
				}else{
					isShow = 0
					document.getElementById("seedetail").innerText = '查看详细错误信息';
					document.getElementById("detail").style.visibility = 'hidden';
				}
			}
		</script>
	</head>
	<body>
		<div id="main">
			<div class=abstract>
				<div class="warn-text" align="middle"><s:property value="exception.message" /> </div>
				<button id="seedetail" onclick="showdetail()" >查看详细错误信息</button>
				<button id="goback" onclick="history.go(-1);" >返回上一页</button>
			</div>
			<div id="detail" class="detail">
			<pre>
	<!-- 错误信息开始 -->
	<s:property value="exceptionStack" />
	<!-- 错误信息结束 -->
			</pre>
			</div>
		</div>
	</body>
</html>