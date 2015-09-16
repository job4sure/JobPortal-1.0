package com.job4sure.service;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.job4sure.model.Attachment;
import com.job4sure.model.CompanyProfileModel;

public interface CompanyProfileService {

    public CompanyProfileModel getCompanyCompleteInfo(Integer registrationId);

    public boolean saveCompanyProfile(CompanyProfileModel companyProfile, MultipartFile filePart,
		    CommonsMultipartFile[] upload, String attchmentName);

    public Attachment getCompanyProfile(Integer registrationId);

}
