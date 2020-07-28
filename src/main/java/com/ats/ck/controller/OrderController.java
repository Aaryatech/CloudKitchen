package com.ats.ck.controller;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
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

import com.ats.ck.common.Constants;
import com.ats.ck.model.CategoryData;
import com.ats.ck.model.FranchiseData;
import com.ats.ck.model.GetAllDataByFr;
import com.ats.ck.model.GetCategoryData;
import com.ats.ck.model.GetFranchiseData;
import com.ats.ck.model.GetSubCategoryData;
import com.ats.ck.model.ItemDisplay;
import com.ats.ck.model.LoginResponse;
import com.ats.ck.model.OfferHeader;
import com.ats.ck.model.SubCategoryData;
import com.ats.ck.model.Tags;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@Scope("session")
public class OrderController {

	@RequestMapping(value = "/addOrder", method = RequestMethod.GET)
	public String addOrder(HttpServletRequest request, HttpServletResponse response, Model model) {

		try {
			HttpSession session = request.getSession();
			int frId = 79;

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

			List<ItemDisplay> itemList = getAllDataByFr.getItemData();
			model.addAttribute("itemList", itemList);

			List<OfferHeader> offerList = getAllDataByFr.getOfferData();
			model.addAttribute("offerList", offerList);

			ObjectMapper Obj = new ObjectMapper();

			try {

				String jsonStr = Obj.writeValueAsString(itemList);
				model.addAttribute("jsonList", jsonStr);
			} catch (IOException e) {
			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return "addOrder";
	}
	
	
	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public String checkout(HttpServletRequest request, HttpServletResponse response, Model model) {

		return "checkout";
	}
}
