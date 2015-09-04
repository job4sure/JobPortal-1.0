package com.job4sure.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.job4sure.model.CompanyProfileModel;
import com.job4sure.model.Registration;
import com.job4sure.model.userProfile;
import com.job4sure.service.RegistrationService;
import com.job4sure.service.companyProfile;
import com.job4sure.validator.RegistrationValidator;

@Controller
public class CompanyProfile
{
	@Autowired
	private RegistrationService registrationService;
	
	@Autowired
	private RegistrationValidator registrationValidator;
		@Autowired
	private companyProfile companyprofile;
	
	@RequestMapping(value = "/CompanyProfile", method = RequestMethod.GET)
	public String Complete_profile(@ModelAttribute("companyProfile") CompanyProfileModel companyProfile,Map<String,Object>map,String message,ModelMap model,HttpServletRequest request) 
	{
	/*	HttpSession session=request.getSession();
		companyProfile =  (CompanyProfileModel) session.getAttribute("companyProfile");*/
		HttpSession session=request.getSession();
		Registration registration = (Registration) session.getAttribute("registration");
		companyProfile = companyprofile.getLoggedInCompanyCompleteInfo(registration.getRegistrationId());
		if(companyProfile!=null){
		map.put("companyProfile", companyProfile);	
		 model.addAttribute("message", message);
		}
		else{
		map.put("companyProfile", new CompanyProfileModel());
		 model.addAttribute("message", message);
		}
		return "companyProfilePage";
}
/*	@RequestMapping(value = "/updateCompProfile", method = RequestMethod.GET)
	public String updateCompProfile(@ModelAttribute("companyProfile") CompanyProfileModel companyProfile,Map<String,Object>map,ModelMap model,HttpServletRequest request) 
	{
		HttpSession session=request.getSession();
		companyProfile =  (CompanyProfileModel) session.getAttribute("companyProfile");
		map.put("companyprofile", new CompanyProfileModel());
		model.addAttribute("companyProfile", companyProfile);
		return "companyProfilePage";
}*/
	
	@RequestMapping(value = "/savecompanyProfile", method = RequestMethod.POST)
	public String savecomplete_profile(@ModelAttribute("companyprofile") CompanyProfileModel companyProfile,ModelMap model,HttpServletRequest request ) 
	{
		
		  HttpSession session=request.getSession();
		   Registration  registration = (Registration) session.getAttribute("registration");
		   companyProfile.setRegistrationId(registration.getRegistrationId());
		//System.out.println(companyProfile.getCompanyName());
		companyprofile.savecompany_profile(companyProfile);
		if(companyProfile.getRegistrationId()==null){
		model.addAttribute("message", "Company profile created successfully!! "); 
		return "redirect:/CompanyProfile";
		}else{
			model.addAttribute("message", "Company profile updated successfully!! "); 
			return "redirect:/CompanyProfile";
		}
}
	@RequestMapping(value = "/viewCompanyProfile", method=RequestMethod.GET)
	public String view_profile(@ModelAttribute("companyprofile") CompanyProfileModel companyProfile,Map<String, Object> map,ModelMap model,HttpServletRequest request ) 
	{
		
		  HttpSession session=request.getSession();
		   Registration  registration = (Registration) session.getAttribute("registration");
		   companyProfile.setRegistrationId(registration.getRegistrationId());
	//	System.out.println(companyProfile.getCompanyName());
		List<CompanyProfileModel> list = companyprofile.view_profile(companyProfile);
              System.out.println("size of list is--------------"+list.size());
              
              System.err.println("aya yaha tak data.----------------------------------------");
	       //   System.out.println(list.get(2));	
	   //   	map.put("CompanyProfileModel", new CompanyProfileModel());
			model.addAttribute("companylist", list);
		return "companyviewProfile12";	
	}
	@RequestMapping(value = "/CompanyProfileView", method = RequestMethod.GET)
	public String CompanyProfileView(Map<String, Object> map,ModelMap model,HttpServletRequest request) 
	{
		HttpSession session=request.getSession();
		Registration registration = (Registration) session.getAttribute("registration");
		CompanyProfileModel  companyProfile = companyprofile.getLoggedInCompanyCompleteInfo(registration.getRegistrationId());
		session.setAttribute("companyProfile", companyProfile);
		map.put("companyprofile", new CompanyProfileModel());
		model.addAttribute("companyProfile", companyProfile);
		return "CompanyDetailsViewPage";
}
	@RequestMapping(value = "/updateCompanyBasicProfile", method = RequestMethod.GET)
	public String updateBasicProfile(@ModelAttribute("Registration") Registration registration,Map<String, Object> map,String message,ModelMap model,HttpServletRequest request) {
		HttpSession session=request.getSession();
		 registration = (Registration) session.getAttribute("registration");
		 map.put("Registration", registration);
		 model.addAttribute("registration", registration);
		 model.addAttribute("message", message);
		 return "updateCompanyBasicProfilePage";
	}
	
	@RequestMapping(value = "/updateCompanyInformation",method = { RequestMethod.GET,RequestMethod.POST })
	private String updateUserInformation(
			@ModelAttribute("Registration") Registration registration,
			ModelMap model, BindingResult result,HttpServletRequest request) throws Exception {
		HttpSession session=request.getSession();
		boolean status = false;
		registrationValidator.validate(registration, result);
		if (result.hasErrors()) {
			return "registration";
		}
		status = registrationService.updateUserInformation(registration);
		if (status) {
			session.setAttribute("registration", registration);
			model.addAttribute("message",
					"Basic Info Successfully Updated !!");
		} else {
			
			
			model.addAttribute("message",
					"Profile Updation failed, Please try again!");
		}
		return "redirect:/updateCompanyBasicProfile";
	}
}