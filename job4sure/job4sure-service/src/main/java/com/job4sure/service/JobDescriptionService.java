package com.job4sure.service;

import java.util.List;

import com.job4sure.model.JobDescription;

public interface JobDescriptionService {
	public boolean saveJobDescription(JobDescription jobDescription);

	public List<JobDescription> getAllJobDescription(int companyId);
	
	public void deleteJob(Integer jobDescriptionId);
	
	public JobDescription editJob(Integer jobId);

	/*public List<Skills> getAllSkills();*/
}
