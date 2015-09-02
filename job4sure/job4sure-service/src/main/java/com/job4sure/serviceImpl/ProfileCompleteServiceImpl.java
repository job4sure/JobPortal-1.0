package com.job4sure.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.job4sure.model.userProfile;
import com.job4sure.repository.ProfileCompleteRepository;
import com.job4sure.service.ProfileCompleteService;

@Service
public class ProfileCompleteServiceImpl implements ProfileCompleteService {
	
	@Autowired
	private  ProfileCompleteRepository  profileCompleteRepository;
	
	public boolean savecomplete_profile(userProfile userProfile) {
		 profileCompleteRepository.save(userProfile);
		return false;
	}

}
