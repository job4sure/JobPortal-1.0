package com.job4sure.admincontroller;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.job4sure.model.CompanyProfileModel;
import com.job4sure.model.Registration;
import com.job4sure.model.UserProfile;
import com.job4sure.service.ReportService;

@Controller
public class ReportController {
	@Autowired
	private ReportService reportService;

	@RequestMapping(value = "/companyList", method = RequestMethod.GET)
	public String ShowCompanyList(ModelMap model) {
		@SuppressWarnings("unchecked")
		List<CompanyProfileModel> companyList = reportService.getCompanyList();
		model.addAttribute("companyList", companyList);
		return "CompanyList";
	}
	

	@RequestMapping(value = "/userList", method = RequestMethod.GET)
	public String ShowUserList(ModelMap model) {
		@SuppressWarnings("unchecked")
		List<Registration> userList = reportService.getUserList();
		model.addAttribute("userList", userList);
		model.addAttribute("cityList", reportService.getCityList());
		return "UserList";
	}
	
	
	@RequestMapping(value = "/forSearch" , method = RequestMethod.POST)
public String ShowSearchResult(ModelMap model,@ModelAttribute("UserProfile")UserProfile userProfile,@RequestParam(required=false)String txtNamSer){
		
		System.out.println();
	String loc=	userProfile.getCityId()+"";
	
		model.addAttribute("cityList", reportService.getCityList());
		System.out.println(txtNamSer+"name aa gya");
@SuppressWarnings("unchecked")
List<Registration>	userList= reportService.getUserListBySer(txtNamSer, loc);
model.addAttribute("userList", userList);

return "UserList";
	}
	
	
	
	
}
