package com.job4sure.service;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.job4sure.model.UserProfile;

public interface ProfileCompleteService {
	public boolean saveCompleteUserProfile(UserProfile userProfile, MultipartFile filePart, CommonsMultipartFile[] upload, String attchmentName) ;

	public UserProfile getLoggedInUserCompleteInfo(
			Integer registrationId);

	public int getprofileCompletedInPercent(Integer registrationId);
}
