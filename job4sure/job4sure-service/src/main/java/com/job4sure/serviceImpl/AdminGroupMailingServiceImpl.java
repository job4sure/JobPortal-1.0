package com.job4sure.serviceImpl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.job4sure.model.Registration;
import com.job4sure.model.SendMail;
import com.job4sure.repository.RegistrationRepository;
import com.job4sure.service.AdminGroupMailingService;
import com.job4sure.util.IConstant;

@Service
public class AdminGroupMailingServiceImpl implements AdminGroupMailingService {

	@Autowired
	private RegistrationRepository registrationRepository;

	public void sendMailToGroup(SendMail sendMail) {

		List<String> items = Arrays.asList(sendMail.getToMailId().split("\\s*,\\s*"));
		for (String to : items) {
			com.job4sure.util.SendMail.commomMailSend(to, sendMail.getSubject(), sendMail.getBody());
		}
	}

	public List<Registration> getRegistrationList(int roleId) {
		List<Registration> registrations = registrationRepository.getUserListByRole(roleId);
		return registrations;
	}
}
