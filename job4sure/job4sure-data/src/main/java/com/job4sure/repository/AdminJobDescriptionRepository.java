package com.job4sure.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.job4sure.model.JobDescription;

public interface AdminJobDescriptionRepository extends
		JpaRepository<JobDescription, Integer> {

	@Query("select jb from JobDescription jb where jb.approvalStatus.statusId =:jdApprovedStatus")
	List<JobDescription> getAllAprovedJobDescriptions(
			@Param("jdApprovedStatus") int jdApprovedStatus);

	@Query("select jb from JobDescription jb where jb.approvalStatus.statusId =:jdApprovedStatus")
	List<JobDescription> getAllPendingJobDescriptions(
			@Param("jdApprovedStatus") Integer jdApprovedStatus);

	@Query("select jb from JobDescription jb where jb.approvalStatus.statusId =:jdApprovedStatus")
	List<JobDescription> getAllRejectedJobDescriptions(
			@Param("jdApprovedStatus") Integer jdApprovedStatus);
}
