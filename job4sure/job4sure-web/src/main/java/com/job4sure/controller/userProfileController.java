package com.job4sure.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class userProfileController {
	
	@RequestMapping(value = "/userProfile", method = RequestMethod.GET)
	public String showuserProfile(HttpServletRequest request) {
		//String loggedInUser = request.getu
		return "userProfilePage";
	}

}
