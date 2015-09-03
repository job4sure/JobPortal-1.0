package com.job4sure.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

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
		userProfile userProfile = profileCompleteService.getLoggedInUserCompleteInfo(registration.getRegistrationId());
		map.put("Registration", new Registration());
		model.addAttribute("registration", registration);
		model.addAttribute("userProfile", userProfile);
		return "userProfilePage";
	}
	@RequestMapping(value = "/updateBasicProfile", method = RequestMethod.GET)
	public String updateBasicProfile(@ModelAttribute("Registration") Registration registration,Map<String, Object> map,ModelMap model,HttpServletRequest request) {
		HttpSession session=request.getSession();
		 registration = (Registration) session.getAttribute("registration");
		 map.put("Registration", registration);
		 model.addAttribute("registration", registration);
		 return "userBasicInfoPage";
	}
	@RequestMapping(value = "/Complete_Profile", method = RequestMethod.GET)
	public String Complete_profile(Map<String,Object>map) 
	{
		map.put("userProfile", new userProfile());
		
		
		return "complteprofile";
}
	@RequestMapping(value = "/updateCompleteInfo", method = RequestMethod.GET)
	public String updateCompleteProfile(@ModelAttribute("userProfile") userProfile userProfile,Map<String, Object> map,ModelMap model,HttpServletRequest request) {
		HttpSession session=request.getSession();
		Registration registration = (Registration) session.getAttribute("registration");
		userProfile = profileCompleteService.getLoggedInUserCompleteInfo(registration.getRegistrationId());
		 map.put("userProfile", userProfile);
	//	 model.addAttribute("userProfile", userProfile);
		 return "complteprofile";
	}
	
	@RequestMapping(value = "/savecomplete_profile", method = RequestMethod.POST)
	public String savecomplete_profile(@ModelAttribute("userProfile") userProfile userProfile,HttpServletRequest request ) 
	{
		// savecomplete_profile(userProfile);
	
		
		 HttpSession session=request.getSession();
		 Registration  registration = (Registration) session.getAttribute("registration");
		      userProfile.setRegistrationId(registration.getRegistrationId());
		     profileCompleteService.savecomplete_profile(userProfile);
		return "complteprofile";
	

}
	//savecomplete_profile

}
