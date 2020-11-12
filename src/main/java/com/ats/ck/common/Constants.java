package com.ats.ck.common;

import org.springframework.http.client.support.BasicAuthorizationInterceptor;
import org.springframework.web.client.RestTemplate;

public class Constants {

	//public static final String softPath = "http://localhost:8080/ck/";
	public static final String softPath = "https://pos.madhvi.in/CloudKitchen/";
	//public static final String softPath = "http://103.86.176.44:8080/CloudKitchen/";
	
	//--------------------------------------------------------------
	
	//OLD SERVER
	public static final String url = "http://localhost:8095/";
	//public static final String url = "http://107.180.91.43:8080/ckwebapi/";
	
	//public static final String url = "https://pos.madhvi.in/ckwebdemo/";
	
	//MILESWEB
	//public static final String url = "http://103.86.176.44:8080/ckwebapi/";
	
	//-----------------------------------------------------------------

	//public static final String imageShowUrl = "https://107.180.91.43:8080/uploads/ckuploads/";
	public static final String imageShowUrl = "https://pos.madhvi.in/uploads/ckuploads/";

	public static RestTemplate rest = new RestTemplate();
	public static String[] allextension = { "txt", "doc", "pdf", "xls", "jpg", "jpeg", "gif", "png" };
	public static String[] values = { "jpg", "jpeg", "gif", "png" };

	public static RestTemplate getRestTemplate() {
		rest = new RestTemplate();
		rest.getInterceptors().add(new BasicAuthorizationInterceptor("aaryatech", "Aaryatech@1cr"));
		return rest;

	}
}