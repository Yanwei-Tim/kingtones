//-------------------【定义ztree开始】----------------------------------------------------------------------	
	var zTree1;
	var setting;
	setting = {	
		checkable: false,
		async: true,		
		asyncUrl: webroot+"/manage/lawDirectoryAC!queryLawDirectoryTree.action",  //获取节点数据的URL地址
		asyncParam: ["name", "id"],  //获取节点数据时，必须的数据名称，例如：id、name
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
	//获取选中节点name
	function getSelectNodeName(){
		if(!getSelectNode())return null;
		else return getSelectNode().name;
	}
	
	
	//节点单击事件
	function zTreeOnClick() {
		var treeNode = getSelectNode();
		zTree1.expandNode(treeNode);//点击节点展开
		
		$.ajax( {
			url : webroot + '/manage/lawDirectoryAC!queryLawDirectoryContent.action',
			// 数据发送方式
			type : "post",
			data:'id='+getSelectNodeId(),
			// 接受数据格式
			dataType : "json",
			// 回调函数，接受服务器端返回给客户端的值，即result值
			error: function(){
		       alert('加载失败');
		    },
			success : function(data) {	
		    	//document.getElementById("contentid").innerText =  data.lawContent.id;
				document.getElementById("timediv").innerText = data.lawTime==null?'没有内容':data.lawTime;
				document.getElementById("contentspan").innerText = data.lawContent.content;
			}
		});
	
	}
	
	
