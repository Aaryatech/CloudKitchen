package com.ats.ck.common;

import org.springframework.http.client.support.BasicAuthorizationInterceptor;
import org.springframework.web.client.RestTemplate;

public class Constants {

	// local
	public static final String opsWebApiUrl = "http://107.180.95.11:8080/webapi/";
	public static final String softPath = "http://107.180.91.43:8080/ckwebapidemo/";
	//public static final String url = "http://107.180.91.43:8080/ckwebapidemo/";
	public static final String url = "http://localhost:8095/";
	public static String REPORT_SAVE = "/home/lenovo/Documents/pdf/Report.pdf";
	public static final String ReportURL = "http://localhost:8082/hreasy/";
	public static final String attsDocSaveUrl = "/home/lenovo/Downloads/old/apache-tomcat-8.5.37/webapps/media/";
	public static final String docSaveUrl = "/home/lenovo/Downloads/old/apache-tomcat-8.5.37/webapps/media/";

	public static final String imageShowUrl = "https://107.180.91.43:8080/uploads/ckuploads/";
	public static final String templateShowUrl = "https://localhost:8080/hrdocument/templatedoc/";

	public static RestTemplate rest = new RestTemplate();
	public static String[] allextension = { "txt", "doc", "pdf", "xls", "jpg", "jpeg", "gif", "png" };
	public static String[] values = { "jpg", "jpeg", "gif", "png" };
	public static String empLoanAgrDocViewUrl;
	public static String empLoanAgrDocSaveUrl;

	public static RestTemplate getRestTemplate() {
		rest = new RestTemplate();
		rest.getInterceptors().add(new BasicAuthorizationInterceptor("aaryatech", "Aaryatech@1cr"));
		return rest;

	}
}