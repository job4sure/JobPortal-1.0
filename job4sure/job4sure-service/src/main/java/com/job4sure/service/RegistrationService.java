package com.job4sure.service;

import com.job4sure.model.Registration;

public interface RegistrationService {

	public boolean saveUserInformation(Registration registration);

	public Registration verifyUser(Integer registrationId);

}
