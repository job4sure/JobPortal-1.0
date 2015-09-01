package com.job4sure.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.job4sure.model.JobDescription;
import com.job4sure.model.Registration;
import com.job4sure.service.JobDescriptionService;

@Controller
public class JobDescriptionController {

	@Autowired
	private JobDescriptionService jobDescriptionService;

	@Autowired
	@Qualifier("jobDescriptionValidator")
	private Validator validator;

	@RequestMapping(value = "/createJobDescription", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String createJobDescription(
			@ModelAttribute JobDescription jobDescription,
			HttpServletRequest request, BindingResult bindingResult, Model model) {
		String methodType = request.getMethod();
		if (methodType.equals("POST")) {
			validator.validate(jobDescription, bindingResult);
			if (bindingResult.hasErrors()) {
				return "addJobDesc";
			}
			HttpSession session = request.getSession(false);
			Registration registration = (Registration) session
					.getAttribute("registration");
			jobDescription.setRegistration(registration);
			boolean state = jobDescriptionService
					.saveJobDescription(jobDescription);
			if (state) {
				model.addAttribute("status",
						"Successfully save job description...");
			} else {
				model.addAttribute("status", "Failed save job description...");
			}
			return "addJobDesc";
		} else {
			model.addAttribute("jobDescription", new JobDescription());
			return "addJobDesc";
		}
	}

	@RequestMapping(value = "viewAllJobDescription", method = RequestMethod.GET)
	public String viewAllJobDescription(Model model) {
		
		return "viewAllJobDesc";
	}
}
