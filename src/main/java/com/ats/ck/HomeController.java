package com.ats.ck;

import java.io.BufferedReader;
import java.io.FileInputStream;
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

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.iid.FirebaseInstanceId;
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
			// execute();
			/*
			 * FileInputStream serviceAccount = new
			 * FileInputStream("/home/lenovo/Downloads/firbase-753eb6984a31.json");
			 * 
			 * FirebaseOptions options = new FirebaseOptions.Builder()
			 * .setCredentials(GoogleCredentials.fromStream(serviceAccount))
			 * .setDatabaseUrl("https://firbase-1fba8.firebaseio.com").build();
			 * 
			 * FirebaseApp.initializeApp(options); String uid = "some-uid"; String
			 * customToken = FirebaseAuth.getInstance().createCustomToken(uid);
			 * System.out.println(customToken);
			 */
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "chatbox";
	}

	@RequestMapping(value = "/sendNotification", method = RequestMethod.POST)
	public String sendNotification(HttpServletRequest request, HttpServletResponse response, Model model) {

		try {
			execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}

	private static final long serialVersionUID = -8022560668279505764L;

	// Method to send Notifications from server to client end.
	public final static String AUTH_KEY_FCM = "AAAAK88z50I:APA91bEu1TLNO0aV6Z16KjdQ5htyR3ju7eCOMPxpTyWQGuU7PZ26HzyVN-ZuIK4j7vz_iXoJaFBEwzhhGNs5bwQ792GySSLZ9nXq8i9wwt9GWWrn2bovhwFOvDUPhzIOYIQjG1bJgmdA";
	public final static String API_URL_FCM = "https://fcm.googleapis.com/fcm/send";
	public final static String DEVICE_ID = "d6tjOUtPP-JK39rf1Isa5w:APA91bErwpAoK2UYcbd9klex01l3t_6fQQGqlcY03PeC5FBB6o-qV3fyBZ5InYW7Bh_t0-LnpHd0wm_fnR-H8V_-3dlI-eyGKSZDeuKqQQLOwZa5HoSWVx_rhHzXTCxt_Gm8vpICRJIR";

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
				info.put("body", "You have new messagesdfs"); // Notification
				info.put("sound", "/ck/resources/assets/sound/for-sure.mp3");
				info.put("vibrate", "true");
				info.put("click_action", "http://localhost:8081/ck/");
				info.put("icon", "/ck/resources/assets/img/dashboard_logo.png");
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
