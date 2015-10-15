package com.job4sure.service;

import java.util.List;

import com.job4sure.model.Registration;
import com.job4sure.model.SendMail;

public interface AdminGroupMailingService {

	List<Registration> getSubAdminsList();

	void sendMailToGroup(SendMail sendMail);

}
