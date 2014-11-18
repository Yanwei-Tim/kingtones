//-------------------【定义ztree开始】----------------------------------------------------------------------
	var zTree1;
	var setting;
	setting = {
		checkable: false,
		async: true,
		asyncUrl: webroot+"/platform/unitAC!queryUnitTreeNodes.action",  //获取节点数据的URL地址
		asyncParam: ["name", "id","xzqh"],  //获取节点数据时，必须的数据名称，例如：id、name
		asyncParamOther: ["test","true"], //其它参数 ( key, value 键值对格式)
		callback:{
			click:	zTreeOnClick
		}
	};	
	var zNodes =[];
	//整个树加载
	$(document).ready(function(){
		//setting.asyncParamOther = ["test1","tr1","test2","tr2"];//传参测试
		zTree1 = $("#treeDemo").zTree(setting, zNodes);
	});
	//整个树刷新
	function refreshTree(){
		zTree1 = $("#treeDemo").zTree(setting, zNodes);
	}
	//选中节点刷新
	function refreshNode(){
		var treeNode = getSelectNode();
		if(!treeNode){
			refreshTree();
		}else{
			zTree1.reAsyncChildNodes(treeNode, "refresh");
		}
	}
	//获取选中节点
	function getSelectNode(){
		return zTree1.getSelectedNode();
	}
	//获取选中节点id
	function getSelectNodeId(){
		if(!getSelectNode())return null;
		else return getSelectNode().id;
	}
	//节点单击事件
	function zTreeOnClick(event, treeId, treeNode) {
		//刷新flexgrid
		//$("#flex1").flexOptions({params: [{ name:'treeNodeID', value:treeNode.id},{ name:'test1',value:"test1"}]}).flexReload();
	   $("#xzqh").val(getSelectNode().xzqh)
	    $("#dw").val(getSelectNodeId())
	    refreshGrid2()
	}
	
//----------------【定义flexgrid开始】--------------------------------------------------------------------------
	var viewPic='none';
	var delPic ='none';
	 var str=document.cookie.split(";")
	 var temp;
	 var temp1;
	 var  i=0;
	 for(var i=0;i<str.length;i++){
		  temp = str[i];
		 if(temp.indexOf("ROLE_BUTTON")>=0){
			 temp1=temp.split("=")[1];
			 if(temp1.indexOf("viewPic")>=0){
				 viewPic='inline';
			 }
			 if(temp1.indexOf("delPic")>=0){
				 delPic='inline';
			 }
			 break;
		 }
	 }

	$("#flex1").flexigrid(
	{
		url: webroot+'/commonbiz/sjcjAC!queryTpcjList.action',
		dataType: 'json',
		colModel : [
			{display: '编号', name : 'id', width : 40, sortable : true, align: 'center',hide: false},
			{display: '图片名称', name : 'picturename', width : 180, sortable : true, align: 'left'},
			{display: '创建人', name : 'xm', width :50, sortable : false, align: 'left'},
			//{display: '单位', name : 'dw', width : 50, sortable : false, align: 'left'},
			//{display: '部门', name : 'bm', width : 50, sortable : false, align: 'left'},
			{display: '手机串号', name : 'device_id', width : 100, sortable : false, align: 'left'},
			{display: '创建时间', name : 'createtime', width : 100, sortable : false, align: 'left'},
			{display: '描述', name : 'description', width : 180, sortable : false, align: 'left'}
			],
		buttons : [
			{name: '删除', onpress : btn_even,state:delPic},
			{separator: true,sepstate:delPic},
			{name: '浏览图片', onpress : btn_even,state:viewPic},
			{separator: true, sepstate:viewPic}
			],
		sortname: "iso",
		sortorder: "asc",
		usepager: true,
		title: false,//'组织单元列表',
		useRp: true,
		rp: 10,
		//title:'组织单位管理',
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
		$('#flex1').flexOptions({params: [{ name: 'treeNodeID', value: getSelectNodeId()}]}).flexReload();
	}	
	
	function refreshGrid2(){
		var xm = $("#xm").val();
		var device_id = $("#device_id").val();
		var startdate = $("#startdate").val();
		var enddate = $("#enddate").val();
		var xzqh = $("#xzqh").val();
		var dw = $("#dw").val();
		if(!dateCheck2(startdate,enddate))
			return;
		if(!dateCheck(startdate,enddate))
			return;
		
		
		$("#flex1").flexOptions({params: [
		{ name:'device_id',value:device_id},
		{ name:'startdate',value:startdate},
		{ name:'enddate',value:enddate},
		{ name:'xzqh',value:xzqh},
		{ name:'xm', value:xm},
		{ name: 'dw', value: dw}
		]}).flexReload();
	}
	
	var selectItemId;
	function btn_even(com,grid){
		if(com=='返选'){
			$('tr',grid).toggleClass('trSelected'); 
		}
		else if (com=='删除')
		{
				if($('.trSelected',grid).length==0){
					alert("请选择要删除的项！");
					return;
				}else{
					if(confirm('是否要删除该项！')){
						var ids = $('.trSelected',grid).find("td:first").eq(0).text();
						for(var i=1;i<$('.trSelected',grid).find("td:first").length;i++){
							ids+="split"+$('.trSelected',grid).find("td:first").eq(i).text();
						}
						$.ajax({
					    	url: webroot+'/commonbiz/sjcjAC!delTpcj.action?ids='+ids,
					    	type: 'POST',
						    dataType: 'json',
						    //timeout: 1000,
						    error: function(){
								alert("删除失败");
						    	refreshGrid2();
						    },
						    success: function(data){
								
						    	refreshGrid2();
						    }
						});
					}
				}
		}else if (com=='浏览图片')
		{
			selectItemId = $('.trSelected',grid).find("td:first").eq(0).text()
			// 选择数据项效验  -Add by 陈萧如
			if(selectItemId==''){
				alert("请选择一项需要浏览的图片信息！");
				return;
			}else if($('.trSelected',grid).length>1){
			alert("请选择一项需要浏览的图片信息！");
				return;
			}
			$.ajax({
				url: webroot+'/commonbiz/sjcjAC!queryImageUrl.action?id='+selectItemId,
				type: 'POST',
				dataType: 'json',
				//timeout: 1000,
				error: function(){
					alert("查询失败");
				},
				success: function(data){
					if(data.info=='2'){
					alert("文件不存在，请检查!");}else{
					
					url=webroot+"/biz/common/tpcjview.jsp";
            window.showModalDialog(url,window,'status:false;dialogWidth:450px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
            }				
				}
			});
		}	
	}
