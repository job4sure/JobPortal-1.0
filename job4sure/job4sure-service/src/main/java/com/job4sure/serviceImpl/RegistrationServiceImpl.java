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

import com.job4sure.model.Attachment;
import com.job4sure.model.Login;
import com.job4sure.model.Registration;
import com.job4sure.repository.AdminRegistrationRepository;
import com.job4sure.repository.AttachmentRepository;
import com.job4sure.repository.RegistrationRepository;
import com.job4sure.service.RegistrationService;
import com.job4sure.util.EncryptDecrypt;
import com.job4sure.util.IConstant;
import com.job4sure.util.SendMail;

@SuppressWarnings("unused")
@Transactional
@Service
public class RegistrationServiceImpl implements RegistrationService {

	@Autowired
	private RegistrationRepository registrationRepository;

	@Autowired
	private AdminRegistrationRepository adminRegistrationRepository;

	@Autowired
	private AttachmentRepository attachmentRepository;

	@Transactional
	public boolean saveUserInformation(Registration registration) throws Exception {
		if (registration.getEmail() != null) {
			Calendar c = new GregorianCalendar();
			c.add(Calendar.DATE, 30);
			Date date = c.getTime();
			SimpleDateFormat date1 = new SimpleDateFormat(IConstant.VALID_UP_TO_DATE_FORMAT);
			String strDate = date1.format(date);
			registration.setValidUpTo(strDate);
			String password = EncryptDecrypt.springSecurityEncription(registration.getPassword());
			registration.setEnabled(0);
			registration.setEncrypted(password);
			Registration userregistration = registrationRepository.save(registration);
			Integer registrationId = userregistration.getRegistrationId();
			String id = Integer.toString(registrationId);
			String encryptedId = EncryptDecrypt.encrypt(id);
			if (userregistration != null) {
				SendMail.mailSend(userregistration.getEmail(), userregistration.getFullName(),
				                userregistration.getRegistrationId(), encryptedId);
			}
		} else {
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
		Registration registration = registrationRepository.getLoggedInUserInfo(userName);
		return registration;
	}

	public boolean verifyUserEmailId(String emailId) {
		List<Registration> emailList = null;
		emailList = registrationRepository.verifyUserEmailId(emailId);
		if (!emailList.isEmpty()) {
			return true;
		} else {
			return false;
		}
	}

	public boolean sendMailToResetPass(Login login) throws Exception {
		boolean status = false;

		if (login != null) {
			String id = Integer.toString(login.getRegistration_Id());
			String registrationId = EncryptDecrypt.encrypt(id);
			status = SendMail.mailSend(login.getEmail(), registrationId);
		}

		return status;
	}

	public void updatePassword(Integer registrationId, String password) {
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String encriptedPassword = passwordEncoder.encode(password);
		int status = registrationRepository.updatePassword(registrationId, password, encriptedPassword);
	}

	public boolean updateUserInformation(Registration registration) throws Exception {
		if (registration.getEmail() != null) {
			Calendar c = new GregorianCalendar();
			c.add(Calendar.DATE, 30);
			Date date = c.getTime();
			SimpleDateFormat date1 = new SimpleDateFormat(IConstant.VALID_UP_TO_DATE_FORMAT);
			String strDate = date1.format(date);
			registration.setValidUpTo(strDate);
			PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			String password = registration.getPassword();
			password = passwordEncoder.encode(password);
			registration.setEnabled(1);
			registration.setEncrypted(password);
			Registration userregistration = registrationRepository.save(registration);
			Integer registrationId = userregistration.getRegistrationId();
			String id = Integer.toString(registrationId);
		}
		return true;
	}

	public boolean saveadmininformation(Registration registration) {

		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String password = registration.getPassword();
		password = passwordEncoder.encode(password);
		registration.setEncrypted(password);
		registration.setEnabled(1);
		registrationRepository.save(registration);
		String subject = "New Sub-Admin Added Successfully";
		String body = "Dear Admin,\n\n A new sub admin has submited his profile sucessfully.\n Details are as follows: \n"
						+ "Full Name: "
		                + registration.getFullName()
		                + "\n"
		                + "Email Id: "
		                + registration.getEmail()
		                + "\n"
		                + "Contact No: "
		                + registration.getMobileNo() + "\n\n" + "Regards,\n" + "Job4Sure";

		String to=registrationRepository.getUserListByRole(IConstant.ADMIN_ROLE_ID).get(0).getEmail();
		SendMail.commomMailSend(to, subject, body);
		return true;
	}

	public Attachment getAllAttachment(Integer registrationId) {
		Attachment attachment = null;
		if (registrationId != null) {
			String attchmentType = "profilePic";
			Attachment profilepicattachment = attachmentRepository.getProfilePicAttachment(registrationId,
			                attchmentType);
			if (profilepicattachment != null) {
				return profilepicattachment;
			}

		}
		return attachment;
	}

	public boolean saveSubAdmin(Registration registration) throws Exception {
		if (registration.getEmail() != null) {
			Calendar calendar = new GregorianCalendar();
			calendar.add(Calendar.DATE, 30);
			Date date = calendar.getTime();
			SimpleDateFormat date1 = new SimpleDateFormat(IConstant.VALID_UP_TO_DATE_FORMAT);
			String strDate = date1.format(date);
			registration.setValidUpTo(strDate);
			registration.setRoleType(4);

			registration.setEnabled(0);

			Registration userregistration = registrationRepository.save(registration);
			Integer registrationId = userregistration.getRegistrationId();

			if (userregistration != null) {
				SendMail.mailSendSubAdmin(userregistration.getEmail(), userregistration.getRegistrationId());

			}
		} else {
			return false;
		}
		return true;
	}

	public Registration getAllRecods(Integer registrationId) {
		Registration registration = registrationRepository.verifySubAdmin(registrationId);
		registrationRepository.save(registration);
		return registration;
	}

}
