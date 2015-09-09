package com.job4sure.service;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.job4sure.model.userProfile;

public interface ProfileCompleteService {
	public boolean saveCompleteUserProfile(userProfile userProfile, MultipartFile filePart, CommonsMultipartFile[] upload, String attchmentName) ;

	public userProfile getLoggedInUserCompleteInfo(
			Integer registrationId);

	public int getprofileCompletedInPercent(Integer registrationId);
}
