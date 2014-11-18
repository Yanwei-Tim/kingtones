	//----------------【定义flexgrid开始】--------------------------------------------------------------------------
var addjwuser='none';
	var deljwGPS ='none';
	var deljwAllGPS='none';
	 var str=document.cookie.split(";")
	 var temp;
	 var temp1;
	 var  i=0;
	 for(var i=0;i<str.length;i++){
		  temp = str[i];
		 if(temp.indexOf("ROLE_BUTTON")>=0){
			 temp1=temp.split("=")[1];
			 if(temp1.indexOf("deljwGPS")>=0){
				 deljwGPS='inline';
			 }
			 if(temp1.indexOf("deljwAllGPS")>=0){
				 deljwAllGPS='inline';
			 }
			 break;
		 }
	 }
	$("#flex1").flexigrid(
	{
		url: webroot+'/xajw/jwGpsConfigAC!findGPSData.action',
		dataType: 'json',
		colModel : [
			{display: '主键', name : 'keyValue', width : 55, sortable : true, align: 'center',hide: true},
			{display: '用户名', name : 'userid', width : 55, sortable : true, align: 'center',hide: false},
			{display: '设备串号', name : 'deviceid', width : 150, sortable : true, align: 'left'},
			{display: '维度', name : 'x', width :55, sortable : false, align: 'left'},
			{display: '精度', name : 'y', width : 55, sortable : false, align: 'left'},
			{display: '时间', name : 'datetime', width : 150, sortable : false, align: 'left'},
			{display: '速度', name : 'speed', width : 55, sortable : false, align: 'left'},
			{display: '方向', name : 'direction', width : 55,align: 'left',hide:false},
			{display: 'IMSI码', name : 'imsi', width : 150,align: 'left',hide:false}
			],
		buttons : [
			{name: '删除', onpress : btn_even,state:deljwGPS},
			{separator: true,sepstate:deljwGPS},
			{name: '批量删除', onpress : btn_even,state:deljwAllGPS},
			{separator: true,sepstate:deljwAllGPS}
			],
		
		sortname: "iso",
		sortorder: "asc",
		usepager: true,
		useRp: true,
		rp: 10,
		title: false,
		showTableToggleBtn: true,
		resizable:false,  //窗口伸缩
		onSubmit: addFormData,
		width:850,
		height: 400
		}
		);	
	function addFormData()
	{
		return true;
	}
	//刷新列表	
	function refreshGrid(){
		$('#flex1').flexOptions({params: [{ name: null, value: null}]}).flexReload();
	}	
	
	function refreshGrid2(){
		var userName = $("#userName").val();
		var deviceid = $("#deviceid").val();
		var startdate = $("#startdate").val();
		var enddate = $("#enddate").val();
		
		if(!dateCheck2(startdate,enddate))
			return;
		if(!dateCheck(startdate,enddate))
			return;
		
		
		$("#flex1").flexOptions({params: [
		{ name:'deviceid',value:deviceid},
		{ name:'startdate',value:startdate},
		{ name:'enddate',value:enddate},
		{ name:'userName', value:userName}
		]}).flexReload();
	}
	
	var selectItemId;
	function btn_even(com,grid){
		if(com=='返选'){
			$('tr',grid).toggleClass('trSelected'); 
		}
		else if (com=='删除'){
			if($('.trSelected',grid).length==0){
				alert("请选择要删除的数据项！");
				return;
			}
			else if(confirm('是否要删除选中项！')){  
				var deleteItems = $('.trSelected',grid).find("td:first").eq(0).text();
				for(var i=1;i<$('.trSelected',grid).find("td:first").length;i++){
					deleteItems+="split"+$('.trSelected',grid).find("td:first").eq(i).text();
				}
				$.ajax({
			    	url: webroot+'/xajw/jwGpsConfigAC!delSelectGPSData.action',
			        data:'deleteItems='+deleteItems,
			    	type: 'POST',
				    dataType: 'json',
				    error: function(){
						alert("删除失败");
				    },
				    success: function(data){
				        alert("删除成功");
						refreshGrid2();
				    }
			});}}
		
		else if (com=='批量删除'){
			deleteGPSData()
		}
	
	}
	
	// 查询GPS数据
	function searchGPSData()
	{
		if(checkData()){
			refreshGrid2()
		}
	}
	
	// 删除GPS数据
	function deleteGPSData()
	{
		if(checkData()){
			userName = $("#userName").val().trim();
			deviceid = $("#deviceid").val().trim();
			
			// 设置删除确认消息
		    dateIntervalStr = '确定要删除日期范围在'+$("#startdate").val()+'至'+$("#enddate").val();
		    if(userName !=""){
		    	userNameStr = '用户' + userName;
		    }else{
		    	userNameStr = '';
		    }
		    if(deviceid !=""){
		    	deviceIdStr = '使用设备号' + deviceid;
		    }else{
		    	deviceIdStr = '';
		    }
		    endStr = '的GPS数据吗?';
			confirmStr = dateIntervalStr + userNameStr + deviceIdStr + endStr;
			if(!confirm(confirmStr)) {
				alert("删除操作已取消！")
				return false
			}

			var postData = $("#form2").serialize();  
			$.ajax({
		    	url: webroot+'/xajw/jwGpsConfigAC!delGPSData.action',
			    type: 'POST',
				data:postData,
				dataType: 'json',
			    error: function(){
					alert("删除失败!");
				},
				success: function(data){
					alert("删除成功!");
					refreshGrid();
			    }
				});
			// 刷新table数据
			refreshGrid2()
		}
	}
	
	function checkData()
	{
		// 数据非空验证
		var startdate = $("#startdate").val();
		if(!isNull(startdate,"页面下方的删除条件=>起始日期")) {
			return false;
		}
		
		var enddate = $("#enddate").val();
		if(!isNull(enddate,"页面下方的删除条件=>结束日期")) {
			return false;
		}
		// 日期验证
		if(!dateCheck2(startdate,enddate))
			return false;
			
		if(!dateCheck(startdate,enddate))
			return false;
		
		return true;
	}
