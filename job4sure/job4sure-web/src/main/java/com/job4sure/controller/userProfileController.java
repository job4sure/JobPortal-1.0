package com.job4sure.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.job4sure.model.Registration;
@Controller
public class userProfileController {
	
	@RequestMapping(value = "/userProfile", method = RequestMethod.GET)
	public String showuserProfile(Map<String, Object> map,ModelMap model, HttpServletRequest request) {
		HttpSession session=request.getSession();
		Registration registration = (Registration) session.getAttribute("registration");
	//	map.put("Registration", new Registration());
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

}
