package com.job4sure.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.job4sure.model.Attachment;
import com.job4sure.model.City;
import com.job4sure.model.Registration;
import com.job4sure.model.UserProfile;
import com.job4sure.service.JobDescriptionService;
import com.job4sure.service.RegistrationService;
import com.job4sure.service.UserProfileService;
import com.job4sure.util.IConstant;
import com.job4sure.util.ImageFormat;
import com.job4sure.validator.RegistrationValidator;

@Controller
public class UserProfileController {

    @Autowired
    private UserProfileService userProfileService;
    @Autowired
    private RegistrationService registrationService;
    @Autowired
    private RegistrationValidator registrationValidator;
    @Autowired
    private JobDescriptionService jobDescriptionService;

    @RequestMapping(value = "/userProfileHomePage", method = RequestMethod.GET)
    public String showuserProfile(Map<String, Object> map, String message, ModelMap model, HttpServletRequest request)
		    throws IOException {
	HttpSession session = request.getSession();
	Registration registration = (Registration) session.getAttribute("registration");
	UserProfile userProfile = userProfileService.getLoggedInUserCompleteInfo(registration.getRegistrationId());
	String loggedInEmail = registration.getEmail();
	int profilecompleted = userProfileService.getprofileCompletedInPercent(registration.getRegistrationId());
	model.addAttribute("profilecompleted", profilecompleted);
	Attachment attachment = userProfileService.getAllAttachment(registration.getRegistrationId());
	if (attachment != null && attachment.getAttachmentType().equals("profilePic")) {
	    String path = ImageFormat.readImage(attachment.getPath());
	    model.addAttribute("attachment", path);
	}
	map.put("Registration", new Registration());
	model.addAttribute("registration", registration);
	model.addAttribute("userProfile", userProfile);
	model.addAttribute("loggedInEmail", loggedInEmail);
	model.addAttribute("message", message);
	// return "userProfilePage";
	return "userHomePage";
    }

    @RequestMapping(value = "/updateBasicProfile", method = RequestMethod.GET)
    public String updateBasicProfile(@ModelAttribute("Registration") Registration registration,
		    Map<String, Object> map, String message, ModelMap model, HttpServletRequest request) {
	HttpSession session = request.getSession();
	registration = (Registration) session.getAttribute("registration");
	map.put("Registration", registration);
	model.addAttribute("registration", registration);
	model.addAttribute("message", message);
	return "userBasicInfoPage";
    }

    @RequestMapping(value = "/updateCompleteInfo", method = RequestMethod.GET)
    public String updateCompleteProfile(@ModelAttribute("userProfile") UserProfile userProfile,
		    Map<String, Object> map, String message, ModelMap model, HttpServletRequest request,
		    @RequestParam(required = false) Integer stateId1) throws IOException {
	HttpSession session = request.getSession();
	Registration registration = (Registration) session.getAttribute("registration");
	userProfile = userProfileService.getLoggedInUserCompleteInfo(registration.getRegistrationId());
	Attachment attachment = userProfileService.getAllAttachment(registration.getRegistrationId());
	if (attachment != null && attachment.getAttachmentType().equals("profilePic")) {
	    String path = ImageFormat.readImage(attachment.getPath());
	    model.addAttribute("attachment", path);
	}
	 model.addAttribute("roletype12", userProfileService.roleData());
	    model.addAttribute("experienceList", jobDescriptionService.getAllExperience());
	    model.addAttribute("stateList", userProfileService.getAllState());
	    model.addAttribute("salary", jobDescriptionService.getAllSalary());
	if (userProfile != null) {
	    //List industry = userProfileService.industryData();
	    map.put("userProfile", userProfile);
	    model.addAttribute("message", message);
	   // model.addAttribute("industrydata", industry);
	    model.addAttribute("homeCityList", userProfileService.getCity(userProfile.getHomeCity().getState().getStateId()));
	    model.addAttribute("currentCityList", userProfileService.getCity(userProfile.getCurrentCityId().getState().getStateId()));
	    model.addAttribute("cityList", userProfileService.getCity(userProfile.getCityId().getState().getStateId()));//getStateId().getStateId())
	    return "userCompleteInfo";
	} else {
	    model.addAttribute("message", IConstant.FIRST_COMPLETE_INFO_MESSAGE);
	    return "userCompleteInfo";
	}
    }

    @RequestMapping(value = "/saveCompleteUserProfile", method = RequestMethod.POST)
    public String saveCompleteUserProfile(@ModelAttribute("userProfile") UserProfile userProfile,
		    @RequestParam CommonsMultipartFile[] upload, ModelMap model, HttpServletRequest request) {
	HttpSession session = request.getSession();
	Registration registration = (Registration) session.getAttribute("registration");
	userProfile.setRegistrationId(registration.getRegistrationId());
	userProfileService.saveCompleteUserProfile(userProfile, upload);
	model.addAttribute("message", IConstant.USER_COMPLETE_INFO_SUCCESS_MESSAGE);
	return "redirect:/updateCompleteInfo";
    }

    @RequestMapping(value = "/setNewPassword", method = { RequestMethod.GET, RequestMethod.POST })
    public String reCreatePass(Map<String, Object> map, ModelMap model, HttpServletRequest request) throws Exception {
	HttpSession session = request.getSession();
	Registration registration = (Registration) session.getAttribute("registration");
	registration.setRegistrationId(registration.getRegistrationId());
	map.put("registration", registration);
	return "newUserPassword";
    }

    @RequestMapping(value = "/updateUserInformation", method = { RequestMethod.GET, RequestMethod.POST })
    private String updateUserInformation(@ModelAttribute("Registration") Registration registration, ModelMap model,
		    BindingResult result, HttpServletRequest request) throws Exception {
	HttpSession session = request.getSession();
	boolean status = false;
	registrationValidator.validate(registration, result);
	if (result.hasErrors()) {
	    model.addAttribute("message", "Mobile number should be 10 digit");
	    return "redirect:/updateBasicProfile";
	}
	status = registrationService.updateUserInformation(registration);
	if (status) {
	    session.setAttribute("registration", registration);
	    model.addAttribute("message", IConstant.USER_BASIC_INFO_SUCCESS_MESSAGE);
	} else
	    model.addAttribute("message", IConstant.USER_BASIC_INFO_FAILURE_MESSAGE);
	return "redirect:/updateBasicProfile";
    }

    @RequestMapping(value = "/downloadResume", method = { RequestMethod.GET, RequestMethod.POST })
    public String downloadResume(@RequestParam(required = false) Integer registrationId, HttpServletResponse response)
		    throws IOException {
	userProfileService.getUserResume(registrationId, response);
	return "redirect:/updateCompleteInfo";
    }

    @RequestMapping(value = "/getCityListByStateId", method = { RequestMethod.GET })
    @ResponseBody
    public Map<String, List<City>> getAllCityByStateId(@RequestParam Integer stateId) {
	Map<String, List<City>> cityListMap = new HashMap<String, List<City>>();
	List<City> cityList = userProfileService.getCity(stateId);
	cityListMap.put("cityList", cityList);
	return cityListMap;

    }
}
