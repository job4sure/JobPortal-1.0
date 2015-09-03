package com.job4sure.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.job4sure.model.CompanyProfileModel;
import com.job4sure.repository.companyProfileRepository;
import com.job4sure.service.companyProfile;
@Service
public class CompanyProfileServiceImp implements companyProfile {

	@Autowired
	private companyProfileRepository companyRepository; 
	
	public boolean savecompany_profile(CompanyProfileModel companyProfile) {
		companyRepository.saveAndFlush(companyProfile);
	
		
		return false;
	}

	public List<CompanyProfileModel> view_profile(CompanyProfileModel companyProfile) {
		 
	    
		List<CompanyProfileModel> list = companyRepository.findByRegistrationId(companyProfile.getRegistrationId());
		return list;
	}
}
