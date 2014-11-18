
//-------------------【定义ztree开始】----------------------------------------------------------------------	
	var roleTree;
	var roleTreeSet;
	
	roleTreeSet = {
		checkable: true,
		async: true,
		asyncUrl: webroot+"/platform/roleAC!queryRoleTreeNodes.action",  //获取节点数据的URL地址
		asyncParam: ["name", "id"],  //获取节点数据时，必须的数据名称，例如：id、name
		callback:{
			click:	roleTreeOnClick
		}
	};	
	var roleTreeNodes =[];
	//整个树加载
	$(document).ready(function(){
		//roleTreeSet.asyncParamOther = ["test1","tr1","test2","tr2"];//传参测试
		roleTree = $("#roletree").zTree(roleTreeSet, roleTreeNodes);
	});
	
	//整个树刷新
	function refreshTree(){
		roleTree = $("#roletree").zTree(roleTreeSet, roleTreeNodes);
	}
	//选中节点刷新
	function refreshNode(){
		var treeNode = getSelectNode();
		if(!treeNode){
			refreshTree();
		}else{
			roleTree.reAsyncChildNodes(treeNode, "refresh");
		}
	}
	//获取选中节点
	function getSelectNode(){
		return roleTree.getSelectedNode();
	}
	//获取选中节点id
	function getSelectNodeId(){
		if(!getSelectNode())return null;
		else return getSelectNode().id;
	}
	//节点单击事件
	function roleTreeOnClick(event, treeId, treeNode) {
		
	}
	var parent=this.dialogArguments;
	function _btnSubmit(){
  		var tmp = roleTree.getCheckedNodes(true);
		var roleIDstr = "";
		var roleNamestr = "";
		for (var i=0; i<tmp.length; i++) {
			if(tmp[i].checkedOld != tmp[i].checked){
				roleIDstr+= tmp[i].id + "split";
				roleNamestr+= tmp[i].name+ ",";
			}
		}
  		parent.setRoleID(roleIDstr);
  		parent.setRoleName(roleNamestr);
  		window.close();
  	}
	
	

