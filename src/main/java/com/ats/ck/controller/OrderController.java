package com.ats.ck.controller;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.text.DateFormat;
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
import com.ats.ck.model.CategoryData;
import com.ats.ck.model.CustomerAddressDisplay;
import com.ats.ck.model.DeliveryInstruction;
import com.ats.ck.model.FranchiseData;
import com.ats.ck.model.GetAllDataByFr;
import com.ats.ck.model.GetCategoryData;
import com.ats.ck.model.GetFranchiseData;
import com.ats.ck.model.GetSubCategoryData;
import com.ats.ck.model.Info;
import com.ats.ck.model.ItemDisplay;
import com.ats.ck.model.LoginResponse;
import com.ats.ck.model.OfferHeader;
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
}
