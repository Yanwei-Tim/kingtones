<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
	if( request.getParameter("guide_start")!=null){
		out.print("<script>  guide_start='"+request.getParameter("guide_start")+"';bizId='"+request.getParameter("bizId")+"';parent.selectItemId=bizId;</script>");
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>业务编辑</title>
    <link href="<%=path%>/platform/images/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
    <script type="text/javascript" src="check.js"></script>
    <script type="text/javascript" src="<%=path%>/config.js"></script>
    <script type="text/javascript" src="<%=path%>/common.js"></script>
<script type="text/javascript">
function guide_next(){
	url=webroot+'/biz/service/businessrel_add.jsp?guide_start=true&bizId='+parent.bizId+'&b_name='+$("#b_name").val();
	window.name = "dialogPage"; window.open(url,"dialogPage");
}
function guide_next_add(){
	url=webroot+'/biz/service/tabinfo_add.jsp';
	window.name = "dialogPage"; window.open(url,"dialogPage");
}
var parent=this.dialogArguments;
 $(document).ready(function(){
 if(parent==null)parent=window.opener;
 if(parent.guide_start){
 	parent.selectItemId=parent.bizId;
 	$("#guide_span").text("业务编辑向导页面");
	 //$("#btn_guide_next").show();
	 //$("#btn_guide_next_add").show();
	 }
	 $("#btn_guide_next").click(function(){
		guide_next();
    }); 
    $("#btn_guide_next_add").click(function(){
		guide_next();
    }); 
 	getSysCodeList("business","b_type","biz.b_type","100");	
 	getSysCodeList("isleaf","final_node","biz.final_node","100");
 	getImgCodeList("img_name","img_name","biz.img_name","100");
 	getSysCodeValueList("datasource","ds","biz.ds","100");
 	
 		$.ajax({
		url: webroot+'/biz/serviceAC!queryBizById.action',
		data:'bizId='+parent.selectItemId,
		type: 'POST',
		async:false,
		dataType: 'json',
	    error: function(){
			alert("加载数据失败");
		},
		success: function(data){
			$("#b_id").val(data.biz.b_id);
			$("#b_name").val(data.biz.b_name);
			//alert(data.biz.b_type);
			$("#b_type").val(data.biz.b_type);
			$("#img_name").val(data.biz.img_name);
			//$("#img_show").attr("src",webroot+"/uploadfile/image/"+data.biz.img_name+".png");
			$("#l_simple_items").val(data.biz.l_simple_items);
			$("#d_simple_items").val(data.biz.d_simple_items);
			$("#l_sql").val(data.biz.l_sql);
			$("#d_sql").val(data.biz.d_sql);
			$("#father_id").val(data.biz.father_id);
			$("#final_node").val(data.biz.final_node);
			$("#ds").val(data.biz.ds);
			$("#b_orders").val(data.biz.b_orders);
			$("#operation").val(data.biz.operation);
			//$("#operation_relate").val(data.biz.operationRalete);
			$("#validate_res").val(data.biz.validate_res);
			$("#validate_des").val(data.biz.validate_des);
			var img_name=data.biz.img_name;
			$.ajax({
		url: webroot+'/biz/serviceAC!queryImageInfoById.action',
		data:'imageInfoId='+img_name,
		type: 'POST',
		async:false,
		dataType: 'json',
	    error: function(){
			alert("加载数据失败");
		},
		success: function(data){	
			//alert(data.imageInfo.img_path);		
			$("#img_show").attr("src",webroot+data.imageInfo.img_path);
		}
	});
	    }
	});
 
    $("#btn1").click(function(){
    	//window.opener.disable = true;
		document.getElementById("btn1").disabled =true;
    	postdata();                                              
    });      
    $("#btn2").click(function(){
		window.close();
    });  
    $("#selectListItemBtn").click(function(){
    	bizId=document.getElementById("b_id").value;
    	url=webroot+"/biz/service/select_box.jsp?type=l&bizId="+bizId;
        window.showModalDialog(url,window,'status:false;dialogWidth:240px;dialogHeight:500px;dialogLeft:300px;dialogTop:230px;center:yes');
    });
    $("#selectDetailItemBtn").click(function(){
    	bizId=document.getElementById("b_id").value;
    	url=webroot+"/biz/service/select_box.jsp?type=d&bizId="+bizId;
        window.showModalDialog(url,window,'status:false;dialogWidth:240px;dialogHeight:500px;dialogLeft:300px;dialogTop:230px;center:yes');
    });    
    $("#father_id").click(function(){
    	url=webroot+"/biz/service/selectbiz_boxtree.jsp?type=f";
        window.showModalDialog(url,window,'status:false;dialogWidth:200px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
    });  
    $("#img_name").click(function(){
    	url=webroot+"/biz/service/selectone_imageinfo.jsp?type=i";
        window.showModalDialog(url,window,'status:false;dialogWidth:400px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
    });
    /**
    $("#operationitem").click(function(){
    	url=webroot+"/biz/service/select_box_operate.jsp?type=o";
        window.showModalDialog(url,window,'status:false;dialogWidth:400px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
    });
    $("#operation_relate").click(function(){
    	url=webroot+"/biz/service/select_relate_operate.jsp?type=op";
        window.showModalDialog(url,window,'status:false;dialogWidth:400px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
    });
    */  
 }); 
 
 
function postdata(){ 

	if(!isNull($("#b_name").val(),"业务名称")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	if(!isNull($("#img_name").val(),"图片名称")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	
	// 列表过滤项非空验证
	var l_simple_items = $("#l_simple_items").val();
	if(l_simple_items.length != 0 && l_simple_items != ""){
		list_items = l_simple_items.split(",");
	// 列表过滤项数目验证，只能为1个或4个
		if(list_items.length != 1 && list_items.length != 4){
		document.getElementById("btn1").disabled = false;
		alert("列表过滤项设置个数只能为1个或4个，并且必须由半角逗号（,）间隔！");
		return;
		}else{
		// 列表过滤项数目验证，不能设置为空字符
			for(i = 0; i<list_items.length;i++)
				if(list_items[i] == ''){
					document.getElementById("btn1").disabled = false;
					alert("列表过滤项的第"+(i+1)+"个项目不能为空字符！");
					return;
				}
		}
	}
	/**
	
	// 列表过滤项非空验证
	var l_simple_items = $("#l_simple_items").val();
	if(!isNull(l_simple_items,"列表过滤")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	list_items = l_simple_items.split(",");
	// 列表过滤项数目验证，只能为1个或4个
	if(list_items.length != 1 && list_items.length != 4){
		document.getElementById("btn1").disabled = false;
		alert("列表过滤项设置个数只能为1个或4个，并且必须由半角逗号（,）间隔！");
		return;
	}else{
	// 列表过滤项数目验证，不能设置为空字符
		for(i = 0; i<list_items.length;i++)
			if(list_items[i] == ''){
				document.getElementById("btn1").disabled = false;
				alert("列表过滤项的第"+(i+1)+"个项目不能为空字符！");
				return;
			}
	}
	*/
	
	/*
	if(!isNull($("#l_simple_items").val(),"列表过滤")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	if(!isNull($("#d_simple_items").val(),"详细过滤")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	*/
	/*
	if(!isNull($("#l_sql").val(),"L_SQL语句")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	if(!isNull($("#d_sql").val(),"D_SQL语句")) {
		document.getElementById("btn1").disabled = false;
		return;
	}
	*/
	if(!isNull($("#father_id").val(),"父节点id")) {
		document.getElementById("btn1").disabled = false;
		return;
	}else{
	var ifexist=false;
	$.ajax({
		url: webroot+'/biz/serviceAC!queryRootBiz.action',
		data:'bizId='+parent.selectItemId,
		type: 'POST',
		async:false,
		dataType: 'json',
	    error: function(){
	   		 document.getElementById("btn1").disabled = false;
			alert("父节点id:加载数据失败");	
			ifexist=true;		

		},
		success: function(data){
			//alert(data.biz.b_id+"-"+$("#father_id").val()+"-"+$("#b_id").val());
			//alert(data.biz.father_id);
			var rootb_id=data.biz.b_id;
			if($("#father_id").val()==$("#b_id").val()){
			document.getElementById("btn1").disabled = false;
			alert("父节点id:不能设置自己节点");	
			ifexist=true;
			}else if(rootb_id!=null&&rootb_id!=$("#b_id").val()&&data.biz.father_id==$("#father_id").val())
			{
			document.getElementById("btn1").disabled = false;
			alert("父节点id:根业务已存在");	
			ifexist=true;
			} 		
	    }
	});
	if(ifexist)return;
	}
	if(!isNull($("#b_orders").val(),"排序")) {
		document.getElementById("btn1").disabled = false;
		return;
	}

	var postData = $("#form1").serialize();                                   
   	$.post(webroot+'/biz/serviceAC!updateBiz.action', postData, function(data){
   	if(parent.guide_start){
				alert("添加成功！进入下一步向导");
				guide_next();
				}else{
   			 document.getElementById("btn1").disabled =false;  
		     //window.opner.refreshGrid();
		     parent.refreshGrid();
		     window.close();}
	}, 'json');    
 }
function setColumns(Columns,type,imgpath){
	if(type=="l")$("#l_simple_items").val(Columns);
	else if(type=="d")$("#d_simple_items").val(Columns);
	else if(type=="f")$("#father_id").val(Columns);
	else if(type=="i"){$("#img_name").val(Columns);$("#img_show").attr("src",webroot+imgpath);};
	//else if(type=="o")$("#operationitem"+imgpath).val(Columns);
	//else if(type=="op")$("#operation_relate"+imgpath).val(Columns);
}

function setColumns2(Columns,type,imgpath){
  if(type=="o")$("#operationitem"+imgpath).val(Columns);
  else if(type=="op")$("#operation_relate"+imgpath).val(Columns);
}

$("body").ready(function(){
	$("#setting").toggle(
     
      function () {
         $("#showsetting").show("slow"); 
      }, 
	  function () {
        $("#showsetting").hide(1000);
      }
    );
	});
var j=0;
var t=0; 
//onfocus="getRelate();"	
//onfocus="getOperation('+j+');"
function insertRow()
{
	var v_rowHTML="";
		v_rowHTML =v_rowHTML+'<td><input name="oper" type="checkbox" id="oper" size="20%"  /></td>#';
		v_rowHTML=v_rowHTML+'<td><input name="operationitem" type="text" id="operationitem'+j+'" onclick="getOperation('+j+');"/></td>#'
		v_rowHTML=v_rowHTML+'<td><input type="text" id="operation_relate'+t+'" name="operation_relate" size="40%" maxlength="1000" onclick="getRelate('+j+');" /></td>#'
	//alert(v_rowHTML);
    var newRow=$("#table2")[0].insertRow(-1);  
    //alert(newRow);
    var v_tdHTML=v_rowHTML.split("#");
    for(var i=0;i<v_tdHTML.length-1;i++){
        var newCell=newRow.insertCell(i);
        newCell.innerHTML=v_tdHTML[i];        
    }
    j++;
    t++;
}
function deleteRow()
{
	
    var di=$("#table2")[0].rows.length;
    for(di=di-1;di>=1;di--){
        if($("#table2")[0].rows[di].getElementsByTagName("input")[0].checked){
            $("#table2")[0].deleteRow(di);
           // j--;
       	   // t--;
        }
    }
}
 var strlll="";
function getResult(){
	strlll="";
   //var cl=$("input[type=checkbox][name=oper][checked]").length;
   //var cl=$("input[type=checkbox][name=oper]").length;
   var cl = t;
   //alert(cl);
   for(var i=0;i<cl;i++){
   		if($("#operationitem"+i).val()!= undefined){
   			if($("#operationitem"+i).val()!=null&&$("#operationitem"+i).val().indexOf(',')>0){
	   			alert('只能选择一个流程！');
	   			return false;
   			}
   			strlll= strlll+$("#operationitem"+i).val();
   		}
   		if($("#operation_relate"+i).val() != undefined){
   			if(strlll!=""&&$("#operation_relate"+i).val() !=null && $("#operation_relate"+i).val().length>0){
		       if($("#operation_relate"+i).val().indexOf(',')>0){
		   			alert('只能选择一个业务！');
		   			return false;
		   		}
            	strlll=strlll+"@"+$("#operation_relate"+i).val();
       		}
   		}
   		// || $("#operationitem"+i).val()!= undefined || $("#operation_relate"+i).val() != undefined
       if(strlll!="" && $("#operationitem"+i).val()!= undefined)
       	strlll = strlll+","
   }
  $("#operation").val(strlll);
}
function getOperation(oid){
	url=webroot+"/biz/service/select_box_operate.jsp?type=o&oid="+oid;	
	window.showModalDialog(url,window,"status:false;dialogWidth:400px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes");
}
function getRelate(rid){
	url=webroot+"/biz/service/select_relate_operate.jsp?type=op&rid="+rid;
	window.showModalDialog(url,window,"status:false;dialogWidth:400px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes");
}
</script>
  </head>
  <body>
  	<form id="form1">

  	<br><span id="guide_span"></span>
  	<table>
	  	<colgroup>
	  		<col width="10%" align="right" />
	  		<col width="40%" align="left" />
			<col width="40%" align="left" />
			<col width="10%" align="right" />
	  	</colgroup>
	  	<tr><td></td><td>&nbsp;&nbsp;&nbsp;&nbsp;业务ID：</td><td><input type="text" readonly id="b_id" name="biz.b_id" size="50%" maxlength="50"/></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;业务名称：</td><td><input type="text" id="b_name" name="biz.b_name" size="50%" maxlength="50"/></td></tr>
	  	<tr><td></td>
	  		<td>&nbsp;&nbsp;&nbsp;&nbsp;业务类型：</td>
	  		<td>
	  		<div id="business_div"></div>
	  			<!--<select name="biz.b_type" id="b_type" style="width:100%">
		    		<option value="0">平铺菜单</option>
		         	<option value="1">列表菜单</option>
		         	<option value="2">查询</option>
		         	<option value="3">增加</option>
	    		</select>-->
	  		</td>
	  	</tr>
	  	
	  	<tr><td></td><td>&nbsp;&nbsp;&nbsp;&nbsp;图片名称1：</td><td>
	  	<input readonly type="text" id="img_name" name="biz.img_name" size="40%" maxlength="30"/>&nbsp;<img alt="图片显示" src="" id="img_show" width="40"/>
	  	<!--<div class="info"  id="img_show"><img alt="" src="/SSIV/uploadfile/image/ajxx.png" id="img_show" width="100"/></div>
	  	<div id="img_name_div"></div>-->
	  	</td></tr>
	  	<tr>
		  	<td></td>
		  	<td>&nbsp;&nbsp;&nbsp;&nbsp;列表过滤：</td>
		  	<td><input type="text" id="l_simple_items" name="biz.l_simple_items" size="40%" maxlength="1000"/>&nbsp;
				<input type="button" id="selectListItemBtn"  value="选择" width="40"/>
			</td>
		</tr>
	  	<tr>
		  	<td></td>
		  	<td>&nbsp;&nbsp;&nbsp;&nbsp;详细过滤：</td><td><input type="text" id="d_simple_items" name="biz.d_simple_items" size="40%" maxlength="1000"/>&nbsp;
		  		<input type="button" id="selectDetailItemBtn"  value="选择" width="40"/>
		  	</td>
	  	</tr>
	  	<tr>
	  	<td></td><td>&nbsp;&nbsp;L_SQL语句：</td>
	  	<td>
	  		<input type="text" id="l_sql" name="biz.l_sql" size="50%" maxlength="1000"/>
	  	</td>
	  	</tr>
	  	<tr><td></td><td>&nbsp;&nbsp;D_SQL语句：</td><td><input type="text" id="d_sql" name="biz.d_sql" size="50%" maxlength="1000"/></td></tr>
	  	<tr><td></td><td>&nbsp;&nbsp;&nbsp;&nbsp;父节点id：</td><td><input readonly type="text" id="father_id" name="biz.father_id" size="50%" maxlength="10"/></td></tr>
	  	<tr><td></td>
		  	<td>是否为叶子节点：</td>
		  	<td>
		  		<div id="isleaf_div"></div>
	  			<!--<select id="final_node" name="biz.final_node" style="width:100%">
		    		<option value="0">否</option>
		         	<option value="1">是</option>
	    		</select>-->
		  	</td>
	  	</tr>
	  	<tr><td></td><td>&nbsp;&nbsp;&nbsp;&nbsp;数据源：</td><td><div id="datasource_div"></div></td></tr>
	  	<tr><td></td><td><span class="xing">*</span>&nbsp;&nbsp;排序：</td><td><input id="b_orders" type="text" name="biz.b_orders" size="50%" maxlength="1000"/></td></tr>
	  	
	  	<tr>
		  	<td></td>
		  	<td>&nbsp;&nbsp;&nbsp;&nbsp;业务流程：</td>
		  	<td><input type="text" id="operation" name="biz.operation" size="40%" maxlength="1000"/>&nbsp;
				<input type="button" id="setting"  value="设置" width="40"/>
			</td>
		</tr>
	  	<tr><td></td><td>&nbsp;&nbsp;&nbsp;&nbsp;业务验证：</td><td><input id="validate_res" type="text" name="biz.validate_res" size="50%" maxlength="1000"/></td></tr>
	  	<tr><td></td><td>&nbsp;&nbsp;&nbsp;&nbsp;验证说明：</td><td><input id="validate_des" type="text" name="biz.validate_des" size="50%" maxlength="1000"/></td></tr>
	  	<tr><td></td><td></td>
	  		<td align="center"><input type="button" id="btn1"  value="保 存"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		<input type="button" id="btn2"  value="取 消"/></td>
	  	</tr>
	  	<tr><td></td><td></td><td><input style="display:none;" type="button" id="btn_guide_next_add"  value="继续增加"/><input style="display:none;" type="button" id="btn_guide_next"  value="直接进入下一步向导"/></td></tr>
  	</table>
  	<p></p>
  <div id="showsetting" style="display:none">
  	<table id="table2">
	  	<colgroup>
	  		<col width="10%" align="right" />
	  		<col width="30%" align="left" />
			<col width="50%" align="left" />
			<col width="10%" align="right" />
	  	</colgroup>
	  	<tr><td size="20%">选择：</td><td size="40%">操作：</td><td size="40%">关联业务：</td></tr>
  	</table>
  	<p></p>
  	<table id="table3">
	  	<colgroup>
	  		<col width="10%" align="right" />
	  		<col width="30%" align="left" />
			<col width="50%" align="left" />
			<col width="10%" align="right" />
	  	</colgroup>
	  	<tr><td></td><td></td>
	  		<td align="left"><input type="button" name="Submit" value="增加"  onclick="insertRow();"/>&nbsp;&nbsp;&nbsp;
	  		<input type="button" name="Submit2" value="删除"  onclick="deleteRow();"/>&nbsp;&nbsp;&nbsp;
	  		<input type="button" name="Submit3" value="确定" id="confirmBtn" onclick="getResult();"/></td>
	  	</tr>
  	</table>
  	</div>
	</form>  
  </body>
</html>
