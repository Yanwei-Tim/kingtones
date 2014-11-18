function getCodeList(codeType,selectId,selectName,selectWidth){
	var params = 'codeType='+codeType+'&selectId='+selectId+'&selectName='+selectName+'&selectWidth='+selectWidth;
	//alert(params);
	$.ajax({
	    	url: webroot+'/platform/codeListAC!findCodeListByType.action',
	    	type: 'POST',
	    	async:false,
	    	data:params,
		    dataType: 'json',
		    error: function(){
		    	alert(type+"代码加载失败！");
		    },
		    success: function(data){
		       $("#"+codeType+"_div").html(data.codeListHtml);
		       return 1;
		    }
		});

}
function getSysCodeList(selectType,selectId,selectName,selectWidth){
	var params = 'selectType='+selectType+'&selectId='+selectId+'&selectName='+selectName+'&selectWidth='+selectWidth;
	//alert(params);
	$.ajax({
	    	url: webroot+'/biz/sysCodeListAC!findSysCodeListByType.action',
	    	type: 'POST',
	    	async:false,
	    	data:params,
		    dataType: 'json',
		    error: function(){
		    	alert(type+"代码加载失败！");
		    },
		    success: function(data){
		       $("#"+selectType+"_div").html(data.codeListHtml);
		    }
		});
	//return 1;
}

function getSysCodeValueList(selectType,selectId,selectName,selectWidth){
	var params = 'selectType='+selectType+'&selectId='+selectId+'&selectName='+selectName+'&selectWidth='+selectWidth;
	//alert(params);
	$.ajax({
	    	url: webroot+'/biz/sysCodeListAC!findSysCodeValueListByType.action',
	    	type: 'POST',
	    	async:false,
	    	data:params,
		    dataType: 'json',
		    error: function(){
		    	alert(type+"代码加载失败！");
		    },
		    success: function(data){
		       $("#"+selectType+"_div").html(data.codeListHtml);
		    }
		});
	//return 1;
}
function getImgCodeList(selectType,selectId,selectName,selectWidth,selvalue){
	var params = 'selectType='+selectType+'&selectId='+selectId+'&selectName='+selectName+'&selectWidth='+selectWidth;//+'&selvalue='+selvalue;
	//alert(params);
	$.ajax({
	    	url: webroot+'/biz/sysCodeListAC!findImgCodeList.action',
	    	type: 'POST',
	    	async:false,
	    	data:params,
		    dataType: 'json',
		    error: function(){
		    	alert(type+"代码加载失败！");
		    },
		    success: function(data){
		       $("#"+selectType+"_div").html(data.codeListHtml);
		    }
		});
	//return 1;
}
function getSelectBoxList(){
	var params = 'bizId='+bizId;
	//alert(params);
	$.ajax({
	    	url: webroot+'/biz/sysCodeListAC!queryAllColMappingList.action',
	    	type: 'POST',
	    	async:false,
	    	data:params,
		    dataType: 'json',
		    error: function(){
		    	alert(type+"代码加载失败！");
		    },
		    success: function(data){
		       $("#"+"checkbox"+"_div").html(data.codeListHtml);
		    }
		});
}
function getColMappingCodeList(selectType,selectId,selectName,selectWidth,selvalue){
	var params = 'selectType='+selectType+'&selectId='+selectId+'&selectName='+selectName+'&selectWidth='+selectWidth;//+'&selvalue='+selvalue;
	//alert(params);
	$.ajax({
	    	url: webroot+'/biz/sysCodeListAC!findColMappingCodeList.action?bizId='+parent.bizId,
	    	type: 'POST',
	    	async:false,
	    	data:params,
		    dataType: 'json',
		    error: function(){
		    	alert(type+"代码加载失败！");
		    },
		    success: function(data){
		       $("#"+selectType+"_div").html(data.codeListHtml);
		    }
		});
	//return 1;
}
function getSystemMapTypeCodeList(selectType,selectId,selectName,selectWidth,selvalue){
	var params = 'selectType='+selectType+'&selectId='+selectId+'&selectName='+selectName+'&selectWidth='+selectWidth;//+'&selvalue='+selvalue;
	//alert(params);
	$.ajax({
	    	url: webroot+'/biz/sysCodeListAC!findSystemMapTypeCodeList.action',
	    	type: 'POST',
	    	async:false,
	    	data:params,
		    dataType: 'json',
		    error: function(){
		    	alert(type+"代码加载失败！");
		    },
		    success: function(data){
		       $("#"+selectType+"_div").html(data.codeListHtml);
		    }
		});
	//return 1;
}


