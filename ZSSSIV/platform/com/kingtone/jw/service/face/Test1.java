package com.kingtone.jw.service.face;

import java.util.List;



public class Test1 {

	/**
	 * @param args
	 */
	
	/*
	public static void main(String[] args) {
		try {

			PrimaryServiceComImplLocator pp = new PrimaryServiceComImplLocator();
			BasicHttpBinding_PrimaryServiceStub service = (BasicHttpBinding_PrimaryServiceStub) pp
					.getBasicHttpBinding_PrimaryService();
			String str = service.helloWorld("test0001");
			System.out.println("----- str = " + str);

			String jksqm = "Mzg5MWRjMWNhNmJjNDIwYmFiODQ2YjMxZTAzMzk5M2I=";// 接口授权码
			String jkid = "01012";// 接口id （1：N）
			String imgstring = Base64Util
					.GetImageStr("D:/test_zhongshan/faceimg/5.jpg");

			QueryCondition condition = new QueryCondition();
			condition.setImg(imgstring);
			condition.setScore("0.75");
			condition.setMaxCount(20);

			QueryRoot qRoot = new QueryRoot();
			qRoot.setQueryCondition(condition);

			String strXml = JaxbMapper.toXml(qRoot);
			System.out.println(strXml);

			String result = service.queryObjectOut(jksqm, jkid, strXml);
			// System.out.println("***** result = " + result);

			Root outRoot = JaxbMapper.fromXml(result, Root.class);
			BaseInfo info = outRoot.getInfo();
			String code = info.getCode();
			String msg = info.getMessage();
			int count = info.getRowcount();

			System.out.println("----- code = " + code);
			System.out.println("----- msg = " + msg);
			System.out.println("----- count = " + count);

			if (code.equals("1")) {// 获取数据成功
				List<Preasign> pList = outRoot.getPreasignList();

				for (Preasign p : pList) {
					System.out.println("----- --- id = " + p.getId());
					System.out.println("----- --- name = " + p.getName());
					String img = p.getImg();
					String imgPath = "D:/test_zhongshan/faceimg/out/5_"
							+ p.getId() + ".jpeg";
					Base64Util.GenerateImage(img, imgPath);
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}*/

}
