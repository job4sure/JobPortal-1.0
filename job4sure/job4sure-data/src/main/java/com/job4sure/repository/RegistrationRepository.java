package com.job4sure.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.job4sure.model.Registration;

public interface RegistrationRepository extends JpaRepository<Registration, Integer>{

	@Query("select registration from Registration registration where registration.registrationId=:registrationId")
	public Registration verifyUser(@Param("registrationId") Integer registrationId);

	@Query("select registration from Registration registration where registration.email=:userName")
	public Registration getLoggedInUserInfo(@Param("userName") String userName);

	@Query("select registration from Registration registration where registration.email=:emailId")
	public List<Registration> verifyUserEmailId(@Param("emailId") String emailId);
	
	
	
	/*@Query("select registration from Registration registration where registration.email=:email")
	public List getLoggedInUserInfo(String userName);*/
	
	}
	
