package com.job4sure.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.job4sure.model.userProfile;

public interface ProfileCompleteRepository extends JpaRepository<userProfile, Integer> {

	@Query("select userProfileObj from userProfile userProfileObj where userProfileObj.registrationId=:registrationId")
	userProfile getLoggedInUserCompleteInfo(@Param("registrationId") Integer registrationId);

	
}
