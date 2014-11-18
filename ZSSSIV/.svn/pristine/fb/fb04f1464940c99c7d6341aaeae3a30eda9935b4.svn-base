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
	$("#sendDeptid").val(getSelectNode().id);
	refreshGrid2()
	}
	
//----------------【定义flexgrid开始】--------------------------------------------------------------------------
//	var role = document.cookie;
	var edittztg='none';
	var viewtztg ='none';
	var addtztg = 'none';
	var deltztg ='none';
	var downtztg ='none';
	 var str=document.cookie.split(";")
	 var temp;
	 var temp1;
	 var  i=0;
	 for(var i=0;i<str.length;i++){
		  temp = str[i];
		 if(temp.indexOf("ROLE_BUTTON")>=0){
			 temp1=temp.split("=")[1];
			 if(temp1.indexOf("edittztg")>=0){
				 edittztg='inline';
			 }
			 if(temp1.indexOf("viewtztg")>=0){
				 viewtztg='inline';
			 }
			  if(temp1.indexOf("addtztg")>=0){
				 addtztg='inline';
			 }
			  if(temp1.indexOf("deltztg")>=0){
				 deltztg='inline';
			 }
			 if(temp1.indexOf("downtztg")>=0){
				 downtztg='inline';
			 }
			 break;
		 }
	 }
	$("#flex1").flexigrid(
	{
		
		url: webroot+'/commonbiz/tztgAC!queryTztgList.action',
		dataType: 'json',
		colModel : [
			{display: '编号', name : 'id', width : 40, sortable : true, align: 'center',hide: false},
			{display: '标题', name : 'title', width : 100, sortable : true, align: 'left'},
			{display: '类型', name : 'type', width :100, sortable : false, align: 'left'},
			{display: '发送人', name : 'sendUsername', width : 100, sortable : false, align: 'left'},
			{display: '发送单位', name : 'sendDeptname', width : 100, sortable : false, align: 'left'},
			{display: '发送状态', name : 'sendStatus', width : 100, sortable : false, align: 'left'},
			{display: '发送时间', name : 'sendTime', width : 100, sortable : false, align: 'left'},
			{display: '上传文件', name : 'uploadFileName', width : 180, sortable : true, align: 'center',hide: false}
			],
		buttons : [
			{name: '添加', onpress : btn_even,state:addtztg},
			{separator: true,sepstate:addtztg},
			{name: '编辑', onpress : btn_even,state:edittztg},
			{separator: true,sepstate:edittztg},
			{name: '查看', onpress : btn_even,state:viewtztg},
			{separator: true,sepstate:viewtztg},
			{name: '删除', onpress : btn_even,state:deltztg},
			{separator: true,sepstate:deltztg},
			{name: '下载附件', onpress : btn_even,state:downtztg},
			{separator: true,sepstate:downtztg}
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
		var type = $("#type").val();
		var sendStatus = $("#sendStatus").val();
		var startdate = $("#startdate").val() == null?"":$("#startdate").val();
		var enddate = $("#enddate").val();
		var sendDeptid = $("#sendDeptid").val();
		if(!dateCheck2(startdate,enddate))
			return;
		
		if(!dateCheck(startdate,enddate))
			return;
		
		$("#flex1").flexOptions({params: [
		{ name:'sendStatus',value:sendStatus},
		{ name:'startdate',value:startdate},
		{ name:'enddate',value:enddate},
		{ name:'sendDeptid',value:sendDeptid},
		{ name:'type', value:type}
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
					    	url: webroot+'/commonbiz/tztgAC!delNotice.action?ids='+ids,
					    
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
		}else if (com=='添加')
		{
			url=webroot+"/biz/common/tztg_add.jsp";
            window.showModalDialog(url,window,'status:false;dialogWidth:450px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
		}
		else if (com=='下载附件')
		{   if($('.trSelected',grid).length==0){
					alert("请选择要下载的数据项！");
					return;
			}
			else if($('.trSelected',grid).length>1){
				alert("请选择一项要下载的数据项！")
				return;
			}
			
			selectItemId = $('.trSelected',grid).find("td:first").eq(0).text()
			$.ajax({
				url: webroot+'/commonbiz/tztgAC!checkFile.action?id='+selectItemId,
				type: 'POST',
				dataType: 'json',
				
				error: function(){
					
				},
				success: function(data){
					if(data.info=='1'){
				       alert("文件不存在，请检查!");}else {
				       window.location=webroot+'/commonbiz/tztgAC!downloadFile.action?id='+selectItemId;
				       }
					}
			});
			
		}	
		else if (com=='编辑')
		{   selectItemId = $('.trSelected',grid).find("td:first").eq(0).text()
			if(selectItemId==''){
				alert("请选择要修改的数据项！");
				return;
			}else if($('.trSelected',grid).length>1){
			alert("请选择一项要修改的数据项！");
				return;
			
			}
			$.ajax({
	    	url: webroot+'/commonbiz/tztgAC!queryNoticeByID.action',
	    	data:'id='+selectItemId,
	    	type: 'POST',
		    dataType: 'json',
		    //timeout: 1000,
		    error: function(){
		       alert('Error loading XML document');
		    },
		    success: function(data){
		       if(data.tztg.sendStatus=='1'){
			  alert("通知已发送不能修改！")
			  parent.refreshGrid();
	        	window.close();
			}else{
				url=webroot+"/biz/common/tztg_edit.jsp";
            window.showModalDialog(url,window,'status:false;dialogWidth:450px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
		    	
		    	}
		    }
		});
			
		}else if (com=='查看')
		{   
		  selectItemId = $('.trSelected',grid).find("td:first").eq(0).text()
		    if(selectItemId==''){
				alert("请选择要查看的数据项！");
				return;
			}
			 if($('.trSelected',grid).length>1){
			alert("请选择一项要查看的数据项！");
				return;
			
			}
	    	 $.ajax({
	    	url: webroot+'/commonbiz/tztgAC!queryNoticeByID.action',
	    	data:'id='+selectItemId,
	    	type: 'POST',
		    dataType: 'json',
		    //timeout: 1000,
		    error: function(){
		       alert('Error loading XML document');
		    },
		    success: function(data){
		       if(data.tztg.sendStatus=='0'){
			  alert("通知未发送不能查看！");
			 
			}else{
			url=webroot+"/biz/common/tztg_view_list.jsp";
            window.showModalDialog(url,window,'status:false;dialogWidth:600px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
			}    }
		});
		  
		}	
	}
	
