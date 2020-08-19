package com.ats.ck.common;

import org.springframework.http.client.support.BasicAuthorizationInterceptor;
import org.springframework.web.client.RestTemplate;

public class Constants {

	// local
	public static final String opsWebApiUrl = "http://107.180.95.11:8080/webapi/";
	public static final String softPath = "https://107.180.88.121:8443/CloudKitchen/";
	//public static final String url = "http://192.168.2.12:8080/ckdemoapi/";
	public static final String url = "http://localhost:8095/";
	public static String REPORT_SAVE = "/home/lenovo/Documents/pdf/Report.pdf";
	public static final String ReportURL = "http://localhost:8082/hreasy/";
	public static final String attsDocSaveUrl = "/home/lenovo/Downloads/old/apache-tomcat-8.5.37/webapps/media/";
	public static final String docSaveUrl = "/home/lenovo/Downloads/old/apache-tomcat-8.5.37/webapps/media/";

	public static final String imageShowUrl = "https://107.180.88.121:8080/uploads/ckuploads/";
	public static final String templateShowUrl = "https://107.180.88.121:8080/hrdocument/templatedoc/";

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