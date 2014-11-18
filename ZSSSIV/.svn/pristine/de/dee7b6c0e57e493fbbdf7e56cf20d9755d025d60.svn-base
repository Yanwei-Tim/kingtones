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