function getJwjzCodeList(selectType,selectId,selectName,selectWidth,selvalue){
	var params = '&selectId='+selectId+'&selectName='+selectName+'&selectWidth='+selectWidth;//+'&selvalue='+selvalue;
	//alert(params);
	$.ajax({
	    	url: webroot+'/xajw/jwUserAC!findJwjzCodeList.action',
	    	type: 'POST',
	    	async:false,
	    	data:params,
		    dataType: 'json',
		    error: function(){
		    	alert(type+"代码加载失败！");
		    },
		    success: function(data){
		       $("#"+selectType+"_div").html(data.codeListHtml);
		    }
		});
	//return 1;
}

function getJwroleCodeList(selectType,selectId,selectName,selectWidth,selvalue){
	var params = '&selectId='+selectId+'&selectName='+selectName+'&selectWidth='+selectWidth;//+'&selvalue='+selvalue;
	//alert(params);
	$.ajax({
	    	url: webroot+'/xajw/jwUserAC!findJwjzCodeList.action',
	    	type: 'POST',
	    	async:false,
	    	data:params,
		    dataType: 'json',
		    error: function(){
		    	alert(type+"代码加载失败！");
		    },
		    success: function(data){
		       $("#"+selectType+"_div").html(data.codeListHtml);
		    }
		});
	//return 1;
}

function getResCodeList(selectType,selectId,selectName,selectWidth,selvalue){
	var params = 'selectType='+selectType+'&selectId='+selectId+'&selectName='+selectName+'&selectWidth='+selectWidth;//+'&selvalue='+selvalue;
	//alert(params);
	$.ajax({
	    	url: webroot+'/biz/sysCodeListAC!findResCodeList.action',
	    	type: 'POST',
	    	async:false,
	    	data:params,
		    dataType: 'json',
		    error: function(){
		    	alert(type+"代码加载失败！");
		    },
		    success: function(data){
		       $("#"+selectType+"_div").html(data.codeListHtml);
		    }
		});
	//return 1;
}

function getTabInfoList(selectType,selectId,selectName,selectWidth,selvalue){
	var params = 'selectType='+selectType+'&selectId='+selectId+'&selectName='+selectName+'&selectWidth='+selectWidth;//+'&selvalue='+selvalue;
	//alert(params);
	$.ajax({
	    	url: webroot+'/biz/sysCodeListAC!findTabInfoList.action?bizId='+parent.bizId,
	    	type: 'POST',
	    	async:false,
	    	data:params,
		    dataType: 'json',
		    error: function(){
		    	alert(type+"代码加载失败！");
		    },
		    success: function(data){
		       $("#"+selectType+"_div").html(data.codeListHtml);
		    }
		});
	//return 1;
}

function getJwRoleTypeCodeList(selectType,selectId,selectName,selectWidth,selvalue){
	var params = 'selectType='+selectType+'&selectId='+selectId+'&selectName='+selectName+'&selectWidth='+selectWidth;
	//alert(params);
	$.ajax({
	    	url: webroot+'/biz/sysCodeListAC!findJwRoleTypeCodeList.action',
	    	type: 'POST',
	    	async:false,
	    	data:params,
		    dataType: 'json',
		    error: function(){
		    	alert(type+"代码加载失败！");
		    },
		    success: function(data){
		       $("#"+selectType+"_div").html(data.codeListHtml);
		    }
		});
	//return 1;
}