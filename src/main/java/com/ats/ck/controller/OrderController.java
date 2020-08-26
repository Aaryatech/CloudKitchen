package com.ats.ck.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.net.URL;
import java.net.URLConnection;
import java.security.MessageDigest;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.SortedSet;
import java.util.TreeSet;
import java.util.UUID;

import javax.crypto.Mac;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.RedirectView;

import com.ats.ck.common.Constants;
import com.ats.ck.common.DateConvertor;
import com.ats.ck.common.EmailUtility;
import com.ats.ck.common.PushNotification;
import com.ats.ck.model.CategoryData;
import com.ats.ck.model.CustWalletTotal;
import com.ats.ck.model.CustomerAddressDisplay;
import com.ats.ck.model.CustomerDisplay;
import com.ats.ck.model.DeliveryInstruction;
import com.ats.ck.model.ErrorMessage;
import com.ats.ck.model.FranchiseData;
import com.ats.ck.model.GetAllDataByFr;
import com.ats.ck.model.GetCategoryData;
import com.ats.ck.model.GetFranchiseData;
import com.ats.ck.model.GetGrievienceList;
import com.ats.ck.model.GetOrderDetailList;
import com.ats.ck.model.GetOrderHeaderList;
import com.ats.ck.model.GetRelatedItemsAndFreqOrderList;
import com.ats.ck.model.GetSubCategoryData;
import com.ats.ck.model.GrievencesInstruction;
import com.ats.ck.model.Info;
import com.ats.ck.model.ItemDisplay;
import com.ats.ck.model.ItemJsonImportData;
import com.ats.ck.model.LoginResponse;
import com.ats.ck.model.MnUser;
import com.ats.ck.model.OfferHeader;
import com.ats.ck.model.OrderDetail;
import com.ats.ck.model.OrderFeedback;
import com.ats.ck.model.OrderGrievance;
import com.ats.ck.model.OrderGrievanceTrail;
import com.ats.ck.model.OrderHeader;
import com.ats.ck.model.OrderResponse;
import com.ats.ck.model.OrderSaveData;
import com.ats.ck.model.OrderTrail;
import com.ats.ck.model.Setting;
import com.ats.ck.model.SubCategoryData;
import com.ats.ck.model.Tags;
import com.ats.ck.model.Wallet;
import com.ats.ck.model.gatwaymodel.Body;
import com.ats.ck.model.gatwaymodel.Formdata;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@Scope("session")
public class OrderController {

	List<ItemDisplay> itemList = new ArrayList<>();

	@RequestMapping(value = "/addOrder", method = RequestMethod.GET)
	public String addOrder(HttpServletRequest request, HttpServletResponse response, Model model) {

		try {
			HttpSession session = request.getSession();
			int frId = (int) session.getAttribute("frIdForOrder");

			model.addAttribute("frId", frId);

			/*
			 * GetFranchiseData frData =
			 * Constants.getRestTemplate().getForObject(Constants.url + "getFranchiseList",
			 * GetFranchiseData.class); List<FranchiseData> franchiseList =
			 * frData.getFranchise();
			 */
			// model.addAttribute("franchiseList", franchiseList);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("frId", frId);
			map.add("type", 2);
			map.add("applicableFor", 1);
			map.add("compId", 1);
			GetAllDataByFr getAllDataByFr = Constants.getRestTemplate().postForObject(Constants.url + "getAllDataByFr",
					map, GetAllDataByFr.class);
			List<CategoryData> catList = getAllDataByFr.getCategoryData();
			model.addAttribute("catList", catList);
			model.addAttribute("catImageUrl", Constants.imageShowUrl);

			List<SubCategoryData> subcatList = getAllDataByFr.getSubCategoryData();
			model.addAttribute("subcatList", subcatList);

			List<Tags> tagList = getAllDataByFr.getTagsData();
			model.addAttribute("tagList", tagList);

			itemList = getAllDataByFr.getItemData();
			model.addAttribute("itemList", itemList);

			List<OfferHeader> offerList = getAllDataByFr.getOfferData();
			model.addAttribute("offerList", offerList);

			ObjectMapper Obj = new ObjectMapper();

			try {

				String jsonStr = Obj.writeValueAsString(itemList);
				model.addAttribute("jsonList", jsonStr);
			} catch (IOException e) {
			}

			// System.out.println("sdf" + session.getAttribute("frIdForOrder"));
			// model.addAttribute("frIdForOrder", session.getAttribute("frIdForOrder"));

		} catch (Exception e) {

			e.printStackTrace();

		}

		return "addOrder";
	}

