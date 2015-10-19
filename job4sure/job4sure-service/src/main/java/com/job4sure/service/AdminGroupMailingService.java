package com.job4sure.service;

import java.util.List;

import com.job4sure.model.Registration;
import com.job4sure.model.SendMail;

public interface AdminGroupMailingService {
	void sendMailToGroup(SendMail sendMail);

	List<Registration> getRegistrationList(int subadminRoleId);
}
