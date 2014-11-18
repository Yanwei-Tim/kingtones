package commonserver;

public class test {
	
	public static void main(String [] args){
		String url = "http://localhost:8088/SSIV/services/CommonServer?wsdl";
		String method = "getList";
		String xml1 = "<com.kingtone.jw.service.domain.QueryEnvelop>"+
		  "<bizTag>B201100015</bizTag>"+
		  "<condition/>"+
		  "<detail/>"+
		  "<list/>"+
		  "<userID>3</userID>"+
		  "<pageSize>6</pageSize>"+
		  "<totalNum>-1</totalNum>"+
		  "<totalPage>-1</totalPage>"+
		  "<pageNum>1</pageNum>"+
		"</com.kingtone.jw.service.domain.QueryEnvelop>";
		String xml2 = "<com.kingtone.jw.service.domain.QueryEnvelop>"+
		  "<bizTag>B201100017</bizTag>"+
		  "<condition/>"+
		  "<detail/>"+
		  "<list/>"+
		  "<userID>3</userID>"+
		  "<pageSize>6</pageSize>"+
		  "<totalNum>-1</totalNum>"+
		  "<totalPage>-1</totalPage>"+
		  "<pageNum>1</pageNum>"+
		"</com.kingtone.jw.service.domain.QueryEnvelop>";
		for(int i=0;i<100;i++){
			if(i%2==0){
				new ThreadTest(url,method,xml1).start();
			}else{
				new ThreadTest(url,method,xml2).start();
			}
		}
		
	}

}
