package com.job4sure.service;

import java.util.List;

import com.job4sure.model.CompanyProfileModel;

public interface CompanyProfileService{
	public boolean savecompany_profile(CompanyProfileModel companyProfile) ;
	public List<CompanyProfileModel>view_profile(CompanyProfileModel companyProfile);
	public CompanyProfileModel getLoggedInCompanyCompleteInfo(
			Integer registrationId);
	
}
