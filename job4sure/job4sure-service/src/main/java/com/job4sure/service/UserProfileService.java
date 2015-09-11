package com.job4sure.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.job4sure.model.Attachment;
import com.job4sure.model.UserProfile;

public interface UserProfileService {
	public boolean saveCompleteUserProfile(UserProfile userProfile, MultipartFile filePart, CommonsMultipartFile[] upload, String attchmentName) ;

	public UserProfile getLoggedInUserCompleteInfo(
			Integer registrationId);

	public int getprofileCompletedInPercent(Integer registrationId);
	
	  public List salaryAnnual();
		
		public List industryData();
		
		public List currentLocation();
		
		public List prefferedLocation();
		
		public List roleData();

		public Attachment getAllAttachment(Integer registrationId);
}
