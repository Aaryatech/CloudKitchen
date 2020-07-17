package com.ats.ck;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

	/*
	 * <script async defer src=
	 * "https://maps.googleapis.com/maps/api/js?key=AIzaSyBahlnISPYhetj3q50ADqVE6SECypRGe4A&callback=initMap">
	 */
}
