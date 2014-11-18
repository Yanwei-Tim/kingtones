<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML xmlns="http://www.w3.org/1999/xhtml" xmlns:v ="urn:schemas-microsoft-com:vml">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=GB2312" />
		<title>1.地图显示</title>
		<LINK href="css/EzServer.css" type="text/css" rel="stylesheet">
		<SCRIPT src="http://10.44.128.151:9080/PGIS_S_TileMap/js/EzMapAPI.js" type="text/javascript"></SCRIPT>
		<script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=path%>/config.js"></script>
		
		<!-- 下面style的用处是把命名空间"v"和系统预定义的行为VML连接 -->
		<style>
		v\:* {
			BEHAVIOR: url(#default#VML)
		}
		</style>
	<script type="text/javascript">
	// 构造地图类
	var _MapApp;
	function onLoad() {
		_MapApp = new EzMap(document.getElementById("mymap"));
		// 显示地图左侧比例尺控制控件
		_MapApp.showMapControl();	
		// 设置地图对中中心
		_MapApp.centerAndZoom(new Point(113.3842, 22.5120), 11);
			
		t1();	
	}	
    
	function userSou(){
		var uaid = document.getElementById("uaid").value;
		var account = document.getElementById("account").value;
		
		$.ajax( {
			url : webroot + '/dw/jwGpsManagerAC!findUserforMap.action',
			// 数据发送方式
			type : "post",
			data:'jwGpsData.uaid='+uaid+'&jwGpsData.account='+account,
			// 接受数据格式
			dataType : "json",
			// 回调函数，接受服务器端返回给客户端的值，即result值
			error: function(){
		       alert('加载失败');
		    },
			success : function(data) {
				if(data.rows.length==0){
					alert("没有搜索到该用户");
					t1();
				}else{
					var arrayObj = new Array();
					var arr = new Array();
					for ( var i = 0; i < eval(data.rows).length; i++) {
						arr = [ data.rows[i].y, data.rows[i].x,data.rows[i].userName, data.rows[i].account,
								data.rows[i].phone,data.rows[i].datetime ];
						arrayObj.push(arr);
					}
					document.getElementById("show").value = arrayObj;
					t2();
				}								
			}
		});
	}
	
	function t1() {
		
		$.ajax( {
			url : webroot + '/dw/jwGpsManagerAC!findGpsall.action',
			// 数据发送方式
			type : "post",
			// 接受数据格式
			dataType : "json",
			// 回调函数，接受服务器端返回给客户端的值，即result值
			success : function(data) {
				var arrayObj = new Array();
				var arr = new Array();
				for ( var i = 0; i < eval(data.rows).length; i++) {
					arr = [ data.rows[i].y, data.rows[i].x,data.rows[i].userName, data.rows[i].account,
							data.rows[i].phone,data.rows[i].datetime ];
					arrayObj.push(arr);
				}
				document.getElementById("show").value = arrayObj;
				t2();
			}
		});
	}
	
	function t2() {		
		var pIcon=new Icon();
		pIcon.image="<%=path%>/flexgrid/w2.png";
		pIcon.height=24;
		pIcon.width=16;
		
		var dashu = document.getElementById("show").value;
		var array = dashu.split(",");
		var nums = [];
		for ( var i = 0; i < array.length; i++) {
			nums.push(array[i]);
		}
		var data_info = splitArray(nums, 6);//变二维		
		
		for ( var i = 0; i < data_info.length; i++) {

			var point = new Point(data_info[i][0], data_info[i][1]);			
			var marker = new Marker(point,pIcon,new Title(data_info[i][2],11,7,"宋体",null,"green","blue","1"));	
			
			var strMsg = "<b>姓&nbsp&nbsp&nbsp&nbsp名："+data_info[i][2]+"</b><br>"+"<b>账&nbsp&nbsp&nbsp&nbsp号："+data_info[i][3]+"</b><br>"+
						"<b>联系方式："+data_info[i][4]+"</b><br>"+"<b>上传时间："+data_info[i][5]+"</b>";

			//marker.locPnt = point;				
			addOpenInfoWindow(marker, strMsg);
		  	_MapApp.addOverlay(marker);
		  	_MapApp.centerAndZoom(point, 12); // 12
		  	//marker.flash();
		}

		function addOpenInfoWindow(obj, msg){
			obj.addListener("click", function(){obj.openInfoWindowHtml(msg);});
		};
	}
	
	function splitArray(aim, size) { //一维数组变二维数组   
		var result = [];
		var tempArray;
		for ( var count = 0; count < aim.length; count++) {
			if (count % size == 0) {
				if (tempArray) {
					result.push(tempArray);
				}
				tempArray = [];
			}
			tempArray[tempArray.length] = aim[count];
			if (count + 1 == aim.length) {
				result.push(tempArray);
			}
		}
		return result;
	}
	
    </script>
	</head>
	<body onload="onLoad()">
		<div id="mymap" class="map" style="width: 99%; height: 95%;"></div>
		<input type="hidden" id="show" />
		搜索警员:<select type="select" id="uaid" style="width: 80px; margin-right: 10px;">
		     <option value="0">警员姓名 </option>
		     <option value="1">登陆账号 </option>
		</select> 
		<input id="account" type="text" style="width: 100px; margin-right: 10px;" />
		<input type="button" value="搜索" onclick="userSou()";/>
	</body>
</html>


