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
	//获取选中节点xzqh
	function getSelectNodeXzqh(){
		if(!getSelectNode())return null;
		else return getSelectNode().xzqh;
	}
	//节点单击事件
	function zTreeOnClick(event, treeId, treeNode) {
		//刷新flexgrid
		$("#flex1").flexOptions({params: [{ name:'unitID', value:treeNode.id},{ name:'xzqh', value:treeNode.xzqh},{ name:'test1',value:"test1"}]}).flexReload();
	}
	
	
//----------------【定义flexgrid开始】--------------------------------------------------------------------------
	$("#flex1").flexigrid(
	{
		url: webroot+'/xajw/jwUserAC!queryJwUserList.action',
		dataType: 'json',
		colModel : [
		
			{display: '用户编号', name : 'id', width : 100, sortable : true, align: 'center',hide: true},
			{display: '登录账号', name : 'account', width : 100, sortable : true, align: 'left'},
			{display: '用户姓名', name : 'name', width : 100, sortable : true, align: 'left'},
			{display: '性别', name : 'xb', width : 50, sortable : true, align: 'center'},
			{display: '手机号码', name : 'sjhm', width : 100, sortable : true, align: 'left'},
			{display: '加密卡号', name : 'jmkh', width : 100, sortable : false, align: 'left'}
			
			
			],
		buttons : [
			//{name: '反选',  onpress : btn_even},
			//{separator: true},
			//{name: '增加',  onpress : btn_even},
			//{separator: true},
			//{name: '修改', onpress : btn_even},
			//{separator: true},
			//{name: '删除', onpress : btn_even},
			//{separator: true},
			//{name: 'Excel导出', onpress : btn_even},
			//{separator: true},
			//{name: 'Excel导入', onpress : btn_even},
			//{separator: true},
			//{name: '获取模板', onpress : btn_even},
			//{separator: true},
			//{name: '在线用户统计', onpress : btn_even},
			//{separator: true}
		
			],
		searchitems : [
			
			{display: '登录账号', name : 'account' , isdefault: true},
			{display: '用户姓名', name : 'name'},
			{display: '手机号码', name : 'sjhm'}
			//{display: '手机串码', name : 'sjcm'},
			//{display: '警种', name : 'jz'},
		    //{display: '描述信息', name : 'description'}
			
			],
		sortname: "iso",
		sortorder: "asc",
		usepager: true,
		useRp: true,
		rp: 10,
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
		$('#flex1').flexOptions({params: [{ name: 'unitID', value: getSelectNodeId()},{ name: 'xzqh', value: getSelectNodeXzqh()}]}).flexReload();
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
			url=webroot+"/biz/xajw/jwuser_add.jsp";
          window.showModalDialog(url,window,'status:false;dialogWidth:450px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
			
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
			url=webroot+"/biz/xajw/jwuser_edit.jsp";
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
		    	url: webroot+'/xajw/jwUserAC!delJwUser.action',
		      data:'userIds='+userIds,
		    	type: 'POST',
			    dataType: 'json',
			  //  timeout: 1000,
			    error: function(){
					alert("删除失败");
			    },
			    success: function(data){
			        alert("删除成功");
					refreshGrid();
			    }
			});}}
		}	else if (com=='Excel导出')
		{   window.location=webroot+'/xajw/jwUserAC!excelDoOut.action'
			
		}	else if (com=='Excel导入')
		{ 
		url=webroot+"/biz/xajw/jwuser_import.jsp";
        window.open(url,'opendialog','width=460,height=410,top=230,left=300');
			
		}	else if (com=='获取模板')
		{
		window.location=webroot+'/xajw/jwUserAC!ExcelTemp.action'
			
		}else if (com=='在线用户统计')
		{
		url=webroot+"/biz/xajw/jwuserOnline_mgr_list.jsp";
         window.open(url,'opendialog','width=460,height=1000,top=230,left=300');
			
		}		
								
	}