	@RequestMapping(value = "/orderProcess", method = RequestMethod.POST)
	@ResponseBody
	public Info orderProcess(HttpServletRequest request, HttpServletResponse response, Model model) {

		Info info = new Info();

		try {
			HttpSession session = request.getSession();

			int addressId = Integer.parseInt(request.getParameter("addressId"));
			int iscity = Integer.parseInt(request.getParameter("iscity"));
			int placeCustAgent = Integer.parseInt(request.getParameter("placeCustAgent"));
			int frIdForOrder = Integer.parseInt(request.getParameter("frIdForOrder"));
			String orderTime = request.getParameter("orderTime");
			String orderDate = request.getParameter("orderDate");

			session.setAttribute("addressId", addressId);
			session.setAttribute("frIdForOrder", frIdForOrder);
			session.setAttribute("orderTime", orderTime);
			session.setAttribute("orderDate", orderDate);
			session.setAttribute("allowOrderandCheckoutPage", 1);

			if (iscity == 0) {
				session.setAttribute("addCustAgent", 0);
			} else {
				session.setAttribute("addCustAgent", placeCustAgent);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return info;
	}

	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public String checkout(HttpServletRequest request, HttpServletResponse response, Model model) {

		try {

			HttpSession session = request.getSession();

			LinkedMultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("custAddressId", session.getAttribute("addressId"));
			CustomerAddressDisplay addressDetail = Constants.getRestTemplate()
					.postForObject(Constants.url + "getCustomerAddressListById", map, CustomerAddressDisplay.class);

			model.addAttribute("addressDetail", addressDetail);

			map = new LinkedMultiValueMap<String, Object>();
			map.add("compId", 1);
			DeliveryInstruction[] deliveryInstruction = Constants.getRestTemplate()
					.postForObject(Constants.url + "getAllDeliveryInstructions", map, DeliveryInstruction[].class);
			List<DeliveryInstruction> deliveryInstructionList = new ArrayList<>(Arrays.asList(deliveryInstruction));
			model.addAttribute("deliveryInstructionList", deliveryInstructionList);

			/*
			 * map = new LinkedMultiValueMap<String, Object>(); map.add("custAddressId",
			 * session.getAttribute("addressId")); CustomerAddressDisplay addressDetail =
			 * Constants.getRestTemplate() .postForObject(Constants.url +
			 * "getCustomerAddressListById", map, CustomerAddressDisplay.class);
			 */

			SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yyyy hh:mm");
			SimpleDateFormat timeFormat = new SimpleDateFormat("hh:mm a");
			SimpleDateFormat dateFormate = new SimpleDateFormat("dd-MM-yyyy");
			String orderTime = (String) session.getAttribute("orderTime");
			String orderDate = (String) session.getAttribute("orderDate");

			String dttime = orderDate + " " + orderTime;
			Date dt = sf.parse(dttime);

			String time = timeFormat.format(dt);
			String date = dateFormate.format(dt);
			model.addAttribute("time", time);
			model.addAttribute("date", date);

			model.addAttribute("catImageUrl", Constants.imageShowUrl);

			String itemIdsForRelatedItem = (String) session.getAttribute("itemIdsForRelatedItem");
			CustomerDisplay liveCustomer = (CustomerDisplay) session.getAttribute("liveCustomer");

			map = new LinkedMultiValueMap<String, Object>();
			map.add("frId", session.getAttribute("frIdForOrder"));
			map.add("type", 2);
			map.add("applicableFor", 1);
			map.add("itemIds", itemIdsForRelatedItem);
			map.add("custId", liveCustomer.getCustId());

			GetRelatedItemsAndFreqOrderList getRelatedItemsAndFreqOrderList = Constants.getRestTemplate().postForObject(
					Constants.url + "getRelAndFreqOrderItemList", map, GetRelatedItemsAndFreqOrderList.class);

			List<ItemDisplay> relatedItemList = getRelatedItemsAndFreqOrderList.getRelatedItemList();
			List<ItemDisplay> favrouitItemList = getRelatedItemsAndFreqOrderList.getFreqOrderItemList();

			// System.out.println(favrouitItemList);
			model.addAttribute("relatedItemList", relatedItemList);
			model.addAttribute("favItemList", favrouitItemList);

			map = new LinkedMultiValueMap<String, Object>();
			map.add("frId", session.getAttribute("frIdForOrder"));
			FranchiseData franchiseData = Constants.getRestTemplate()
					.postForObject(Constants.url + "getFranchiseByFrId", map, FranchiseData.class);
			model.addAttribute("franchiseData", franchiseData);

			try {
				map = new LinkedMultiValueMap<String, Object>();
				map.add("custId", liveCustomer.getCustId());

				CustWalletTotal wallet = Constants.getRestTemplate()
						.postForObject(Constants.url + "getCustomerWalletAmt", map, CustWalletTotal.class);
				model.addAttribute("wallet", wallet);
			} catch (Exception e) {
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "checkout";
	}

	@RequestMapping(value = "/getItemList", method = RequestMethod.POST)
	@ResponseBody
	public List<ItemDisplay> getItemList(HttpServletRequest request, HttpServletResponse response, Model model) {

		try {
			/*
			 * ObjectMapper Obj = new ObjectMapper(); String jsonStr =
			 * Obj.writeValueAsString(itemList); model.addAttribute("jsonList", jsonStr);
			 */
		} catch (Exception e) {
		}
		return itemList;
	}

	@RequestMapping(value = "/placeOrder", method = RequestMethod.POST)
	@ResponseBody
	public OrderResponse placeOrder(HttpServletRequest request, HttpServletResponse response, Model model) {

		OrderResponse orderResponse = new OrderResponse();
		HttpSession session = request.getSession();

		try {
			MnUser userObj = (MnUser) session.getAttribute("userInfo");
			int parkOrderToPlaceOrderOrderId = (int) session.getAttribute("parkOrderToPlaceOrderOrderId");
			int status = Integer.parseInt(request.getParameter("status"));
			int frId = (int) session.getAttribute("frIdForOrder");
			int paymentMethod = Integer.parseInt(request.getParameter("paymentMethod"));
			float deliveryCharges = Float.parseFloat(request.getParameter("deliveryCharges"));

			float applyWalletAmt = 0;
			try {
				applyWalletAmt = Float.parseFloat(request.getParameter("applyWalletAmt"));
			} catch (Exception e) {
				applyWalletAmt = 0;
			}

			float finaTaxableAmt = 0;
			float finaTaxAmt = 0;
			float finaTotalAmt = 0;
			float finalCgstAmt = 0;
			float finalsgstAmt = 0;
			float finalIgstAmt = 0;

			String uuid = "0";
			// String orderNo = "0";

			if (parkOrderToPlaceOrderOrderId == 0) {

				uuid = UUID.randomUUID().toString();
				Date ct = new Date();
				SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
				SimpleDateFormat dttime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

				CustomerDisplay liveCustomer = (CustomerDisplay) session.getAttribute("liveCustomer");

				String itemData = request.getParameter("itemaData");
				// int status = Integer.parseInt(request.getParameter("status"));
				// int paymentMethod = Integer.parseInt(request.getParameter("paymentMethod"));
				int homeDelivery = Integer.parseInt(request.getParameter("homeDelivery"));
				int deliveryInstru = Integer.parseInt(request.getParameter("deliveryInstru"));
				String textDeliveryInstr = request.getParameter("textDeliveryInstr");
				String billingName = request.getParameter("billingName");
				String billingAddress = request.getParameter("billingAddress");
				String orderTime = (String) session.getAttribute("orderTime");
				String orderDate = (String) session.getAttribute("orderDate");
				// int frId = (int) session.getAttribute("frIdForOrder");
				int addressId = (int) session.getAttribute("addressId");
				int addCustAgent = (int) session.getAttribute("addCustAgent");

				// float deliveryCharges =
				// Float.parseFloat(request.getParameter("deliveryCharges"));

				// create ObjectMapper instance
				ObjectMapper objectMapper = new ObjectMapper();

				// convert json string to object
				ItemJsonImportData[] itemJsonImportData = objectMapper.readValue(itemData, ItemJsonImportData[].class);

				LinkedMultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				map.add("custAddressId", addressId);
				CustomerAddressDisplay addressDetail = Constants.getRestTemplate()
						.postForObject(Constants.url + "getCustomerAddressListById", map, CustomerAddressDisplay.class);

				/*
				 * map = new LinkedMultiValueMap<String, Object>(); map.add("key", "ORDER_NO");
				 * Setting setting = Constants.getRestTemplate() .postForObject(Constants.url +
				 * "getCustomerAddressListById", map, Setting.class);
				 */

				DecimalFormat df = new DecimalFormat("#.00");

				OrderHeader order = new OrderHeader();
				order.setOrderNo("0002");
				order.setOrderDate(sf.format(ct));
				order.setFrId(frId);
				order.setCustId(liveCustomer.getCustId());

				if (paymentMethod == 2 && status == 1) {
					order.setOrderStatus(9);
				} else {
					order.setOrderStatus(status);
				}

				order.setPaidStatus(0);
				order.setPaymentMethod(paymentMethod);
				order.setCityId(addressDetail.getCityId());
				order.setAreaId(addressDetail.getAreaId());
				order.setAddressId(addressId);
				order.setAddress(addressDetail.getAddress());
				order.setWhatsappNo(liveCustomer.getWhatsappNo());
				order.setLandmark(addressDetail.getLandmark());
				order.setDeliveryDate(DateConvertor.convertToYMD(orderDate));
				order.setDeliveryTime(orderTime);
				order.setInsertDateTime(dttime.format(ct));
				order.setInsertUserId(userObj.getUserId());
				order.setOrderPlatform(1);
				order.setBillingName(billingName);
				order.setBillingAddress(billingAddress);
				order.setDeliveryType(homeDelivery);
				order.setDeliveryInstId(deliveryInstru);
				order.setDeliveryInstText(textDeliveryInstr);
				order.setDeliveryCharges(deliveryCharges);
				order.setUuidNo(uuid);
				order.setExFloat1(applyWalletAmt);// Wallet Amt

				if (addCustAgent > 0) {
					order.setIsAgent(1);
					order.setOrderDeliveredBy(addCustAgent);
				}
				List<OrderDetail> orderDetailList = new ArrayList<>();

				for (int i = 0; i < itemJsonImportData.length; i++) {

					OrderDetail orderDetail = new OrderDetail();
					orderDetail.setItemId(itemJsonImportData[i].getItemId());
					orderDetail.setQty(itemJsonImportData[i].getQty());
					orderDetail.setRate(itemJsonImportData[i].getPrice());
					orderDetail.setCgstPer(itemJsonImportData[i].getCgstPer());
					orderDetail.setIgstPer(itemJsonImportData[i].getIgstPer());
					orderDetail.setSgstPer(itemJsonImportData[i].getSgstPer());
					orderDetail.setRemark(itemJsonImportData[i].getSpecialremark());

					float taxableAmt = Float.parseFloat(df.format(
							(itemJsonImportData[i].getTotal() * 100) / (100 + itemJsonImportData[i].getIgstPer())));
					float taxAmt = Float.parseFloat(df.format(itemJsonImportData[i].getTotal() - taxableAmt));
					orderDetail.setTaxableAmt(taxableAmt);
					orderDetail.setTaxAmt(taxAmt);
					orderDetail.setTotalAmt(itemJsonImportData[i].getTotal());

					orderDetail.setCgstAmt(taxAmt / 2);
					orderDetail.setSgstAmt(taxAmt / 2);
					orderDetail.setIgstAmt(taxAmt);

					finalCgstAmt = Float.parseFloat(df.format(finalCgstAmt + (taxAmt / 2)));
					finalsgstAmt = Float.parseFloat(df.format(finalsgstAmt + (taxAmt / 2)));
					finalIgstAmt = Float.parseFloat(df.format(finalIgstAmt + (taxAmt)));

					finaTaxableAmt = Float.parseFloat(df.format(finaTaxableAmt + taxableAmt));
					finaTaxAmt = Float.parseFloat(df.format(finaTaxAmt + taxAmt));
					finaTotalAmt = Float.parseFloat(df.format(finaTotalAmt + itemJsonImportData[i].getTotal()));

					for (int j = 0; j < itemList.size(); j++) {

						if (itemJsonImportData[i].getItemId() == itemList.get(j).getItemId()) {
							orderDetail.setMrp(itemList.get(j).getMrpAmt());
							break;
						}

					}
					orderDetailList.add(orderDetail);

				}

				order.setTaxableAmt(finaTaxableAmt);
				order.setTaxAmt(finaTaxAmt);
				order.setTotalAmt(finaTotalAmt + deliveryCharges);
				order.setSgstAmt(finalsgstAmt);
				order.setCgstAmt(finalCgstAmt);
				order.setIgstAmt(finalIgstAmt);

				OrderTrail orderTrail = new OrderTrail();
				orderTrail.setActionByUserId(userObj.getUserId());
				orderTrail.setActionDateTime(dttime.format(ct));
				orderTrail.setStatus(status);
				orderTrail.setExInt1(1);
				orderTrail.setExVar1("-");
				
				OrderSaveData orderSaveData = new OrderSaveData();
				orderSaveData.setOrderDetailList(orderDetailList);
				orderSaveData.setOrderHeader(order);
				orderSaveData.setOrderTrail(orderTrail);

				Info info = Constants.getRestTemplate().postForObject(Constants.url + "saveCloudOrder", orderSaveData,
						Info.class);

				orderResponse.setError(info.getError());

				if (info.getError() == false) {
					orderResponse.setFrId(frId);
					orderResponse.setOrderId(Integer.parseInt(info.getMessage()));
					orderResponse.setInsertDateTime(dttime.format(ct));
					orderResponse.setUserId(userObj.getUserId());
					orderResponse.setUuidNo(uuid);

					if (status == 0) {
						session.setAttribute("successMsg", "Order Park successfully.");
					} else {
						session.setAttribute("successMsg", "Order place successfully.");
					}
					orderResponse.setAddEdit(1);

					try {
						if (applyWalletAmt > 0) {
							Wallet wallet = new Wallet(0, Integer.parseInt(info.getMessage()), 0, frId, paymentMethod,
									0, 0, applyWalletAmt, 1, userObj.getUserId(), sf.format(ct), dttime.format(ct), 0,
									0, "", "", 0, 0);
							Constants.getRestTemplate().postForObject(Constants.url + "saveWallet", wallet,
									Wallet.class);
						}
					} catch (Exception e) {
					}

				} else {
					session.setAttribute("errorMsg", "Something wrong while placing order.");
				}

			} else {

				Date ct = new Date();
				SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
				SimpleDateFormat dttime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				map.add("orderId", parkOrderToPlaceOrderOrderId);
				GetOrderHeaderList getOrderHeaderList = Constants.getRestTemplate()
						.postForObject(Constants.url + "getOrderOrderId", map, GetOrderHeaderList.class);

				uuid = getOrderHeaderList.getUuidNo();

				String itemData = request.getParameter("itemaData");
				// int status = Integer.parseInt(request.getParameter("status"));
				// int paymentMethod = Integer.parseInt(request.getParameter("paymentMethod"));
				int homeDelivery = Integer.parseInt(request.getParameter("homeDelivery"));
				int deliveryInstru = Integer.parseInt(request.getParameter("deliveryInstru"));
				String textDeliveryInstr = request.getParameter("textDeliveryInstr");
				String billingName = request.getParameter("billingName");
				String billingAddress = request.getParameter("billingAddress");
				// float deliveryCharges =
				// Float.parseFloat(request.getParameter("deliveryCharges"));

				// create ObjectMapper instance
				ObjectMapper objectMapper = new ObjectMapper();

				// convert json string to object
				ItemJsonImportData[] itemJsonImportData = objectMapper.readValue(itemData, ItemJsonImportData[].class);

				DecimalFormat df = new DecimalFormat("#.00");

				getOrderHeaderList.setOrderDate(sf.format(ct));

				if (paymentMethod == 2 && status == 1) {
					getOrderHeaderList.setOrderStatus(9);
				} else {
					getOrderHeaderList.setOrderStatus(status);
				}

				getOrderHeaderList.setPaymentMethod(paymentMethod);
				getOrderHeaderList.setBillingName(billingName);
				getOrderHeaderList.setBillingAddress(billingAddress);
				getOrderHeaderList.setDeliveryType(homeDelivery);
				getOrderHeaderList.setDeliveryInstId(deliveryInstru);
				getOrderHeaderList.setDeliveryInstText(textDeliveryInstr);
				getOrderHeaderList.setDeliveryCharges(deliveryCharges);
				getOrderHeaderList.setDeliveryDate(DateConvertor.convertToYMD(getOrderHeaderList.getDeliveryDate()));
				getOrderHeaderList.setInsertDateTime(dttime.format(ct));
				getOrderHeaderList.setInsertUserId(userObj.getUserId());
				getOrderHeaderList.setExFloat1(applyWalletAmt);
				List<GetOrderDetailList> orderDetailList = getOrderHeaderList.getDetailList();

				for (int i = 0; i < itemJsonImportData.length; i++) {

					int findItem = 0;

					for (int j = 0; j < orderDetailList.size(); j++) {

						if (itemJsonImportData[i].getItemId() == orderDetailList.get(j).getItemId()) {

							orderDetailList.get(j).setQty(itemJsonImportData[i].getQty());
							orderDetailList.get(j).setRate(itemJsonImportData[i].getPrice());
							orderDetailList.get(j).setCgstPer(itemJsonImportData[i].getCgstPer());
							orderDetailList.get(j).setIgstPer(itemJsonImportData[i].getIgstPer());
							orderDetailList.get(j).setSgstPer(itemJsonImportData[i].getSgstPer());
							orderDetailList.get(j).setRemark(itemJsonImportData[i].getSpecialremark());
							float taxableAmt = Float.parseFloat(df.format((itemJsonImportData[i].getTotal() * 100)
									/ (100 + itemJsonImportData[i].getIgstPer())));
							float taxAmt = Float.parseFloat(df.format(itemJsonImportData[i].getTotal() - taxableAmt));
							orderDetailList.get(j).setTaxableAmt(taxableAmt);
							orderDetailList.get(j).setTaxAmt(taxAmt);
							orderDetailList.get(j).setTotalAmt(itemJsonImportData[i].getTotal());

							orderDetailList.get(j).setCgstAmt(taxAmt / 2);
							orderDetailList.get(j).setSgstAmt(taxAmt / 2);
							orderDetailList.get(j).setIgstAmt(taxAmt);

							for (int k = 0; k < itemList.size(); k++) {

								if (itemJsonImportData[i].getItemId() == itemList.get(k).getItemId()) {
									orderDetailList.get(j).setMrp(itemList.get(j).getMrpAmt());
									break;
								}

							}
							findItem = 1;
							break;
						}
					}

					if (findItem == 0) {

						GetOrderDetailList orderDetail = new GetOrderDetailList();
						orderDetail.setOrderId(getOrderHeaderList.getOrderId());
						orderDetail.setItemId(itemJsonImportData[i].getItemId());
						orderDetail.setQty(itemJsonImportData[i].getQty());
						orderDetail.setRate(itemJsonImportData[i].getPrice());
						orderDetail.setCgstPer(itemJsonImportData[i].getCgstPer());
						orderDetail.setIgstPer(itemJsonImportData[i].getIgstPer());
						orderDetail.setSgstPer(itemJsonImportData[i].getSgstPer());
						orderDetail.setRemark(itemJsonImportData[i].getSpecialremark());

						float taxableAmt = Float.parseFloat(df.format(
								(itemJsonImportData[i].getTotal() * 100) / (100 + itemJsonImportData[i].getIgstPer())));
						float taxAmt = Float.parseFloat(df.format(itemJsonImportData[i].getTotal() - taxableAmt));

						orderDetail.setTaxableAmt(taxableAmt);
						orderDetail.setTaxAmt(taxAmt);
						orderDetail.setTotalAmt(itemJsonImportData[i].getTotal());

						orderDetail.setCgstAmt(taxAmt / 2);
						orderDetail.setSgstAmt(taxAmt / 2);
						orderDetail.setIgstAmt(taxAmt);

						for (int j = 0; j < itemList.size(); j++) {

							if (itemJsonImportData[i].getItemId() == itemList.get(j).getItemId()) {
								orderDetail.setMrp(itemList.get(j).getMrpAmt());
								break;
							}

						}
						orderDetailList.add(orderDetail);
					}

				}

				for (int j = 0; j < orderDetailList.size(); j++) {
					int findItem = 0;

					for (int i = 0; i < itemJsonImportData.length; i++) {

						if (orderDetailList.get(j).getItemId() == itemJsonImportData[i].getItemId()) {

							finalCgstAmt = Float
									.parseFloat(df.format(finalCgstAmt + (orderDetailList.get(i).getTaxAmt() / 2)));
							finalsgstAmt = Float
									.parseFloat(df.format(finalsgstAmt + (orderDetailList.get(i).getTaxAmt() / 2)));
							finalIgstAmt = Float
									.parseFloat(df.format(finalIgstAmt + (orderDetailList.get(i).getTaxAmt())));

							finaTaxableAmt = Float
									.parseFloat(df.format(finaTaxableAmt + orderDetailList.get(i).getTaxableAmt()));
							finaTaxAmt = Float.parseFloat(df.format(finaTaxAmt + orderDetailList.get(i).getTaxAmt()));
							finaTotalAmt = Float.parseFloat(df.format(finaTotalAmt + itemJsonImportData[i].getTotal()));
							findItem = 1;
							break;
						}
					}

					if (findItem == 0) {
						orderDetailList.get(j).setDelStatus(1);
					}
				}

				getOrderHeaderList.setTaxableAmt(finaTaxableAmt);
				getOrderHeaderList.setTaxAmt(finaTaxAmt);
				getOrderHeaderList.setTotalAmt(finaTotalAmt + deliveryCharges);
				getOrderHeaderList.setSgstAmt(finalsgstAmt);
				getOrderHeaderList.setCgstAmt(finalCgstAmt);
				getOrderHeaderList.setIgstAmt(finalIgstAmt);

				OrderTrail orderTrail = new OrderTrail();
				orderTrail.setOrderId(parkOrderToPlaceOrderOrderId);
				orderTrail.setActionByUserId(userObj.getUserId());
				orderTrail.setActionDateTime(dttime.format(ct));
				orderTrail.setStatus(status);
				orderTrail.setExInt1(1);
				orderTrail.setExVar1("-");
				
				OrderHeader orderHeaderRes = Constants.getRestTemplate()
						.postForObject(Constants.url + "updateOrderHeader", getOrderHeaderList, OrderHeader.class);

				OrderDetail[] orderDetail = Constants.getRestTemplate()
						.postForObject(Constants.url + "updateOrderHeaderDetail", orderDetailList, OrderDetail[].class);

				OrderTrail orderTrailRes = Constants.getRestTemplate().postForObject(Constants.url + "insertOrderTrail",
						orderTrail, OrderTrail.class);

				orderResponse.setFrId(getOrderHeaderList.getFrId());
				orderResponse.setOrderId(orderHeaderRes.getOrderId());
				orderResponse.setInsertDateTime(dttime.format(ct));
				orderResponse.setUserId(userObj.getUserId());
				orderResponse.setAddEdit(2);
				orderResponse.setError(false);
				orderResponse.setUuidNo(uuid);

				if (status == 0) {
					session.setAttribute("successMsg", "Order Park successfully.");
				} else {
					session.setAttribute("successMsg", "Order place successfully.");
				}

			}

			orderResponse.setPaymentStatus(0);
			orderResponse.setStatus(status);
			// int status = Integer.parseInt(request.getParameter("status"));

			if (status == 1) {

				if (paymentMethod == 2) {

					try {
						DecimalFormat df = new DecimalFormat("#.00");

						MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
						map.add("orderId", orderResponse.getOrderId());
						GetOrderHeaderList getOrderHeaderList = Constants.getRestTemplate()
								.postForObject(Constants.url + "getOrderOrderId", map, GetOrderHeaderList.class);

						orderResponse.setStatus(9);
						CustomerDisplay liveCustomer = (CustomerDisplay) session.getAttribute("liveCustomer");

						String totalAmt = df.format(finaTotalAmt + deliveryCharges);

						map = new LinkedMultiValueMap<String, Object>();

						map.add("appId", "27027a6652b91619aa1a8ad8172072");
						map.add("secretKey", "68bdc7d71b4ff20a294a8844c98fdb696510078d");
						/*map.add("appId", "7233535973c0dcc4f58af274653327");
						map.add("secretKey", "44bb412ea48da2acb093573debfdd42306099612");*/
						map.add("orderId", uuid);
						map.add("orderAmount", totalAmt);
						map.add("orderCurrency", "INR");
						map.add("orderNote", "Ok");
						map.add("customerEmail", liveCustomer.getEmailId());
						map.add("customerName", liveCustomer.getCustName());
						map.add("customerPhone", liveCustomer.getPhoneNumber());
						map.add("returnUrl", Constants.softPath + "returnUrl");
						map.add("notifyUrl", Constants.softPath + "notifyUrl");

						Body res = Constants.getRestTemplate()
								.postForObject("https://test.cashfree.com/api/v1/order/create", map, Body.class);
						/*Body res = Constants.getRestTemplate()
								.postForObject("https://api.cashfree.com/api/v1/order/create", map, Body.class);*/

						String subject = "Order Payment Link";
						String msg = "<html xmlns=\"http://www.w3.org/1999/xhtml\">\n" + "<head>\n"
								+ "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n"
								+ "<title>cloud Kitchen :: Happiness is homemade</title>\n" + "</head>\n"
								+ "<body leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginheight=\"0\"\n"
								+ "	yahoo=\"fix\"\n"
								+ "	style=\"font-family: Arial, sans-serif; background: #e3ebef;\">\n"
								+ "	<!-- Wrapper -->\n"
								+ "	<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"\n"
								+ "		align=\"center\" style=\"margin-top: 10px; margin-bottom: 10px;\">\n"
								+ "		<tr>\n" + "			<td width=\"100%\" valign=\"top\" bgcolor=\"#e3ebef\">\n"
								+ "				<!-- Start Header--> <!--style=\"padding-top:20px; padding-bottom:20px;\"-->\n"
								+ "\n"
								+ "				<table width=\"700\" id=\"tborder\" class=\"deviceWidth\" bgcolor=\"#fff\"\n"
								+ "					align=\"center\" cellspacing=\"0\" cellpadding=\"0\"\n"
								+ "					style=\"position: relative; border: 2px solid #d8e0e4;\">\n"
								+ "					<!--f07d00-->\n" + "					<tr>\n"
								+ "						<td cellspacing=\"0\" cellpadding=\"0\" style=\"padding: 0;\"><table\n"
								+ "								width=\"100%\" id=\"\" class=\"\" cellspacing=\"0\" cellpadding=\"0\"\n"
								+ "								align=\"center\" background=\"#000\" border=\"0\" style=\"padding: 0;\">\n"
								+ "								<tr>\n"
								+ "									<td align=\"center\" style=\"background: #2a3042;\"><img\n"
								+ "										src=\"" + Constants.softPath
								+ "resources/assets/img/cloud_kitchen.png\"\n"
								+ "										alt=\"cloud_kitchen\"\n"
								+ "										style=\"border: none; max-width: 100%; float: none;\"></td>\n"
								+ "								</tr>\n" + "								<tr>\n"
								+ "									<td cellspacing=\"0\" cellpadding=\"0\"\n"
								+ "										style=\"position: relative; padding: 30px 40px;\" border=\"0\"><table\n"
								+ "											width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"\n"
								+ "											align=\"center\">\n"
								+ "											<tr>\n"
								+ "												<td\n"
								+ "													style=\"text-align: center; font-size: 12px; text-transform: uppercase; padding: 0 0 5px 0; color: #f26a90;\"><strong>Hey\n"
								+ "														" + liveCustomer.getCustName()
								+ "</strong></td>\n" + "											</tr>\n"
								+ "											<tr>\n"
								+ "												<td\n"
								+ "													style=\"text-align: center; padding: 0 0 15px 0; font-size: 13px; line-height: 22px; color: #3a3a3a;\"><strong\n"
								+ "													style=\"color: #32b0de;\">Business Name</strong> has\n"
								+ "													requested a payment of amount INR "
								+ totalAmt + " for your order #" + getOrderHeaderList.getOrderNo() + ".\n"
								+ "													Please click on pay button below to make payment.</td>\n"
								+ "											</tr>\n"
								+ "											<tr>\n"
								+ "												<td style=\"text-align: center;\"><a\n"
								+ "													href=" + res.getPaymentLink()
								+ " target=\"_blank\"\n"
								+ "													style=\"background: #9ccd2b; padding: 9px 30px; color: #FFF; font-size: 12px; text-transform: uppercase; font-weight: bold; text-decoration: none;\">Click\n"
								+ "														to pay INR " + totalAmt
								+ "</a></td>\n" + "											</tr>\n"
								+ "										</table></td>\n"
								+ "								</tr>\n" + "								<tr>\n"
								+ "									<td><img\n"
								+ "										src=\"" + Constants.softPath
								+ "resources/assets/img/seprator.jpg\"\n"
								+ "										alt=\"seprator\"\n"
								+ "										style=\"border: none; max-width: 100%; float: left; padding: 0 0 28px 0;\"></td>\n"
								+ "								</tr>\n" + "								<tr>\n"
								+ "									<td cellspacing=\"0\" cellpadding=\"0\"\n"
								+ "										style=\"position: relative; padding: 0 50px;\" border=\"0\"><table\n"
								+ "											width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"\n"
								+ "											style=\"border: 1px solid #e3ebef;\">\n"
								+ "											<tr>\n"
								+ "												<td\n"
								+ "													style=\"background: #32b0de; padding: 10px; color: #FFF; text-align: center; font-size: 13px; font-weight: bold;\">Order\n"
								+ "													Details</td>\n"
								+ "											</tr>\n"
								+ "											<tr>\n"
								+ "												<td\n"
								+ "													style=\"padding: 10px 15px; border-bottom: 1px solid #e3ebef; font-size: 14px; color: #3a3a3a;\"><strong\n"
								+ "													style=\"font-size: 13px;\">Order / Invoice Number</strong>\n"
								+ "													&nbsp; #"
								+ getOrderHeaderList.getOrderNo() + "</td>\n"
								+ "											</tr>\n"
								+ "											<tr>\n"
								+ "												<td\n"
								+ "													style=\"padding: 10px 15px; background: #ecf4f8; border-bottom: 1px solid #e3ebef; font-size: 14px; color: #3a3a3a;\"><strong\n"
								+ "													style=\"font-size: 13px;\">Amount</strong> &nbsp; INR "
								+ totalAmt + "</td>\n" + "											</tr>\n"
								+ "										</table></td>\n"
								+ "								</tr>\n" + "								<tr>\n"
								+ "									<td><img\n"
								+ "										src=\"" + Constants.softPath
								+ "resources/assets/img/seprator.jpg\"\n"
								+ "										alt=\"seprator\"\n"
								+ "										style=\"border: none; max-width: 100%; float: left; padding: 28px 0;\"></td>\n"
								+ "								</tr>\n" + "								<tr>\n"
								+ "									<td cellspacing=\"0\" cellpadding=\"0\"\n"
								+ "										style=\"position: relative; padding: 0 30px 30px 30px;\"\n"
								+ "										border=\"0\"><table width=\"100%\" border=\"0\" cellspacing=\"0\"\n"
								+ "											cellpadding=\"0\">\n"
								+ "											<tr>\n"
								+ "												<td\n"
								+ "													style=\"font-size: 13px; padding: 0 0 8px 0; color: #262626;\"><strong>Merchant\n"
								+ "														Contact</strong> - Email : <a href=\"mailto:akshay@cloudkitchen.in\"\n"
								+ "													style=\"color: #4666b9; text-decoration: underline;\">akshay@cloudkitchen.in</a>\n"
								+ "													| Phone : <a href=\"tel:123-456-7890\"\n"
								+ "													style=\"color: #4666b9; text-decoration: underline;\">123-456-7890</a></td>\n"
								+ "											</tr>\n"
								+ "											<tr>\n"
								+ "												<td\n"
								+ "													style=\"font-size: 13px; color: #262626; padding: 0 0 8px 0;\">(Hit\n"
								+ "													'Reply' to send a query to merchant)</td>\n"
								+ "											</tr>\n"
								+ "											<tr>\n"
								+ "												<td\n"
								+ "													style=\"color: #8f8b9f; font-size: 12px; padding: 10px 0; line-height: 20px;\">if\n"
								+ "													you are not the intended receiver of his email or feel\n"
								+ "													there has been a mistake, then please reach out to <a\n"
								+ "													href=\"mailto:support@cloudkitchen.com\"\n"
								+ "													style=\"color: #4666b9; text-decoration: underline;\">support@cloudkitchen.com</a>\n"
								+ "												</td>\n"
								+ "											</tr>\n"
								+ "											<tr>\n"
								+ "												<td\n"
								+ "													style=\"color: #3a3a3a; font-size: 13px; line-height: 20px; font-weight: bold;\">Regards,<br>\n"
								+ "													Team CloudKitchen\n"
								+ "												</td>\n"
								+ "											</tr>\n"
								+ "										</table></td>\n"
								+ "								</tr>\n"
								+ "							</table> <!--bottom start---> <!--bottom end---></td>\n"
								+ "					</tr>\n" + "				</table> <!--end-->\n"
								+ "			</td>\n" + "		</tr>\n" + "	</table>\n"
								+ "	<!-- End Wrapper https://www.mytatasky.com/delegate/EmailCampaignAction/CampaignAction?campaignID=liUFBUl1mbM=&vendor=oBEMvseSmG0= -->\n"
								+ "</body>\n" + "</html>";

						ErrorMessage sendMail = EmailUtility.sendEmailWithSubMsgAndToAdd(subject, msg,
								liveCustomer.getEmailId());

						session.setAttribute("successMsg",
								"Order place successfully And Payment Link Send To Customer Mail.");
					} catch (Exception e) {
						e.printStackTrace();
					}

				}
				LinkedMultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				map.add("frId", frId);
				String[] list = Constants.getRestTemplate().postForObject(Constants.url + "getAllTokenListByFr", map,
						String[].class);
				List<String> tokenList = new ArrayList<>(Arrays.asList(list));

				PushNotification.sendNotification(tokenList, "New Order", "You Have New Order.",
						"https://107.180.88.121:8443/CloudKitchen/firebase",
						"https://107.180.88.121:8443/CloudKitchen");
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
		return orderResponse;
	}

	@RequestMapping(value = "/submitCancelOrder", method = RequestMethod.POST)
	@ResponseBody
	public Info submitCancelOrder(HttpServletRequest request, HttpServletResponse response, Model model) {

		Info info = new Info();

		try {
			HttpSession session = request.getSession();
			MnUser userObj = (MnUser) session.getAttribute("userInfo");

			int order_id = Integer.parseInt(request.getParameter("order_id"));
			String cancel_remark = request.getParameter("cancel_remark");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("status", 8);
			map.add("userId", userObj.getUserId());
			map.add("orderId", order_id);
			map.add("remark", cancel_remark);
			map.add("type", 1);
			info = Constants.getRestTemplate().postForObject(Constants.url + "changeStatusByOrderId", map, Info.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return info;
	}

	List<GrievencesInstruction> grievencesInstructionList = new ArrayList<>();

	@RequestMapping(value = "/grievences", method = RequestMethod.GET)
	public String editOrder(HttpServletRequest request, HttpServletResponse response, Model model) {

		try {

			HttpSession session = request.getSession();

			// int addDetailId = Integer.parseInt(request.getParameter("id"));

			int orderId = Integer.parseInt(request.getParameter("orderId"));

			LinkedMultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("compId", 1);
			GrievencesInstruction[] grievencesInstruction = Constants.getRestTemplate()
					.postForObject(Constants.url + "getAllGrievancesInstructns", map, GrievencesInstruction[].class);
			grievencesInstructionList = new ArrayList<>(Arrays.asList(grievencesInstruction));
			model.addAttribute("grievencesInstructionList", grievencesInstructionList);

			map = new LinkedMultiValueMap<String, Object>();
			map.add("orderId", orderId);
			GetOrderHeaderList getOrderHeaderList = Constants.getRestTemplate()
					.postForObject(Constants.url + "getOrderOrderId", map, GetOrderHeaderList.class);
			model.addAttribute("getOrderHeaderList", getOrderHeaderList);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "grievences";
	}

	@RequestMapping(value = "/viewGrvDetail", method = RequestMethod.GET)
	public String viewGrvDetail(HttpServletRequest request, HttpServletResponse response, Model model) {

		try {

			HttpSession session = request.getSession();

			// int addDetailId = Integer.parseInt(request.getParameter("id"));

			int grvId = Integer.parseInt(request.getParameter("grvId"));

			LinkedMultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("grvId", grvId);
			GetGrievienceList getGrvHeaderList = Constants.getRestTemplate()
					.postForObject(Constants.url + "getGriviencevByGrvId", map, GetGrievienceList.class);
			model.addAttribute("getGrvHeaderList", getGrvHeaderList);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "viewGrvDetail";
	}

	@RequestMapping(value = "/submitFeedback", method = RequestMethod.POST)
	@ResponseBody
	public Info submitFeedback(HttpServletRequest request, HttpServletResponse response, Model model) {

		Info info = new Info();
		try {

			HttpSession session = request.getSession();
			MnUser userObj = (MnUser) session.getAttribute("userInfo");
			Date ct = new Date();
			SimpleDateFormat dttime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			// int addDetailId = Integer.parseInt(request.getParameter("id"));

			int orderId = Integer.parseInt(request.getParameter("orderIdGrievences"));
			String remark = request.getParameter("feedback_remark");

			OrderFeedback orderFeedback = new OrderFeedback();
			orderFeedback.setOrderId(orderId);
			orderFeedback.setInsertUserId(userObj.getUserId());
			orderFeedback.setInsertDatetime(dttime.format(ct));
			orderFeedback.setRemark(remark);
			orderFeedback.setPlatform(1);

			OrderFeedback res = Constants.getRestTemplate().postForObject(Constants.url + "saveFeedBackOfOrder",
					orderFeedback, OrderFeedback.class);
			if (res == null) {
				info.setError(true);
			} else {
				info.setError(false);
			}
		} catch (Exception e) {
			info.setError(true);
			e.printStackTrace();
		}
		return info;
	}

	@RequestMapping(value = "/submitGrievince", method = RequestMethod.POST)
	@ResponseBody
	public Info submitGrievince(HttpServletRequest request, HttpServletResponse response, Model model) {

		Info info = new Info();
		try {

			HttpSession session = request.getSession();
			MnUser userObj = (MnUser) session.getAttribute("userInfo");
			Date ct = new Date();
			SimpleDateFormat dttime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			SimpleDateFormat yy = new SimpleDateFormat("yyyy-MM-dd");
			// int addDetailId = Integer.parseInt(request.getParameter("id"));

			int orderId = Integer.parseInt(request.getParameter("orderIdGrievences"));
			int grievencesInstructionId = Integer.parseInt(request.getParameter("grievencesInstructionId"));
			String remark = request.getParameter("grivience_remark");

			OrderGrievance orderGrievance = new OrderGrievance();
			orderGrievance.setOrderId(orderId);
			orderGrievance.setInsertById(userObj.getUserId());
			orderGrievance.setInsertDateTime(dttime.format(ct));
			orderGrievance.setRemark(remark);
			orderGrievance.setPlatform(1);
			orderGrievance.setGrievenceSubtypeId(grievencesInstructionId);
			orderGrievance.setCurrentStatus(0);
			orderGrievance.setDate(yy.format(ct));
			orderGrievance.setGrievencceNo("1");

			for (int i = 0; i < grievencesInstructionList.size(); i++) {

				if (grievencesInstructionList.get(i).getGrievanceId() == grievencesInstructionId) {
					orderGrievance.setGrievenceTypeId(grievencesInstructionList.get(i).getGrievenceTypeId());
					break;
				}
			}

			OrderGrievanceTrail orderGrievanceTrail = new OrderGrievanceTrail();
			orderGrievanceTrail.setActionByUserId(userObj.getUserId());
			orderGrievanceTrail.setActionDateTime(dttime.format(ct));
			orderGrievanceTrail.setStatus(0);
			orderGrievanceTrail.setRemark(remark);
			orderGrievance.setOrderGrievanceTrail(orderGrievanceTrail);

			OrderGrievance res = Constants.getRestTemplate().postForObject(Constants.url + "saveGrievanceOfOrder",
					orderGrievance, OrderGrievance.class);
			if (res == null) {
				info.setError(true);
			} else {
				info.setError(false);
			}
		} catch (Exception e) {
			info.setError(true);
			e.printStackTrace();
		}
		return info;
	}

	@RequestMapping(value = "/selectOptionForRepeateOrder", method = RequestMethod.GET)
	public String selectOptionForRepeateOrder(HttpServletRequest request, HttpServletResponse response, Model model) {

		try {

			HttpSession session = request.getSession();

			int addressId = Integer.parseInt(request.getParameter("addressId"));
			int orderId = Integer.parseInt(request.getParameter("orderId"));
			int frId = Integer.parseInt(request.getParameter("frId"));

			/*
			 * GetFranchiseData frData =
			 * Constants.getRestTemplate().getForObject(Constants.url + "getFranchiseList",
			 * GetFranchiseData.class); List<FranchiseData> franchiseList =
			 * frData.getFranchise(); model.addAttribute("franchiseList", franchiseList);
			 */

			CustomerDisplay liveCustomer = (CustomerDisplay) session.getAttribute("liveCustomer");

			LinkedMultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("custId", liveCustomer.getCustId());
			CustomerAddressDisplay[] info = Constants.getRestTemplate()
					.postForObject(Constants.url + "getCustomerAddressList", map, CustomerAddressDisplay[].class);
			List<CustomerAddressDisplay> addressList = new ArrayList<>(Arrays.asList(info));
			model.addAttribute("addressList", addressList);
			model.addAttribute("frId", frId);
			model.addAttribute("addressId", addressId);

			session.setAttribute("repeatOrderReferenceOrderId", orderId);

			/*
			 * LinkedMultiValueMap<String, Object> map = new LinkedMultiValueMap<String,
			 * Object>(); map.add("compId", 1); GrievencesInstruction[]
			 * grievencesInstruction = Constants.getRestTemplate()
			 * .postForObject(Constants.url + "getAllGrievancesInstructns", map,
			 * GrievencesInstruction[].class); grievencesInstructionList = new
			 * ArrayList<>(Arrays.asList(grievencesInstruction));
			 * model.addAttribute("grievencesInstructionList", grievencesInstructionList);
			 * 
			 * map = new LinkedMultiValueMap<String, Object>(); map.add("orderId", orderId);
			 * GetOrderHeaderList getOrderHeaderList = Constants.getRestTemplate()
			 * .postForObject(Constants.url + "getOrderOrderId", map,
			 * GetOrderHeaderList.class); model.addAttribute("getOrderHeaderList",
			 * getOrderHeaderList);
			 */

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "selectOptionForRepeateOrder";
	}

	@RequestMapping(value = "/orderProcessgetList", method = RequestMethod.POST)
	@ResponseBody
	public List<ItemJsonImportData> orderProcessgetList(HttpServletRequest request, HttpServletResponse response,
			Model model) {

		List<ItemJsonImportData> itemJsonList = new ArrayList<>();

		try {
			HttpSession session = request.getSession();

			int addressId = Integer.parseInt(request.getParameter("addressListForRepeatOrder"));
			int frId = Integer.parseInt(request.getParameter("frIdForRepeatOrder"));
			String orderTime = request.getParameter("orderRepeatTime");
			String orderDate = request.getParameter("orderRepeatDate");
			int iscity = Integer.parseInt(request.getParameter("iscity"));

			session.setAttribute("addressId", addressId);
			session.setAttribute("frIdForOrder", frId);
			session.setAttribute("orderTime", orderTime);
			session.setAttribute("orderDate", orderDate);
			session.setAttribute("allowOrderandCheckoutPage", 1);

			if (iscity == 0) {
				session.setAttribute("addCustAgent", 0);
			} else {
				int repeatOrderAgent = Integer.parseInt(request.getParameter("repeatOrderAgent"));
				session.setAttribute("addCustAgent", repeatOrderAgent);
			}

			int orderId = (int) session.getAttribute("repeatOrderReferenceOrderId");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("orderId", orderId);
			GetOrderHeaderList getOrderHeaderList = Constants.getRestTemplate()
					.postForObject(Constants.url + "getOrderOrderId", map, GetOrderHeaderList.class);

			List<GetOrderDetailList> detailList = getOrderHeaderList.getDetailList();

			map = new LinkedMultiValueMap<String, Object>();
			map.add("frId", frId);
			map.add("type", 2);
			map.add("applicableFor", 1);
			ItemDisplay[] itemDisplay = Constants.getRestTemplate().postForObject(Constants.url + "getAllItemListByFr",
					map, ItemDisplay[].class);

			itemList = new ArrayList<>(Arrays.asList(itemDisplay));

			for (int i = 0; i < detailList.size(); i++) {

				for (int j = 0; j < itemList.size(); j++) {

					if (detailList.get(i).getItemId() == itemList.get(j).getItemId()) {
						ItemJsonImportData item = new ItemJsonImportData();
						item.setItemId(itemList.get(j).getItemId());
						item.setItemName(itemList.get(j).getItemName());
						item.setPrice(itemList.get(j).getSpRateAmt());
						item.setQty(detailList.get(i).getQty());
						item.setTotal(detailList.get(i).getQty() * itemList.get(j).getSpRateAmt());
						item.setCgstPer(itemList.get(j).getCgstPer());
						item.setSgstPer(itemList.get(j).getSgstPer());
						item.setIgstPer(itemList.get(j).getIgstPer());
						item.setSpecialremark("");
						itemJsonList.add(item);
						break;
					}
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return itemJsonList;
	}

	@RequestMapping(value = "/parkOrderToPlaceOrder", method = RequestMethod.POST)
	@ResponseBody
	public List<ItemJsonImportData> parkOrderToPlaceOrder(HttpServletRequest request, HttpServletResponse response,
			Model model) {

		List<ItemJsonImportData> itemJsonList = new ArrayList<>();

		try {
			HttpSession session = request.getSession();

			int orderId = Integer.parseInt(request.getParameter("orderId"));

			session.setAttribute("parkOrderToPlaceOrderOrderId", orderId);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("orderId", orderId);
			GetOrderHeaderList getOrderHeaderList = Constants.getRestTemplate()
					.postForObject(Constants.url + "getOrderOrderId", map, GetOrderHeaderList.class);

			session.setAttribute("addressId", getOrderHeaderList.getAddressId());
			session.setAttribute("frIdForOrder", getOrderHeaderList.getFrId());
			session.setAttribute("orderTime", getOrderHeaderList.getDeliveryTime());
			session.setAttribute("orderDate", getOrderHeaderList.getOrderDate());
			session.setAttribute("allowOrderandCheckoutPage", 1);

			List<GetOrderDetailList> detailList = getOrderHeaderList.getDetailList();

			map = new LinkedMultiValueMap<String, Object>();
			map.add("frId", getOrderHeaderList.getFrId());
			map.add("type", 2);
			map.add("applicableFor", 1);
			ItemDisplay[] itemDisplay = Constants.getRestTemplate().postForObject(Constants.url + "getAllItemListByFr",
					map, ItemDisplay[].class);

			itemList = new ArrayList<>(Arrays.asList(itemDisplay));

			for (int i = 0; i < detailList.size(); i++) {

				for (int j = 0; j < itemList.size(); j++) {

					if (detailList.get(i).getItemId() == itemList.get(j).getItemId()) {
						ItemJsonImportData item = new ItemJsonImportData();
						item.setItemId(itemList.get(j).getItemId());
						item.setItemName(itemList.get(j).getItemName());
						item.setPrice(itemList.get(j).getSpRateAmt());
						item.setQty(detailList.get(i).getQty());
						item.setTotal(detailList.get(i).getQty() * itemList.get(j).getSpRateAmt());
						item.setCgstPer(itemList.get(j).getCgstPer());
						item.setSgstPer(itemList.get(j).getSgstPer());
						item.setIgstPer(itemList.get(j).getIgstPer());
						item.setSpecialremark("");
						itemJsonList.add(item);
						break;
					}
				}

			}

			map = new LinkedMultiValueMap<String, Object>();
			map.add("custId", getOrderHeaderList.getCustId());
			CustomerDisplay customer = Constants.getRestTemplate().postForObject(Constants.url + "getCustomerById", map,
					CustomerDisplay.class);
			session.setAttribute("liveCustomer", customer);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return itemJsonList;
	}

	@RequestMapping(value = "/tableScrollExample", method = RequestMethod.GET)
	public String tableScrollExample(HttpServletRequest request, HttpServletResponse response, Model model) {

		try {

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "tableScrollExample";
	}

	@RequestMapping(value = "/setItemIdsForRelatedItemList", method = RequestMethod.POST)
	@ResponseBody
	public Info setItemIdsForRelatedItemList(HttpServletRequest request, HttpServletResponse response, Model model) {

		Info info = new Info();
		try {

			String itemIds = request.getParameter("itemIds");
			ObjectMapper objectMapper = new ObjectMapper();
			int[] itemIdsList = objectMapper.readValue(itemIds, int[].class);

			String str = "";

			for (int i = 0; i < itemIdsList.length; i++) {

				str = str + itemIdsList[i] + ",";
				// System.out.println(itemIdsList[i]);
			}

			str = str.substring(0, str.length() - 1);

			HttpSession session = request.getSession();
			session.setAttribute("itemIdsForRelatedItem", str);
		} catch (Exception e) {
			info.setError(true);
			e.printStackTrace();
		}
		return info;
	}

	@RequestMapping(value = "/changeFrId", method = RequestMethod.POST)
	@ResponseBody
	public List<ItemJsonImportData> changeFrId(HttpServletRequest request, HttpServletResponse response) {

		List<ItemJsonImportData> itemJsonList = new ArrayList<>();

		try {
			HttpSession session = request.getSession();

			int headerFrId = Integer.parseInt(request.getParameter("headerFrId"));
			String cartListJson = request.getParameter("cartList");

			ObjectMapper objectMapper = new ObjectMapper();

			// convert json string to object
			ItemJsonImportData[] itemJsonImportData = objectMapper.readValue(cartListJson, ItemJsonImportData[].class);

			List<ItemJsonImportData> cartList = new ArrayList<>(Arrays.asList(itemJsonImportData));

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("frId", headerFrId);
			map.add("type", 2);
			map.add("applicableFor", 1);
			ItemDisplay[] itemDisplay = Constants.getRestTemplate().postForObject(Constants.url + "getAllItemListByFr",
					map, ItemDisplay[].class);

			itemList = new ArrayList<>(Arrays.asList(itemDisplay));

			for (int i = 0; i < cartList.size(); i++) {

				for (int j = 0; j < itemList.size(); j++) {

					if (cartList.get(i).getItemId() == itemList.get(j).getItemId()) {
						ItemJsonImportData item = new ItemJsonImportData();
						item.setItemId(itemList.get(j).getItemId());
						item.setItemName(itemList.get(j).getItemName());
						item.setPrice(itemList.get(j).getSpRateAmt());
						item.setQty(cartList.get(i).getQty());
						item.setTotal(cartList.get(i).getQty() * itemList.get(j).getSpRateAmt());
						item.setCgstPer(itemList.get(j).getCgstPer());
						item.setSgstPer(itemList.get(j).getSgstPer());
						item.setIgstPer(itemList.get(j).getIgstPer());
						item.setSpecialremark("");
						// System.out.println(item);
						itemJsonList.add(item);
						break;
					}
				}

			}
			session.setAttribute("frIdForOrder", headerFrId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return itemJsonList;
	}

	@RequestMapping(value = "/paymentLink", method = RequestMethod.GET)
	public String paymentLink(HttpServletRequest request, HttpServletResponse response, Model model) {

		try {
			String uuid = UUID.randomUUID().toString();

			/*
			 * Map<String, String> postData = new HashMap<String, String>();
			 * postData.put("appId", "27027a6652b91619aa1a8ad8172072");
			 * postData.put("orderId", uuid); postData.put("orderAmount", "2");
			 * postData.put("orderCurrency", "INR"); postData.put("orderNote", "OK");
			 * postData.put("customerName", "akshay kasar"); postData.put("customerEmail",
			 * "akshaykasar72@gmail.com"); postData.put("customerPhone", "7588519473");
			 * postData.put("returnUrl", "http://localhost:8086/ck/returnUrl");
			 * postData.put("notifyUrl", "http://localhost:8086/ck/notifyUrl"); String data
			 * = ""; SortedSet<String> keys = new TreeSet<String>(postData.keySet()); for
			 * (String key : keys) { data = data + key + postData.get(key); } Mac
			 * sha256_HMAC = Mac.getInstance("HmacSHA256"); SecretKeySpec secret_key_spec =
			 * new SecretKeySpec("68bdc7d71b4ff20a294a8844c98fdb696510078d".getBytes(),
			 * "HmacSHA256"); sha256_HMAC.init(secret_key_spec); String signature =
			 * Base64.getEncoder().encodeToString(sha256_HMAC.doFinal(data.getBytes()));
			 * model.addAttribute("signature", signature); model.addAttribute("uuid", uuid);
			 */

			// List<Formdata> formdataList = new ArrayList<>();
			Body body = new Body();

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("appId", "27027a6652b91619aa1a8ad8172072");
			map.add("secretKey", "68bdc7d71b4ff20a294a8844c98fdb696510078d");
			map.add("orderId", uuid);
			map.add("orderAmount", "1");
			map.add("orderCurrency", "INR");
			map.add("orderNote", "Test");
			map.add("customerEmail", "akshaykasar72@gmail.com");
			map.add("customerName", "Akshay Kasar");
			map.add("customerPhone", "7588519473");
			map.add("returnUrl", "http://localhost:8086/ck/returnUrl");
			map.add("notifyUrl", "http://localhost:8086/ck/notifyUrl");

			Body res = Constants.getRestTemplate().postForObject("https://test.cashfree.com/api/v1/order/create", map,
					Body.class);

			/* System.out.println(res); */

			String subject = "Order Payment Link";
			String msg = "Your Bill total is  5/- Only \n" + res.getPaymentLink();

			ErrorMessage sendMail = EmailUtility.sendEmailWithSubMsgAndToAdd(subject, msg, "akshaykasar72@gmail.com");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "paymentLink";
	}

	@RequestMapping(value = "/notifyUrl", method = RequestMethod.POST)
	public String notifyUrl(HttpServletRequest request, HttpServletResponse response, Model model) {

		try {

			String orderId = request.getParameter("orderId");
			String orderAmount = request.getParameter("orderAmount");
			String referenceId = request.getParameter("referenceId");
			String txStatus = request.getParameter("txStatus");
			String paymentMode = request.getParameter("paymentMode");
			String txMsg = request.getParameter("txMsg");
			String txTime = request.getParameter("txTime");
			String signature = request.getParameter("signature");

			int status = 1;
			int paid = 1;

			if (!txStatus.equals("SUCCESS")) {
				status = 8;
				paid = 0;
			}

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("status", status);
			map.add("paid", paid);
			map.add("orderId", orderId);
			map.add("txStatus", txStatus);
			Info info = Constants.getRestTemplate().postForObject(Constants.url + "updatePaymentSuccessful", map,
					Info.class);

			System.out.println(txStatus);
			System.out.println(status);
			model.addAttribute("status", status);
			model.addAttribute("paid", paid);
			model.addAttribute("orderId", orderId);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "returnUrl";
	}

	@RequestMapping(value = "/returnUrl", method = RequestMethod.POST)
	public String returnUrl(HttpServletRequest request, HttpServletResponse response, Model model) {

		try {

			String orderId = request.getParameter("orderId");
			String orderAmount = request.getParameter("orderAmount");
			String referenceId = request.getParameter("referenceId");
			String txStatus = request.getParameter("txStatus");
			String paymentMode = request.getParameter("paymentMode");
			String txMsg = request.getParameter("txMsg");
			String txTime = request.getParameter("txTime");
			String signature = request.getParameter("signature");

			int status = 1;
			int paid = 1;

			if (!txStatus.equals("SUCCESS")) {
				status = 8;
				paid = 0;
			}

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("status", status);
			map.add("paid", paid);
			map.add("orderId", orderId);
			map.add("txStatus", txStatus);
			Info info = Constants.getRestTemplate().postForObject(Constants.url + "updatePaymentSuccessful", map,
					Info.class);

			System.out.println(txStatus);
			System.out.println(status);

			model.addAttribute("status", status);
			model.addAttribute("paid", paid);
			model.addAttribute("orderId", orderId);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "returnUrl";
	}

	@RequestMapping(value = "/thankYou", method = RequestMethod.GET)
	public String thankYou(HttpServletRequest request, HttpServletResponse response, Model model) {

		try {

			/*
			 * MultiValueMap<String, Object> map = new LinkedMultiValueMap<String,
			 * Object>(); map.add("appId", "27027a6652b91619aa1a8ad8172072");
			 * map.add("secretKey", "68bdc7d71b4ff20a294a8844c98fdb696510078d");
			 * map.add("orderId", "b6529ee2-d044-49f9-afec-247ebaa74393");
			 * 
			 * System.out.println(map); String res =
			 * Constants.getRestTemplate().postForObject(
			 * "https://test.cashfree.com/api/v1/order/info/link", map, String.class);
			 * 
			 * System.out.println(res);
			 */

			/*
			 * String url = "https://test.cashfree.com/api/v1/order/info/"; URL obj = new
			 * URL(url); HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();
			 * 
			 * // add reuqest header con.setRequestMethod("POST");
			 * con.setRequestProperty("cache-control", "no-cache");
			 * con.setRequestProperty("content-type", "application/x-www-form-urlencoded");
			 * 
			 * String urlParameters =
			 * "appId=27027a6652b91619aa1a8ad8172072&secretKey=68bdc7d71b4ff20a294a8844c98fdb696510078d&orderId=204708b2-b7d2-42b1-b88c-b523ddc3c729";
			 * 
			 * // Send post request con.setDoOutput(true); DataOutputStream wr = new
			 * DataOutputStream(con.getOutputStream()); wr.writeBytes(urlParameters);
			 * wr.flush(); wr.close();
			 * 
			 * int responseCode = con.getResponseCode();
			 * System.out.println("\nSending 'POST' request to URL : " + url);
			 * System.out.println("Post parameters : " + urlParameters);
			 * System.out.println("Response Code : " + responseCode);
			 * 
			 * BufferedReader in = new BufferedReader(new
			 * InputStreamReader(con.getInputStream())); String inputLine; StringBuffer
			 * response1 = new StringBuffer();
			 * 
			 * while ((inputLine = in.readLine()) != null) { response1.append(inputLine); }
			 * in.close(); System.out.println("response1 : " + response1);
			 */
			// print result

			// read this input

		} catch (Exception e) {
			e.printStackTrace();
		}

		/*
		 * RedirectView redirectView = new RedirectView();
		 * redirectView.setUrl("https://madhvi.in/"); return redirectView;
		 */

		return "emaildata/mailContent";
	}

	@RequestMapping(value = "/hello", method = RequestMethod.GET)
	public String hello(HttpServletRequest request, HttpServletResponse response, Model model) {

		/*
		 * RedirectView redirectView = new RedirectView();
		 * redirectView.setUrl("https://madhvi.in/"); return redirectView;
		 */

		return "thankYou";
	}

	/*
	 * @RequestMapping(value = "/repeatOrderProcess", method = RequestMethod.GET)
	 * public String repeatOrderProcess(HttpServletRequest request,
	 * HttpServletResponse response, Model model) {
	 * 
	 * try {
	 * 
	 * HttpSession session = request.getSession();
	 * 
	 * int frId = (int) session.getAttribute("frIdForOrder");
	 * 
	 * model.addAttribute("frId", frId);
	 * 
	 * GetFranchiseData frData =
	 * Constants.getRestTemplate().getForObject(Constants.url + "getFranchiseList",
	 * GetFranchiseData.class); List<FranchiseData> franchiseList =
	 * frData.getFranchise(); model.addAttribute("franchiseList", franchiseList);
	 * 
	 * MultiValueMap<String, Object> map = new LinkedMultiValueMap<String,
	 * Object>(); map.add("frId", frId); map.add("type", 2);
	 * map.add("applicableFor", 1); GetAllDataByFr getAllDataByFr =
	 * Constants.getRestTemplate().postForObject(Constants.url + "getAllDataByFr",
	 * map, GetAllDataByFr.class); List<CategoryData> catList =
	 * getAllDataByFr.getCategoryData(); model.addAttribute("catList", catList);
	 * model.addAttribute("catImageUrl", Constants.imageShowUrl);
	 * 
	 * List<SubCategoryData> subcatList = getAllDataByFr.getSubCategoryData();
	 * model.addAttribute("subcatList", subcatList);
	 * 
	 * List<Tags> tagList = getAllDataByFr.getTagsData();
	 * model.addAttribute("tagList", tagList);
	 * 
	 * itemList = getAllDataByFr.getItemData(); model.addAttribute("itemList",
	 * itemList);
	 * 
	 * List<OfferHeader> offerList = getAllDataByFr.getOfferData();
	 * model.addAttribute("offerList", offerList);
	 * 
	 * ObjectMapper Obj = new ObjectMapper();
	 * 
	 * try {
	 * 
	 * String jsonStr = Obj.writeValueAsString(itemList);
	 * model.addAttribute("jsonList", jsonStr); } catch (IOException e) { }
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } return "repeatOrderProcess"; }
	 */
}
