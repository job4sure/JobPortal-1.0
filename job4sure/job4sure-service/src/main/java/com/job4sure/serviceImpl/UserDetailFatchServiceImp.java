package com.job4sure.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.job4sure.repository.DOBdayRepository;
import com.job4sure.repository.DOBmonthRepository;
import com.job4sure.repository.DOByearRepository;
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
	@Autowired
	private DOBdayRepository dobday;
	@Autowired
	private DOBmonthRepository dobmonth;
	@Autowired
	private DOByearRepository dobyear;
	

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

	public List dobDay() {
		List dobday1=dobday.findAll();
		return dobday1;
	}

	public List dobMonth() {
	List dobmonth1=	dobmonth.findAll();
		return dobmonth1;
	}

	public List dobYear() {
	List dobyear1=	dobyear.findAll();
		return dobyear1;
	}

		
	}

		
	


