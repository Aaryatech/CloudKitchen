package com.ats.ck;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.Message;
import com.google.firebase.messaging.Notification;
import com.google.firebase.messaging.WebpushConfig;
import com.google.firebase.messaging.WebpushNotification;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "login";
	}

	@RequestMapping(value = "/forgotPassword", method = RequestMethod.GET)
	public String home(HttpServletRequest request, HttpServletResponse response, Model model) {

		return "forgotPassword";
	}

	@RequestMapping(value = "/resetPassword", method = RequestMethod.GET)
	public String resetPassword(HttpServletRequest request, HttpServletResponse response, Model model) {

		return "resetPassword";
	}

	@RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
	public String loginProcess(HttpServletRequest request, HttpServletResponse response, Model model) {

		return "redirect:/dashboard";
	}

	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String dashboard(HttpServletRequest request, HttpServletResponse response, Model model) {

		return "dashboard";
	}

	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public String checkout(HttpServletRequest request, HttpServletResponse response, Model model) {

		return "checkout";
	}

	@RequestMapping(value = "/addOrder", method = RequestMethod.GET)
	public String addOrder(HttpServletRequest request, HttpServletResponse response, Model model) {

		return "addOrder";
	}

	@RequestMapping(value = "/googleMap", method = RequestMethod.GET)
	public String googleMap(HttpServletRequest request, HttpServletResponse response, Model model) {

		return "googleMap";
	}

	@RequestMapping(value = "/googleMap1", method = RequestMethod.GET)
	public String googleMap1(HttpServletRequest request, HttpServletResponse response, Model model) {

		return "googleMap1";
	}

	@RequestMapping(value = "/firebase", method = RequestMethod.GET)
	public String firebase(HttpServletRequest request, HttpServletResponse response, Model model) {

		return "firebase";
	}
	
	@RequestMapping(value = "/storagedfirebase", method = RequestMethod.GET)
	public String storagedfirebase(HttpServletRequest request, HttpServletResponse response, Model model) {

		return "storagedfirebase";
	}

	@RequestMapping(value = "/chatbox", method = RequestMethod.GET)
	public String chatbox(HttpServletRequest request, HttpServletResponse response, Model model) {

		try {
			//execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "chatbox";
	}

	@RequestMapping(value = "/sendNotification", method = RequestMethod.POST)
	public String sendNotification(HttpServletRequest request, HttpServletResponse response, Model model) {

		try {
			//execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}

	private static final long serialVersionUID = -8022560668279505764L;

	// Method to send Notifications from server to client end.
	public final static String AUTH_KEY_FCM = "AAAAK88z50I:APA91bEu1TLNO0aV6Z16KjdQ5htyR3ju7eCOMPxpTyWQGuU7PZ26HzyVN-ZuIK4j7vz_iXoJaFBEwzhhGNs5bwQ792GySSLZ9nXq8i9wwt9GWWrn2bovhwFOvDUPhzIOYIQjG1bJgmdA";
	public final static String API_URL_FCM = "https://fcm.googleapis.com/fcm/send";
	public final static String DEVICE_ID = "f6-4Fj_U598Pp4vErWxLQg:APA91bG0KMX5uvDKzaDjUpQOpO3fALW4mwxqltdyC083hJFSv152_IshYrpbRKVYUk3V2yj-OfmEpRFcIMsZb4s5fTl-_towp26tHRTvhCHe1hA-cQq9gBHhk5WSyRPjAGiWdfg0xkGd";

	public void execute() {
		String DeviceIdKey = DEVICE_ID;
		String authKey = AUTH_KEY_FCM;
		String FMCurl = API_URL_FCM;

		try {
			// System.out.println("Parameters : " + deviceToken + "\nTitle : " +
			// title + "\nDesc : " + body);
			String result = "";
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

				json.put("to", DEVICE_ID);
				info.put("title", "You have new message");
				info.put("body", "You have new message"); // Notification
				info.put("sound", "default");
				info.put("vibrate", "true");
				json.put("data", info);

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
				result = "success";
			} catch (Exception e) {
				e.printStackTrace();
				result = "failure";
			}
			System.out.println("------------------------------------------------------------------------");
			System.out.println("FCM Notification is sent successfully");

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	/*
	 * <script async defer src=
	 * "https://maps.googleapis.com/maps/api/js?key=AIzaSyBahlnISPYhetj3q50ADqVE6SECypRGe4A&callback=initMap">
	 */
}
