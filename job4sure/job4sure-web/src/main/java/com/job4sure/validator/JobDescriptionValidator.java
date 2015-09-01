package com.job4sure.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.job4sure.model.JobDescription;

@Component("jobDescriptionValidator")
public class JobDescriptionValidator implements Validator {

	public boolean supports(Class<?> clazz) {
		return JobDescription.class.equals(clazz);
	}

	public void validate(Object object, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "jobTitle", "error.jobTitle.empty");
		ValidationUtils.rejectIfEmpty(errors, "jobDesc", "error.jobDesc.empty");
		ValidationUtils.rejectIfEmpty(errors, "jobLocation", "error.jobLocation.empty");
		ValidationUtils.rejectIfEmpty(errors, "noOfCandidates", "error.noOfCandidates.empty");
		ValidationUtils.rejectIfEmpty(errors, "jobValidDate", "error.jobValidDate.empty");
		ValidationUtils.rejectIfEmpty(errors, "experience", "error.experience.empty");
		ValidationUtils.rejectIfEmpty(errors, "role", "error.role.empty");
	}

}
