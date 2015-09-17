package com.job4sure.admincontroller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.job4sure.model.Registration;
import com.job4sure.service.RegistrationService;
import com.job4sure.util.IConstant;

@Controller
public class AdminRegistrationController {
	
	@Autowired
	private RegistrationService registrationService;

	@RequestMapping("/adminRegistration")  
	public String showRegistration(Map<String, Object> map,@RequestParam(required = false) Integer registrationId,ModelMap model) {
		Registration registration=	 new Registration();
		registration = registrationService.getAllRecods(registrationId);
		map.put("Registration", registration);
		model.addAttribute("message", IConstant.FILUP__REGISTRATION__FORM_MESSAGE);
		return "adminRegistration";
	}

	@RequestMapping(value = "/saveRegistration", method = { RequestMethod.GET, RequestMethod.POST })
	private String saveUserInformation(@ModelAttribute("Registration") Registration registration, ModelMap model) throws Exception {
		boolean status = false;
		status = registrationService.saveadmininformation(registration);
		if (status) {
			model.addAttribute("message", IConstant.SUCCESS_MESSAGE);
		} else {
			model.addAttribute("message", IConstant.FAILURE_MESSAGE);
		}
		return "redirect:/OpenloginPage";
	}

	 @RequestMapping(value = "/addSubAdmin")
	    public String showSubAdmin(Map<String, Object> map,@RequestParam(required=false)String message,ModelMap model){
		 map.put("Registration", new Registration());
		 model.addAttribute("message", message);
		return "addSubAdmin";
	    }
	@RequestMapping(value = "/saveSubAdmin", method = { RequestMethod.GET, RequestMethod.POST })
	private String saveSubAdmin(@ModelAttribute("Registration") Registration registration, ModelMap model) throws Exception {
		boolean status = false;
		status = registrationService.saveSubAdmin(registration);
		if (status) {
			System.out.println("SUCCESSFULLY_MESSAGE");
			model.addAttribute("message", IConstant.SUCCESSFULLY_MESSAGE);
			
		} else {
			model.addAttribute("message", IConstant.FAILURE_MESSAGE_ADMIN);
		}
		return "redirect:/addSubAdmin";
	}
	
	
}
