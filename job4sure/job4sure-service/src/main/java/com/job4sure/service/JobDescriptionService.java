package com.job4sure.service;

import java.util.List;

import com.job4sure.model.Experience;
import com.job4sure.model.JobDescription;
import com.job4sure.model.Salary;
import com.job4sure.model.Skills;

public interface JobDescriptionService {
	public boolean saveJobDescription(JobDescription jobDescription, String skill);

	public List<JobDescription> getAllJobDescription(int companyId);
	
	public void deleteJob(Integer jobDescriptionId);
	
	public JobDescription editJob(Integer jobId);

	public List<Skills> getAllSkills();
	
	public List<Salary> getAllSalary();
	
	public List<Experience> getAllExperience();
	
	
	
}
