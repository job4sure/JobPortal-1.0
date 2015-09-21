package com.job4sure.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.job4sure.model.Registration;

public interface RegistrationRepository extends JpaRepository<Registration, Integer> {

	@Query("select registration from Registration registration where registration.registrationId=:registrationId")
	public Registration verifyUser(@Param("registrationId") Integer registrationId);

	@Query("select registration from Registration registration where registration.email=:userName")
	public Registration getLoggedInUserInfo(@Param("userName") String userName);

	@Query("select registration from Registration registration where registration.email=:emailId")
	public List<Registration> verifyUserEmailId(@Param("emailId") String emailId);

	@Modifying
	@Query("UPDATE Registration r SET r.password =:password, r.encrypted =:encrypted WHERE r.registrationId =:registrationId")
	int updatePassword(@Param("registrationId") int registrationId, @Param("password") String password,
	                @Param("encrypted") String encryptedPassword);

	@Query("select registration from Registration registration where registration.registrationId=:registrationId")
	public Registration verifySubAdmin(@Param("registrationId") Integer registrationId);

	@Query("select registration from Registration registration where registration.roleType=:roleType")
	public List<Registration> getUserListByRole(@Param("roleType") Integer roleType);

}
