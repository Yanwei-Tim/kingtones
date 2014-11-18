function dateCheck2(startdate,enddate){
	var ret=true;
	if(!(startdate==""&&enddate=="")&&!(startdate!=""&&enddate!="")){
		if(startdate==""){
			alert("请输入起始日期！");
			ret=false;
		}else{
			alert("请输入结束日期！");
			ret=false;
		}
	}  
	return ret;		
}

function dateCheck(startdate,enddate){
	var ret = true;
	if(startdate!=""&&enddate!=""){
			var startTmp=startdate.split("-");  
	        var endTmp=enddate.split("-");  
	        var sd=new Date(startTmp[0],startTmp[1],startTmp[2]);  
	        var ed=new Date(endTmp[0],endTmp[1],endTmp[2]); 
			if(ed.getTime()<sd.getTime()){
				alert("结束日期不能早于开始日期！");
				ret= false;
			}
	}
	return ret;
}

 function pastePassword()
   {
   	alert("禁止粘贴密码!");
    return false;
  }
 
function isNumber(input,msg)
{
  var ret = true;
  if(!input) ret=false;
  var strP=/^\d+(\.\d+)?$/;
  if(!strP.test(input)) ret=false;
  try{
  	if(parseFloat(input)!=input) ret=false;
  }catch(ex)
  {
   	ret= false;
  }
  if(ret==false){
     alert(msg+": 必须为数字!");
     return;
  }
  return ret;
}

function isNull(input,msg){
	if(input==null||input==""){
		alert(msg+": 不能为空!");
		return false;
	}else{
		return true;
	}
}

function selectCheck(input,msg){
	if(input==null||input=="-1"){
		alert("请选择"+msg+"！");
		return false;
	}else{
		return true;
	}
}

function lengthCheck(input,msg,maxlength){
	if(input==null||input==""){
		return true;
	}
	if(input.getBytes()>maxlength) {
		alert(msg+"值不能超过"+maxlength+"字符!");
		return false;
	}
	return true;
}

String.prototype.getBytes = function() {    
    var cArr = this.match(/[^\x00-\xff]/ig);    
    return this.length + (cArr == null ? 0 : cArr.length);    
}


// 字符重复验证
function repeatCheck(input,msg){
	len = input.length;
	for(var i=0;i<=len;i++){
		var str1=input.charCodeAt(i);
		for(var l=0;l<=len;l++){
			if(i!=l){
			 	var str2=input.charCodeAt(l);
				if(str1==str2){
					alert(msg+": 不能有重复字符!");
					return false;
					}
				}
			}
	}
	return true;
}
// 不含0的数字组合
function isNumberWithoutZero(input,msg)
{
	var ret = true;
	if(!input) ret=false;
	var strP=/^[1-9]+$/;
	if(!strP.test(input)){
		ret = false;
		alert(msg+": 必须为数字串，并且数字串只能由【1-9】组成!");
		return;
	}
	return ret;
}

// 解锁密码设置验证
function parrentPasswordCheck(input){
	if(!isNull(input,"密码")) {
		return false;
	} 
	 if(!isNumberWithoutZero(input,"密码")){
     	return false;
   }  
    if( !repeatCheck(input,"密码")){
    	return false;
    }
	 if(!lengthCheck(input,"密码",9)){
     	return false;
   }  
   return true;
}
//关闭页面
	function clo(){		
		window.close()
	}

