//-------------------【定义ztree开始】----------------------------------------------------------------------	
	var zTree1;
	var setting;
	/**
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
	*/
	
//----------------【定义flexgrid开始】--------------------------------------------------------------------------
	var addres='none';
	var delres ='none';
	var editres='none';
	var outres='none';
	var intores='none';
	var getres='none';
	 var str=document.cookie.split(";")
	 var temp;
	 var temp1;
	 var  i=0;
	 for(var i=0;i<str.length;i++){
		  temp = str[i];
		 if(temp.indexOf("ROLE_BUTTON")>=0){
			 temp1=temp.split("=")[1];
			 if(temp1.indexOf("addres")>=0){
				 addres='inline';
			 }
			 if(temp1.indexOf("delres")>=0){
				 delres='inline';
			 }
			 if(temp1.indexOf("editres")>=0){
				 editres='inline';
			 }
			 if(temp1.indexOf("outres")>=0){
				 outres='inline';
			 }
			 if(temp1.indexOf("intores")>=0){
				 intores='inline';
			 }
			 if(temp1.indexOf("getres")>=0){
				 getres='inline';
			 }
			 break;
		 }
	 }
	$("#flex1").flexigrid(
	{
		
		url: webroot+'/manage/addressAC!queryAddressList.action',
		//url: webroot+'/manage/addressAC!queryJwUserListByXzqh.action',
		dataType: 'json',
		colModel : [
			{display: '通讯录编号', name : 'ADDID', width : 40, sortable : true, align: 'center',hide: true},
			{display: '姓名', name : 'NAME', width : 50, sortable : true, align: 'left'},
			{display: '单位编号', name : 'DEPTID', width : 50, sortable : true, align: 'left'},
			{display: '手机', name : 'MOBILE', width : 80, sortable : false, align: 'left'},
			{display: '单位电话', name : 'UNITTEL', width : 80, sortable : false, align: 'left'},
			{display: '家庭电话', name : 'HOMETEL', width : 80, sortable : false, align: 'left'},
			{display: '职务', name : 'DUTY', width : 60, sortable : false, align: 'left'},
			{display: '邮箱', name : 'EMAIL', width : 120, sortable : false, align: 'left'},
			{display: '备注', name : 'REMARK', width : 160, sortable : false, align: 'left'}
			],
		buttons : [
			//{name: '反选',  onpress : btn_even},
			//{separator: true},
			{name: '增加',  onpress : btn_even,state:addres},
			{separator: true,sepstate:addres},
			{name: '修改', onpress : btn_even,state:editres},
			{separator: true,sepstate:editres},
			{name: '删除', onpress : btn_even,state:delres},
			{separator: true,sepstate:delres},
			{name: 'Excel导出', onpress : btn_even,state:outres},
			{separator: true,sepstate:outres},
			{name: 'Excel导入', onpress : btn_even,state:intores},
			{separator: true,sepstate:intores},
			{name: '获取模板', onpress : btn_even,state:getres},
			{separator: true,sepstate:getres}
			],
		searchitems : [
			{display: '姓名', name : 'NAME' , isdefault: true},
			{display: '单位编号', name : 'DEPTID'},
			{display: '手机', name : 'MOBILE' , isdefault: true},
			{display: '单位电话', name : 'UNITTEL' , isdefault: true},
			{display: '家庭电话', name : 'HOMETEL' , isdefault: true},
			{display: '职务', name : 'DUTY' , isdefault: true},
			{display: '邮箱', name : 'EMAIL' , isdefault: true}
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
			
			url=webroot+"/biz/manage/address/address_add.jsp";
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
			url=webroot+"/biz/manage/address/address_edit.jsp";
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
		    	url: webroot+'/manage/addressAC!delAddressByAddID.action',
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
		{   window.location=webroot+'/manage/addressAC!excelDoOut.action'
			
		}	else if (com=='Excel导入')
		{ 
		url=webroot+"/biz/manage/address/address_import.jsp";
        window.open(url,'opendialog','width=460,height=410,top=230,left=300');
			
		}	else if (com=='获取模板')
		{
		window.location=webroot+'/manage/addressAC!ExcelTemp.action'
			
		}	
								
	}
