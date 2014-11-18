<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>城市名定位</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
		<style type="text/css">
			body,html {
				width: 100%;
				height: 100%;
				margin: 0;
				font-family: "微软雅黑";
			}			
			#allmap {
				height: 510px;
				width: 100%;
			}			
			#r-result {
				width: 100%;
				font-size: 14px;
			}
		</style>

		<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=obTbYkbPRe7L8HXw7pz2aGTd"></script>
		<script type="text/javascript" src="http://developer.baidu.com/map/jsdemo/demo/changeMore.js"></script>
		<script type="text/javascript" src="<%=path%>/flexgrid/lib/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=path%>/config.js"></script>

		<link rel="stylesheet" href="<%=path%>/ztree/demo/demoStyle/demo.css" type="text/css" />
	</head>

	<body onload="t1()">
	
		<div id="allmap"></div>
		<%--<div id="r-result">			
			城市名(如:中山,深圳等):<input id="cityName" type="text"style="width: 100px; margin-right: 10px;" />
			<input type="button" value="查询" onclick=theLocation();/>			
			搜索:<input id="sou" type="text" style="width: 100px; margin-right: 10px;" />
			<input type="button" value="查询" onclick=theSou();/>(如:银行,商城等)
		</div>	--%>	
		搜索警员:<select type="select" id="uaid" style="width: 80px; margin-right: 10px;">
		     <option value="0">警员姓名 </option>
		     <option value="1">登陆账号 </option>
		</select> 
		<input id="account" type="text" style="width: 100px; margin-right: 10px;" />
		<input type="button" value="搜索" onclick="userSou()";/>
		
        <input type="hidden" id="show" />
	</body>

	<script type="text/javascript">
	//百度地图API功能
	var map = new BMap.Map("allmap");//显示地图
	map.centerAndZoom(new BMap.Point(113.399132, 22.523332), 15);

	map.addControl(new BMap.MapTypeControl()); //添加地图类型控件，右上角
	map.enableScrollWheelZoom(true);//大小缩放

	var top_left_control = new BMap.ScaleControl( {
		anchor : BMAP_ANCHOR_TOP_LEFT
	});// 左上角，添加比例尺
	var top_left_navigation = new BMap.NavigationControl(); //左上角，添加默认缩放平移控件			
	map.addControl(top_left_control); //添加控件和比例尺     
	map.addControl(top_left_navigation);
	//点击提交按钮时，从服务端获取数据，然后在客户端显示
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
				}				
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

	function t2() {
		var dashu = document.getElementById("show").value;

		var array = dashu.split(",");
		var nums = [];
		for ( var i = 0; i < array.length; i++) {
			nums.push(array[i]);
		}
		var data_info = splitArray(nums, 6);//变二维
		var opts = {
			width : 100, // 信息窗口宽度
			height : 80, // 信息窗口高度
			title : "<b>个人信息</b>", // 信息窗口标题
			enableMessage : false
		//设置允许信息窗发送短息
		};
		var pointArray = new Array();
		for ( var i = 0; i < data_info.length; i++) {
			var point = new BMap.Point(data_info[i][0], data_info[i][1]);
			var marker = new BMap.Marker(point); // 创建标注
			var content = "<b>姓&nbsp&nbsp&nbsp&nbsp名："+data_info[i][2]+"</b><br>"+"<b>账&nbsp&nbsp&nbsp&nbsp号："+data_info[i][3]+"</b><br>"+
			"<b>联系方式："+data_info[i][4]+"</b><br>"+"<b>上传时间："+data_info[i][5]+"</b>";
			map.addOverlay(marker); // 将标注添加到地图中

			pointArray[i] = point;
			marker.addEventListener("click", openInfo.bind(null, content));
		}

		map.setViewport(pointArray);//让所有点在视野范围内
		function openInfo(content, e) {
			var p = e.target;
			var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
			var infoWindow = new BMap.InfoWindow(content, opts); // 创建信息窗口对象 
			map.openInfoWindow(infoWindow, point); //开启信息窗口
		}

	}

	function theSou() {//实物搜索
		var s = document.getElementById("sou").value;
		var local = new BMap.LocalSearch(map, {
			renderOptions : {
				map : map
			}
		});
		local.search(s);
	}
</script>

</html>
