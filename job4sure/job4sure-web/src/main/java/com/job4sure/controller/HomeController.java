package com.job4sure.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.job4sure.model.Attachment;
import com.job4sure.model.CompanyProfileModel;
import com.job4sure.model.Login;
import com.job4sure.model.Reference;
import com.job4sure.model.Registration;
import com.job4sure.service.CompanyProfileService;
import com.job4sure.service.RefrenceService;
import com.job4sure.service.RegistrationService;
import com.job4sure.util.DateFormatUtil;
import com.job4sure.util.EncryptDecrypt;
import com.job4sure.util.IConstant;
import com.job4sure.util.ImageFormat;

@Controller
public class HomeController {

    @Autowired
    private RegistrationService registrationService;

    @Autowired
    private CompanyProfileService companyProfileService;
    
    @Autowired
    private RefrenceService refrenceService;
    
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
	    model.addAttribute("message", IConstant.WRONG_CREDENTIAL);
	if (logout != null)
	    model.addAttribute("message", IConstant.RIGHT_CREDENTIAL);
	return "loginPage";
    }

    @RequestMapping(value = "/success", method = RequestMethod.GET)
    public String showSuccessPage(HttpServletRequest request, Principal principal,ModelMap model) {
	HttpSession session = request.getSession();
	boolean isUser = request.isUserInRole("USER");
	boolean isComp = request.isUserInRole("COMP");
	String userName = principal.getName();
	Registration registration = registrationService.getLoggedInUserInfo(userName);
	int numberOfDaysRemaining = DateFormatUtil.getRemainingDays(registration.getValidUpTo());
	session.setAttribute("registration", registration);
	session.setAttribute("daysLeft", numberOfDaysRemaining);
	if (isUser)
	    return "redirect:/userProfileHomePage";
	else if (isComp)
	    return "redirect:/companyHome";
	else{
		model.addAttribute("message", IConstant.WRONG_CREDENTIAL);
	    return "redirect:/OpenloginPage";
	}
    }

    @RequestMapping(value = "/companyHome", method = RequestMethod.GET)
    public String showCompPage(Map<String, Object> map, ModelMap model, HttpServletRequest request) throws IOException {
	HttpSession session = request.getSession();
	Registration registration = (Registration) session.getAttribute("registration");
	CompanyProfileModel companyProfile = companyProfileService.getCompanyCompleteInfo(registration
					.getRegistrationId());
	List<Reference> resumeList = refrenceService.getUserResume();
	if(resumeList!=null){
	model.addAttribute("resumeList", resumeList);
	}
	model.addAttribute("companyProfile", companyProfile);
	model.addAttribute("registration", registration);
	Attachment attachment = companyProfileService.getCompanyAttachment(registration.getRegistrationId());
	if (attachment != null) {
		String path = ImageFormat.readImage(attachment.getPath());
		model.addAttribute("attachment", path);
	}
	return "companyHomePage";
    }

    @RequestMapping(value = "/forgotPassword", method = RequestMethod.GET)
    public String ShowForgotPassPage(Map<String, Object> map, @RequestParam(required = false) String message,
		    ModelMap model) {
	map.put("login", new Login());
	model.addAttribute("message", message);
	return "forgotPassPage";
    }

    @RequestMapping(value = "/sendMailToResetPass", method = RequestMethod.POST)
    private String sendMailToResetPass(@ModelAttribute("login") Login login, ModelMap model) {

	Registration registration = registrationService.getLoggedInUserInfo(login.getEmail());
	boolean status = false;
	try {
	    login.setRegistration_Id(registration.getRegistrationId());
	    status = registrationService.sendMailToResetPass(login);
	} catch (Exception e) {
	    e.printStackTrace();
	}
	if (status)
	    model.addAttribute("message", IConstant.MAIL_SUCCESS_MESSAGE);
	else
	    model.addAttribute("message", IConstant.MAIL_FAILURE_MESSAGE);
	return "redirect:/forgotPassword";
    }

    @RequestMapping(value = "/reCreatePass", method = { RequestMethod.GET, RequestMethod.POST })
    public String reCreatePass(@RequestParam(required = false) String registrationId, String message,
		    Map<String, Object> map, ModelMap model) throws Exception {
	registrationId = EncryptDecrypt.decrypt(registrationId);
	Integer regId = Integer.parseInt(registrationId);
	Registration registration = new Registration();
	registration.setRegistrationId(regId);
	map.put("registration", registration);
	model.addAttribute("message", message);
	return "newPassword";
    }

    @RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
    public String updatePassword(@ModelAttribute("registration") Registration registration, Model model) {
	registrationService.updatePassword(registration.getRegistrationId(), registration.getPassword());
	model.addAttribute("message", IConstant.PASSWORD_UPDATED);
	return "redirect:/OpenloginPage";
    }
    
    @RequestMapping(value="/contact",method=RequestMethod.GET)
    public String showContactPage(){
    	return "contactUs";
    }
}
