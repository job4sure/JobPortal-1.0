package com.job4sure.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.job4sure.model.CompanyProfileModel;

public interface companyProfileRepository extends JpaRepository<CompanyProfileModel, Integer> 
{
	 @Query("select c  from CompanyProfileModel c where c.registrationId =:registrationId")
	 public List<CompanyProfileModel> findByRegistrationId(@Param("registrationId") Integer registrationId);
}
