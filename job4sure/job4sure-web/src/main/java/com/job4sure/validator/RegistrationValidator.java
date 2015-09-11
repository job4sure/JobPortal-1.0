package com.job4sure.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;

import com.job4sure.model.Registration;
@Component
public class RegistrationValidator {
	
	public boolean supports(Class<?> clazz) {
		return Registration.class.isAssignableFrom(clazz);
	}
	public void validate(Object target, Errors errors) {
		Registration registration = (Registration) target;
		if (registration.getEmail() != null && registration.getEmail().trim().length() > 0) {
			boolean b = ValidationUtil.validateEmail(registration.getEmail());
			if (registration.getEmail().contains("@") != true && !b) {
				errors.rejectValue("email", "error.email.first.rule");
			} else if (registration.getEmail().contains(".com") != true
					&& registration.getEmail().contains(".net") != true
					&& registration.getEmail().contains(".co.in") != true && !b) {
				errors.rejectValue("email", "error.email.second.rule");
			} else if (!b) {
				errors.rejectValue("email", "error.email.required");
			}
		}
		//if (registration.getMobileNo() != null && !registration.getMobileNo().isEmpty()) {
			if (registration.getMobileNo().length() != 10) {
				errors.rejectValue("mobileNo", "error.mobileNo.length");
			//}
		}
		
	}
		
}
	
