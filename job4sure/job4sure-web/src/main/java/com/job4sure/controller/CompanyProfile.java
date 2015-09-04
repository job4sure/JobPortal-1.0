package com.job4sure.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.job4sure.model.CompanyProfileModel;
import com.job4sure.model.Registration;
import com.job4sure.model.userProfile;
import com.job4sure.service.companyProfile;

@Controller
public class CompanyProfile
{
     
		@Autowired
	private companyProfile companyprofile;
	
	@RequestMapping(value = "/CompanyProfile", method = RequestMethod.GET)
	public String Complete_profile(@ModelAttribute("companyProfile") CompanyProfileModel companyProfile,Map<String,Object>map,ModelMap model,HttpServletRequest request) 
	{
		HttpSession session=request.getSession();
		companyProfile =  (CompanyProfileModel) session.getAttribute("companyProfile");
		map.put("companyprofile", new CompanyProfileModel());
	//	model.addAttribute("companyProfile", companyProfile.getRegistrationId());
		return "companyProfilePage";
}
	@RequestMapping(value = "/updateCompProfile", method = RequestMethod.GET)
	public String updateCompProfile(@ModelAttribute("companyProfile") CompanyProfileModel companyProfile,Map<String,Object>map,ModelMap model,HttpServletRequest request) 
	{
		HttpSession session=request.getSession();
		companyProfile =  (CompanyProfileModel) session.getAttribute("companyProfile");
		map.put("companyprofile", new CompanyProfileModel());
		model.addAttribute("companyProfile", companyProfile);
		return "companyProfilePage";
}
	
	@RequestMapping(value = "/savecompanyProfile", method = RequestMethod.POST)
	public String savecomplete_profile(@ModelAttribute("companyprofile") CompanyProfileModel companyProfile,ModelMap model,HttpServletRequest request ) 
	{
		
		  HttpSession session=request.getSession();
		   Registration  registration = (Registration) session.getAttribute("registration");
		   companyProfile.setRegistrationId(registration.getRegistrationId());
		System.out.println(companyProfile.getCompanyName());
		companyprofile.savecompany_profile(companyProfile);
		
		model.addAttribute("message", "Done!! "); 
		
		return "redirect:/OpenloginPage";
}
	@RequestMapping(value = "/viewCompanyProfile", method=RequestMethod.GET)
	public String view_profile(@ModelAttribute("companyprofile") CompanyProfileModel companyProfile,Map<String, Object> map,ModelMap model,HttpServletRequest request ) 
	{
		
		  HttpSession session=request.getSession();
		   Registration  registration = (Registration) session.getAttribute("registration");
		   companyProfile.setRegistrationId(registration.getRegistrationId());
		System.out.println(companyProfile.getCompanyName());
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
	public String updateBasicProfile(@ModelAttribute("Registration") Registration registration,Map<String, Object> map,ModelMap model,HttpServletRequest request) {
		HttpSession session=request.getSession();
		 registration = (Registration) session.getAttribute("registration");
		 map.put("Registration", registration);
		 model.addAttribute("registration", registration);
		 return "updateCompanyBasicProfilePage";
	}
}