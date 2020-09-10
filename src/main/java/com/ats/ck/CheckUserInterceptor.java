package com.ats.ck;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ats.ck.model.LoginResponse;
import com.ats.ck.model.MnUser;

public class CheckUserInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws IOException {

		HttpSession session = request.getSession();

		String path = request.getRequestURI().substring(request.getContextPath().length());
		// System.out.println("Current Req Mapping is: " + request.getServletPath() +
		// "/" + session.getId());

		if (path.startsWith("/pdf")) {
			return true;
		}
		try {
			String resourcesPath = path.substring(1, 4);
			// System.out.println("substring is: "+resourcesPath);

			if (resourcesPath.equalsIgnoreCase("res")) {
				// System.out.println("resource req : "+path);

				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		if (!path.equalsIgnoreCase("/sessionTimeOut") || path.startsWith("/resources")) {

			MnUser userObj = null;
			try {

				userObj = (MnUser) session.getAttribute("userInfo");

			} catch (Exception e) {
				// TODO: handle exception

				// System.out.println("User Details: "+userObj);

			}

			// System.out.println();
			try {
				if (request.getServletPath().equals("/") || request.getServletPath().equals("/loginProcess")
						|| request.getServletPath().equals("/logout")
						|| request.getServletPath().equals("/forgotPassword")
						|| request.getServletPath().equals("/submitResetPassword")
						|| request.getServletPath().equals("/thankYou") || request.getServletPath().equals("/returnUrl")
						|| request.getServletPath().equals("/notifyUrl") || request.getServletPath().equals("/checkSessionAjax")
						|| request.getServletPath().equals("/otpVerification")
						|| request.getServletPath().equals("/changeToNewPassword")) { // ||request.getServletPath().equals("/logout"))
					// { //
					// ||request.getServletPath().equals("/logout")
					// System.out.println("Login request");
					return true;
				} else if (userObj == null) {
					//System.out.println("Session Expired - " + userObj);

					// request.setAttribute("emassage", "login failed");
					response.sendRedirect(request.getContextPath() + "/sessionTimeOut");

					return false;
				} else {
					int allowOrderandCheckoutPage = (int) session.getAttribute("allowOrderandCheckoutPage");

					if ((request.getServletPath().equals("/checkout") || request.getServletPath().equals("/addOrder"))
							&& allowOrderandCheckoutPage == 0) {
						session.setAttribute("errorMsg", "Follow order process.");
						// System.out.println(session.getAttribute("errorMsg"));
						response.sendRedirect(request.getContextPath() + "/dashboard");
						return false;
					} else {
						return true;
					}

				}
			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect(request.getContextPath() + "/sessionTimeOut");

				return false;
			}

		}
		return true;

	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

		// System.out.println("post intercept hanlder");
		super.postHandle(request, response, handler, modelAndView);
	}

}