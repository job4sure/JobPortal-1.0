package com.job4sure.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.job4sure.model.City;
import com.job4sure.model.JobDescription;
import com.job4sure.model.JobDescriptionApprovalStatus;
import com.job4sure.model.Registration;
import com.job4sure.model.Skills;
import com.job4sure.service.AdminJobDescriptionService;
import com.job4sure.service.JobDescriptionService;
import com.job4sure.util.IConstant;
import com.job4sure.util.JobDescriptionDropDownList;

@Controller
public class JobDescriptionController {

    @Autowired
    private JobDescriptionService jobDescriptionService;
    
    @Autowired
    AdminJobDescriptionService adminJobDescriptionService;
    
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
		List<JobDescription> joblist = adminJobDescriptionService.getJobDescriptionList(IConstant.JD_APPROVED_STATUS);
		if (joblist.isEmpty())
			model.addAttribute("message", IConstant.EMPTY_LIST);
		else {
			model.addAttribute("jobList", joblist);
			model.addAttribute("message", IConstant.NOT_EMPTY_LIST);
		}
		return "viewApprovedJobDescriptionInUser";
	}

    @RequestMapping(value = "/getAllJobsBySkillId", method = { RequestMethod.GET })
    @ResponseBody
    public Map<String, List<Object>> getAllJobsBySkillId(@RequestParam Integer skillId) {
	Map<String, List<Object>> jobListMap = new HashMap<String, List<Object>>();
	List<Skills> skillList = jobDescriptionService.getAllJobsBySkillId(skillId);
	Skills s=skillList.get(0);
	Set<JobDescription> aa=s.getJobDescription();
	Iterator<JobDescription> ff=aa.iterator();
	List<Object> jobDescriptionList=new ArrayList<Object>();
	
	while(ff.hasNext()){
	    jobDescriptionList.add(ff.next());
	}
	
	jobListMap.put("jobDescriptionList", jobDescriptionList);
	return jobListMap;

    }
    
    @RequestMapping(value = "/getAllJobsByExp", method = { RequestMethod.GET })
    @ResponseBody
    public List<JobDescription> getAllJobsByExp(@RequestParam Integer experience) {
	
	List<JobDescription> jobDescriptions = jobDescriptionService.getAllJobsByExp(experience);
	return jobDescriptions;
    }

}
