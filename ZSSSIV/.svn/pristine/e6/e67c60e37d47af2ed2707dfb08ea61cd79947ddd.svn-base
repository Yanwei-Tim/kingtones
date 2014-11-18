//-------------------【定义ztree开始】----------------------------------------------------------------------	
	var zTree1;
	var setting;
	setting = {
		checkable: false,
		async: true,
		asyncUrl: webroot+"/platform/menuAC!queryMenuTreeNodes.action",  //获取节点数据的URL地址
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
	
	var addmenu='none';
	var delmenu ='none';
	var editmenu='none';
	var regbutton='none';
	 var str=document.cookie.split(";")
	 var temp;
	 var temp1;
	 var  i=0;
	 for(var i=0;i<str.length;i++){
		  temp = str[i];
		 if(temp.indexOf("ROLE_BUTTON")>=0){
			 temp1=temp.split("=")[1];
			 if(temp1.indexOf("addmenu")>=0){
				 addmenu='inline';
			 }
			 if(temp1.indexOf("delmenu")>=0){
				 delmenu='inline';
			 }
			 if(temp1.indexOf("editmenu")>=0){
				 editmenu='inline';
			 }
			 if(temp1.indexOf("regbutton")>=0){
				 regbutton='inline';
			 }
			 break;
		 }
	 }
	$("#flex1").flexigrid(
	{
		url: webroot+'/platform/menuAC!queryMenuGridList.action',
		dataType: 'json',
		colModel : [
			{display: '菜单编号', name : 'menu_id', width : 40, sortable : true, align: 'center',hide: true},
			{display: '菜单名称', name : 'menu_name', width : 180, sortable : true, align: 'left'},
			{display: '页面', name : 'menu_res', width : 500, sortable : false, align: 'left'},
			{display: '资源编号', name : 'menu_resid', width : 40, sortable : true, align: 'center',hide: true},
			{display: '按钮名称', name : 'button_name', width : 40, sortable : true, align: 'center',hide: true}
			],
		buttons : [
			{name: '增加',  onpress : btn_even,state:addmenu},
			{separator: true,sepstate:addmenu},
			{name: '修改',  onpress : btn_even,state:editmenu},
			{separator: true,sepstate:editmenu},
			{name: '删除',  onpress : btn_even,state:delmenu},
			{separator: true,sepstate:delmenu},
			{name: '注册按钮', onpress : btn_even,state:regbutton},
			{separator: true,sepstate:regbutton}
			],
		searchitems : [
			
			{display: '菜单名称', name : 'menu_name', isdefault: true}
			],
		//sortname: "iso",
		//sortorder: "asc",
		usepager: true,
		useRp: true,
		rp: 10,
		//title:'组织菜单管理',
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
		}else if (com=='删除')
		{
			if($('.trSelected',grid).length==0){
				alert("请选择要删除的项！");
				return;
			}
			else{
			 if(confirm('是否要删除该项！')){
			var delMenus = $('.trSelected',grid).find("td:first").eq(0).text();
			var delResource= $('.trSelected',grid).find("td:last").eq(0).text();
			
			for(var i=1;i<$('.trSelected',grid).find("td:first").length;i++){
				delMenus+="split"+$('.trSelected',grid).find("td:first").eq(i).text();
				delResource+="split"+$('.trSelected',grid).find("td:last").eq(i).text();
			}
			$.ajax({
		    	url: webroot+'/platform/menuAC!delMenuList.action',
		    	 data:'delMenus='+delMenus+'&&delResource='+delResource,
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
			      alert("存在子节点，请先删除节点!");
			      }
					
					refreshNode();
					refreshGrid();
			    }
			});}}
		}else if (com=='增加')
		{
			url=webroot+"/platform/auth/menu_add.jsp";
            var newWin=window.showModalDialog(url,window,'status:false;dialogWidth:450px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
			newWin.open();
		}	
		else if (com=='修改')
		{
			selectItemId = $('.trSelected',grid).find("td:first").eq(0).text()
			if(selectItemId==''){
				alert("请选择要修改的数据项！");
				return;
			}else if($('.trSelected',grid).length>1){
			alert("请选择一项要修改的数据项！");
				return;
			
			}
			url=webroot+"/platform/auth/menu_edit.jsp";
          var newWin=window.showModalDialog(url,window,'status:false;dialogWidth:400px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
			newWin.open();
		}else if(com=='注册按钮'){
			selectItemId = $('.trSelected',grid).find("td:first").eq(0).text()
			if(getSelectNodeId()==null||getSelectNodeId()==''){
				alert("不能在主菜单下注册按钮！");
				return;
			}else if(selectItemId==''){
				alert("请选择要注册按钮的菜单！");
				return;
			}else if($('.trSelected',grid).length>1){
				alert("请选择一项要注册按钮的菜单！");
				return;
			
			}
			url=webroot+"/platform/auth/button_add.jsp";
          	var newWin=window.showModalDialog(url,window,'status:false;dialogWidth:400px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
			newWin.open();
		}		
	}
