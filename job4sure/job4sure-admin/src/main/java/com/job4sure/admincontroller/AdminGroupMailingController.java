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
		List<Registration> subadmins= adminGroupMailingService.getSubAdminsList();
		model.addAttribute("subadmins",subadmins);
		model.addAttribute("sendMail",new SendMail());
		return "groupMailToSubAdminsPage";
	}
	
	
	
	@RequestMapping(value = "/sendMailToGroup", method = RequestMethod.POST)
	public String sendMailToGroup(ModelMap model,@ModelAttribute("sendMail") SendMail sendMail) {
		adminGroupMailingService.sendMailToGroup(sendMail);
		
		return "groupMailToSubAdminsPage";
	}
}
