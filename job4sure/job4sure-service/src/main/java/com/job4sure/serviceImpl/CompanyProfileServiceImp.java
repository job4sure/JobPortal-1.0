package com.job4sure.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.job4sure.model.CompanyProfileModel;
import com.job4sure.repository.companyProfileRepository;
import com.job4sure.service.CompanyProfileService;

@Service
public class CompanyProfileServiceImp implements CompanyProfileService {

	@Autowired
	private companyProfileRepository companyProfileRepository;

	@Transactional
	public boolean savecompany_profile(CompanyProfileModel companyProfile) {
		companyProfileRepository.save(companyProfile);
		System.out.println("Repository--");
		return false;
	}

	public List<CompanyProfileModel> view_profile(
			CompanyProfileModel companyProfile) {

		List<CompanyProfileModel> list = companyProfileRepository
				.findByRegistrationId(companyProfile.getRegistrationId());
		return list;
	}

	public CompanyProfileModel getLoggedInCompanyCompleteInfo(
			Integer registrationId) {
		CompanyProfileModel companyProfile = companyProfileRepository
				.getLoggedInCompanyCompleteInfo(registrationId);
		return companyProfile;

	}
}
