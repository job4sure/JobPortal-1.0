package com.job4sure.service;

import com.job4sure.model.userProfile;

public interface ProfileCompleteService {
	public boolean saveCompleteUserProfile(userProfile userProfile) ;

	public userProfile getLoggedInUserCompleteInfo(
			Integer registrationId);
}
