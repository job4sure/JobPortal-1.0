package com.job4sure.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.job4sure.model.JobDescription;
import com.job4sure.repository.AdminJobDescriptionRepository;
import com.job4sure.service.AdminJobDescriptionService;
@Service
public class AdminJobDescriptionServiceImpl implements AdminJobDescriptionService {
@Autowired
private AdminJobDescriptionRepository adminJobDescriptionRepository;
	public List<JobDescription> getAllAprovedJobDescriptions(
			int jdApprovedStatus) {
		List<JobDescription> approvedJobDescriptionsList=adminJobDescriptionRepository.getAllAprovedJobDescriptions(jdApprovedStatus);
		return approvedJobDescriptionsList;
	}
	public JobDescription viewJobDescription(Integer jobId) {
		JobDescription jobDescription = adminJobDescriptionRepository.findOne(jobId);
		return jobDescription;
	}
	public boolean approveJobDescription(Integer jobId) {
		JobDescription jobDescription = adminJobDescriptionRepository.findOne(jobId);
		jobDescription.setJdApprovalStatus(1);
		if(jobDescription!=null){
		adminJobDescriptionRepository.save(jobDescription);
		return true;
	}else{
		return false;
	}
	}
	public boolean rejectJobDescription(Integer jobId) {
		JobDescription jobDescription = adminJobDescriptionRepository.findOne(jobId);
		jobDescription.setJdApprovalStatus(0);
		if(jobDescription!=null){
		adminJobDescriptionRepository.save(jobDescription);
		return true;
	}else{
		return false;
	}
	}
}
