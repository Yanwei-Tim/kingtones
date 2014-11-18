//-------------------【定义ztree开始】----------------------------------------------------------------------	
	var zTree1;
	var setting;
	setting = {
		checkable: false,
		async: true,
		asyncUrl: webroot+"/platform/unitAC!queryUnitTreeNodes.action",  //获取节点数据的URL地址
		asyncParam: ["name", "id","xzqh"],  //获取节点数据时，必须的数据名称，例如：id、name
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

	var unlockjwuser='none';
	 var str=document.cookie.split(";")
	 var temp;
	 var temp1;
	 var  i=0;
	 for(var i=0;i<str.length;i++){
		  temp = str[i];
		 if(temp.indexOf("ROLE_BUTTON")>=0){
			 temp1=temp.split("=")[1];			
			 if(temp1.indexOf("unlockjwuser")>=0){
				 unlockjwuser='inline';
			 }
			 break;
		 }
	 }
	$("#flex1").flexigrid(
	{
		url: webroot+'/dw/jwUserDisplayAC!queryGpsDisplay.action',
		dataType: 'json',
		colModel : [		           
			{display: '用户编号', name : 'id', width : 100, sortable : true, align: 'center',hide: true},
			{display: '登录账号', name : 'account', width : 120, sortable : true, align: 'left'},
			{display: '用户姓名', name : 'name', width : 125, sortable : true, align: 'left'},
			{display: '部门', name : 'unit_name', width : 175, sortable : true, align: 'left'},
			{display: '警种', name : 'jz', width : 140, sortable : true, align: 'left'},
			{display: 'GPS显示状态', name : 'display', width : 160, sortable : false, align: 'center'}
			],
		buttons : [
		    {name: '<b><font color=green>点击修改GPS显示状态</font></b>', onpress : btn_even,state:unlockjwuser},
			{separator: true,sepstate:unlockjwuser}
			],
		searchitems : [
			
			{display: '登录账号', name : 'account'},
			{display: '用户姓名', name : 'name' , isdefault: true},			
			
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
		$('#flex1').flexOptions({params: [{ name: 'unitID', value: getSelectNodeId()},{ name: 'xzqh', value: getSelectNodeXzqh()}]}).flexReload();
	}	
	
	var selectItemId;
	function btn_even(com,grid){
		if(com=='反选'){
			$('tr',grid).toggleClass('trSelected'); 
		}
		else if (com=='<b><font color=green>点击修改GPS显示状态</font></b>')
		{
			selectItemId = $('.trSelected',grid).find("td:first").eq(0).text();
			for(var i=1;i<$('.trSelected',grid).find("td:first").length;i++){
				selectItemId+="split"+$('.trSelected',grid).find("td:first").eq(i).text();
			}
			if(selectItemId==''){
				if(confirm('确认批量设置？')){
					if(getSelectNodeXzqh()== null){
						alert('请选择警员');
						return;
					}
					url=webroot+"/biz/dw/jwgps_add.jsp";
          window.showModalDialog(url,window,'status:false;dialogWidth:450px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
					return;
				}
			}else if($('.trSelected',grid).length>1){
				if(confirm('确认批量设置？')){
					url=webroot+"/biz/dw/jwgps_add.jsp";
          window.showModalDialog(url,window,'status:false;dialogWidth:450px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
					return;
				}
			}else{
				url=webroot+"/biz/dw/jwgps_add.jsp";
          window.showModalDialog(url,window,'status:false;dialogWidth:450px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
			}
			
		}		
								
	}
