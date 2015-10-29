package com.job4sure.admincontroller;

import java.sql.Ref;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.job4sure.model.JobDescription;
import com.job4sure.model.Reference;
import com.job4sure.model.Registration;
import com.job4sure.service.AdminJobDescriptionService;
import com.job4sure.service.RefrenceService;
import com.job4sure.util.IConstant;

/**
 * @author Mayank and Patidar
 *
 */
@Controller
public class AdminJobDescriptionController {
    @Autowired
    private AdminJobDescriptionService adminJobDescriptionService;

    @Autowired
    private RefrenceService refrenceService;

    @RequestMapping(value = "/showApprovedJobDescriptions", method = RequestMethod.GET)
    public String showAllApprovedJds(String message, ModelMap model, HttpServletRequest request) {
	List<JobDescription> approvedJobDescriptionsList = adminJobDescriptionService.getJobDescriptionList(IConstant.JD_APPROVED_STATUS);
	model.addAttribute("approvedJobDescriptionsList", approvedJobDescriptionsList);
	model.addAttribute("message", message);
	return "jobDescriptionList";
    }

    /*
     * This method is to show details for selected job description.
     */
    @RequestMapping(value = "/viewJobDescription", method = { RequestMethod.GET, RequestMethod.POST })
    public String viewJobDescription(HttpServletRequest request, ModelMap model, @RequestParam Integer jobId) {
	Registration registration;
	List<Reference> references = new ArrayList<Reference>();
	HttpSession session = request.getSession();
	registration = (Registration) session.getAttribute("registration");

	JobDescription jobDescription = adminJobDescriptionService.viewJobDescription(jobId);
	if (registration.getRoleType() == 3) {
	    references = refrenceService.findByJobId(jobId);
	} else {
	    references = refrenceService.getRefrenceByJobIdAndUser(jobId, registration.getRegistrationId());
	}

	model.addAttribute("references", references);
	model.addAttribute("reference", new Reference());
	model.addAttribute("jobDescription", jobDescription);
	return "viewJobDescription";
    }

    @RequestMapping(value = "/referToAdmin", method = { RequestMethod.GET, RequestMethod.POST })
    public String referToAdmin(@ModelAttribute("refrence") Reference reference, @RequestParam CommonsMultipartFile[] upload,
		    HttpServletRequest request, ModelMap model, @RequestParam("jobId") String jobId) {
	HttpSession session = request.getSession();
	Integer jId = Integer.valueOf(jobId);
	Registration registration;

	JobDescription jobDescriptionTemp = adminJobDescriptionService.viewJobDescription(jId);
	registration = (Registration) session.getAttribute("registration");
	reference.setRegistration(registration);
	reference.setJobDescription(jobDescriptionTemp);
	if (registration.getRoleType() == 3)
	    reference.setStatus(true);
	else
	    reference.setStatus(false);

	refrenceService.save(reference, upload);

	model.addAttribute("jobId", jId);
	model.addAttribute("jobDescription", jobDescriptionTemp);

	return "redirect:/viewJobDescription";
    }

    @RequestMapping(value = "/showPendingJobDescriptions", method = RequestMethod.GET)
    public String showAllPendingJds(String message, ModelMap model, HttpServletRequest request) {
	List<JobDescription> pendingJobDescriptionsList = adminJobDescriptionService.getJobDescriptionList(IConstant.JD_PENDING_STATUS);
	model.addAttribute("approvedJobDescriptionsList", pendingJobDescriptionsList);
	model.addAttribute("message", message);
	return "jobDescriptionList";
    }

    @RequestMapping(value = "/showRejectedJobDescriptions", method = RequestMethod.GET)
    public String showRejectedJobDescriptions(String message, ModelMap model, HttpServletRequest request) {
	List<JobDescription> rejectedJobDescriptionsList = adminJobDescriptionService.getJobDescriptionList(IConstant.JD_REJECTED_STATUS);
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

    @RequestMapping(value = "/changeReferStatus", method = { RequestMethod.POST })
    @ResponseBody
    public Map<String, Reference> getAllCityByStateId(@RequestParam Integer referenceId, @RequestParam String isRefer) {
	Map<String, Reference> refrenceMap = new HashMap<String, Reference>();
	Reference reference = refrenceService.changeStatus(referenceId, isRefer);
	refrenceMap.put("refrence", reference);
	return refrenceMap;
    }
}
