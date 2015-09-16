package com.job4sure.service;

import com.job4sure.model.Attachment;
import com.job4sure.model.Login;
import com.job4sure.model.Registration;

public interface RegistrationService {

	public boolean saveUserInformation(Registration registration) throws Exception;

	public Registration verifyUser(Integer registrationId);

	public Registration getLoggedInUserInfo(String userName);

	public boolean verifyUserEmailId(String emailId);

	public boolean updateUserInformation(Registration registration) throws Exception;  

	public boolean sendMailToResetPass(Login login) throws Exception;

	public void updatePassword(Integer registrationId, String password);

	public boolean saveadmininformation(Registration registration);

	public Attachment getAllAttachment(Integer registrationId);

	
	public boolean saveSubAdmin(Registration registration) throws Exception;

	public Registration getAllRecods(Integer registrationId);


}
