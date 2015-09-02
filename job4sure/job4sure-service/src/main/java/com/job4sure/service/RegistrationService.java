package com.job4sure.service;

import com.job4sure.model.Registration;

public interface RegistrationService {

	public boolean saveUserInformation(Registration registration) throws Exception;

	public Registration verifyUser(Integer registrationId);

	public Registration getLoggedInUserInfo(String userName);

	public boolean verifyUserEmailId(String emailId);

	/*public List getLoggedInUserInfo(String userName);*/

}
