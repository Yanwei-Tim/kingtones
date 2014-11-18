
//-------------------【定义ztree开始】----------------------------------------------------------------------	
	var roleTree;
	var roleTreeSet;
	var menuTree;
	var menuTreeSet;
	
	var menuTree3;
	var menuTreeSet3;
	
	roleTreeSet = {
		checkable: false,
		async: true,
		asyncUrl: webroot+"/xajw/jwRoleAC!queryJwRoleTreeNodes.action",  //获取节点数据的URL地址
		asyncParam: ["name", "id"],  //获取节点数据时，必须的数据名称，例如：id、name
		callback:{
			click:	roleTreeOnClick
		}
	};	
	var roleTreeNodes =[];
	//整个树加载
	$(document).ready(function(){
		refreshTree();
		//roleTreeSet.asyncParamOther = ["test1","tr1","test2","tr2"];//传参测试
		//roleTree = $("#roletree").zTree(roleTreeSet, roleTreeNodes);
	});
	
	menuTreeSet = {
		checkable: true,
		async: true,
		asyncUrl: webroot+"/biz/sysCodeListAC!queryBizRoleTreeNodes.action",  //获取节点数据的URL地址
		asyncParam: ["name", "id","pid"],  //获取节点数据时，必须的数据名称，例如：id、name
		asyncParamOther: ["treeType",true], //其它参数 ( key, value 键值对格式)
		callback:{
			beforeChange: menuTreeBeforeChange,
			click:	roleTreeOnClick3
		}
	};	
	var menuTreeNodes =[];
		
	function menuTreeBeforeChange(treeId, treeNode){
		//alert("treeId"+treeId);alert("treeNode:"+treeNode.id);
		//menuTree.reAsyncChildNodes(treeNode, "refresh");
		menuTree.expandNode(treeNode, true, false);
	}

	//整个树刷新
	function refreshTree(){
		roleTree = $("#roletree").zTree(roleTreeSet, roleTreeNodes);
	}
	function refreshTree1(){
		menuTree = $("#menutree2").zTree(menuTreeSet, menuTreeNodes);
	}
	function refreshTree2(){
		menuTree3 = $("#menutree3").zTree(menuTreeSet3, menuTreeNodes3);
	}
	//选中节点刷新
	function refreshNode(){
		var treeNode = getSelectNode();
		//alert("refreshNode treeNode:"+treeNode.id);
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
		//获取选中节点id
	function getSelectNodeBizId(){
		if(!menuTree.getSelectedNode())return null;
		else return menuTree.getSelectedNode().id;
	}

	//节点单击事件
	function roleTreeOnClick(event, treeId, treeNode) {
		//alert(treeId+"-"+treeNode.id+"-roleid:");
		$.ajax({
	    	url: webroot+'/xajw/jwRoleAC!queryBizRoleTreeNodes.action',
	    	type: 'POST',
		    dataType: 'json',
		    //timeout: 1000,
		    error: function(){
		       alert('Error loading XML document');
		    },
		    success: function(data){
		    	menuTreeSet.asyncUrl = webroot+'/xajw/jwRoleAC!queryBizRoleTreeNodes.action?jwRoleId='+treeNode.id+'&bizId='+treeId;
				menuTree = $("#menutree2").zTree(menuTreeSet, menuTreeNodes);
		    }
		});		
		
	}
	
	menuTreeSet3 = {
		checkable: true,
		async: true,
		asyncUrl: webroot+'/xajw/jwRoleAC!queryResRoleTreeNodes.action',  //获取节点数据的URL地址
		asyncParam: ["name", "id","pid"],  //获取节点数据时，必须的数据名称，例如：id、name
		callback:{
			
		}
	};	
	var menuTreeNodes3 =[];
		//节点单击事件
	function roleTreeOnClick3(event, treeId, treeNode) {
		//alert(treeId+"-"+treeNode.id+"-roleid:");
		$.ajax({
	    	url: webroot+'/xajw/jwRoleAC!queryResRoleTreeNodes.action',
	    	type: 'POST',
		    dataType: 'json',
		    //timeout: 1000,
		    error: function(){
		       alert('Error loading XML document');
		    },
		    success: function(data){
		    	menuTreeSet3.asyncUrl = webroot+'/xajw/jwRoleAC!queryResRoleTreeNodes.action?jwRoleId='+getSelectNodeId()+'&id='+treeNode.id;
				menuTree3 = $("#menutree3").zTree(menuTreeSet3, menuTreeNodes3);
		    }
		});		
		
	}
	
	

