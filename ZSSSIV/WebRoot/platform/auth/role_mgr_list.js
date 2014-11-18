
//-------------------【定义ztree开始】----------------------------------------------------------------------	
	var roleTree;
	var roleTreeSet;
	var menuTree;
	var menuTreeSet;
	
	//var menuTree3;
	//var menuTreeSet3;
	
	roleTreeSet = {
		checkable: false,
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
	
	menuTreeSet = {
		checkable: true,
		checkType : { "Y": "ps", "N": "s" },
		async: true,
		asyncUrl: webroot+"/platform/roleAC!queryMenusByRoleID.action",  //获取节点数据的URL地址
		asyncParam: ["name", "id","resourceId"],  //获取节点数据时，必须的数据名称，例如：id、name
		asyncParamOther: ["treeType",true], //其它参数 ( key, value 键值对格式)
		callback:{
			beforeChange: menuTreeBeforeChange
		}
	};	
	var menuTreeNodes =[];
	//整个树加载
	$(document).ready(function(){
		//roleTreeSet.asyncParamOther = ["test1","tr1","test2","tr2"];//传参测试
		menuTree = $("#menutree2").zTree(menuTreeSet, menuTreeNodes);
	});
	
	/*
	menuTreeSet3 = {
		checkable: true,
		async: true,
		asyncUrl: webroot+"/platform/roleAC!queryMenusByRoleID.action",  //获取节点数据的URL地址
		asyncParam: ["name", "id","resourceId"],  //获取节点数据时，必须的数据名称，例如：id、name
		asyncParamOther: ["treeType",true], //其它参数 ( key, value 键值对格式)
		callback:{
			beforeChange: menuTreeBeforeChange,
			change:	menuTreeOnChange
		}
	};	
	var menuTreeNodes3 =[];
	//整个树加载
	$(document).ready(function(){
		//roleTreeSet.asyncParamOther = ["test1","tr1","test2","tr2"];//传参测试
		menuTree3 = $("#menutree3").zTree(menuTreeSet3, menuTreeNodes3);
	});
	*/
	
	function menuTreeBeforeChange(treeId, treeNode){
		//menuTree.reAsyncChildNodes(treeNode, "refresh");
		var menuNode = menuTree.getSelectedNode();
		menuTree.expandNode(menuNode, true, true);
	}

	//整个树刷新
	function refreshTree(){
		roleTree = $("#roletree").zTree(roleTreeSet, roleTreeNodes);
	}
	function refreshTree1(){
		menuTree = $("#menutree2").zTree(menuTreeSet, menuTreeNodes);
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
		$.ajax({
	    	url: webroot+'/platform/roleAC!queryMenusByRoleID.action',
	    	type: 'POST',
		    dataType: 'json',
		    //timeout: 1000,
		    error: function(){
		       alert('Error loading XML document');
		    },
		    success: function(data){
		    	menuTreeSet.asyncUrl = webroot+'/platform/roleAC!queryMenusByRoleID.action?roleID='+treeNode.id;
				menuTree = $("#menutree2").zTree(menuTreeSet, menuTreeNodes);
		    }
		});
		
		/*
		$.ajax({
	    	url: webroot+'/platform/roleAC!queryMenusByRoleID2.action',
	    	type: 'POST',
		    dataType: 'json',
		    timeout: 1000,
		    error: function(){
		       alert('Error loading XML document');
		    },
		    success: function(data){
		    	menuTreeSet3.asyncUrl = webroot+'/platform/roleAC!queryMenusByRoleID2.action?roleID='+treeNode.id;
				menuTree3 = $("#menutree3").zTree(menuTreeSet3, menuTreeNodes3);
		    }
		});
 		*/
		
	}
	
	

