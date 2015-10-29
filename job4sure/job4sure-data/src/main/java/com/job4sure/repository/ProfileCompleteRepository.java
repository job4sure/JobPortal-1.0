package com.job4sure.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.job4sure.model.UserProfile;

public interface ProfileCompleteRepository extends JpaRepository<UserProfile, Integer> {

	@Query("select userProfileObj from UserProfile userProfileObj where userProfileObj.registrationId=:registrationId")
	UserProfile getLoggedInUserCompleteInfo(@Param("registrationId") Integer registrationId);

	@Query("select userProfileObj from UserProfile userProfileObj where userProfileObj.currentCityId.id=:currentCityId and userProfileObj.registration.fullName=:fullName")
	List<UserProfile> getLoggedInUserInfoList(@Param("currentCityId") Integer currentCityId, @Param("fullName") String fullName);

	@Query("select userProfileObj from UserProfile userProfileObj where userProfileObj.registration.roleType=:role")
    List<UserProfile> getUserByRole(@Param("role")Integer role);
}
