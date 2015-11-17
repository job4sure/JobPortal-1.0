package com.job4sure.repository;

import java.util.List;

import org.hibernate.Session;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.job4sure.model.UserProfile;

public interface ProfileCompleteRepository extends JpaRepository<UserProfile, Integer> {

	String query = null;
	String query2 = null;

	@Query("select userProfileObj from UserProfile userProfileObj where userProfileObj.registrationId=:registrationId")
	UserProfile getLoggedInUserCompleteInfo(@Param("registrationId") Integer registrationId);

	@Query("select userProfileObj from UserProfile userProfileObj where userProfileObj.currentCityId.id=:currentCityId and userProfileObj.registration.fullName=:fullName")
	List<UserProfile> getLoggedInUserInfoList(@Param("currentCityId") Integer currentCityId, @Param("fullName") String fullName);

	@Query("select userProfileObj from UserProfile userProfileObj where userProfileObj.registration.roleType=:role")
    List<UserProfile> getUserByRole(@Param("role")Integer role);
	
	@Query("select userProfileObj from UserProfile userProfileObj where userProfileObj.registration.fullName LIKE %:searchByName% AND userProfileObj.cityId.id=:loc AND userProfileObj.minExperience.experienceId=:exp")
	List<UserProfile>getUserSearchCommon(@Param("searchByName") String searchByName,@Param("loc") Integer loc,@Param("exp") Integer exp);
	
	/*@Query("select userProfileObj from UserProfile userProfileObj where userProfileObj.registration.fullName LIKE %:searchByName% OR userProfileObj.cityId.id=:city1 OR userProfileObj.minExperience.experienceId=:minExperience1")
	List<UserProfile> getAllUserByName(@Param("searchByTitle") String searchByTitle,@Param("userCity")Integer userCity, @Param("userMinExperience")Integer userMinExperience);*/
	
	
	

	@Query("select userProfileObj from UserProfile userProfileObj where userProfileObj.cityId.id=:userCity")
	List<UserProfile> getAllUserByCity(@Param("userCity") Integer userCity);

	@Query("select userProfileObj from UserProfile userProfileObj where userProfileObj.minExperience.experienceId=:minExperience")
	List<UserProfile> getAllUserByExperience(@Param("minExperience")Integer minExperience);

	@Query("select userProfileObj from UserProfile userProfileObj where userProfileObj.registration.fullName LIKE %:searchByTitle% AND userProfileObj.cityId.id=:userCity")
	List<UserProfile> getAllUserListByNameAndCity(@Param("searchByTitle") String searchByTitle,@Param("userCity") Integer userCity);
	
	@Query("select userProfileObj from UserProfile userProfileObj where userProfileObj.registration.fullName LIKE %:searchByTitle% AND userProfileObj.minExperience.experienceId=:minExperience")
	List<UserProfile> getAllUserListByNameAndExperience(@Param("searchByTitle") String searchByTitle, @Param("minExperience")Integer minExperience);
	
	@Query("select userProfileObj from UserProfile userProfileObj where userProfileObj.cityId.id=:userCity AND userProfileObj.minExperience.experienceId=:minExperience")
	List<UserProfile> getAllUserListByCityAndExperience(@Param("userCity") Integer userCity, @Param("minExperience")Integer minExperience);

	@Query("select userProfileObj from UserProfile userProfileObj where userProfileObj.registration.fullName LIKE %:searchByTitle% AND userProfileObj.cityId.id=:userCity AND userProfileObj.minExperience.experienceId=:minExperience")
	List<UserProfile> getAllUserListByNameCityAndMinExperience(@Param("searchByTitle") String searchByTitle, @Param("userCity") Integer userCity, @Param("minExperience")Integer minExperience);

	
	/*@Query(value = "SELECT * FROM USERS WHERE EMAIL_ADDRESS = ?0", nativeQuery = true)
	List<UserProfile> getAllUserListByName(String query);
	*/
	/*@Query(value = "SELECT * FROM UserProfile", nativeQuery = true)
	 UserProfile getUserSearchList();*/
}
