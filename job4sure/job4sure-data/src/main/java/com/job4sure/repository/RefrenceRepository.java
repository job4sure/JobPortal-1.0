package com.job4sure.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.job4sure.model.Reference;

public interface RefrenceRepository extends JpaRepository<Reference, Integer> {
	
	@Query("from Reference r where r.jobDescription.jobDescriptionId=:jobId and r.registration.registrationId =:registrationId")
	public  List<Reference> getRefrenceByJobIdAndUser(@Param("jobId") Integer jobId ,@Param("registrationId") Integer registrationId);

}
