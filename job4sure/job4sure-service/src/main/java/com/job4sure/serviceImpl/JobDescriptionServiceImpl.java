package com.job4sure.serviceImpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.job4sure.model.Experience;
import com.job4sure.model.JobDescription;
import com.job4sure.model.Salary;
import com.job4sure.model.Skills;
import com.job4sure.repository.ExperienceRepository;
import com.job4sure.repository.JobDescriptionRepository;
import com.job4sure.repository.SalaryRepository;
import com.job4sure.repository.SkillsRepository;
import com.job4sure.service.JobDescriptionService;
import com.job4sure.util.DateFormatUtil;

@Service
public class JobDescriptionServiceImpl implements JobDescriptionService {

	@Autowired
	private JobDescriptionRepository jobDescriptionRepository;

	@Autowired
	private SkillsRepository skillsRepository;

	@Autowired
	private SalaryRepository salaryRepository;
	
	@Autowired
	private ExperienceRepository experienceRepository;
	
	
	
	@SuppressWarnings("unused")
	@Transactional
	public boolean saveJobDescription(JobDescription jobDescription, String skill) {
		jobDescription.setPostedDate(DateFormatUtil.getformattedDate(new Date()));
		String mulSkill[] = skill.split(",");
		if (jobDescription != null) {
			for (String id : mulSkill) {
				Skills skills = new Skills();
				Skills oneSkills =skillsRepository.findOne(Integer.parseInt(id));
				jobDescription.getSkillsSet().add(oneSkills);
			}
			jobDescription = jobDescriptionRepository.save(jobDescription);
			return true;
		} else {
			return false;
		}
	}

	public List<JobDescription> getAllJobDescription(int companyId) {
		List<JobDescription> jobDescriptionsList = jobDescriptionRepository.findByCompanyId(companyId);
		return jobDescriptionsList;
	}

	public void deleteJob(Integer jobDescriptionId) {
		jobDescriptionRepository.delete(jobDescriptionId);

	}

	public JobDescription editJob(Integer jobId) {
		JobDescription jobDescription = jobDescriptionRepository.findOne(jobId);
		return jobDescription;
	}

	public List<Skills> getAllSkills() {
		List<Skills> skillsList = skillsRepository.findAll();
		return skillsList;
	}

	public List<Salary> getAllSalary() {
	   List<Salary> minSalaryList=salaryRepository.findAll();
	    return minSalaryList;
	}

	public List<Experience> getAllExperience() {
	    List<Experience>experienceList=experienceRepository.findAll();
	    return experienceList;
	}
	
	
	
}
