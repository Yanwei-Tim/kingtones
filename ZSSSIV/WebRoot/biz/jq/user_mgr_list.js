//-------------------【定义ztree开始】----------------------------------------------------------------------	
	var zTree1;
	var setting;
	setting = {
		checkable: false,
		async: true,
		asyncUrl: webroot+"/jq/psAC!findPulicSituation.action",  //获取节点数据的URL地址
		asyncParam: ["name", "id"],  //获取节点数据时，必须的数据名称，例如：id、name
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
		$("#flex1").flexOptions({params: [{ name:'treeNodeID', value:treeNode.id},{ name:'xzqh', value:treeNode.xzqh},{ name:'test1',value:"test1"}]}).flexReload();
	}
	
	//----------------【定义flexgrid开始】--------------------------------------------------------------------------
		var addjwuser='none';
		var deljwuser ='none';
		var editjwuser='none';
		var outjwuser='none';
		var intojwuser='none';
		var getjwuser='none';
		var onlinejwuser='none';
		var lockedjwuser='none';
		var unlockjwuser='none';
		 var str=document.cookie.split(";")
		 var temp;
		 var temp1;
		 var  i=0;
		 for(var i=0;i<str.length;i++){
			  temp = str[i];
			 if(temp.indexOf("ROLE_BUTTON")>=0){
				 temp1=temp.split("=")[1];
				 if(temp1.indexOf("addjwuser")>=0){
					 addjwuser='inline';
				 }
				 if(temp1.indexOf("deljwuser")>=0){
					 deljwuser='inline';
				 }
				 if(temp1.indexOf("editjwuser")>=0){
					 editjwuser='inline';
				 }
				 if(temp1.indexOf("outjwuser")>=0){
					 outjwuser='inline';
				 }
				 if(temp1.indexOf("intojwuser")>=0){
					 intojwuser='inline';
				 }
				 if(temp1.indexOf("getjwuser")>=0){
					 getjwuser='inline';
				 }
				 if(temp1.indexOf("onlinejwuser")>=0){
					 onlinejwuser='inline';
				 }
				 if(temp1.indexOf("lockedjwuser")>=0){
					 lockedjwuser='inline';
				 }
				 if(temp1.indexOf("unlockjwuser")>=0){
					 unlockjwuser='inline';
				 }
				 break;
			 }
		 }
		$("#flex1").flexigrid(
		{ //
			url: webroot+'/jq/psUserAC!queryJqGridData.action',
			dataType: 'json',
			colModel : [
                {display: 'ID', name : 'id', width : 40, sortable : true, align: 'center',hide: true},
				{display: '警员编号', name : 'code', width : 100, sortable : true, align: 'left'},
				{display: '姓名', name : 'name', width : 80, sortable : true, align: 'left'},
				{display: '警员账号', name : 'account', width : 120, sortable : true, align: 'left'},
				{display: '所属单位', name : 'org_name', width : 200, sortable : false, align: 'left'},
				{display: '通传状态(0:关闭 1:接收)', name : 'status', width : 150, sortable : false, align: 'left'},
				{display: '排序码', name : 'sort', width : 100, sortable : false, align: 'left'}
				],
			buttons : [
				//{name: '反选',  onpress : btn_even},
				//{separator: true},
				{name: '增加',  onpress : btn_even,state:addjwuser},
				{separator: true,sepstate:addjwuser},
				{name: '修改', onpress : btn_even,state:editjwuser},
				{separator: true,sepstate:editjwuser},
				{name: '删除', onpress : btn_even,state:deljwuser},
				{separator: true,sepstate:editjwuser},
				{name: 'Excel导出', onpress : btn_even,state:outjwuser},
				{separator: true,sepstate:outjwuser},
				{name: 'Excel导入', onpress : btn_even,state:intojwuser},
				{separator: true,sepstate:intojwuser},
				{name: '获取导入模板', onpress : btn_even,state:getjwuser},
				{separator: true,sepstate:getjwuser}
//				{name: '在线用户统计', onpress : btn_even,state:onlinejwuser},
//				{separator: true,sepstate:onlinejwuser},
//				
//				{name: '销毁账户', onpress : btn_even,state:lockedjwuser},
//				{separator: true,sepstate:lockedjwuser},
//				{name: '解除锁定', onpress : btn_even,state:unlockjwuser},
//				{separator: true,sepstate:unlockjwuser},
//			    {name: 'GPS设置', onpress : btn_even,state:unlockjwuser},
//				{separator: true,sepstate:unlockjwuser}
				],
			searchitems : [
			    {display: '警员姓名', name : 'name' , isdefault: true},
				{display: '警员账号', name : 'account'},
				
				{display: '警员编码', name : 'code'},
				
				],
			sortname: "iso",
			sortorder: "asc",
			usepager: true,
			useRp: true,
			rp: 15,
			//title:'组织人员管理',
			showTableToggleBtn: true,
			resizable:false,  //窗口伸缩
			onSubmit: addFormData,
			width:800,
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
	var selectItemId;
		function btn_even(com,grid){
			if(com=='反选'){
				$('tr',grid).toggleClass('trSelected'); 
			}
			else if (com=='增加')
			{
				if(!getSelectNode()){
					alert("请选择单位！");
					return ;
				}
				url=webroot+"/biz/jq/user_add.jsp";
	          window.showModalDialog(url,window,'status:false;dialogWidth:500px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
				
			}	
			else if (com=='修改')
			{
				selectItemId = $('.trSelected',grid).find("td:first").eq(0).text();
				if(selectItemId==''){
					alert("请选择要修改的数据项！");
					return;
				}else if($('.trSelected',grid).length>1){
				alert("请选择一项要修改的数据项！");
					return;
				
				}
				url=webroot+"/biz/jq/user_edit.jsp";
	          window.showModalDialog(url,window,'status:false;dialogWidth:450px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
				
			}else if (com=='删除')
			{
				if($('.trSelected',grid).length==0){
					alert("请选择要删除的数据项！");
					return;
				}
				else{
				 if(confirm('是否要删除该项！')){  
				var userIds = $('.trSelected',grid).find("td:first").eq(0).text();
				for(var i=1;i<$('.trSelected',grid).find("td:first").length;i++){
					userIds+="split"+$('.trSelected',grid).find("td:first").eq(i).text();
				}
				$.ajax({
			    	url: webroot+'/jq/psUserAC!delJqUser.action',
			      data:'userIds='+userIds,
			    	type: 'POST',
				    dataType: 'json',
				  //  timeout: 1000,
				    error: function(){
						alert("删除失败");
				    },
				    success: function(data){
			    	 if(data.delInfo=='1'){
					      alert("删除成功！");
					      }else if(data.delInfo=='2'){
					      alert("该警员下存在处警信息，请先删除该处警信息");
					      }
				       
						refreshGrid();
				    }
				});}}
			}	else if (com=='Excel导出')
			{   
				window.location=webroot+'/jq/psUserAC!excelDoOut.action?treeNodeID='+getSelectNodeId()				
				
			}	else if (com=='Excel导入')
			{ 
			url=webroot+"/biz/jq/user_import.jsp";
	        window.open(url,'opendialog','width=460,height=410,top=230,left=300');
				
			}	else if (com=='获取导入模板')
			{
			window.location=webroot+'/jq/psUserAC!ExcelTemp.action'
			}else if (com=='在线用户统计')
			{
			url=webroot+"/biz/xajw/jwuserOnline_mgr_list.jsp";
	         window.open(url,'opendialog','width=600,height=600,top=230,left=300');
			}else if (com=='销毁账户')
			{
				if($('.trSelected',grid).length==0){
					alert("请选择要销毁的账户！");
					return;
				}
				else{
				 if(confirm('确定销毁？')){  
				var userIds = $('.trSelected',grid).find("td:first").eq(0).text();
				for(var i=1;i<$('.trSelected',grid).find("td:first").length;i++){
					userIds+="split"+$('.trSelected',grid).find("td:first").eq(i).text();
				}
				$.ajax({
			    	url: webroot+'/xajw/jwUserAC!lockJwUser.action',
			      data:'userIds='+userIds,
			    	type: 'POST',
				    dataType: 'json',
				  //  timeout: 1000,
				    error: function(){
						alert("操作失败");
				    },
				    success: function(data){
				        alert("操作成功");
						refreshGrid();
				    }
				});}}
			}else if (com=='解除锁定')
			{	if($('.trSelected',grid).length==0){
					alert("请选择要解除锁定的账户！");
					return;
				}
				else{
				 if(confirm('确定解除锁定？')){  
				var userIds = $('.trSelected',grid).find("td:first").eq(0).text();
				for(var i=1;i<$('.trSelected',grid).find("td:first").length;i++){
					userIds+="split"+$('.trSelected',grid).find("td:first").eq(i).text();
				}
				$.ajax({
			    	url: webroot+'/xajw/jwUserAC!unlockJwUser.action',
			      data:'userIds='+userIds,
			    	type: 'POST',
				    dataType: 'json',
				  //  timeout: 1000,
				    error: function(){
						alert("操作失败");
				    },
				    success: function(data){
				        alert("操作成功");
						refreshGrid();
				    }
				});}}
			}else if (com=='GPS设置')
			{
			
			//hanliqiang 修改
				selectItemId = $('.trSelected',grid).find("td:first").eq(0).text();
				for(var i=1;i<$('.trSelected',grid).find("td:first").length;i++){
					selectItemId+="split"+$('.trSelected',grid).find("td:first").eq(i).text();
				}
				if(selectItemId==''){
					if(confirm('确认批量设置？')){
						if(getSelectNodeXzqh()== null){
							alert('请选择单位');
							return;
						}
						url=webroot+"/biz/xajw/jwgps_add.jsp";
	          window.showModalDialog(url,window,'status:false;dialogWidth:450px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
						return;
					}
				}else if($('.trSelected',grid).length>1){
					if(confirm('确认批量设置？')){
						url=webroot+"/biz/xajw/jwgps_add.jsp";
	          window.showModalDialog(url,window,'status:false;dialogWidth:450px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
						return;
					}
				}else{
					url=webroot+"/biz/xajw/jwgps_add.jsp";
	          window.showModalDialog(url,window,'status:false;dialogWidth:450px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
				}
				
			}		
									
		}
