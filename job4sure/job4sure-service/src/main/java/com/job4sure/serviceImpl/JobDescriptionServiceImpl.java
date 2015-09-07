package com.job4sure.serviceImpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.job4sure.model.JobDescription;
import com.job4sure.model.Skills;
import com.job4sure.repository.JobDescriptionRepository;
import com.job4sure.repository.SkillsRepository;
import com.job4sure.service.JobDescriptionService;
import com.job4sure.util.DateFormatUtil;

@Service
public class JobDescriptionServiceImpl implements JobDescriptionService {

    @Autowired
    private JobDescriptionRepository jobDescriptionRepository;
	
	@Autowired
	private SkillsRepository skillsRepository;

	@Transactional
	public boolean saveJobDescription(JobDescription jobDescription) {
		jobDescription.setPostedDate(DateFormatUtil.getformattedDate(new Date()));
		jobDescription = jobDescriptionRepository.save(jobDescription);
		if (jobDescription != null) {
			/*String checkId = jobDescription.getCheckbox();
			String check[] = checkId.split(",");*/
			/*for (String id : check) {
			JobSkills jobskills = new JobSkills();
			Skills skills=skillsRepository.findOne(Integer.parseInt(id));
			jobskills.setSkills(skills);
			jobskills.setJobDescription(jobDescription);
			jobskillsRepository.save(jobskills);
		} */
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

	/*public List<Skills> getAllSkills() {
		List<Skills> skillsList = skillsRepository.findAll();
		return skillsList;
	}*/
}
