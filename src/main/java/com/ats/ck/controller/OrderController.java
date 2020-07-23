package com.ats.ck.controller;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ats.ck.common.Constants;
import com.ats.ck.model.CategoryData;
import com.ats.ck.model.FranchiseData;
import com.ats.ck.model.GetCategoryData;
import com.ats.ck.model.GetFranchiseData;
import com.ats.ck.model.GetSubCategoryData;
import com.ats.ck.model.LoginResponse;
import com.ats.ck.model.SubCategoryData;
import com.ats.ck.model.Tags;

@Controller
public class OrderController {

	@RequestMapping(value = "/addOrder", method = RequestMethod.GET)
	public String addOrder(HttpServletRequest request, HttpServletResponse response, Model model) {

		try {

			int frId = 79;

			model.addAttribute("frId", frId);

			GetFranchiseData frData = Constants.getRestTemplate().getForObject(Constants.url + "getFranchiseList",
					GetFranchiseData.class);
			List<FranchiseData> franchiseList = frData.getFranchise();
			model.addAttribute("franchiseList", franchiseList);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("frId", frId);
			GetCategoryData catogory = Constants.getRestTemplate().postForObject(Constants.url + "getCategoryListByFr",
					map, GetCategoryData.class);
			List<CategoryData> catList = catogory.getCategory();
			model.addAttribute("catList", catList);
			model.addAttribute("catImageUrl", Constants.imageShowUrl);

			map = new LinkedMultiValueMap<String, Object>();
			map.add("frId", frId);
			GetSubCategoryData subcategory = Constants.getRestTemplate()
					.postForObject(Constants.url + "getSubCategoryListByFr", map, GetSubCategoryData.class);
			List<SubCategoryData> subcatList = subcategory.getSubCategory();
			model.addAttribute("subcatList", subcatList);

			Tags[] tag = Constants.getRestTemplate().getForObject(Constants.url + "getAllActiveTags", Tags[].class);
			List<Tags> tagList = new ArrayList<>(Arrays.asList(tag));
			model.addAttribute("tagList", tagList);

		} catch (Exception e) {

			e.printStackTrace();

		}

		return "addOrder";
	}
}
