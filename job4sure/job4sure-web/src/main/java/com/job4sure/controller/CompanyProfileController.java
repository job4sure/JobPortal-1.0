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

import com.job4sure.model.CompanyProfileModel;
import com.job4sure.model.Registration;
import com.job4sure.service.CompanyProfileService;
import com.job4sure.service.RegistrationService;
import com.job4sure.util.IConstant;
import com.job4sure.validator.RegistrationValidator;

@Controller
public class CompanyProfileController {
	@Autowired
	private RegistrationService registrationService;

	@Autowired
	private RegistrationValidator registrationValidator;
	@Autowired
	private CompanyProfileService companyProfileService;

	/*
	 * This method is show the form of complete company profile here
	 * CompanyProfile
	 */

	@RequestMapping(value = "/showCompleteCompanyProfilePage", method = RequestMethod.GET)
	public String Complete_profile(@ModelAttribute("companyProfile") CompanyProfileModel companyProfile,
			Map<String, Object> map, String message, ModelMap model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Registration registration = (Registration) session.getAttribute("registration");
		companyProfile = companyProfileService.getLoggedInCompanyCompleteInfo(registration.getRegistrationId());
		if (companyProfile != null) {
			map.put("companyProfile", companyProfile);
			model.addAttribute("message", message);
		} else {
			map.put("companyProfile", new CompanyProfileModel());
			model.addAttribute("message", message);
		}
		return "companyProfilePage";
	}

	/* This method for saving company complete info here savecompanyProfile */
	@RequestMapping(value = "/saveCompanyCompleteProfile", method = RequestMethod.POST)
	public String savecomplete_profile(@ModelAttribute("companyprofile") CompanyProfileModel companyProfile,
			ModelMap model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Registration registration = (Registration) session.getAttribute("registration");
		companyProfile.setRegistrationId(registration.getRegistrationId());
		companyProfileService.savecompany_profile(companyProfile);
		if (companyProfile.getRegistrationId() == null) {
			model.addAttribute("message", IConstant.COMPANY_COMPLETE_INFO_MESSAGE);
			return "redirect:/CompanyProfile";
		} else {
			model.addAttribute("message", IConstant.COMPANY_INFO_UPDATE_MESSAGE);
			return "redirect:/showCompleteCompanyProfilePage";
		}
	}

	/* this methos for show the company details page as non changeble */
	@RequestMapping(value = "/CompanyProfileView", method = RequestMethod.GET)
	public String CompanyProfileView(Map<String, Object> map, ModelMap model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Registration registration = (Registration) session.getAttribute("registration");
		CompanyProfileModel companyProfile = companyProfileService.getLoggedInCompanyCompleteInfo(registration
				.getRegistrationId());
		session.setAttribute("companyProfile", companyProfile);
		map.put("companyprofile", new CompanyProfileModel());
		model.addAttribute("companyProfile", companyProfile);
		return "CompanyDetailsViewPage";
	}

	/* This method for show the page of company basic info */
	@RequestMapping(value = "/updateCompanyBasicProfile", method = RequestMethod.GET)
	public String updateBasicProfile(@ModelAttribute("Registration") Registration registration,
			Map<String, Object> map, String message, ModelMap model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		registration = (Registration) session.getAttribute("registration");
		map.put("Registration", registration);
		model.addAttribute("registration", registration);
		model.addAttribute("message", message);
		return "updateCompanyBasicProfilePage";
	}

	/*
	 * This method for save the basic info of company here
	 * updateCompanyInformation
	 */
	@RequestMapping(value = "/saveUpdatedCompanyBasicInformation", method = { RequestMethod.GET, RequestMethod.POST })
	private String updateUserInformation(@ModelAttribute("Registration") Registration registration, ModelMap model,
			BindingResult result, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		boolean status = false;
		registrationValidator.validate(registration, result);
		if (result.hasErrors()) {
			return "registration";
		}
		status = registrationService.updateUserInformation(registration);
		if (status) {
			session.setAttribute("registration", registration);
			model.addAttribute("message", IConstant.COMPANY_BASIC_INFO_UPDATE_MESSAGE);
		} else {
			model.addAttribute("message", IConstant.COMPANY_BASIC_INFO_UPDATE_FAILURE_MESSAGE);
		}
		return "redirect:/updateCompanyBasicProfile";
	}

	@RequestMapping(value = "/setNewPasswordForComp", method = { RequestMethod.GET, RequestMethod.POST })
	public String reCreatePass(Map<String, Object> map, ModelMap model, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		Registration registration = (Registration) session.getAttribute("registration");
		registration.setRegistrationId(registration.getRegistrationId());
		map.put("registration", registration);
		return "newUserPasswordForComp";
	}
}