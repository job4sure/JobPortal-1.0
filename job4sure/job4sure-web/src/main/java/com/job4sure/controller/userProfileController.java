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
import org.springframework.web.bind.annotation.RequestParam;

import com.job4sure.model.Registration;
import com.job4sure.model.userProfile;
import com.job4sure.service.ProfileCompleteService;
import com.job4sure.util.AutoGenratedPassword;
import com.job4sure.util.IConstant;
@Controller
public class userProfileController {

         @Autowired
	private ProfileCompleteService profileCompleteService;
	
	@RequestMapping(value = "/userProfile", method = RequestMethod.GET)
	public String showuserProfile(Map<String, Object> map,String message,ModelMap model, HttpServletRequest request) {
		HttpSession session=request.getSession();
		Registration registration = (Registration) session.getAttribute("registration");
		userProfile userProfile = profileCompleteService.getLoggedInUserCompleteInfo(registration.getRegistrationId());
		map.put("Registration", new Registration());
		model.addAttribute("registration", registration);
		model.addAttribute("userProfile", userProfile);
		model.addAttribute("message", message);
		//return "userProfilePage";
		return "userHomePage";
	}
	@RequestMapping(value = "/updateBasicProfile", method = RequestMethod.GET)
	public String updateBasicProfile(@ModelAttribute("Registration") Registration registration,Map<String, Object> map,String message,ModelMap model,HttpServletRequest request) {
		HttpSession session=request.getSession();
		 registration = (Registration) session.getAttribute("registration");
		 map.put("Registration", registration);
		 model.addAttribute("registration", registration);
		 model.addAttribute("message", message);
		 return "userBasicInfoPage";
	}
	
	
	@RequestMapping(value = "/Complete_Profile", method = RequestMethod.GET)
	public String Complete_profile(Map<String,Object>map,String message,ModelMap model) 
	{
		map.put("userProfile", new userProfile());
		model.addAttribute("message", message);
		
		return "complteprofile";
}
	@RequestMapping(value = "/updateCompleteInfo", method = RequestMethod.GET)
	public String updateCompleteProfile(@ModelAttribute("userProfile") userProfile userProfile,Map<String, Object> map,ModelMap model,HttpServletRequest request) {
		HttpSession session=request.getSession();
		Registration registration = (Registration) session.getAttribute("registration");
		userProfile = profileCompleteService.getLoggedInUserCompleteInfo(registration.getRegistrationId());
		if(userProfile!=null){
		 map.put("userProfile", userProfile);
	//	 model.addAttribute("userProfile", userProfile);
		 return "complteprofile";
		}else{
		 model.addAttribute("message", "First Complete your info!!");	
		  return "redirect:/Complete_Profile";
		}
	}
	
	@RequestMapping(value = "/savecomplete_profile", method = RequestMethod.POST)
	public String savecomplete_profile(@ModelAttribute("userProfile") userProfile userProfile,ModelMap model,HttpServletRequest request ) 
	{
		// savecomplete_profile(userProfile);
	
		
		 HttpSession session=request.getSession();
		 Registration  registration = (Registration) session.getAttribute("registration");
		      userProfile.setRegistrationId(registration.getRegistrationId());
		     profileCompleteService.savecomplete_profile(userProfile);
		     model.addAttribute("message", "SuccessFully complete your profile !!");
		     return "redirect:/Complete_Profile";
	

}
	
	@RequestMapping(value = "/setNewPassword", method = {RequestMethod.GET,RequestMethod.POST})
	public String reCreatePass(Map<String, Object> map,ModelMap model,HttpServletRequest request) throws Exception {
		 HttpSession session=request.getSession();
		 Registration  registration = (Registration) session.getAttribute("registration");
		registration.setRegistrationId(registration.getRegistrationId());
		map.put("registration",registration);
	//	model.addAttribute("message", "Password is reset Successfully Please login Again!!");
		return "newPassword";
	}
	//savecomplete_profile

}
