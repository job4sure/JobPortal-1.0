package com.job4sure.serviceImpl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.job4sure.model.Login;
import com.job4sure.model.Registration;
import com.job4sure.repository.RegistrationRepository;
import com.job4sure.service.RegistrationService;
import com.job4sure.util.AutoGenratedPassword;
import com.job4sure.util.SendMail;

@Transactional
@Service
public class RegistrationServiceImpl implements RegistrationService {

	@Autowired
	private RegistrationRepository registrationRepository;
	
	@Transactional
	public boolean saveUserInformation(Registration registration) throws Exception {
		if(registration.getEmail()!=null){
		Calendar c = new GregorianCalendar();
		c.add(Calendar.DATE, 30);
		Date date = c.getTime();
		  SimpleDateFormat date1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		  String strDate = date1.format(date);
		 registration.setValidUpTo(strDate);
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		  String password = registration.getPassword();
		  password = passwordEncoder.encode(password);
		 registration.setEnabled(0);
		 registration.setEncripted(password);
		Registration userregistration = registrationRepository.save(registration);
		Integer registrationId = userregistration.getRegistrationId();
		  String id = Integer.toString(registrationId);
		 String autoGeneratedPassword = AutoGenratedPassword.encrypt(id);
		if(userregistration!=null){
			SendMail.mailSend(userregistration.getEmail(),
					userregistration.getFullName(), userregistration.getRegistrationId(),autoGeneratedPassword);
		
		}
		}else{
			return false;
		}
		return true;
	}

	public Registration verifyUser(Integer registrationId) {
		Registration registration = registrationRepository.verifyUser(registrationId);
		registration.setEnabled(1);
		registrationRepository.save(registration);
		return registration;
	}

	public Registration getLoggedInUserInfo(String userName) {
		Registration registration =	registrationRepository.getLoggedInUserInfo(userName);
		return registration;
	}
	
	public boolean verifyUserEmailId(String emailId) {
		List<Registration> emailList =null; 
		emailList = registrationRepository.verifyUserEmailId(emailId);
		if(!emailList.isEmpty()){
	    	return true;
	}else{
		return false;
	}
	}
	
	public boolean sendMailToResetPass(Login login) throws Exception{
		boolean status=false;
		
		if(login!=null){
			String id = Integer.toString(login.getRegistration_Id());
			String registrationId = AutoGenratedPassword.encrypt(id);
			status=SendMail.mailSend(login.getEmail(),registrationId);
		}
		
		return status;
	}
	
	
	public void updatePassword(Integer registrationId, String password){
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		 
		String  encriptedPassword = passwordEncoder.encode(password);
		int status=registrationRepository.updatePassword(registrationId,password,encriptedPassword);
		
		System.out.println(status);
	}	
	public boolean updateUserInformation(Registration registration)
			throws Exception {
		if(registration.getEmail()!=null){
			Calendar c = new GregorianCalendar();
			c.add(Calendar.DATE, 30);
			Date date = c.getTime();
			  SimpleDateFormat date1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			  String strDate = date1.format(date);
			 registration.setValidUpTo(strDate);
			PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			  String password = registration.getPassword();
			  password = passwordEncoder.encode(password);
			 registration.setEnabled(1);
			 registration.setEncripted(password);
			Registration userregistration = registrationRepository.save(registration);
			Integer registrationId = userregistration.getRegistrationId();
			  String id = Integer.toString(registrationId);
			// String autoGeneratedPassword = AutoGenratedPassword.encrypt(id);
			/*if(userregistration!=null){
				SendMail.mailSend(userregistration.getEmail(),
						userregistration.getFullName(), userregistration.getRegistrationId(),autoGeneratedPassword);
			
			}
			}else{
				return false;*/
			}
			return true;
		}
	
	}

	/*public List getLoggedInUserInfo(String userName) {
		List userInfoList=null;
	//	userInfoList=registrationRepository.getLoggedInUserInfo(userName);
		return userInfoList;
	}*/

