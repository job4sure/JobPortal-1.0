package com.job4sure.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.job4sure.model.Education;
import com.job4sure.repository.EducationRepository;
import com.job4sure.service.EducationService;

@Service
public class EducationServiceimpl implements EducationService {

	@Autowired
	private EducationRepository edurepository;
	
	public void save(Education ed) {
		edurepository.saveAndFlush(ed);
		
	}

	public Education viewEducation(Integer regid,Education edu) {
		
		
		Education edu1=edurepository.view(regid);
		
		return edu1;
		
	}

	
}
