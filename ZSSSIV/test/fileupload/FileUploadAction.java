package fileupload;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.kingtone.ssi.action.SSIAction;
import com.opensymphony.xwork2.ActionSupport;

public class FileUploadAction extends SSIAction {

	private File test;
	private String testFileName;
	private String testContentType;
	@SuppressWarnings("unused")
	public String importExcel() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			String suffixName = testFileName.substring(testFileName
					.lastIndexOf("."));
			File upload = new File(ServletActionContext.getServletContext().getRealPath("/upload")
					+ "/" + System.currentTimeMillis() + ".rar");
			FileUtils.copyFile(test, upload);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "SSSS";
	}

	public void setTest(File test) {
		this.test = test;
	}

	public void setTestContentType(String testContentType) {
		this.testContentType = testContentType;
	}

	public void setTestFileName(String testFileName) {
		this.testFileName = testFileName;
	}
}