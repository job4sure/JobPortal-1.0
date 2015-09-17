package com.job4sure.admincontroller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.job4sure.model.JobDescription;
import com.job4sure.service.AdminJobDescriptionService;

@Controller
public class AdminJobDescriptionController {
    @Autowired
    private AdminJobDescriptionService adminJobDescriptionService;

    @RequestMapping(value = "/showApprovedJobDescriptions", method = RequestMethod.GET)
    public String showAllApprovedJds(String message, ModelMap model, HttpServletRequest request) {
	int jdApprovedStatus = 2;
	List<JobDescription> approvedJobDescriptionsList = adminJobDescriptionService
			.getJobDescriptionList(jdApprovedStatus);
	model.addAttribute("approvedJobDescriptionsList", approvedJobDescriptionsList);
	model.addAttribute("message", message);
	return "jobDescriptionList";
    }

    @RequestMapping(value = "/viewJobDescription", method = { RequestMethod.GET, RequestMethod.POST })
    public String viewJobDescription(ModelMap model, @RequestParam Integer jobId) {
	JobDescription jobDescription = adminJobDescriptionService.viewJobDescription(jobId);
	model.addAttribute("jobDescription", jobDescription);
	return "viewJobDescription";
    }

    @RequestMapping(value = "/showPendingJobDescriptions", method = RequestMethod.GET)
    public String showAllPendingJds(String message, ModelMap model, HttpServletRequest request) {
	Integer jdApprovedStatus = 1;
	List<JobDescription> pendingJobDescriptionsList = adminJobDescriptionService
			.getJobDescriptionList(jdApprovedStatus);
	model.addAttribute("approvedJobDescriptionsList", pendingJobDescriptionsList);
	model.addAttribute("message", message);
	return "jobDescriptionList";
    }

    @RequestMapping(value = "/showRejectedJobDescriptions", method = RequestMethod.GET)
    public String showRejectedJobDescriptions(String message, ModelMap model, HttpServletRequest request) {
	Integer jdApprovedStatus = 3;
	List<JobDescription> rejectedJobDescriptionsList = adminJobDescriptionService
			.getJobDescriptionList(jdApprovedStatus);
	model.addAttribute("approvedJobDescriptionsList", rejectedJobDescriptionsList);
	model.addAttribute("message", message);
	return "jobDescriptionList";
    }

    @RequestMapping(value = "/jobDescription", method = { RequestMethod.GET, RequestMethod.POST })
    public String approvedAndRejectJds(ModelMap model, @RequestParam Integer jobId, @RequestParam Integer statusId) {
	adminJobDescriptionService.approveJobDescription(jobId, statusId);
	if (statusId == 2) {
	    model.addAttribute("message", "Successfully approved job description");
	    return "redirect:/showPendingJobDescriptions";
	} else {
	    model.addAttribute("message", "Successfully rejected job description");
	    return "redirect:/showApprovedJobDescriptions";
	}
    }

}
