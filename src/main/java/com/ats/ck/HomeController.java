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
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ats.ck.common.Constants;
import com.ats.ck.common.EmailUtility;
import com.ats.ck.common.PushNotification;
import com.ats.ck.common.RandomString;
import com.ats.ck.model.Agent;
import com.ats.ck.model.Area;
import com.ats.ck.model.City;
import com.ats.ck.model.Customer;
import com.ats.ck.model.CustomerAddress;
import com.ats.ck.model.CustomerAddressDisplay;
import com.ats.ck.model.CustomerDisplay;
import com.ats.ck.model.ErrorMessage;
import com.ats.ck.model.FranchiseData;
import com.ats.ck.model.GetFranchiseData;
import com.ats.ck.model.GetOrderHeaderList;
import com.ats.ck.model.Info;
import com.ats.ck.model.ItemDisplay;
import com.ats.ck.model.Language;
import com.ats.ck.model.LoginResponse;
import com.ats.ck.model.MnUser;
import com.ats.ck.model.OrderListData;
import com.ats.ck.model.showCustomerInfo;
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
@Scope("session")
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
					session.setAttribute("profilePicUrl", Constants.imageShowUrl);
					session.setAttribute("allowOrderandCheckoutPage", 0);
					session.removeAttribute("liveCustomer");
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

	List<City> cityList = new ArrayList<>();

	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String dashboard(HttpServletRequest request, HttpServletResponse response, Model model) {

		HttpSession session = request.getSession();

		// MnUser userInfo = (MnUser) session.getAttribute("userInfo");

		try {

			/*String invoiceNo = String.format("%0" + 5 + "d", 101);

			System.out.println(invoiceNo);*/

			City[] city = Constants.getRestTemplate().getForObject(Constants.url + "getAllCities", City[].class);
			cityList = new ArrayList<>(Arrays.asList(city));
			model.addAttribute("cityList", cityList);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("compId", 1);
			Language[] language = Constants.getRestTemplate().postForObject(Constants.url + "getAllLanguages", map,
					Language[].class);
			List<Language> languageList = new ArrayList<>(Arrays.asList(language));
			model.addAttribute("languageList", languageList);

			GetFranchiseData frData = Constants.getRestTemplate().getForObject(Constants.url + "getFranchiseList",
					GetFranchiseData.class);
			List<FranchiseData> franchiseList = frData.getFranchise();
			model.addAttribute("franchiseList", franchiseList);
			session.setAttribute("allowOrderandCheckoutPage", 0);
			session.setAttribute("parkOrderToPlaceOrderOrderId", 0);

			try {
				CustomerDisplay liveCustomer = (CustomerDisplay) session.getAttribute("liveCustomer");
				map = new LinkedMultiValueMap<String, Object>();
				map.add("custId", liveCustomer.getCustId());
				CustomerDisplay customer = Constants.getRestTemplate().postForObject(Constants.url + "getCustomerById",
						map, CustomerDisplay.class);
				model.addAttribute("customer", customer);

				session.setAttribute("liveCustomer", customer);
			} catch (Exception e) {
				session.removeAttribute("liveCustomer");
			}
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

	@RequestMapping(value = "/getShopByCityId", method = RequestMethod.POST)
	@ResponseBody
	public GetFranchiseData getShopByCityId(HttpServletRequest request, HttpServletResponse response, Model model) {

		GetFranchiseData getFranchiseData = new GetFranchiseData();
		try {

			int cityId = Integer.parseInt(request.getParameter("cityId"));
			// int iscity = Integer.parseInt(request.getParameter("iscity"));

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("cityId", cityId);

			getFranchiseData = Constants.getRestTemplate().postForObject(Constants.url + "getShopByCityId", map,
					GetFranchiseData.class);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return getFranchiseData;
	}

	@RequestMapping(value = "/getAgetListByShopId", method = RequestMethod.POST)
	@ResponseBody
	public List<Agent> getAgetListByShopId(HttpServletRequest request, HttpServletResponse response, Model model) {

		List<Agent> list = new ArrayList<>();
		try {

			int cityId = Integer.parseInt(request.getParameter("cityId"));
			int shopId = Integer.parseInt(request.getParameter("shopId"));
			// int iscity = Integer.parseInt(request.getParameter("iscity"));

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("cityId", cityId);
			map.add("shopId", shopId);
			Agent[] agent = Constants.getRestTemplate().postForObject(Constants.url + "getAgetListByShopId", map,
					Agent[].class);
			list = new ArrayList<>(Arrays.asList(agent));

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@RequestMapping(value = "/checkMobileNo", method = RequestMethod.POST)
	@ResponseBody
	public Info checkMobileNo(HttpServletRequest request, HttpServletResponse response, Model model) {

		Info info = new Info();
		try {

			String mobileNo = request.getParameter("mobileNo");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("mobileNo", mobileNo);

			CustomerDisplay[] customerDisplay = Constants.getRestTemplate()
					.postForObject(Constants.url + "getCustomerByMobileNo", map, CustomerDisplay[].class);

			if (customerDisplay.length == 0) {
				info.setError(false);
			} else {
				info.setError(true);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return info;
	}

	@RequestMapping(value = "/findCustomerByMobileNo", method = RequestMethod.POST)
	@ResponseBody
	public Info findCustomerByMobileNo(HttpServletRequest request, HttpServletResponse response, Model model) {

		Info info = new Info();
		try {

			String mobileNo = request.getParameter("mobileNo");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("mobileNo", mobileNo);

			CustomerDisplay[] customerDisplay = Constants.getRestTemplate()
					.postForObject(Constants.url + "getCustomerByMobileNo", map, CustomerDisplay[].class);
			HttpSession session = request.getSession();
			if (customerDisplay.length == 0) {
				info.setError(false);
				session.removeAttribute("liveCustomer");
			} else {
				info.setError(true);
				map = new LinkedMultiValueMap<String, Object>();
				map.add("custId", customerDisplay[0].getCustId());
				CustomerDisplay customer = Constants.getRestTemplate().postForObject(Constants.url + "getCustomerById",
						map, CustomerDisplay.class);

				session.setAttribute("liveCustomer", customer);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return info;
	}

	@RequestMapping(value = "/getLiveList", method = RequestMethod.POST)
	@ResponseBody
	public OrderListData getLiveList(HttpServletRequest request, HttpServletResponse response, Model model) {

		OrderListData orderListData = new OrderListData();
		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("status", "0,1,2,3,4");

			orderListData = Constants.getRestTemplate().postForObject(Constants.url + "getOrderListByStatus", map,
					OrderListData.class);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return orderListData;
	}

	@RequestMapping(value = "/getCityList", method = RequestMethod.POST)
	@ResponseBody
	public List<City> getCityList(HttpServletRequest request, HttpServletResponse response, Model model) {

		try {

		} catch (Exception e) {
			e.printStackTrace();
		}
		return cityList;
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
			// execute();
			List<String> tokenList = new ArrayList<>();
			tokenList.add(DEVICE_ID);
			PushNotification.sendNotification(tokenList, "New Notification", "New Notification",
					"https://107.180.88.121:8443/CloudKitchen/firebase", "https://107.180.88.121:8443/CloudKitchen");

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
			HttpSession session = request.getSession();

			String custname = request.getParameter("custname");
			String mobileNo = request.getParameter("mobileNo");
			String email = request.getParameter("email");
			String whatappno = request.getParameter("whatappno");
			String language = request.getParameter("language");
			String address = request.getParameter("address");

			String addcity = request.getParameter("addcity");
			int iscity = Integer.parseInt(request.getParameter("iscity"));
			int addShop = Integer.parseInt(request.getParameter("addShop"));

			String regorderDate = request.getParameter("regorderDate");
			String regorderTime = request.getParameter("regorderTime");

			// session.setAttribute("addressId", addressId);
			session.setAttribute("frIdForOrder", addShop);
			session.setAttribute("orderTime", regorderTime);
			session.setAttribute("orderDate", regorderDate);

			// session.setAttribute("allowOrderandCheckoutPage", 1);

			String txtPlaces = request.getParameter("txtPlaces");

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

			if (iscity == 0) {
				customerAddress.setLandmark(txtPlaces);
				String addLatitude = request.getParameter("addLatitude");
				String addLongitude = request.getParameter("addLongitude");
				customerAddress.setLatitude(addLatitude);
				customerAddress.setLongitude(addLongitude);
				session.setAttribute("addCustAgent", 0);
			} else {
				int addCustAgent = Integer.parseInt(request.getParameter("addCustAgent"));
				session.setAttribute("addCustAgent", addCustAgent);
				customerAddress.setLatitude("");
				customerAddress.setLongitude("");
			}
			// customerAddress.setAreaId(Integer.parseInt(addarea));

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
			LinkedMultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("mobileNo", newcust.getPhoneNumber());
			CustomerDisplay[] customerDisplay = Constants.getRestTemplate()
					.postForObject(Constants.url + "getCustomerByMobileNo", map, CustomerDisplay[].class);

			if (customerDisplay.length == 0) {
				HttpSession session = request.getSession();
				MnUser userInfo = (MnUser) session.getAttribute("userInfo");
				Date dt = new Date();
				SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

				newcust.setAddedFormType(2);
				newcust.setCustAddDatetime(sf.format(dt));
				newcust.setUserId(userInfo.getUserId());
				newcust.setCompId(1);
				res = Constants.getRestTemplate().postForObject(Constants.url + "saveCustomer", newcust,
						Customer.class);

				if (res.isError() == false) {
					List<CustomerAddress> addList = new ArrayList<CustomerAddress>();
					customerAddress.setCustId(res.getCustId());
					addList.add(customerAddress);
					Info info = Constants.getRestTemplate().postForObject(Constants.url + "saveCustomerAddressList",
							addList, Info.class);
					if (info.getError() == false) {

						map = new LinkedMultiValueMap<String, Object>();
						map.add("custId", res.getCustId());
						CustomerDisplay customer = Constants.getRestTemplate()
								.postForObject(Constants.url + "getCustomerById", map, CustomerDisplay.class);
						session.setAttribute("liveCustomer", customer);

						session.setAttribute("addressId", Integer.parseInt(info.getMessage()));
						session.setAttribute("allowOrderandCheckoutPage", 1);
					} else {
						res.setError(true);
					}
				}
			} else {
				res.setError(true);
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
			int iscity = Integer.parseInt(request.getParameter("iscity"));
			String addAddressLandmark = request.getParameter("addAddressLandmark");
			String addAddressDeliveryAdd = request.getParameter("addAddressDeliveryAdd");
			String addAddressLatitude = request.getParameter("addAddressLatitude");
			String addAddressLongitude = request.getParameter("addAddressLongitude");
			int addAddressDetailId = Integer.parseInt(request.getParameter("addAddressDetailId"));

			List<CustomerAddress> addList = new ArrayList<CustomerAddress>();
			CustomerAddress customerAddress = new CustomerAddress();
			customerAddress.setCustId(liveCustomer.getCustId());
			customerAddress.setAddressCaption(addressCation);
			customerAddress.setCityId(Integer.parseInt(addAddressCity));
			if (iscity == 0) {
				customerAddress.setLandmark(addAddressLandmark);
				customerAddress.setLatitude(addAddressLatitude);
				customerAddress.setLongitude(addAddressLongitude);
			} else {
				customerAddress.setLandmark("-");
				customerAddress.setLatitude("");
				customerAddress.setLongitude("");
			}
			customerAddress.setAddress(addAddressDeliveryAdd);

			customerAddress.setCustAddressId(addAddressDetailId);
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

	@RequestMapping(value = "/deleteAddress", method = RequestMethod.POST)
	@ResponseBody
	public Info deleteAddress(HttpServletRequest request, HttpServletResponse response) {

		Info info = new Info();
		try {

			int addDetailId = Integer.parseInt(request.getParameter("id"));

			LinkedMultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("custAddressId", addDetailId);
			map.add("status", 1);
			info = Constants.getRestTemplate().postForObject(Constants.url + "deleteCustAddress", map, Info.class);

		} catch (Exception e) {

			e.printStackTrace();
		}
		return info;
	}

	@RequestMapping(value = "/editAddress", method = RequestMethod.POST)
	@ResponseBody
	public CustomerAddressDisplay editAddress(HttpServletRequest request, HttpServletResponse response) {

		CustomerAddressDisplay info = new CustomerAddressDisplay();
		try {

			int addDetailId = Integer.parseInt(request.getParameter("id"));

			LinkedMultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("custAddressId", addDetailId);
			info = Constants.getRestTemplate().postForObject(Constants.url + "getCustomerAddressListById", map,
					CustomerAddressDisplay.class);

		} catch (Exception e) {

			e.printStackTrace();
		}
		return info;
	}

	CustomerDisplay editcust = new CustomerDisplay();

	@RequestMapping(value = "/editCustomer", method = RequestMethod.POST)
	@ResponseBody
	public CustomerDisplay editCustomer(HttpServletRequest request, HttpServletResponse response) {

		editcust = new CustomerDisplay();
		try {

			HttpSession session = request.getSession();
			editcust = (CustomerDisplay) session.getAttribute("liveCustomer");

		} catch (Exception e) {

			e.printStackTrace();
		}
		return editcust;
	}

	@RequestMapping(value = "/displayCustomerInfo", method = RequestMethod.POST)
	@ResponseBody
	public showCustomerInfo displayCustomerInfo(HttpServletRequest request, HttpServletResponse response) {

		showCustomerInfo info = new showCustomerInfo();
		try {

			HttpSession session = request.getSession();
			editcust = (CustomerDisplay) session.getAttribute("liveCustomer");

			LinkedMultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("custId", editcust.getCustId());
			GetOrderHeaderList[] getOrderHeaderList = Constants.getRestTemplate()
					.postForObject(Constants.url + "getOrderListByCustomerId", map, GetOrderHeaderList[].class);
			List<GetOrderHeaderList> list = new ArrayList<>(Arrays.asList(getOrderHeaderList));

			info.setOrderListByStatus(list);
			info.setCustomerInfo(editcust);
		} catch (Exception e) {
			CustomerDisplay editcust = new CustomerDisplay();
			List<GetOrderHeaderList> list = new ArrayList<>();
			info.setOrderListByStatus(list);
			info.setCustomerInfo(editcust);
			// e.printStackTrace();
		}
		return info;
	}

	@RequestMapping(value = "/sumbitEditCust", method = RequestMethod.POST)
	@ResponseBody
	public Info sumbitEditCust(HttpServletRequest request, HttpServletResponse response) {

		Info info = new Info();
		try {

			String edit_custname = request.getParameter("edit_custname");
			String edit_whatappno = request.getParameter("edit_whatappno");
			String edit_email = request.getParameter("edit_email");
			String edit_language = request.getParameter("edit_language");

			editcust.setCustName(edit_custname);
			editcust.setWhatsappNo(edit_whatappno);
			editcust.setEmailId(edit_email);
			editcust.setLangId(Integer.parseInt(edit_language));

			Customer res = Constants.getRestTemplate().postForObject(Constants.url + "saveCustomer", editcust,
					Customer.class);

			LinkedMultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("custId", res.getCustId());
			CustomerDisplay customer = Constants.getRestTemplate().postForObject(Constants.url + "getCustomerById", map,
					CustomerDisplay.class);

			HttpSession session = request.getSession();
			session.setAttribute("liveCustomer", customer);
			info.setError(false);
		} catch (Exception e) {

			info.setError(true);
			e.printStackTrace();
		}
		return info;
	}

	private static final long serialVersionUID = -8022560668279505764L;

	// Method to send Notifications from server to client end.
	public final static String AUTH_KEY_FCM = "AAAAK88z50I:APA91bEu1TLNO0aV6Z16KjdQ5htyR3ju7eCOMPxpTyWQGuU7PZ26HzyVN-ZuIK4j7vz_iXoJaFBEwzhhGNs5bwQ792GySSLZ9nXq8i9wwt9GWWrn2bovhwFOvDUPhzIOYIQjG1bJgmdA";
	public final static String API_URL_FCM = "https://fcm.googleapis.com/fcm/send";
	public final static String DEVICE_ID = "dT6As-WOIk7rYCVARvWxYz:APA91bFUCw5XdkzS6wgkDnPMsfpgf2JZAbEylY-jNhHef6k6ux-AURbksoFJWCDxzbjiCYpmpOaIoLbS3tWTS9KFZWDl6TNIW4H8_m3HQUmbuPbqD2qQckbSiYypxJlv4OtK7mfS9Azw";

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

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {

		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/sessionTimeOut", method = RequestMethod.GET)
	public String sessionTimeOut(HttpSession session) {
		System.out.println("User Logout");

		session.invalidate();
		return "redirect:/";
	}

	/*
	 * <script async defer src=
	 * "https://maps.googleapis.com/maps/api/js?key=AIzaSyBahlnISPYhetj3q50ADqVE6SECypRGe4A&callback=initMap">
	 */
}
