package com.job4sure.controller;

import java.util.List;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.job4sure.model.Registration;
import com.job4sure.model.UserProfile;
import com.job4sure.service.RegistrationService;
import com.job4sure.service.UserProfileService;
import com.job4sure.util.IConstant;
import com.job4sure.validator.RegistrationValidator;
@Controller
public class UserProfileController {

         @Autowired
	    private UserProfileService userProfileService;
         @Autowired
     	private RegistrationService registrationService;
     	@Autowired
     	private RegistrationValidator registrationValidator;
     	/*@Autowired
     	private UserDetaiFatchService userdetailfatch;*/
	
	@RequestMapping(value = "/userProfileHomePage", method = RequestMethod.GET)
	public String showuserProfile(Map<String, Object> map,String message,ModelMap model, HttpServletRequest request) {
		HttpSession session=request.getSession();
		Registration registration = (Registration) session.getAttribute("registration");
		UserProfile userProfile = userProfileService.getLoggedInUserCompleteInfo(registration.getRegistrationId());
		String loggedInEmail=registration.getEmail();
		int profilecompleted=userProfileService.getprofileCompletedInPercent(registration.getRegistrationId());
		model.addAttribute("profilecompleted", profilecompleted);
		map.put("Registration", new Registration());
		model.addAttribute("registration", registration);
		model.addAttribute("userProfile", userProfile);
		model.addAttribute("loggedInEmail", loggedInEmail);
		model.addAttribute("message", message);
		//return "userProfilePage";
		return "userHomePage";
	}
	@RequestMapping(value = "/updateBasicProfile", method = RequestMethod.GET)
	public String updateBasicProfile(@ModelAttribute("Registration") Registration registration,Map<String, Object> map,String message,ModelMap model,HttpServletRequest request) {
		HttpSession session=request.getSession();
		 registration = (Registration) session.getAttribute("registration");
		 map.put("Registration", registration);
		 model.addAttribute("registration", registration);
		 model.addAttribute("message", message);
		 return "userBasicInfoPage";
	}
	
	
	@RequestMapping(value = "/userCompletInfoPageShow", method = RequestMethod.GET)
	public String Complete_profile(Map<String,Object>map,String message,ModelMap model) 
	{
		List currentLocation= userProfileService.currentLocation();
		model.addAttribute("location", currentLocation);
		List annualSalary=userProfileService.salaryAnnual();
		model.addAttribute("salary", annualSalary);
		List preferedLocation=userProfileService.prefferedLocation();
		model.addAttribute("preferlocation", preferedLocation);
		List industry=userProfileService.industryData();
		model.addAttribute("industrydata", industry);
		List role=userProfileService.roleData();
		model.addAttribute("roletype12", role);
		map.put("userProfile", new UserProfile());
		model.addAttribute("message", message);
		
		return "userCompleteInfo";
}
	@RequestMapping(value = "/updateCompleteInfo", method = RequestMethod.GET)
	public String updateCompleteProfile(@ModelAttribute("userProfile") UserProfile userProfile,Map<String, Object> map,String message,ModelMap model,HttpServletRequest request) {
		HttpSession session=request.getSession();
		Registration registration = (Registration) session.getAttribute("registration");
		userProfile = userProfileService.getLoggedInUserCompleteInfo(registration.getRegistrationId());
		if(userProfile!=null){
		 map.put("userProfile", userProfile);
		 model.addAttribute("message",message);
		    List currentLocation= userProfileService.currentLocation();
			model.addAttribute("location", currentLocation);
			List annualSalary=userProfileService.salaryAnnual();
			model.addAttribute("salary", annualSalary);
			List preferedLocation=userProfileService.prefferedLocation();
			model.addAttribute("preferlocation", preferedLocation);
			List industry=userProfileService.industryData();
			model.addAttribute("industrydata", industry);
			List role=userProfileService.roleData();
			model.addAttribute("roletype12", role);
			
		 return "userCompleteInfo";
		}else{
		 model.addAttribute("message",IConstant.FIRST_COMPLETE_INFO_MESSAGE);	
		  return "redirect:/userCompletInfoPageShow";
		}
	}
	
	@SuppressWarnings("unused")
	@RequestMapping(value = "/saveCompleteUserProfile", method = RequestMethod.POST)
	public String saveCompleteUserProfile(@ModelAttribute("userProfile") UserProfile userProfile,
			@RequestParam CommonsMultipartFile[] upload,@RequestParam("upload") MultipartFile file,String attchmentName,ModelMap model,HttpServletRequest request ) 
	{
		final MultipartFile filePart = file;
		boolean status = false;
		file.getOriginalFilename();
		 HttpSession session=request.getSession();
		 Registration  registration = (Registration) session.getAttribute("registration");
		      userProfile.setRegistrationId(registration.getRegistrationId());
		      userProfileService.saveCompleteUserProfile(userProfile,filePart,upload,attchmentName);
		     model.addAttribute("message", IConstant.USER_COMPLETE_INFO_SUCCESS_MESSAGE);
		     return "redirect:/updateCompleteInfo";
}
	
	@RequestMapping(value = "/setNewPassword", method = {RequestMethod.GET,RequestMethod.POST})
	public String reCreatePass(Map<String, Object> map,ModelMap model,HttpServletRequest request) throws Exception {
		 HttpSession session=request.getSession();
		 Registration  registration = (Registration) session.getAttribute("registration");
		registration.setRegistrationId(registration.getRegistrationId());
		map.put("registration",registration);
	//	model.addAttribute("message", "Password is reset Successfully Please login Again!!");
		return "newUserPassword";
	}
	@RequestMapping(value = "/updateUserInformation", method = { RequestMethod.GET, RequestMethod.POST })
	private String updateUserInformation(@ModelAttribute("Registration") Registration registration, ModelMap model,
			BindingResult result, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		boolean status = false;
		registrationValidator.validate(registration, result);
		if (result.hasErrors()) {
			model.addAttribute("message","Mobile number should be 10 digit");
			return "redirect:/updateBasicProfile";
		}
		status = registrationService.updateUserInformation(registration);
		if (status) {
			session.setAttribute("registration", registration);
			model.addAttribute("message",IConstant.USER_BASIC_INFO_SUCCESS_MESSAGE);
		} else {
			model.addAttribute("message",IConstant.USER_BASIC_INFO_FAILURE_MESSAGE);
		}
		return "redirect:/updateBasicProfile";
	}
}
