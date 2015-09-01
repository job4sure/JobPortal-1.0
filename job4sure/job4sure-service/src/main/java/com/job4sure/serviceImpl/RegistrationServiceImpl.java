package com.job4sure.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.job4sure.model.Registration;
import com.job4sure.repository.RegistrationRepository;
import com.job4sure.service.RegistrationService;
import com.job4sure.util.SendMail;

@Service
public class RegistrationServiceImpl implements RegistrationService {

	@Autowired
	private RegistrationRepository registrationRepository;
	
	@Transactional
	public boolean saveUserInformation(Registration registration) {
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		  String password = registration.getPassword();
		  password = passwordEncoder.encode(password);
		 registration.setEnabled(0);
		 registration.setEncripted(password);
		Registration userregistration = registrationRepository.save(registration);
		if(userregistration!=null){
			SendMail.mailSend(userregistration.getEmail(),
					userregistration.getFullName(), userregistration.getRegistrationId());
		}
		return true;
	}

	public Registration verifyUser(Integer registrationId) {
		Registration registration = registrationRepository.verifyUser(registrationId);
		return registration;
	}

	public Registration getLoggedInUserInfo(String userName) {
		Registration registration =	registrationRepository.getLoggedInUserInfo(userName);
		return registration;
	}

	/*public List getLoggedInUserInfo(String userName) {
		List userInfoList=null;
	//	userInfoList=registrationRepository.getLoggedInUserInfo(userName);
		return userInfoList;
	}*/
}
