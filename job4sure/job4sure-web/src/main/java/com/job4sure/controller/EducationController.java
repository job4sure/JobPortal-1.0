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
import com.job4sure.serviceImpl.EducationServiceImpl;
import com.job4sure.util.IConstant;

@Controller
public class EducationController {

	@Autowired
	private EducationServiceImpl educationServiceImpl;

	@RequestMapping(value = "/educationUpdate", method = RequestMethod.GET)
	public String showEducationSettings(HttpServletRequest request, @RequestParam(required = false) String message,
			Model model, Map<String, Object> map) {
		HttpSession session = request.getSession(false);
		Registration registration = (Registration) session.getAttribute("registration");
		Integer registrationId = registration.getRegistrationId();
		Education education = educationServiceImpl.viewEducation(registrationId);
		if (education != null) {
			model.addAttribute("message", message);
			map.put("ED", education);
		} else
			map.put("ED", new Education());
		return "educationUpdate";
	}

	@RequestMapping(value = "/educationSave", method = RequestMethod.POST)
	public String saveEducation(@ModelAttribute Education education, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		Registration registration = (Registration) session.getAttribute("registration");
		education.setRegistrationId(registration.getRegistrationId());
		educationServiceImpl.save(education);
		model.addAttribute("message", IConstant.EDUCATION_SAVE);
		return "redirect:/educationUpdate";
	}

	}
