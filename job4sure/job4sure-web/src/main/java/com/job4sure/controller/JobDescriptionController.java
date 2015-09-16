package com.job4sure.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.job4sure.model.JobDescription;
import com.job4sure.model.JobDescriptionApprovalStatus;
import com.job4sure.model.Registration;
import com.job4sure.model.Skills;
import com.job4sure.service.JobDescriptionService;
import com.job4sure.util.IConstant;
import com.job4sure.util.JobDescriptionDropDownList;

@Controller
public class JobDescriptionController {

    @Autowired
    private JobDescriptionService jobDescriptionService;

    @Autowired
    @Qualifier("jobDescriptionValidator")
    private Validator validator;

    @RequestMapping(value = "/createJobDescription", method = { RequestMethod.GET, RequestMethod.POST })
    public String createJobDescription(@ModelAttribute JobDescription jobDescription, HttpServletRequest request,
		    BindingResult bindingResult, Model model, @RequestParam(required = false) String status,
		    String skill) {
	model.addAttribute("status", status);
	JobDescriptionDropDownList.getAllJobDescriptionDropDownList(model, jobDescriptionService);
	if (request.getMethod().equals("POST")) {
	    validator.validate(jobDescription, bindingResult);
	    if (bindingResult.hasErrors()) 
		return "addJobDesc";
	    HttpSession session = request.getSession(false);
	    Registration registration = (Registration) session.getAttribute("registration");
	    jobDescription.setRegistration(registration);
	    JobDescriptionApprovalStatus approvalStatus = new JobDescriptionApprovalStatus();
	    approvalStatus.setStatusId(1);
	    jobDescription.setApprovalStatus(approvalStatus);
	    boolean state = jobDescriptionService.saveJobDescription(jobDescription, skill);
	    if (state)
		model.addAttribute("status", "Successfully save job description...");
	    else
		model.addAttribute("status", "Failed save job description...");
	    return "redirect:/createJobDescription.do";
	} else {
	    model.addAttribute("jobDescription", new JobDescription());
	    return "addJobDesc";
	}
    }

    @RequestMapping(value = "viewAllJobDescription", method = RequestMethod.GET)
    public String viewAllJobDescription(Model model, HttpServletRequest request,
		    @RequestParam(required = false) String message) {
	HttpSession session = request.getSession(false);
	Registration registration = (Registration) session.getAttribute("registration");
	List<JobDescription> jobList = jobDescriptionService.getAllJobDescription(registration.getRegistrationId());
	if(jobList.isEmpty())
	    model.addAttribute("message", IConstant.EMPTY_LIST);
	else{
	model.addAttribute("jobList", jobList);
	model.addAttribute("message", IConstant.NOT_EMPTY_LIST);
	}
	return "viewAllJobDesc";
    }

    @RequestMapping(value = "/deleteJob", method = { RequestMethod.GET, RequestMethod.POST })
    public String deleteJob(ModelMap model, @RequestParam Integer jobDescriptionId) {
	jobDescriptionService.deleteJob(jobDescriptionId);
	model.addAttribute("message", IConstant.JOB_DELETE_MESSAGE);
	return "redirect:/viewAllJobDescription.do";
    }

    @RequestMapping(value = "/editJob", method = { RequestMethod.GET, RequestMethod.POST })
    public String editJob(Model model, @RequestParam Integer jobId) {
	JobDescription jobDescription = jobDescriptionService.editJob(jobId);
	Set<Skills> checkedSkillsSet=jobDescription.getSkillsSet();
	List<Skills> checkedSkillsList=new ArrayList<Skills>();
	checkedSkillsList.addAll(checkedSkillsSet);
	JobDescriptionDropDownList.getAllJobDescriptionDropDownList(model, jobDescriptionService);
	model.addAttribute("checkedSkillsList", checkedSkillsList);
	model.addAttribute("jobDescription", jobDescription);
	return "addJobDesc";
    }
    @RequestMapping(value = "/getApprovedJobDescriptionInUser", method = RequestMethod.GET)
	public String viewApprovedJobDescription(Model model, HttpServletRequest request,
			@RequestParam(required = false) String message) {
		Integer jdApprovedStatus = 1;
		List<JobDescription> joblist = jobDescriptionService.getAllApprovedJobDescription(jdApprovedStatus);
		if (joblist.isEmpty())
			model.addAttribute("message", IConstant.EMPTY_LIST);
		else {
			model.addAttribute("jobList", joblist);
			model.addAttribute("message", IConstant.NOT_EMPTY_LIST);
		}
		return "viewApprovedJobDescriptionInUser";
	}


}
