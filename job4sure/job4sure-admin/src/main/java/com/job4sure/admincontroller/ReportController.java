package com.job4sure.admincontroller;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.job4sure.model.CompanyProfileModel;
import com.job4sure.service.ReportService;




@Controller
public class ReportController
{
	@Autowired
	private ReportService reportService;
	
	@RequestMapping(value="/companyList",method=RequestMethod.GET)
   public String ShowCompanyList(ModelMap model)
   {
  List companyList= reportService.getCompanyList();
     model.addAttribute("companyList", companyList);

    return "CompanyList";
     
   }

@RequestMapping(value="/userList",method=RequestMethod.GET)
public String ShowUserList(ModelMap model)
{
	List userList=reportService.getUserList();
	model.addAttribute("userList",userList);
	return "UserList";
}
	
}




