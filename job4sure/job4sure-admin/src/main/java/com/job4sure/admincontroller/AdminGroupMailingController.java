package com.job4sure.admincontroller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.job4sure.model.Registration;
import com.job4sure.model.SendMail;
import com.job4sure.service.AdminGroupMailingService;
import com.job4sure.service.RegistrationService;
import com.job4sure.util.IConstant;


/**
 * @author Vipulraj
 *
 */

@Controller
public class AdminGroupMailingController {

	@Autowired
	private AdminGroupMailingService adminGroupMailingService;
	
	@RequestMapping(value = "/groupMailToSubAdmins", method = RequestMethod.GET)
	public String groupMailToSubAdmins(ModelMap model) {
		List<Registration> subadmins= adminGroupMailingService.getRegistrationList(IConstant.SUBADMIN_ROLE_ID);
		model.addAttribute("subadmins",subadmins);
		model.addAttribute("sendMail",new SendMail());
		return "groupMailToSubAdminsPage";
	}
	
	
	
	@RequestMapping(value = "/groupMailToEmployers", method = RequestMethod.GET)
	public String groupMailToEmployers(ModelMap model) {
		
		List<Registration> employers= adminGroupMailingService.getRegistrationList(IConstant.COMPANY_ROLE_ID);
		model.addAttribute("employers",employers);
		model.addAttribute("sendMail",new SendMail());
		return "groupMailToEmployersPage";
	}
	
	
	
	
	@RequestMapping(value = "/groupMailToUsers", method = RequestMethod.GET)
	public String groupMailToJobSeekers(ModelMap model) {
		List<Registration> users= adminGroupMailingService.getRegistrationList(IConstant.USER_ROLE_ID);
		model.addAttribute("users",users);
		model.addAttribute("sendMail",new SendMail());
		return "groupMailToUsersPage";
	}
	
	
	@RequestMapping(value = "/sendMailToGroup", method = RequestMethod.POST)
	public String sendMailToGroup(ModelMap model,@ModelAttribute("sendMail") SendMail sendMail) {
		adminGroupMailingService.sendMailToGroup(sendMail);
		model.addAttribute("message", IConstant.SUCCESSFULLY_MESSAGE);
		return "redirect:/showAdminHomePage";
	}
}
