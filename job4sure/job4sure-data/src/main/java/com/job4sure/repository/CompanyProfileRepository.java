package com.job4sure.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.job4sure.model.CompanyProfileModel;

public interface CompanyProfileRepository extends JpaRepository<CompanyProfileModel, Integer> {
    @Query("select userProfile  from CompanyProfileModel userProfile where userProfile.registrationId =:registrationId")
    public CompanyProfileModel getLoggedInCompanyCompleteInfo(@Param("registrationId") Integer registrationId);
    
   @Query("select companyObj from CompanyProfileModel companyObj where companyObj.registration.fullName=:fullName and companyObj.currentCityId.id=:currentCity")
    public List<CompanyProfileModel> CompanyBySearch(@Param("fullName") String fullName,@Param("currentCity") Integer currentCity);
}
