package com.job4sure.service;

import java.util.List;

import com.job4sure.model.Registration;

public interface RegistrationService {

	public boolean saveUserInformation(Registration registration);

	public Registration verifyUser(Integer registrationId);

	public Registration getLoggedInUserInfo(String userName);

	/*public List getLoggedInUserInfo(String userName);*/

}
