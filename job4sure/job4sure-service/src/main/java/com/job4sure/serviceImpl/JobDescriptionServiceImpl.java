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
		Skills oneSkills = skillsRepository.findOne(Integer.parseInt(id));
		jobDescription.getSkillsSet().add(oneSkills);
	    }
	    jobDescriptionRepository.save(jobDescription);
	    return true;
	}
	return false;
    }

    public List<JobDescription> getAllJobDescription(int companyId) {
	return jobDescriptionRepository.findByCompanyId(companyId);
    }

    public void deleteJob(Integer jobDescriptionId) {
	jobDescriptionRepository.delete(jobDescriptionId);

    }

    public JobDescription editJob(Integer jobId) {
	return jobDescriptionRepository.findOne(jobId);
    }

    public List<Skills> getAllSkills() {
	return skillsRepository.findAll();
    }

    public List<Salary> getAllSalary() {
	return salaryRepository.findAll();
    }

    public List<Experience> getAllExperience() {
	return experienceRepository.findAll();
    }

}
