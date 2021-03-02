package com.ats.ck.common;

import org.springframework.http.client.support.BasicAuthorizationInterceptor;
import org.springframework.web.client.RestTemplate;

public class Constants {

	//CASHFREE REDIRECT URL - 
	public static final String softPath = "http://localhost:8080/ck/";
	//public static final String softPath = "https://pos.madhvi.in/CloudKitchen/";
	
	//--------------------------------------------------------------
	
	//API URL
	public static final String url = "http://localhost:8095/";
	//public static final String url = "http://107.180.91.43:8080/ckwebapi/";
	
	//-----------------------------------------------------------------

	//public static final String imageShowUrl = "https://107.180.91.43:8080/uploads/ckuploads/";
	public static final String imageShowUrl = "https://pos.madhvi.in/uploads/ckuploads/";
	
	//Live credential
	/*
	 * public static final String cashFreeAppId = "7233535973c0dcc4f58af274653327";
	 * public static final String cashSecretKey =
	 * "44bb412ea48da2acb093573debfdd42306099612"; public static final String
	 * cashFreeOrderCreateLink= "https://api.cashfree.com/";
	 */
	
	//test credential
	public static final String cashFreeAppId = "2800447959f7f92f77608613b40082";
	public static final String cashSecretKey = "7baef9681dc8696e0b4ceeb150e4fb05962fdbe3";
	public static final String cashFreeOrderCreateLink= "https://test.cashfree.com/";

	public static RestTemplate rest = new RestTemplate();
	public static String[] allextension = { "txt", "doc", "pdf", "xls", "jpg", "jpeg", "gif", "png" };
	public static String[] values = { "jpg", "jpeg", "gif", "png" };

	public static RestTemplate getRestTemplate() {
		rest = new RestTemplate();
		rest.getInterceptors().add(new BasicAuthorizationInterceptor("aaryatech", "Aaryatech@1cr"));
		return rest;

	}
}