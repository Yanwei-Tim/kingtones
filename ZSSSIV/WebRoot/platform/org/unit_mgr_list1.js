//-------------------【定义ztree开始】----------------------------------------------------------------------	
	var zTree1;
	var setting;
	setting = {
		checkable: false,
		async: true,
		asyncUrl: webroot+"/platform/unitAC!queryUnitTreeNodes.action",  //获取节点数据的URL地址
		asyncParam: ["name", "id"],  //获取节点数据时，必须的数据名称，例如：id、name
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
		$("#flex1").flexOptions({params: [{ name:'treeNodeID', value:treeNode.id},{ name:'test1',value:"test1"}]}).flexReload();
	}
	
	
//----------------【定义flexgrid开始】--------------------------------------------------------------------------
	$("#flex1").flexigrid(
	{
		url: webroot+'/platform/unitAC!queryUnitGridData.action',
		dataType: 'json',
		colModel : [
			{display: '单元编号', name : 'unit_id', width : 40, sortable : true, align: 'center',hide: true},
			{display: '单元名称', name : 'unit_name', width : 180, sortable : true, align: 'left'},
			{display: '描述信息', name : 'unit_desc', width : 500, sortable : false, align: 'left'}
			],
		buttons : [
			{name: '返选',  onpress : btn_even},
			{separator: true},
			{name: '增加', onpress : btn_even},
			{separator: true},
			{name: '修改', onpress : btn_even},
			{separator: true},
			{name: '删除',  onpress : btn_even},
			{separator: true}
			],
		searchitems : [
			{display: '编号', name : 'iso'},
			{display: '名称', name : 'name', isdefault: true}
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
		if(com=='返选'){
			$('tr',grid).toggleClass('trSelected'); 
		}
		else if (com=='删除')
		{
			if($('.trSelected',grid).length==0){
				alert("请选择要删除的项！");
				return;
			}
			var delUnits = $('.trSelected',grid).find("td:first").eq(0).text();
			for(var i=1;i<$('.trSelected',grid).find("td:first").length;i++){
				delUnits+="split"+$('.trSelected',grid).find("td:first").eq(i).text();
			}
			$.ajax({
		    	url: webroot+'/platform/unitAC!delUnit.action?delUnits='+delUnits,
		    	type: 'POST',
			    dataType: 'json',
			    //timeout: 1000,
			    error: function(){
					alert("删除失败");
			    },
			    success: function(data){
					alert(data.delInfo);
					refreshNode();
					refreshGrid();
			    }
			});
		}else if (com=='增加')
		{
			url=webroot+"/platform/org/unit_add.jsp";
            window.open(url,'','width=460,height=260,top=230,left=300');
            //window.showModalDialog(url);
		}	
		else if (com=='修改')
		{
			selectItemId = $('.trSelected',grid).find("td:first").eq(0).text()
			if(selectItemId==''){
				alert("请选择要修改的数据项！");
				return;
			}
			url=webroot+"/platform/org/unit_edit.jsp";
            window.open(url,'','width=460,height=260,top=230,left=300');
		}			
	}
