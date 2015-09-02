package com.job4sure.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.job4sure.model.Registration;
import com.job4sure.model.userProfile;
import com.job4sure.service.ProfileCompleteService;
@Controller
public class userProfileController {

         @Autowired
	private ProfileCompleteService profileCompleteService;
	
	@RequestMapping(value = "/userProfile", method = RequestMethod.GET)
	public String showuserProfile(Map<String, Object> map,ModelMap model, HttpServletRequest request) {
		HttpSession session=request.getSession();
		Registration registration = (Registration) session.getAttribute("registration");
		map.put("Registration", new Registration());
		model.addAttribute("registration", registration);
		return "userProfilePage";
	}
	@RequestMapping(value = "/updateBasicProfile", method = RequestMethod.GET)
	public String updateBasicProfile(@ModelAttribute("Registration") Registration registration,ModelMap model,HttpServletRequest request) {
		HttpSession session=request.getSession();
		 registration = (Registration) session.getAttribute("registration");
		// map.put("Registration", registration);
		 model.addAttribute("registration", registration);
		 return "registration";
	}
	@RequestMapping(value = "/Complete_Profile", method = RequestMethod.GET)
	public String Complete_profile(Map<String,Object>map) 
	{
		map.put("userfrofile", new userProfile());
		
		
		return "complteprofile";
	

}
	
	
	@RequestMapping(value = "/savecomplete_profile", method = RequestMethod.POST)
	public String savecomplete_profile(@ModelAttribute("userfrofile") userProfile userProfile ) 
	{
		// savecomplete_profile(userProfile);
	
		     userProfile.setUserId(1); userProfile.setRegistrationId(8);
		     profileCompleteService.savecomplete_profile(userProfile);
		return "complteprofile";
	

}
	//savecomplete_profile

}
