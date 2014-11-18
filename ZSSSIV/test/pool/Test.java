package pool;


import com.dragonsoft.adapter.service.QueryAdapterSend;
import com.dragonsoft.pci.exception.InvokeServiceException;

public class Test {
	public static void main(String[] args) {
		try {
			//160468
			QueryAdapterSend adapter = new QueryAdapterSend();
			String QGBDQCLCondition = "HPHM  =   '��T14527'  ";//��ɽ���3�~��ѯ     //��ɽ����ѯ
			String zsBDCLCXCondition1 = "HPHM='��T14527'";//ȫ����3�~��ѯ
			String QGCZRKCondition1 = "SFZH='450721201001015816'";//ȫ��ס�˿�
			String zsCZRKCondition1 = "SFZH='450721201001015816'";//��ɽ��ס�˿�
			String zsJSYCondition1 = "ZJBH='440203197705222118'";//��ɽ��ʻԱ
			String zsGNLKCondition1 = "ZJHM='610322198406042919'";//��ɽ�����ÿ�
			String QGZTRYCondition1 = "XZ_ZTT_SFZH='441427197802280013'";//ȫ��������Ա
			
			
			String zsBDQCL="QueryBDQCLJX";//��ɽ���3�~��ѯ
			String QGCZRK="QueryQGCKJX";//ȫ��ס�˿�
			String zsCZRK="QueryCZRKJX";//��ɽ��ס�˿�
			String zsJSY="QueryQGJSYJX"; //��ɽ��ʻԱ
			String zsLDRK="QueryQGJJAJJX";//��ɽ���˿�
			String zsGNLK="QueryGNLKJX";//��ɽ�����ÿ�
			String QGBDQCL="QueryQGBDQCL";//ȫ����3�~��ѯ
			String QGJDCCX="QueryQGJDCJX";//ȫ�����ѯ
			String zsJDCLCX="QuerySCJDCJX";//��ɽ����ѯ
			String QGZTRY="QueryQGZTJX";//ȫ��������Ա
			String value = adapter.sendQuery(QGCZRK, QGCZRKCondition1,"340621198410209317","����","10002");
			System.out.println(value);
		} catch (InvokeServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			String code = e.getErrorCode();
			String message = e.getErrorMessage();
		}
		
	}
}
