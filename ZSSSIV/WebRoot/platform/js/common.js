var CONTENT_TYPE = "Content-Type" //jquery's HttpResponse'MIME
var CONTENT_TYPE_XML = "text/xml";//xml content type
/*when ajax request broken system error,app server writes a xml to client that includes tag 'sys_error_id'.
  eg:<?xml version='1.0' ?>
        <rt>
           <sys_error_id>S_000003</sys_error_id><!--session time out -->        
        </rt>
*/
var SYS_ERROR_XML_TAG ="sys_error_id";

var REQUEST_TYPE_GET  = "GET";
var REQUEST_TYPE_POST = "POST";

/**
 * ajax submit (return is jsp or html or .do or xml).
 * ajax_result[0]:flag for ajax request indicates jquery is nornaly over.
 *                true :jquery do successfully,app server doesn't throws exception. 
 *                false:excpetion happens when jquery communication or app server throws exception. 
                  only when ajax_result[0] == true ,you need to process ajax_result[1]. 
 * ajax_result[1]:jquery response.it maybe jquery XML object,html or error code.
 *                jquery XML object:jquery request finishs normally,no exceptions happen.                   
 *                             html:jquery request for jsp or html
 *                       error code:app server throws exception or jquery communication abort. 
 * ajax_result[1]:it containts the system error message when ajax_result[0] == true.
 *   async:that indicates the ajax call parrten,true is for asynchrozie,false is for synchronize 
 *     url:the url addrss of post or get method
 *  params:parameters sended to server. eg:xxx.do?userid=1&password=ppp
 *  cached:if get content from browser cache
 *  callBackFunction name login ajax call back methoduser can danamicly define this callbakc methtod
 *  callParams the parameters for call back method
*/
function ajax_submit(async,url,params,cached,callBackFunName,callParams){

    var ajax_result = new Array(); 
    //init result
    ajax_result[0] = true;//success for request
    ajax_result[1] = null;
    
    //XMLHttpRequest
	$.ajax({
		type: REQUEST_TYPE_POST,
		 url: url,
		data: params,
	   cache: cached,
	   async: async,
	 success: function(html){
	            //alert(html.getElementsByTagName("msg")[0].nodeValue);
	            //save result to ajax_result[1] 
	            ajax_result[1] = html;
		      },
    complete:function (XMLHttpRequest){//to do somethings after ajax request complement
               var contentType = XMLHttpRequest.getResponseHeader(CONTENT_TYPE);               
               if (contentType != null ){
                 //Content-Type=TEXT/XML chartset=UTF-8 => text/xml chartset=utf-8 
                 contentType = contentType.toLowerCase();
                 
                 if (contentType.indexOf(CONTENT_TYPE_XML)>=0){
                   //the jquery 's response MIN is XML object
                   ajax_result = parser_ajax_xml_result(ajax_result);
                 }               
               }
               //call ajax callback method
               ajax_callback_function(callBackFunName,ajax_result,callParams);
             },
	   error: function(XMLHttpRequest, textStatus) {
	            ajax_result[0]=false
	            ajax_result[1]="S_100000";//error code than configed in resource file
	            ajax_result[2]="通信异常!";
	            //ajax_callback_function(callBackFunName,ajax_result,callParams);
			    //alert("request failure,status="+textStatus);
		     }
	});
}

//call ajax callback function dynamicly
/*
 * ajaxArrResult[0]:flag for ajax request indicates jquery is nornaly over.
 *                true :jquery do successfully,app server doesn't throws exception. 
 *                false:excpetion happens when jquery communication or app server throws exception. 
                  only when ajax_result[0] == true ,you need to process ajax_result[1]. 
 * ajaxArrResult[1]:jquery response.it maybe jquery XML object,html or error code.
 *                jquery XML object:jquery request finishs normally,no exceptions happen.                   
 *                             html:jquery request for jsp or html
 *                       error code:app server throws exception or jquery communication abort. 
 * ajaxArrResult[1]:it containts the system error message when ajax_result[0] == true.
 */
function ajax_callback_function(callBackFunName,ajaxArrResult,callParams){
  if (callBackFunName != null && callBackFunName != ""){
     eval(callBackFunName+"(ajaxArrResult,callParams)");  
  }  
}

/*paser the request'result */
function parser_ajax_xml_result(ajax_result){
  /*analyze the ajax's xml is produced after nonormally business finished ? 
    or exception happens as app server when business running
  */  
  var data = ajax_result[1];  
  var errTag = $(data).find("sys_error_id");
  if (errTag.length > 0){
    /*this jquery xml object is producted when error happens on the app server side.client doesn't
      deal with it.client only take message id
    */ 
    //set ajax access is false
    ajax_result[0] = false;
    //set error message id to ajax_result
    ajax_result[1] = errTag.text();
    //set error message to ajax_result
    ajax_result[2] = $(data).find("sys_error_msg").text();
  }
  
  return ajax_result;  
}

/*double click*/
function not_clicked(i){
  if (!clickArray[i]) {
    clickArray[i] = true;
    return true;
  }
  return false;
}
