package com.ats.ck.common;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;

public class PushNotification {

	public final static String AUTH_KEY_FCM = "AAAAK88z50I:APA91bEu1TLNO0aV6Z16KjdQ5htyR3ju7eCOMPxpTyWQGuU7PZ26HzyVN-ZuIK4j7vz_iXoJaFBEwzhhGNs5bwQ792GySSLZ9nXq8i9wwt9GWWrn2bovhwFOvDUPhzIOYIQjG1bJgmdA";
	public final static String API_URL_FCM = "https://fcm.googleapis.com/fcm/send";
	public final static String DEVICE_ID = "dT6As-WOIk7rYCVARvWxYz:APA91bFUCw5XdkzS6wgkDnPMsfpgf2JZAbEylY-jNhHef6k6ux-AURbksoFJWCDxzbjiCYpmpOaIoLbS3tWTS9KFZWDl6TNIW4H8_m3HQUmbuPbqD2qQckbSiYypxJlv4OtK7mfS9Azw";

	public static void sendNotification(List<String> tokenList, String title, String msg, String action, String path) {

		// String DeviceIdKey = DEVICE_ID;
		// String authKey = AUTH_KEY_FCM;
		// String FMCurl = API_URL_FCM;

		try {
			// System.out.println("Parameters : " + deviceToken + "\nTitle : " +
			// title + "\nDesc : " + body);
			// String result = "";

			for (int i = 0; i < tokenList.size(); i++) {

				URL url = new URL(API_URL_FCM);
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();

				conn.setUseCaches(false);
				conn.setDoInput(true);
				conn.setDoOutput(true);

				conn.setRequestMethod("POST");
				conn.setRequestProperty("Authorization", "key=" + AUTH_KEY_FCM);
				conn.setRequestProperty("Content-Type", "application/json");

				JSONObject json = new JSONObject();
				JSONObject info = new JSONObject();
				try {

					json.put("to", tokenList.get(i));
					info.put("title", title);
					info.put("body", msg); // Notification
					info.put("sound", "/ck/resources/assets/sound/for-sure.mp3");
					info.put("vibrate", "true");
					info.put("click_action", action);
					info.put("icon", path + "/resources/assets/img/dashboard_logo.png");
					info.put("image", path + "/resources/assets/img/dashboard_logo.png");

					json.put("notification", info);

				} catch (JSONException e1) {
					e1.printStackTrace();
				}

				try {
					OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
					wr.write(json.toString());
					wr.flush();

					BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));

					String output;
					// System.out.println("Output from Server .... \n");
					while ((output = br.readLine()) != null) {
						// System.out.println(output);
					}
					// result = "success";
				} catch (Exception e) {
					e.printStackTrace();
					// result = "failure";
				}
				System.out.println("------------------------------------------------------------------------");
				System.out.println("FCM Notification is sent successfully");
			}
		} catch (Exception e) {
			System.out.println(e);
		}

	}

}
