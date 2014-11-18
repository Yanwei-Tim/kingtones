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
		$("#flex1").flexOptions({params: [{ name:'unitID', value:treeNode.id},{ name:'test1',value:"test1"}]}).flexReload();
	}

	
//----------------【定义flexgrid开始】--------------------------------------------------------------------------
	var addlaw='none';
	var editlaw='none';
	var dellaw ='none';
	 var str=document.cookie.split(";")
	 var temp;
	 var temp1;
	 var  i=0;
	 for(var i=0;i<str.length;i++){
		  temp = str[i];
		 if(temp.indexOf("ROLE_BUTTON")>=0){
			 temp1=temp.split("=")[1];
			 if(temp1.indexOf("editlaw")>=0){
				 editlaw='inline';
			 }
			 if(temp1.indexOf("addlaw")>=0){
				 addlaw='inline';
			 }
			 if(temp1.indexOf("dellaw")>=0){
				 dellaw='inline';
			 }
			 break;
		 }
	 }
	$("#flex1").flexigrid(
	{
		url: webroot+'/manage/lawAC!queryLawList.action',
		//url: webroot+'/manage/addressAC!queryJwUserListByXzqh.action',
		dataType: 'json',
		colModel : [
			{display: '法规ID', name : 'LAW_ID', width : 40, sortable : true, align: 'center',hide: true},
			{display: '法规代码', name : 'LAW_CODE', width : 50, sortable : true, align: 'left'},
			{display: '法规名称', name : 'LAW_NAME', width : 50, sortable : true, align: 'left'},
			{display: '颁布事件', name : 'ADMINISTRATION', width : 200, sortable : false, align: 'left'},
			{display: '法规内容', name : 'IRREGULARITYACTION', width : 200, sortable : false, align: 'left'},
			{display: '法规类型', name : 'LAW_TYPE', width : 45, sortable : false, align: 'left'}
			],
		buttons : [
			//{name: '反选',  onpress : btn_even},
			//{separator: true},
			{name: '增加',  onpress : btn_even,state:addlaw},
			{separator: true,sepstate:addlaw},
			{name: '修改', onpress : btn_even,state:editlaw},
			{separator: true,sepstate:editlaw},
			{name: '删除', onpress : btn_even,state:dellaw},
			{separator: true,sepstate:dellaw}
			//{name: 'Excel导出', onpress : btn_even},
			//{separator: true},
			//{name: 'Excel导入', onpress : btn_even},
			//{separator: true},
			//{name: '获取模板', onpress : btn_even},
			//{separator: true}
			],
		searchitems : [
			{display: '法规代码', name : 'LAW_CODE' , isdefault: true},
			{display: '法规名称', name : 'LAW_NAME'},
			{display: '法规类型', name : 'LAW_TYPE' , isdefault: true}
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
		$('#flex1').flexOptions({params: [{ name: 'null', value: 'null'}]}).flexReload();
	}	
	
var selectItemId;
	function btn_even(com,grid){
		if(com=='反选'){
			$('tr',grid).toggleClass('trSelected'); 
		}
		else if (com=='增加')
		{
			
			url=webroot+"/biz/manage/lawManage/law_add.jsp";
         window.open(url,'opendialog','width=460,height=410,top=230,left=300');
			
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
			url=webroot+"/biz/manage/lawManage/law_edit.jsp";
         window.open(url,'opendialog','width=460,height=410,top=230,left=300');
			
		}else if (com=='删除')
		{
			if($('.trSelected',grid).length==0){
				alert("请选择要删除的数据项！");
				return;
			}
			else{
			 if(confirm('是否要删除该项！')){  
			var addIds = $('.trSelected',grid).find("td:first").eq(0).text();
			for(var i=1;i<$('.trSelected',grid).find("td:first").length;i++){
				addIds+="split"+$('.trSelected',grid).find("td:first").eq(i).text();
			}
			$.ajax({
		    	url: webroot+'/manage/lawAC!delLawByLawID.action',
		      data:'addID='+addIds,
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
		{   window.location=webroot+'/manage/lawAC!excelDoOut.action'
			
		}	else if (com=='Excel导入')
		{ 
		url=webroot+"/biz/manage/lawMang/law_import.jsp";
        window.open(url,'opendialog','width=460,height=410,top=230,left=300');
			
		}	else if (com=='获取模板')
		{
		window.location=webroot+'/manage/lawAC!ExcelTemp.action'
			
		}		
								
	}
