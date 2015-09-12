package com.job4sure.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.job4sure.model.Attachment;
import com.job4sure.model.CompanyProfileModel;

public interface CompanyProfileService {
	public List<CompanyProfileModel> view_profile(CompanyProfileModel companyProfile);

	public CompanyProfileModel getLoggedInCompanyCompleteInfo(Integer registrationId);

	public boolean savecompany_profile(CompanyProfileModel companyProfile, MultipartFile filePart,
			CommonsMultipartFile[] upload, String attchmentName);

	public Attachment getCompanyProfile(Integer registrationId);

}
