package com.job4sure.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.job4sure.model.JobDescription;

public interface JobDescriptionRepository extends JpaRepository<JobDescription, Integer> {

	@Query("select jb from JobDescription jb where jb.registration.registrationId =:companyId")
	public List<JobDescription> findByCompanyId(@Param("companyId") int companyId);

	@Query("select jb from JobDescription jb where jb.approvalStatus.statusId =:jdStatus")
	List<JobDescription> getJobDescriptionListByStatus(@Param("jdStatus") int jdStatus);

}
