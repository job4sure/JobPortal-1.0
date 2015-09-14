package com.job4sure.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.job4sure.model.Education;
import com.job4sure.repository.EducationRepository;
import com.job4sure.service.EducationService;

/**
 * @author ankit.sharma
 * 
 */
@Service
public class EducationServiceImpl implements EducationService {

	@Autowired
	private EducationRepository educationRepository;
	public void save(Education education) {
		educationRepository.saveAndFlush(education);
	}

	public Education viewEducation(Integer registrationId) {
		 return educationRepository.viewEducation(registrationId);
	}
}