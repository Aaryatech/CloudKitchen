package com.ats.ck.controller;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

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

import com.ats.ck.common.Constants;
import com.ats.ck.common.DateConvertor;
import com.ats.ck.model.CategoryData;
import com.ats.ck.model.CustomerAddressDisplay;
import com.ats.ck.model.CustomerDisplay;
import com.ats.ck.model.DeliveryInstruction;
import com.ats.ck.model.FranchiseData;
import com.ats.ck.model.GetAllDataByFr;
import com.ats.ck.model.GetCategoryData;
import com.ats.ck.model.GetFranchiseData;
import com.ats.ck.model.GetOrderDetailList;
import com.ats.ck.model.GetOrderHeaderList;
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
import com.ats.ck.model.SubCategoryData;
import com.ats.ck.model.Tags;
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

			GetFranchiseData frData = Constants.getRestTemplate().getForObject(Constants.url + "getFranchiseList",
					GetFranchiseData.class);
			List<FranchiseData> franchiseList = frData.getFranchise();
			model.addAttribute("franchiseList", franchiseList);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("frId", frId);
			map.add("type", 2);
			map.add("applicableFor", 1);
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
			int frIdForOrder = Integer.parseInt(request.getParameter("frIdForOrder"));
			String orderTime = request.getParameter("orderTime");
			String orderDate = request.getParameter("orderDate");

			session.setAttribute("addressId", addressId);
			session.setAttribute("frIdForOrder", frIdForOrder);
			session.setAttribute("orderTime", orderTime);
			session.setAttribute("orderDate", orderDate);
			session.setAttribute("allowOrderandCheckoutPage", 1);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return info;
	}

	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public String checkout(HttpServletRequest request, HttpServletResponse response, Model model) {

		try {

			HttpSession session = request.getSession();

			// int addDetailId = Integer.parseInt(request.getParameter("id"));

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

			model.addAttribute("relatedItemList", itemList);
			model.addAttribute("favItemList", itemList);
			model.addAttribute("catImageUrl", Constants.imageShowUrl);
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

			Date ct = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat dttime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			CustomerDisplay liveCustomer = (CustomerDisplay) session.getAttribute("liveCustomer");

			String itemData = request.getParameter("itemaData");
			int status = Integer.parseInt(request.getParameter("status"));
			int paymentMethod = Integer.parseInt(request.getParameter("paymentMethod"));
			int homeDelivery = Integer.parseInt(request.getParameter("homeDelivery"));
			int deliveryInstru = Integer.parseInt(request.getParameter("deliveryInstru"));
			String textDeliveryInstr = request.getParameter("textDeliveryInstr");
			String billingName = request.getParameter("billingName");
			String billingAddress = request.getParameter("billingAddress");
			String orderTime = (String) session.getAttribute("orderTime");
			String orderDate = (String) session.getAttribute("orderDate");
			int frId = (int) session.getAttribute("frIdForOrder");
			int addressId = (int) session.getAttribute("addressId");
			float deliveryCharges = Float.parseFloat(request.getParameter("deliveryCharges"));

			// create ObjectMapper instance
			ObjectMapper objectMapper = new ObjectMapper();

			// convert json string to object
			ItemJsonImportData[] itemJsonImportData = objectMapper.readValue(itemData, ItemJsonImportData[].class);

			LinkedMultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("custAddressId", addressId);
			CustomerAddressDisplay addressDetail = Constants.getRestTemplate()
					.postForObject(Constants.url + "getCustomerAddressListById", map, CustomerAddressDisplay.class);

			DecimalFormat df = new DecimalFormat("#.00");

			OrderHeader order = new OrderHeader();
			order.setOrderNo("0002");
			order.setOrderDate(sf.format(ct));
			order.setFrId(frId);
			order.setCustId(liveCustomer.getCustId());
			order.setOrderStatus(status);
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

			List<OrderDetail> orderDetailList = new ArrayList<>();

			float finaTaxableAmt = 0;
			float finaTaxAmt = 0;
			float finaTotalAmt = 0;
			float finalCgstAmt = 0;
			float finalsgstAmt = 0;
			float finalIgstAmt = 0;

			for (int i = 0; i < itemJsonImportData.length; i++) {

				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setItemId(itemJsonImportData[i].getItemId());
				orderDetail.setQty(itemJsonImportData[i].getQty());
				orderDetail.setRate(itemJsonImportData[i].getPrice());
				orderDetail.setCgstPer(itemJsonImportData[i].getCgstPer());
				orderDetail.setIgstPer(itemJsonImportData[i].getIgstPer());
				orderDetail.setSgstPer(itemJsonImportData[i].getSgstPer());
				orderDetail.setRemark(itemJsonImportData[i].getSpecialremark());

				float taxableAmt = Float.parseFloat(df
						.format((itemJsonImportData[i].getTotal() * 100) / (100 + itemJsonImportData[i].getIgstPer())));
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
				orderResponse.setStatus(status);
				session.setAttribute("successMsg", "Order place successfully.");
			} else {
				session.setAttribute("errorMsg", "Something wrong while placing order.");
			}

			// info.setError(false);

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

			GetFranchiseData frData = Constants.getRestTemplate().getForObject(Constants.url + "getFranchiseList",
					GetFranchiseData.class);
			List<FranchiseData> franchiseList = frData.getFranchise();
			model.addAttribute("franchiseList", franchiseList);

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

			session.setAttribute("addressId", addressId);
			session.setAttribute("frIdForOrder", frId);
			session.setAttribute("orderTime", orderTime);
			session.setAttribute("orderDate", orderDate);
			session.setAttribute("allowOrderandCheckoutPage", 1);

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
			GetAllDataByFr getAllDataByFr = Constants.getRestTemplate().postForObject(Constants.url + "getAllDataByFr",
					map, GetAllDataByFr.class);

			itemList = getAllDataByFr.getItemData();

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
					}
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return itemJsonList;
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
