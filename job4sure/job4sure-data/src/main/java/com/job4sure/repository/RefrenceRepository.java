package com.job4sure.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.job4sure.model.Reference;
import com.job4sure.util.IConstant;

public interface RefrenceRepository extends JpaRepository<Reference, Integer> {
	
	@Query("from Reference r where r.jobDescription.jobDescriptionId=:jobId and r.registration.registrationId =:registrationId")
	public  List<Reference> getRefrenceByJobIdAndUser(@Param("jobId") Integer jobId ,@Param("registrationId") Integer registrationId);
	
	@Query("from Reference r where r.jobDescription.jobDescriptionId=:jobId")
	public List<Reference> findByJobId(@Param("jobId") Integer jobId);

	@Query("from Reference r where r.status="+IConstant.IS_STATUS)
	public List<Reference> findBystatus();
}
