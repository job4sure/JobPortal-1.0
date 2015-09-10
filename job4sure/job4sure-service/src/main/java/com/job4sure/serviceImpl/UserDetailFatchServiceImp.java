package com.job4sure.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.job4sure.repository.IndustryRepository;
import com.job4sure.repository.LocationRepository;
import com.job4sure.repository.PrefferedLocationRepository;
import com.job4sure.repository.RoleRepository;
import com.job4sure.repository.SalaryRepositoryForUser;
import com.job4sure.service.UserDetaiFatchService;
@Service
public class UserDetailFatchServiceImp implements UserDetaiFatchService {
	
	@Autowired
	
	private RoleRepository role;
	@Autowired
	private IndustryRepository industry;
	@Autowired
	private PrefferedLocationRepository prefferedlocation;
	@Autowired
	private SalaryRepositoryForUser salary;
	@Autowired
	
	private LocationRepository currentlocation;
	

	public List salaryAnnual() {
	List	salarydata=salary.findAll();
		return salarydata;
	}

	public List industryData() {
		List industrydata=industry.findAll();
		return industrydata;
	}

	public List currentLocation() {
	List currentlocation1=currentlocation.findAll();
		return currentlocation1;
	}

	public List prefferedLocation() {
		List preferedlocation=prefferedlocation.findAll();
		return preferedlocation;
	}

	public List roleData() {
	List roletype=	role.findAll();
		return roletype;
	}

	

		
	}

		
	


