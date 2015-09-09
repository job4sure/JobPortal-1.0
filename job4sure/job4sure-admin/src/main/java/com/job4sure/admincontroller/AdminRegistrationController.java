package com.job4sure.admincontroller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.job4sure.model.Registration;
import com.job4sure.service.RegistrationService;
import com.job4sure.util.IConstant;

@Controller
public class AdminRegistrationController {
	
	@Autowired
	private RegistrationService registrationService;

	@RequestMapping("/adminRegistration")  
	public String showRegistration(Map<String, Object> map) {
		map.put("Registration", new Registration());
		return "adminRegistration";
	}

	@RequestMapping(value = "/saveRegistration", method = { RequestMethod.GET, RequestMethod.POST })
	private String saveUserInformation(@ModelAttribute("Registration") Registration registration, ModelMap model) throws Exception {
		boolean status = false;
		status = registrationService.saveadmininformation(registration);
		if (status) {
			model.addAttribute("message", IConstant.REGISTRATION_SUCCESS_MESSAGE);
		} else {
			model.addAttribute("message", IConstant.REGISTRATION_FAILURE_MESSAGE);
		}
		return "redirect:/adminRegistration";
	}

}
