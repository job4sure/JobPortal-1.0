package com.job4sure.admincontroller;

import java.security.Principal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.job4sure.model.Registration;
import com.job4sure.service.RegistrationService;
import com.job4sure.util.IConstant;

@Controller
public class AdminHomeController {

    @Autowired
    private RegistrationService registrationService;

    @RequestMapping(value = "/welcome", method = RequestMethod.GET)
    public String showWelcomePage() {
	return "welcome";
    }

    @RequestMapping(value = "/OpenloginPage", method = RequestMethod.GET)
    public String showloginPage(@RequestParam(required = false) String message, ModelMap model,
		    HttpServletRequest request) {
	HttpSession session = request.getSession();
	session.invalidate();
	model.addAttribute("message", message);
	return "loginPage";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(@RequestParam(value = "error", required = false) String error,
		    @RequestParam(value = "logout", required = false) String logout, HttpServletRequest request,
		    Model model) {
	HttpSession session = request.getSession();
	session.invalidate();

	if (error != null)
	    model.addAttribute("error", IConstant.WRONG_CREDENTIAL);
	if (logout != null)
	    model.addAttribute("msg", IConstant.RIGHT_CREDENTIAL);
	return "loginPage";
    }

    @RequestMapping(value = "/success", method = RequestMethod.GET)
    public String showsuccesspage(HttpServletRequest request, Principal principal) {
	HttpSession session = request.getSession();
	boolean isAdmin = request.isUserInRole("ADMIN");
	String userName = principal.getName();
	Registration registration = registrationService.getLoggedInUserInfo(userName);
	Date now = new Date();
	int numberOfDaysRemaining = 0;
	DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	try {
	    Date ValidityDate = (Date) formatter.parse(registration.getValidUpTo());
	    if (ValidityDate.compareTo(now) > 0) {
		Calendar day1 = Calendar.getInstance();
		Calendar day2 = Calendar.getInstance();
		day1.setTime(ValidityDate);
		day2.setTime(now);
		numberOfDaysRemaining = day1.get(Calendar.DAY_OF_YEAR) - day2.get(Calendar.DAY_OF_YEAR);
	    }
	} catch (ParseException e) {
	    e.printStackTrace();
	}
	session.setAttribute("registration", registration);
	session.setAttribute("daysLeft", numberOfDaysRemaining);
	if (isAdmin)
	    return "redirect:/showAdminHomePage";
	 else
	    return "loginPage";
    }

    @RequestMapping(value = "/showAdminHomePage", method = RequestMethod.GET)
    public String showAdminHomePage() {
	return "adminHomePage";
    }
}
