//-------------------【定义ztree开始】----------------------------------------------------------------------		
	var zTree1;
	var setting;
	setting = {
		checkable: true,
		async: true,
		asyncUrl: webroot+"/biz/sysCodeListAC!querySystemResTreeNodes.action",  //获取节点数据的URL地址
		asyncParam: ["name", "id"],  //获取节点数据时，必须的数据名称，例如：id、name
		callback:{
			click:	zTreeOnClick
		}
	};	
	var zNodes =[];
	//整个树加载
	$(document).ready(function(){
		refreshTree();
	});
	//整个树刷新
	function refreshTree(){
		zTree1 = $("#unittree").zTree(setting, zNodes);
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
		//if(!getSelectNode())return null;
		if(!getSelectNode())return "0";
		else return getSelectNode().id;
	}

	//节点单击事件
	function zTreeOnClick(event, treeId, treeNode) {
	}
	
	var parent=this.dialogArguments;
	function close_btnSubmit(){
		parent.setColumns(getSelectNodeId(),type);
  		window.close();
	}
	function _btnSubmit(){
  		var tmp = zTree1.getCheckedNodes(true);
		var unitIDstr = "";
		var unitNamestr = "";
		for (var i=0; i<tmp.length; i++) {
			if(tmp[i].checkedOld != tmp[i].checked){
				unitIDstr+= tmp[i].id+",";
				unitNamestr+= tmp[i].name+ ",";
			}
		}
		if(unitIDstr!=""){unitIDstr=unitIDstr.substr(0,unitIDstr.length-1);}
  		parent.setColumns(unitIDstr,type);
  		window.close();
  	}