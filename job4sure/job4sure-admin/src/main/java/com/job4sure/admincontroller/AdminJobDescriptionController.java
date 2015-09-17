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
import com.job4sure.util.IConstant;

/**
 * @author Mayank and Patidar
 *
 */
@Controller
public class AdminJobDescriptionController {
    @Autowired
    private AdminJobDescriptionService adminJobDescriptionService;

    @RequestMapping(value = "/showApprovedJobDescriptions", method = RequestMethod.GET)
    public String showAllApprovedJds(String message, ModelMap model, HttpServletRequest request) {
	List<JobDescription> approvedJobDescriptionsList = adminJobDescriptionService
			.getJobDescriptionList(IConstant.JD_APPROVED_STATUS);
	model.addAttribute("approvedJobDescriptionsList", approvedJobDescriptionsList);
	model.addAttribute("message", message);
	return "jobDescriptionList";
    }

    /*
     * This method is to show details for selected job description.
     */
    @RequestMapping(value = "/viewJobDescription", method = { RequestMethod.GET, RequestMethod.POST })
    public String viewJobDescription(ModelMap model, @RequestParam Integer jobId) {
	JobDescription jobDescription = adminJobDescriptionService.viewJobDescription(jobId);
	model.addAttribute("jobDescription", jobDescription);
	return "viewJobDescription";
    }

    @RequestMapping(value = "/showPendingJobDescriptions", method = RequestMethod.GET)
    public String showAllPendingJds(String message, ModelMap model, HttpServletRequest request) {
	List<JobDescription> pendingJobDescriptionsList = adminJobDescriptionService
			.getJobDescriptionList(IConstant.JD_PENDING_STATUS);
	model.addAttribute("approvedJobDescriptionsList", pendingJobDescriptionsList);
	model.addAttribute("message", message);
	return "jobDescriptionList";
    }

    @RequestMapping(value = "/showRejectedJobDescriptions", method = RequestMethod.GET)
    public String showRejectedJobDescriptions(String message, ModelMap model, HttpServletRequest request) {
	List<JobDescription> rejectedJobDescriptionsList = adminJobDescriptionService
			.getJobDescriptionList(IConstant.JD_REJECTED_STATUS);
	model.addAttribute("approvedJobDescriptionsList", rejectedJobDescriptionsList);
	model.addAttribute("message", message);
	model.addAttribute("hideRejectLink", "reject");
	return "jobDescriptionList";
    }

    /**
     * This method is used for approve or reject coming JD.
     * 
     * @param statusId
     *            to check coming JD is for approval or for reject operation.
     */
    @RequestMapping(value = "/jobDescription", method = { RequestMethod.GET, RequestMethod.POST })
    public String approvedAndRejectJds(ModelMap model, @RequestParam Integer jobId, @RequestParam Integer statusId) {
	adminJobDescriptionService.approveOrRejectJobDescription(jobId, statusId);
	if (statusId == 2) {
	    model.addAttribute("message", IConstant.JD_APPROVED_MSG);
	    return "redirect:/showPendingJobDescriptions";
	} else {
	    model.addAttribute("message", IConstant.JD_REJECTED_MSG);
	    return "redirect:/showApprovedJobDescriptions";
	}
    }

}
