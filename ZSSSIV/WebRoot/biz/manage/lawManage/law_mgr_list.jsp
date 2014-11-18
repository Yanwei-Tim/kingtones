<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
  <head>
    <title>新法律法规</title>
    <meta http-equiv="x-ua-compatible" content="ie=8" />
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" type="text/css" href="<%=path%>/flexgrid/css/flexigrid/flexigrid.css"/>
	<script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
	<script type="text/javascript" src="<%=path%>/flexgrid/flexigrid.js"></script>
	<link rel="stylesheet" href="<%=path%>/ztree/demo/demoStyle/demo.css" type="text/css"/>
  	<link rel="stylesheet" href="<%=path%>/ztree/demo/zTreeStyle/zTreeStyle.css" type="text/css"/>
  	
  	<script type="text/javascript" src="<%=path%>/ztree/demo/jquery-ztree-2.5.js"></script>
  	<script type="text/javascript" src="<%=path%>/config.js"></script>
  	
	
	<style>
		body
			{
			font-family: Arial, Helvetica, sans-serif;
			font-size: 12px;
			}
		.flexigrid div.fbutton .add
			{
				background: url(<%=path%>/flexgrid/css/images/add.png) no-repeat center left;
			}	
		.flexigrid div.fbutton .delete
			{
				background: url(<%=path%>/flexgrid/css/images/close.png) no-repeat center left;
			}	
		#adiv{
			border-bottom:1px solid #E6E6E6;
			color:#999999;
			height:485px;
			width:900px;
			overflow:auto;
		}
	</style>
	
  </head>
  
  <body>
  	<table width="100%"> 		
  		<tr>
  			<td width="15%">
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr height="20px">
			  			<td class="rtitletdM" valign="bottom" align="left">
			  			<span style="color:#000000; font-weight:bolder;">管理功能&gt;&gt;新法律法规</span>
			  			</td>
			  		</tr>
			  		
					<tr height="22px">
						<td class="rtitletdM" valign="bottom" align="left">
							<span style="color: #000000;font-weight: bolder;">法律法规目录</span>
						</td>
					</tr>
				</table>

  				<table cellpadding="1" cellspacing="1" border="1px" width="100%">
  					<tr>
  						<td>
  							<ul id="treeDemo" class="tree"></ul>
  						</td>
  					</tr>
  				</table>
  				
			</td>
										
  			<td valign="top">
  				<table cellpadding="0" cellspacing="0" width="900px">
					<tr height="23px">
						<td class="rtitletdM"  align="left">
							<span style="color: #000000; font-weight: bolder;">法律法规内容</span>
						</td>
					</tr>
<tr>
	<td class="rtitletdM"  align="left">
	<input onclick="fadd1()" type="button" value="增加目录"/><input onclick="fedit1()" type="button" value="修改目录"/><input onclick="fdele1()" type="button" value="删除目录"/>
	<input onclick="fadd2()" type="button" value="增加内容"/><input onclick="fedit2()" type="button" value="修改内容"/><input onclick="fdele2()" type="button" value="删除内容"/>						
	</td>
</tr>
				</table>
				<table cellpadding="10" cellspacing="2" width="900px">
					
					<tr>
						<td style="color:tomato;font-size:14px;text-align:right;"><span id="timediv"></span></td>
					</tr>
					<tr>
						<td><div id="adiv" style="color:steelblue;font-size:16px"><span id="contentspan"></span></div></td>
					</tr>
				</table>
  			</td>
  		</tr>
  	</table>
<script type="text/javascript" src="<%=path%>/biz/manage/lawManage/law_mgr_list.js"></script>
<script type="text/javascript">
	function fadd1(){
		url=webroot+"/biz/manage/lawManage/law_Directory_add.jsp?pid="+getSelectNodeId();
        window.open(url,'opendialog');
	}
	function fedit1(){
		if(getSelectNodeId()!=null){			
			url=webroot+"/biz/manage/lawManage/law_Directory_edit.jsp?pid="+getSelectNodeId();
	        window.open(url,'opendialog');
		}else{
			alert("请点击选择目录！");
		}		
	}
	function fadd2(){
		if(getSelectNodeId()!=null){
			$.ajax({
				url: webroot+'/manage/lawDirectoryAC!getLawContentCount.action',
				data:'someid='+getSelectNodeId(),	
				type: 'POST',
				dataType: 'json',
			    error: function(){
					alert("加载数据失败");
				},
				success: function(data){
					if(data.id>0){
						alert("该目录下已有内容,无法再添加！");
					}else{
						url=webroot+"/biz/manage/lawManage/law_Content_add.jsp?pid="+getSelectNodeId();
				        window.open(url,'opendialog');
					}
			    }
			});						
		}else{
			alert("请点击选择要添加内容的目录！");
		}		
	}
	function fedit2(){
		if(getSelectNodeId()!=null){	
			$.ajax({
				url: webroot+'/manage/lawDirectoryAC!getLawContentCount.action',
				data:'someid='+getSelectNodeId(),	
				type: 'POST',
				dataType: 'json',
			    error: function(){
					alert("加载数据失败！");
				},
				success: function(data){
					if(data.id>0){
						url=webroot+"/biz/manage/lawManage/law_Content_edit.jsp?pid="+getSelectNodeId();
				        window.open(url,'opendialog');
					}else{
						alert("该目录没有内容，请重新选择修改！");
					}
			    }
			});	
		}else{
			alert("请点击选择目录！");
		}		
	}
	function fdele2(){		
		if(getSelectNodeId()!=null){	
			if(confirm('你确定要删除该内容？')){ 
				$.ajax({
					url: webroot+'/manage/lawDirectoryAC!deleteLawContent.action',
					type: 'POST',
					data:'someid='+getSelectNodeId(),
					dataType: 'json',
				    error: function(){
				    	document.getElementById("btn1").disabled = false;
						alert("删除失败");
					},
					success: function(data){	
						if(data.id==1){
							alert("该目录没有内容，请重新选择删除！");
				   		}else if(data.id==2){
					    	 alert("删除成功！")
							 zTreeOnClick();																
						     window.close();	
				     	}					     	   						 							    			
				    }
				});
			} 							
		}else{
			alert("请点击选择目录！");
		}		
	}
	function fdele1(){
		if(getSelectNodeId()!=null){	
			if(confirm('你确定要删除该目录？')){
				$.ajax({
					url: webroot+'/manage/lawDirectoryAC!deleteDirectory.action',
					data:'someid='+getSelectNodeId(),	
					type: 'POST',
					dataType: 'json',
				    error: function(){
						alert("加载数据失败！");
					},
					success: function(data){

					 if(data.id==1){
					    alert("该目录下还有子目录,请先删除子目录！");
				     }else if(data.id==2){
				     	alert("该目录还有内容,请先删除内容！");
				     }else if(data.id==3){
				    	 alert("删除成功！")
						 refreshTree();																
					     window.close();	
				     }
				    }
				});	 
			}					
		}else{
			alert("请点击选择目录！");
		}		
	}
</script>
  </body>
</html>
