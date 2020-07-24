package com.ats.ck;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ats.ck.common.Constants;
import com.ats.ck.common.EmailUtility;
import com.ats.ck.common.RandomString;
import com.ats.ck.model.Area;
import com.ats.ck.model.City;
import com.ats.ck.model.Customer;
import com.ats.ck.model.CustomerAddress;
import com.ats.ck.model.CustomerAddressDisplay;
import com.ats.ck.model.CustomerDisplay;
import com.ats.ck.model.ErrorMessage;
import com.ats.ck.model.Info;
import com.ats.ck.model.Language;
import com.ats.ck.model.LoginResponse;
import com.ats.ck.model.MnUser;
import com.fasterxml.jackson.databind.ObjectMapper;
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
	public String home(HttpServletRequest request, HttpServletResponse response, Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);
		HttpSession session = request.getSession();
		model.addAttribute("serverTime", formattedDate);

		return "login";
	}

	@RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
	public String loginProcess(HttpServletRequest request, HttpServletResponse response, Model model) {

		String mav = new String();
		HttpSession session = request.getSession();
		try {

			String sessiongeneratedkey = (String) session.getAttribute("tokenKey");
			String token = request.getParameter("token").trim();

			String name = request.getParameter("username");
			String password = request.getParameter("password");

			/* if (sessiongeneratedkey.trim().equals(token.trim())) { */

			if (name.equalsIgnoreCase("") || password.equalsIgnoreCase("") || name == null || password == null) {

				mav = "redirect:/";
				session.setAttribute("errorMsg", "Login Failed");
			} else {

				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

				MessageDigest md = MessageDigest.getInstance("MD5");
				byte[] messageDigest = md.digest(password.getBytes());
				BigInteger number = new BigInteger(1, messageDigest);
				String encryptPass = number.toString(16);

				map.add("username", name);
				map.add("password", encryptPass);
				map.add("type", 1);
				LoginResponse userObj = Constants.getRestTemplate().postForObject(Constants.url + "login", map,
						LoginResponse.class);

				if (userObj.getErrorMessage().isError() == false) {

					mav = "redirect:/dashboard";
					session.setAttribute("userInfo", userObj.getUser());

				} else {
					mav = "redirect:/";
					session.setAttribute("errorMsg", "Login Failed");
				}

			}
			/*
			 * } else { mav = "redirect:/"; session.setAttribute("errorMsg",
			 * "Login Failed"); }
			 */
		} catch (Exception e) {
			mav = "redirect:/";
			session.setAttribute("errorMsg", "Login Failed");
			e.printStackTrace();
		}

		return mav;
	}

	@RequestMapping(value = "/forgotPassword", method = RequestMethod.GET)
	public String home(HttpServletRequest request, HttpServletResponse response, Model model) {

		return "forgotPassword";
	}

	@RequestMapping(value = "/submitResetPassword", method = RequestMethod.POST)
	public String submitResetPassword(HttpServletRequest request, HttpServletResponse response, Model model) {

		String mav = new String();
		HttpSession session = request.getSession();

		try {

			String name = request.getParameter("username");

			if (name.equalsIgnoreCase("") || name == null) {

				mav = "redirect:/";
				session.setAttribute("errorMsg", "Invalid Moble number or Email.");
			} else {

				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

				map.add("username", name);
				map.add("type", 1);
				LoginResponse userObj = Constants.getRestTemplate().postForObject(Constants.url + "forgotPassword", map,
						LoginResponse.class);

				if (userObj.getErrorMessage().isError() == false) {

					RandomString randomString = new RandomString();
					String password = randomString.nextString();
					MessageDigest md = MessageDigest.getInstance("MD5");
					byte[] messageDigest = md.digest(password.getBytes());
					BigInteger number = new BigInteger(1, messageDigest);
					String hashtext = number.toString(16);

					map = new LinkedMultiValueMap<String, Object>();
					map.add("username", hashtext);
					map.add("userId", userObj.getUser().getUserId());
					ErrorMessage updatepass = Constants.getRestTemplate()
							.postForObject(Constants.url + "updatePassword", map, ErrorMessage.class);

					String subject = "Reset Password";
					String msg = "Hello, \n Your Credential, \n Username : " + userObj.getUser().getUserMobileNo()
							+ "\n Password : " + password;

					ErrorMessage sendMail = EmailUtility.sendEmailWithSubMsgAndToAdd(subject, msg,
							userObj.getErrorMessage().getMessage());
					mav = "redirect:/";
					session.setAttribute("successMsg", "Password send to your register Email.");

					model.addAttribute("imageUrl", Constants.imageShowUrl);

				} else {

					mav = "redirect:/forgotPassword";
					session.setAttribute("errorMsg", "Invalid Moble number or Email.");
				}

			}

		} catch (Exception e) {
			mav = "redirect:/";
			session.setAttribute("errorMsg", "Invalid Moble number or Email.");
			e.printStackTrace();
		}

		return mav;
	}

	@RequestMapping(value = "/resetPassword", method = RequestMethod.GET)
	public String resetPassword(HttpServletRequest request, HttpServletResponse response, Model model) {

		return "resetPassword";
	}

	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String dashboard(HttpServletRequest request, HttpServletResponse response, Model model) {

		HttpSession session = request.getSession();

		// MnUser userInfo = (MnUser) session.getAttribute("userInfo");

		try {

			City[] city = Constants.getRestTemplate().getForObject(Constants.url + "getAllCities", City[].class);
			List<City> cityList = new ArrayList<>(Arrays.asList(city));
			model.addAttribute("cityList", cityList);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("compId", 1);
			Language[] language = Constants.getRestTemplate().postForObject(Constants.url + "getAllLanguages", map,
					Language[].class);
			List<Language> languageList = new ArrayList<>(Arrays.asList(language));
			model.addAttribute("languageList", languageList);

			map = new LinkedMultiValueMap<String, Object>();
			map.add("custId", 3);
			CustomerDisplay customer = Constants.getRestTemplate().postForObject(Constants.url + "getCustomerById", map,
					CustomerDisplay.class);
			model.addAttribute("customer", customer);

			session.setAttribute("liveCustomer", customer);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "dashboard";
	}

	@RequestMapping(value = "/getAreaListByCity", method = RequestMethod.POST)
	@ResponseBody
	public List<Area> getAreaListByCity(HttpServletRequest request, HttpServletResponse response, Model model) {

		List<Area> areaList = new ArrayList<>();
		try {

			int cityId = Integer.parseInt(request.getParameter("cityId"));

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("cityId", cityId);

			Area[] area = Constants.getRestTemplate().postForObject(Constants.url + "getAreaListByCity", map,
					Area[].class);
			areaList = new ArrayList<>(Arrays.asList(area));

		} catch (Exception e) {
			e.printStackTrace();
		}
		return areaList;
	}

	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public String checkout(HttpServletRequest request, HttpServletResponse response, Model model) {

		return "checkout";
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
	@ResponseBody
	public ErrorMessage sendNotification(HttpServletRequest request, HttpServletResponse response, Model model) {

		ErrorMessage ErrorMessage = new ErrorMessage();
		try {
			execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ErrorMessage;
	}

	Customer newcust = new Customer();
	CustomerAddress customerAddress = new CustomerAddress();

	@RequestMapping(value = "/sendOtpCustRegistration", method = RequestMethod.POST)
	@ResponseBody
	public ErrorMessage sendOtpCustRegistration(HttpServletRequest request, HttpServletResponse response) {
		ErrorMessage errorMessage = new ErrorMessage();
		try {

			String custname = request.getParameter("custname");
			String mobileNo = request.getParameter("mobileNo");
			String email = request.getParameter("email");
			String whatappno = request.getParameter("whatappno");
			String language = request.getParameter("language");
			String address = request.getParameter("address");

			String addcity = request.getParameter("addcity");
			String addarea = request.getParameter("addarea");
			String txtPlaces = request.getParameter("txtPlaces");
			String addLatitude = request.getParameter("addLatitude");
			String addLongitude = request.getParameter("addLongitude");

			newcust = new Customer();
			newcust.setCustName(custname);
			newcust.setEmailId(email);
			newcust.setPhoneNumber(mobileNo);
			newcust.setWhatsappNo(whatappno);
			newcust.setLangId(Integer.parseInt(language));
			newcust.setAddress(address);

			customerAddress = new CustomerAddress();
			customerAddress.setAddress(address);
			customerAddress.setCityId(Integer.parseInt(addcity));
			customerAddress.setAreaId(Integer.parseInt(addarea));
			customerAddress.setLandmark(txtPlaces);
			customerAddress.setLatitude(addLatitude);
			customerAddress.setLongitude(addLongitude);
			customerAddress.setAddressCaption("HOME");

			errorMessage.setError(false);
			errorMessage.setMessage("OTP send");

		} catch (Exception e) {
			errorMessage.setError(true);
			errorMessage.setMessage("failed to send");
			e.printStackTrace();
		}
		return errorMessage;
	}

	@RequestMapping(value = "/resendOTPregistration", method = RequestMethod.POST)
	@ResponseBody
	public ErrorMessage resendOTPregistration(HttpServletRequest request, HttpServletResponse response) {
		ErrorMessage errorMessage = new ErrorMessage();
		try {

			errorMessage.setError(false);
			errorMessage.setMessage("OTP send");

		} catch (Exception e) {
			errorMessage.setError(true);
			errorMessage.setMessage("failed to send");
			e.printStackTrace();
		}
		return errorMessage;
	}

	@RequestMapping(value = "/submitCustomerRegistration", method = RequestMethod.POST)
	@ResponseBody
	public Customer submitCustomerRegistration(HttpServletRequest request, HttpServletResponse response) {
		Customer res = new Customer();
		try {

			HttpSession session = request.getSession();
			MnUser userInfo = (MnUser) session.getAttribute("userInfo");
			Date dt = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			newcust.setAddedFormType(2);
			newcust.setCustAddDatetime(sf.format(dt));
			newcust.setUserId(userInfo.getUserId());
			newcust.setCompId(1);
			res = Constants.getRestTemplate().postForObject(Constants.url + "saveCustomer", newcust, Customer.class);

			if (res.isError() == false) {
				List<CustomerAddress> addList = new ArrayList<CustomerAddress>();
				customerAddress.setCustId(res.getCustId());
				addList.add(customerAddress);
				Info info = Constants.getRestTemplate().postForObject(Constants.url + "saveCustomerAddressList",
						addList, Info.class);

				LinkedMultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				map.add("custId", res.getCustId());
				CustomerDisplay customer = Constants.getRestTemplate().postForObject(Constants.url + "getCustomerById",
						map, CustomerDisplay.class);
				session.setAttribute("liveCustomer", customer);
			}

		} catch (Exception e) {

			res.setError(true);
			e.printStackTrace();
		}
		return res;
	}

	@RequestMapping(value = "/submitAddNewAddress", method = RequestMethod.POST)
	@ResponseBody
	public Info submitAddNewAddress(HttpServletRequest request, HttpServletResponse response) {

		Info info = new Info();
		try {

			HttpSession session = request.getSession();
			CustomerDisplay liveCustomer = (CustomerDisplay) session.getAttribute("liveCustomer");

			String addressCation = request.getParameter("addressCation");
			String addAddressCity = request.getParameter("addAddressCity");
			String addAddressArea = request.getParameter("addAddressArea");
			String addAddressLandmark = request.getParameter("addAddressLandmark");
			String addAddressDeliveryAdd = request.getParameter("addAddressDeliveryAdd");
			String addAddressLatitude = request.getParameter("addAddressLatitude");
			String addAddressLongitude = request.getParameter("addAddressLongitude");

			List<CustomerAddress> addList = new ArrayList<CustomerAddress>();
			CustomerAddress customerAddress = new CustomerAddress();
			customerAddress.setCustId(liveCustomer.getCustId());
			customerAddress.setAddressCaption(addressCation);
			customerAddress.setCityId(Integer.parseInt(addAddressCity));
			customerAddress.setAreaId(Integer.parseInt(addAddressArea));
			customerAddress.setLandmark(addAddressLandmark);
			customerAddress.setAddress(addAddressDeliveryAdd);
			customerAddress.setLatitude(addAddressLatitude);
			customerAddress.setLongitude(addAddressLongitude);

			addList.add(customerAddress);
			info = Constants.getRestTemplate().postForObject(Constants.url + "saveCustomerAddressList", addList,
					Info.class);

		} catch (Exception e) {

			info.setError(true);
			e.printStackTrace();
		}
		return info;
	}

	@RequestMapping(value = "/getAddressListOfCustomer", method = RequestMethod.POST)
	@ResponseBody
	public List<CustomerAddressDisplay> getAddressListOfCustomer(HttpServletRequest request,
			HttpServletResponse response) {

		List<CustomerAddressDisplay> addressList = new ArrayList<CustomerAddressDisplay>();
		try {

			HttpSession session = request.getSession();
			CustomerDisplay liveCustomer = (CustomerDisplay) session.getAttribute("liveCustomer");

			LinkedMultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("custId", liveCustomer.getCustId());
			CustomerAddressDisplay[] info = Constants.getRestTemplate()
					.postForObject(Constants.url + "getCustomerAddressList", map, CustomerAddressDisplay[].class);
			addressList = new ArrayList<>(Arrays.asList(info));
		} catch (Exception e) {

			e.printStackTrace();
		}
		return addressList;
	}

	private static final long serialVersionUID = -8022560668279505764L;

	// Method to send Notifications from server to client end.
	public final static String AUTH_KEY_FCM = "AAAAK88z50I:APA91bEu1TLNO0aV6Z16KjdQ5htyR3ju7eCOMPxpTyWQGuU7PZ26HzyVN-ZuIK4j7vz_iXoJaFBEwzhhGNs5bwQ792GySSLZ9nXq8i9wwt9GWWrn2bovhwFOvDUPhzIOYIQjG1bJgmdA";
	public final static String API_URL_FCM = "https://fcm.googleapis.com/fcm/send";
	public final static String DEVICE_ID = "";

//fcvBXJVWI_gpahKUUR5-MZ:APA91bEFA8ZUOPaVUp1m4HUdyWJ5x0j-DVpyvrICFZChkPokDT6uehb3GluQSmKX2UyImVyr353eQyp2rgaidt1G_Mg76XNKxBzjdmS9HqX-ZFTFiilOE1V64vq7h5U07ANJJqMYpqmC
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
				info.put("image", "/ck/resources/assets/img/dashboard_logo.png");

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

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {

		session.invalidate();
		return "redirect:/";
	}
	/*
	 * <script async defer src=
	 * "https://maps.googleapis.com/maps/api/js?key=AIzaSyBahlnISPYhetj3q50ADqVE6SECypRGe4A&callback=initMap">
	 */
}
