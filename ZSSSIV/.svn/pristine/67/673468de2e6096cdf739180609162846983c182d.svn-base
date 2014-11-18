<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();



%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>图片上传页面</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
  <script type="text/javascript" src="<%=path%>/config.js"></script>
   <script type="text/javascript" src="<%=path%>/check.js"></script>
<script type="text/javascript">
var parent=this.dialogArguments;
 $(document).ready(function(){
  	$.ajax({
		url: webroot+'/biz/serviceAC!queryImageInfoAllList.action',
		type: 'POST',
		dataType: 'json',
	    error: function(){
			alert("加载数据失败");
		},
		success: function(data){
			//alert("1");
			//alert(data.imgfilelist);
			$.each(data.rows, function (i, n) {
			//alert(i);alert(n);
			$("#img_show_table").append('<tr><td></td><td><input type="radio" name="rad" value="'+n.img_name+'" />'+n.img_des+'</td><td><img alt="" src="/ZSSSIV/'+n.img_path+'" id="img_show" width="100"></td></tr>');
			});	
			    var maxwidth=100;  
   				 $("img").each(function(){        
      			  if (this.width>maxwidth)   
        			 this.width = maxwidth;   
   				 }); 				
	    }
	});
    $("#btn1").click(function(){
		document.getElementById("btn1").disabled =true;
    	postdata();                                              
    });      
    $("#btn2").click(function(){
		window.close();
    });  
    var maxwidth=100;  
    $("img").each(function(){        
        if (this.width>maxwidth)   
         this.width = maxwidth;   
    }); 
    $("#btgender").click(function () {
           //alert($("input[name=rad]:checked"));
           var img=$("input[name=rad]:checked").val();
           var imgname=img.substring(0,img.lastIndexOf("."));
           var imgpath="/uploadfile/image/"+img;
           //alert(img+"="+imgname);
           callBack.setColumns(imgname,"i",imgpath);window.close();
    });
	$("input[type='radio']").click(function(){     
		alert("2");                                     
  		// $(this).next().text()
       }); 
	//alert($("input[name=rad]:checked").val());
 }); 
 </script>
   <style>  
.tScroll {overflow: scroll; overflow-x:hidden; height:370px; cursor: default; }  
</style>  
  </head>
  <body> 		
	<input type="button" id="btgender" value="选中所选图片"/>
	<div class="tScroll">  	
	<table cellspacing="0" width="50%" align="center" id="img_show_table"> 
	</table>
  	</div>
  </body>
</html>
<script type="text/javascript">
    var callBack = null;  
    // IE浏览器 （画面自提交后，window.dialogArguments不会丢失，同时window.opener属性不存在）  
    if ($.browser.msie){  
        callBack = window.dialogArguments;  
    }  
    else  
    {  
        // Firefox浏览器（画面自提交后，window.dialogArguments会丢失，同时window.opener属性存在），  
        if (window.opener.callBack == undefined) {  
            window.opener.callBack = window.dialogArguments;  
        }  
        callBack = window.opener.callBack;  
    }  
</script>
<%
if(request.getAttribute("result")!=null){
	if(request.getAttribute("result").equals("1"))
	out.print("<script> alert('"+request.getAttribute("import_result_info")+"');callBack.setColumns('"+request.getAttribute("tpmc")+"','"+request.getAttribute("tplj")+"');window.close();</script>");
	else out.print("<script> alert('"+request.getAttribute("import_result_info")+"');</script>");
} 
%>
