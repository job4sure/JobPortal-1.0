package com.job4sure.serviceImpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.job4sure.model.JobDescription;
import com.job4sure.repository.JobDescriptionRepository;
import com.job4sure.service.JobDescriptionService;
import com.job4sure.util.DateFormatUtil;

@Service
public class JobDescriptionServiceImpl implements JobDescriptionService {

	@Autowired
	private JobDescriptionRepository jobDescriptionRepository;

	public boolean saveJobDescription(JobDescription jobDescription) {
		jobDescription.setPostedDate(DateFormatUtil.getformattedDate(new Date()));
		jobDescription = jobDescriptionRepository.save(jobDescription);
				
		if (jobDescription != null) {
			return true;
		} else {
			return false;
		}
	}

	public List<JobDescription> getAllJobDescription() {
		List<JobDescription> jobDescriptionsList = jobDescriptionRepository
				.findAll();
		return jobDescriptionsList;
	}

	public void deleteJob(Integer jobDescriptionId) {
		jobDescriptionRepository.delete(jobDescriptionId);
		
	}

	public JobDescription editJob(Integer jobId) {
		JobDescription jobDescription=jobDescriptionRepository.findOne(jobId);
		return jobDescription;
	}
}
