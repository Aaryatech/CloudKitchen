package com.ats.ck.common;

import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.ats.ck.model.Info;


public class SMSUtility {

	public static Info sendSMS(String phoneNo, String msg,String senderId) {

		Info info = new Info();

		try {

			RestTemplate restTemplate = new RestTemplate();
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			
//			String msg = "Welcome to Madhvi!\r\n" + 
//					"Thank u for being a part of Madhvi Customer Loyalty Program & the Patronage for QUALITY initiatives by the People of North Gujarat.";

			map.add("APIKEY", "pJMAaVPuGbh");
			map.add("MobileNo", phoneNo);
			map.add("SenderID", senderId);//MADHVI
			map.add("Message", msg);
			map.add("ServiceName", "TEMPLATE_BASED");
			String sms = restTemplate.postForObject("https://smsapi.24x7sms.com/api_2.0/SendSMS.aspx", map,
					String.class);

			info.setError(false);
			info.setMessage(sms);
			System.err.println("SMS --------------- "+sms);

		} catch (Exception e) {

			info.setError(true);
			info.setMessage("sendMsg");
			e.printStackTrace();
		}

		return info;
	}
	
}
