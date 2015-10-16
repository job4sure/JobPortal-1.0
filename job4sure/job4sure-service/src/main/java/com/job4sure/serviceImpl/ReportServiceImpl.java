package com.job4sure.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.job4sure.model.CompanyProfileModel;
import com.job4sure.model.Registration;
import com.job4sure.repository.CompanyProfileRepository;
import com.job4sure.repository.RegistrationRepository;
import com.job4sure.service.ReportService;

@Service
public class ReportServiceImpl implements ReportService {
	@Autowired
	private CompanyProfileRepository companyProfileRepository;
	@Autowired
	private RegistrationRepository registrationRepository;

	public List getCompanyList() {

		List<CompanyProfileModel> companyProfile = companyProfileRepository.findAll();
		return companyProfile;
	}

	public List getUserList() {
		List<Registration> userList = registrationRepository.getUserListByRole(1);
		return userList;
	}

}