package com.job4sure.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.job4sure.model.JobDescription;
import com.job4sure.model.JobDescriptionApprovalStatus;
import com.job4sure.model.Registration;
import com.job4sure.repository.JobDescriptionRepository;
import com.job4sure.repository.RegistrationRepository;
import com.job4sure.service.AdminJobDescriptionService;
import com.job4sure.util.IConstant;
import com.job4sure.util.SendMail;

@Service
public class AdminJobDescriptionServiceImpl implements AdminJobDescriptionService {
	@Autowired
	private JobDescriptionRepository jobDescriptionRepository;
	@Autowired
	private RegistrationRepository registrationRepository;

	public List<JobDescription> getJobDescriptionList(int jdApprovedStatus) {
		List<JobDescription> approvedJobDescriptionsList = jobDescriptionRepository
		                .getJobDescriptionListByStatus(jdApprovedStatus);
		return approvedJobDescriptionsList;
	}

	public boolean approveOrRejectJobDescription(Integer jobId, Integer statusId) {
		JobDescription jobDescription = jobDescriptionRepository.findOne(jobId);
		JobDescriptionApprovalStatus approvalStatus = new JobDescriptionApprovalStatus();
		if (statusId == IConstant.JD_APPROVED_STATUS) {
			approvalStatus.setStatusId(IConstant.JD_APPROVED_STATUS);
			sendJdToSubAdmins(jobId);
		} else
			approvalStatus.setStatusId(IConstant.JD_REJECTED_STATUS);
		jobDescription.setApprovalStatus(approvalStatus);
		jobDescriptionRepository.save(jobDescription);
		return true;
	}

	private Object sendJdToSubAdmins(Integer jobId) {
		// TODO Auto-generated method stub

		JobDescription jobDescription = jobDescriptionRepository.findOne(jobId);
		String subject = "New Job Description";
		String toMailId = "";
		String body = "Dear Sub Admin,\n \n A new Job Description has been posted on our Portal. \n Please have a look on following JD. \n\n Job Title"
		                + jobDescription.getJobTitle()
		                + "\n Job Location: "
		                
		                + "\n Edjucation: "
		                + jobDescription.getEducation()
		                + "\n Minimum Salary: "
		                + jobDescription.getMinSalary().getSalary()
		                + "\n Maximum Salary: "
		                + jobDescription.getMaxSalary().getSalary()
		                + "\n Minimum Exp: "
		                + jobDescription.getMinExperience().getExperience()
		                + "\n No. of Candidates"
		                + jobDescription.getNoOfCandidates()
		                + "\n Description: "
		                + jobDescription.getJobDesc()
		                + "\n\n Regards, \n Job4Sure Admin";

		List<Registration> registrations = registrationRepository.getUserListByRole(IConstant.SUBADMIN_ROLE_ID);
		for (Registration registration : registrations) {
			System.out.println(registration.getEmail());
			SendMail.commomMailSend(registration.getEmail(), subject, body);
		}

		return null;
	}

	public JobDescription viewJobDescription(Integer jobId) {
		JobDescription jobDescription = jobDescriptionRepository.findOne(jobId);
		return jobDescription;
	}
}
