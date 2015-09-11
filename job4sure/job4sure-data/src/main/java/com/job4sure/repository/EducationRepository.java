package com.job4sure.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.job4sure.model.Education;

@Repository
public interface EducationRepository extends JpaRepository<Education, Integer>{

	
	 @Query("select edu  from Education edu where edu.registration_id =:registration_id")
	public Education viewEducation(@Param("registration_id") Integer reg);

	

	 
	 
	
}
