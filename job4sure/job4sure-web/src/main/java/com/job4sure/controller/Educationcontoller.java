package com.job4sure.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.job4sure.model.Education;
import com.job4sure.model.Registration;
import com.job4sure.service.EducationService;
import com.job4sure.serviceImpl.EducationServiceimpl;

@Controller
public class Educationcontoller {

	@Autowired
	private EducationServiceimpl eduserviceimpl;

	@RequestMapping(value = "/educationupdate", method = RequestMethod.GET)
	public String showeducationsettings(Map<String, Object> map) {
		map.put("ED", new Education());
		return "educationupdate";

	}

	@RequestMapping(value = "/edusave", method = RequestMethod.POST)
	public String saveeducation(@ModelAttribute Education edu,
			HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		Registration registration = (Registration) session
				.getAttribute("registration");
		//System.out.println(edu.getInstitute());
		edu.setRegistration_id(registration.getRegistrationId());
		eduserviceimpl.save(edu);
		model.addAttribute("message", "edu data Stored");
		return "viewedudetails";
	}

	@RequestMapping(value = "/viewEducation", method = RequestMethod.GET)
	public String viewEducation(@ModelAttribute Education edu,
			HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		Registration registration = (Registration) session
				.getAttribute("registration");
		
		Integer reg_id = registration.getRegistrationId();
		
		Education edu3 = eduserviceimpl.viewEducation(reg_id, edu);
		
		model.addAttribute("message", "education data retrieved!");
		return "viewedudetails";
	}

}
