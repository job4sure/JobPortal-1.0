package com.job4sure.serviceImpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.job4sure.model.Experience;
import com.job4sure.model.JobDescription;
import com.job4sure.model.Registration;
import com.job4sure.model.Salary;
import com.job4sure.model.Skills;
import com.job4sure.repository.ExperienceRepository;
import com.job4sure.repository.JobDescriptionRepository;
import com.job4sure.repository.RegistrationRepository;
import com.job4sure.repository.SalaryRepository;
import com.job4sure.repository.SkillsRepository;
import com.job4sure.service.JobDescriptionService;
import com.job4sure.util.DateFormatUtil;
import com.job4sure.util.IConstant;
import com.job4sure.util.SendMail;

@Service
public class JobDescriptionServiceImpl implements JobDescriptionService {

    @Autowired
    private JobDescriptionRepository jobDescriptionRepository;
    
    @Autowired
    private RegistrationRepository registrationRepository;

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
	   JobDescription jobDesc= jobDescriptionRepository.save(jobDescription);
	   updateAdmin(jobDesc);
	    return true;
	}
	return false;
    }
    
    
    

    private void updateAdmin(JobDescription jobDescription) {
    	String subject = "New Job Description";
		String toMailId = "";
		String body = "Dear Admin,\n \n A new Job Description has been posted on our Portal. \n Please have a look on following JD. \n\n Job Title"
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
		                + "\n\n Regards, \n ItJobers";

		List<Registration> registrations = registrationRepository.getUserListByRole(IConstant.ADMIN_ROLE_ID);
		for (Registration registration : registrations) {
			System.out.println(registration.getEmail());
			System.out.println(body);
			SendMail.commomMailSend(registration.getEmail(), subject, body);
		}
	}
  




	public List<JobDescription> getAllJobDescription(int companyId) {
    	 List<JobDescription> list=	 jobDescriptionRepository.findByCompanyId(companyId);
    	 System.out.println(list.size());
    	 return list;
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

    public List<Skills> getAllJobsBySkillId(Integer skillId) {
	return jobDescriptionRepository.getAllJobsBySkillId(skillId);
    }

	public List<JobDescription> getAllJobsByExp(Integer experience){
		return jobDescriptionRepository.getAllJobsByExp(experience);
	}
}
