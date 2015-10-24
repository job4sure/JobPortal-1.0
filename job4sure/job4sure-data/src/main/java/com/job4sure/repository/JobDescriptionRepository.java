package com.job4sure.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.job4sure.model.JobDescription;
import com.job4sure.model.Skills;

public interface JobDescriptionRepository extends JpaRepository<JobDescription, Integer> {

	@Query("select jb from JobDescription jb where jb.registration.registrationId =:companyId")
	public List<JobDescription> findByCompanyId(@Param("companyId") int companyId);

	@Query("select jb from JobDescription jb where jb.approvalStatus.statusId =:jdStatus")
	List<JobDescription> getJobDescriptionListByStatus(@Param("jdStatus") int jdStatus);
	
	
	
	@Query("select s from Skills s where s.skillsId =:skillId")
	List<Skills> getAllJobsBySkillId(@Param("skillId") Integer skillId);

	
	@Query("select jb from JobDescription jb where jb.minExperience.experienceId <=:experience AND jb.maxExperience.experienceId >=:experience ")
	public List<JobDescription> getAllJobsByExp(@Param("experience") Integer experience);
	
	@Query("select jb from JobDescription jb where jb.jobTitle LIKE %:jobTitle%")
	public List<JobDescription> searchByJobTitle(@Param("jobTitle") String jobTitle);
	
	@Query("select jb from JobDescription jb where jb.currentCityId.id =:searchByLocation")
	public List<JobDescription> searchByLocation(@Param("searchByLocation") int searchByLocation);
	
	@Query("select jb from JobDescription jb where jb.jobTitle LIKE %:jobTitle% AND jb.currentCityId.id =:searchByLocation")
	public List<JobDescription> searchJdListByJobtitleAndLocation(@Param("jobTitle") String jobTitle,@Param("searchByLocation") int searchByLocation);
	
	
	@Query("select jb from JobDescription jb where jb.minExperience.experience=:exp")
	public List<JobDescription> searchJdListByExperience(@Param("exp") String exp);
	
	@Query("select jb from JobDescription jb where jb.jobTitle LIKE %:jobTitle% AND jb.minExperience.experience=:exp")
	public List<JobDescription> searchJdListByJobtitleAndExperience(@Param("jobTitle") String jobTitle,@Param("exp") String exp);
	
	
	

}
