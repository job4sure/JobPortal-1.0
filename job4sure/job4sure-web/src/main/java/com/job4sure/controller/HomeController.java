package com.job4sure.controller;

import java.security.Principal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.job4sure.model.Login;
import com.job4sure.model.Registration;
import com.job4sure.service.RegistrationService;
import com.job4sure.util.EncryptDecrypt;
import com.job4sure.util.IConstant;

@Controller
public class HomeController {

	@Autowired
	private RegistrationService registrationService;

	@RequestMapping(value = "/welcome", method = RequestMethod.GET)
	public String showWelcomePage() {
		return "welcome";
	}

	@RequestMapping(value = "/OpenloginPage", method = RequestMethod.GET)
	public String showloginPage(@RequestParam(required = false) String message,
			ModelMap model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		model.addAttribute("message", message);
		return "loginPage";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout,
			HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		session.invalidate();
		if (error != null) {
			model.addAttribute("error",
					"<h3 class='msg error'>Incorrect Username or Password</h3>");
		}
		if (logout != null) {
			model.addAttribute("msg",
					"<p class='msg done'>You've been logged out successfully.</p>");
		}
		return "loginPage";
	}

	@RequestMapping(value = "/success", method = RequestMethod.GET)
	public String showsuccesspage(HttpServletRequest request,
			Principal principal) {
		HttpSession session = request.getSession();
		boolean isUser = request.isUserInRole("USER");
		boolean isComp = request.isUserInRole("COMP");
		String userName = principal.getName();
		Registration registration = registrationService
				.getLoggedInUserInfo(userName);
		Date now = new Date();
		int numberOfDaysRemaining = 0;
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			Date ValidityDate = (Date) formatter.parse(registration
					.getValidUpTo());
			if (ValidityDate.compareTo(now) > 0) {
				Calendar day1 = Calendar.getInstance();
				Calendar day2 = Calendar.getInstance();
				day1.setTime(ValidityDate);
				day2.setTime(now);
				numberOfDaysRemaining = day1.get(Calendar.DAY_OF_YEAR)
						- day2.get(Calendar.DAY_OF_YEAR);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		session.setAttribute("registration", registration);
		session.setAttribute("daysLeft", numberOfDaysRemaining);
		if (isUser) {
			return "redirect:/userProfileHomePage";
		} else if (isComp) {
			return "redirect:/companyHome";
		} else {
			return "loginPage";
		}

	}

	@RequestMapping(value = "/companyHome", method = RequestMethod.GET)
	public String showCompPage(Map<String, Object> map, ModelMap model,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		Registration registration = (Registration) session
				.getAttribute("registration");
		map.put("Registration", new Registration());
		model.addAttribute("registration", registration);
		return "companyHomePage";
	}

	@RequestMapping(value = "/forgotPassword", method = RequestMethod.GET)
	public String ShowforgotPassPage(Map<String, Object> map,
			@RequestParam(required = false) String message, ModelMap model) {
		map.put("login", new Login());
		model.addAttribute("message", message);
		return "forgotPassPage";
	}

	@RequestMapping(value = "/sendMailToResetPass", method = RequestMethod.POST)
	private String sendMailToResetPass(@ModelAttribute("login") Login login,
			ModelMap model) {

		Registration registration = registrationService
				.getLoggedInUserInfo(login.getEmail());
		boolean status = false;
		try {
			login.setRegistration_Id(registration.getRegistrationId());
			status = registrationService.sendMailToResetPass(login);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (status) {
			model.addAttribute("message", IConstant.MAIL_SUCCESS_MESSAGE);
		} else {
			model.addAttribute("message", IConstant.MAIL_FAILURE_MESSAGE);
		}
		return "redirect:/forgotPassword";
	}

	@RequestMapping(value = "/reCreatePass", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String reCreatePass(
			@RequestParam(required = false) String registrationId,
			String message, Map<String, Object> map, ModelMap model)
			throws Exception {
		registrationId = EncryptDecrypt.decrypt(registrationId);
		Integer regId = Integer.parseInt(registrationId);
		Registration registration = new Registration();
		registration.setRegistrationId(regId);
		map.put("registration", registration);
		model.addAttribute("message", message);
		return "newPassword";
	}

	@RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
	public String UpdatePassword(
			@ModelAttribute("registration") Registration registration,
			BindingResult result, Model model, Map<String, Object> map) {
		registrationService.updatePassword(registration.getRegistrationId(),
				registration.getPassword());
		model.addAttribute("message", "Your password successfully updated");
		return "redirect:/OpenloginPage";
	}

}
