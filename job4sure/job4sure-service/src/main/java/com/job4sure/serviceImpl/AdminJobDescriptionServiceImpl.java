package com.job4sure.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.job4sure.model.JobDescription;
import com.job4sure.model.JobDescriptionApprovalStatus;
import com.job4sure.repository.AdminJobDescriptionRepository;
import com.job4sure.service.AdminJobDescriptionService;

@Service
public class AdminJobDescriptionServiceImpl implements AdminJobDescriptionService {
    @Autowired
    private AdminJobDescriptionRepository adminJobDescriptionRepository;

    public List<JobDescription> getJobDescriptionList(int jdApprovedStatus) {
	List<JobDescription> approvedJobDescriptionsList = adminJobDescriptionRepository
			.getJobDescriptionStatusList(jdApprovedStatus);
	return approvedJobDescriptionsList;
    }

    public boolean approveJobDescription(Integer jobId, Integer statusId) {
	JobDescription jobDescription = adminJobDescriptionRepository.findOne(jobId);
	JobDescriptionApprovalStatus approvalStatus = new JobDescriptionApprovalStatus();
	if (statusId == 2)
	    approvalStatus.setStatusId(2);// For approval
	else
	    approvalStatus.setStatusId(3);// For rejection
	jobDescription.setApprovalStatus(approvalStatus);
	adminJobDescriptionRepository.save(jobDescription);
	return true;
    }

    public JobDescription viewJobDescription(Integer jobId) {
	JobDescription jobDescription = adminJobDescriptionRepository.findOne(jobId);
	return jobDescription;
    }
}
