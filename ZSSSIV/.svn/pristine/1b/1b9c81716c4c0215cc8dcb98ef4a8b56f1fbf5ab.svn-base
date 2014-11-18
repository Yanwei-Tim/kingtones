
//-------------------【定义ztree开始】----------------------------------------------------------------------
	var zTree1;
	var setting;
	setting = {
		checkable: false,
		async: true,
		asyncUrl: webroot+"/jq/psAC!findPulicSituation.action",  //获取节点数据的URL地址
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
	//节点单击事件
	function zTreeOnClick(event, treeId, treeNode) {
		//刷新flexgrid
		$("#flex1").flexOptions({params: [{ name:'treeNodeID', value:treeNode.id},{ name:'test1',value:"test1"}]}).flexReload();
	}
	
	
//----------------【定义flexgrid开始】--------------------------------------------------------------------------
	var addunit='none';
	var delunit ='none';
	var editunit='none';
	var outunit='none';
	var intounit='none';
	var getunit='none';
	
	var stime=null;
	 var str=document.cookie.split(";")
	 var temp;
	 var temp1;
	 var  i=0;
	 for(var i=0;i<str.length;i++){
		  temp = str[i];
		 if(temp.indexOf("ROLE_BUTTON")>=0){
			 temp1=temp.split("=")[1];
			 if(temp1.indexOf("addunit")>=0){
				 addunit='inline';
			 }
			 if(temp1.indexOf("delunit")>=0){
				 delunit='inline';
			 }
			 if(temp1.indexOf("editunit")>=0){
				 editunit='inline';
			 }
			 if(temp1.indexOf("outunit")>=0){
				 outunit='inline';
			 }
			 if(temp1.indexOf("intounit")>=0){
				 intounit='inline';
			 }
			 if(temp1.indexOf("getunit")>=0){
				 getunit='inline';
			 }
			 break;
		 }
	 }

	 $("#flex1").flexigrid(
	{
		url: webroot+'/jq/psUCAC!findJqUserCount.action',
		dataType: 'json',
		colModel : [
            {display: 'ID', name : 'id', width : 10, sortable : true, align: 'center',hide: true},
			{display: '警员姓名', name : 'name', width : 75, sortable : true, align: 'left'},
			{display: '警员账号', name : 'account', width : 80, sortable : true, align: 'left'},
			{display: '所属单位', name : 'org_name', width : 120, sortable : true, align: 'left'},
			{display: '受理警情次数', name : 'accept', width : 70, sortable : false, align: 'left'},
			{display: '处警到位次数', name : 'reach', width : 70, sortable : false, align: 'left'},
			{display: '处警完成次数', name : 'finish', width : 70, sortable : false, align: 'left'},
			{display: '统计起始日期', name : 'stime', width : 120, sortable : false, align: 'left'},
			{display: '统计结束日期', name : 'etime', width : 120, sortable : false, align: 'left'}
			],
//		buttons : [
//			//{name: '反选',  onpress : btn_even},
//			//{separator: true},
//			{name: '增加', onpress : btn_even,state:addunit},
//			{separator: true,sepstate:addunit},
//			{name: '修改', onpress : btn_even,state:editunit},
//			{separator: true,sepstate:editunit},
//			{name: '删除',  onpress : btn_even,state:delunit},
//			{separator: true,sepstate:delunit},
//			{name: 'Excel导出', onpress : btn_even,state:outunit},
//			{separator: true,sepstate:outunit},
//			{name: 'Excel导入', onpress : btn_even,state:intounit},
//			{separator: true,sepstate:intounit},
//			{name: '获取导入模板', onpress : btn_even,state:getunit},
//			{separator: true,sepstate:getunit}
//			],

		sortname: "iso",//排序字段
		sortorder: "asc",//顺序
		usepager: true,//是否启用分页，默认为false
		title: false,//'组织单元列表',
		useRp: true,//,是否可以动态设置每页显示的结果数 
		rp: 14,//每页显示记录数,默认为10 
		
		//title:'组织单位管理',
		showTableToggleBtn: true,
		resizable:false,  //窗口伸缩
		onSubmit: addFormData,
		width:800,
		height: 400,
		striped: true, //是否显示斑纹效果，默认是奇偶交互的形式
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
		else if (com=='删除')
		{
			if($('.trSelected',grid).length==0){
				alert("请选择要删除的项！");
				return;
			}else{
			 if(confirm('是否要删除该项！')){   
			 
			var delOrgans = $('.trSelected',grid).find("td:first").eq(0).text();
			for(var i=1;i<$('.trSelected',grid).find("td:first").length;i++){
				delOrgans+="split"+$('.trSelected',grid).find("td:first").eq(i).text();
			}
			$.ajax({
		    	url: webroot+'/jq/psAC!delJq.action',
		    	data:'delOrgans='+delOrgans,
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
			      alert("存在子节点，请先删除节点");
			      }else if(data.delInfo=='3'){
			       alert("存在后台用户，请先删除后台用户!");
			      }else if(data.delInfo=='4'){
			       alert("存在警务用户，请先删除警务用户!");
			      }
					
					refreshNode();
					refreshGrid();
			    }
			});}}
		}else if (com=='增加')
		{
			url=webroot+"/biz/jq/unit_add.jsp";
            window.showModalDialog(url,window,'status:false;dialogWidth:450px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
            //window.showModalDialog(url);
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
			url=webroot+"/biz/jq/unit_edit.jsp";
           window.showModalDialog(url,window,'status:false;dialogWidth:450px;dialogHeight:400px;dialogLeft:300px;dialogTop:230px;center:yes');
			
		}else if (com=='Excel导出')
		{  		
		  window.location=webroot+'/jq/psAC!excelDoOut.action?treeNodeID='+getSelectNodeId()
			
		}else if (com=='Excel导入')
		{ 
		  url=webroot+"/biz/jq/unit_import.jsp";
		
          window.open(url,'opendialog','width=460,height=410,top=230,left=300');
			
		}	else if (com=='获取导入模板')
		{

		}				
	}