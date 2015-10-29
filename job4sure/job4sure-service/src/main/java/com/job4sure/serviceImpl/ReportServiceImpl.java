package com.job4sure.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.job4sure.model.City;
import com.job4sure.model.CompanyProfileModel;
import com.job4sure.model.JobDescription;
import com.job4sure.model.Registration;
import com.job4sure.model.UserProfile;
import com.job4sure.repository.CityRepository;
import com.job4sure.repository.CompanyProfileRepository;
import com.job4sure.repository.JobDescriptionRepository;
import com.job4sure.repository.ProfileCompleteRepository;
import com.job4sure.repository.RegistrationRepository;
import com.job4sure.repository.StateRepository;
import com.job4sure.service.ReportService;

@Service
public class ReportServiceImpl implements ReportService {
	@Autowired
	private CompanyProfileRepository companyProfileRepository;
	@Autowired
	private RegistrationRepository registrationRepository;

	@Autowired
	private ProfileCompleteRepository profileCompleteRepository;

	@Autowired
	private CityRepository cityRepository;

	@Autowired
	private StateRepository stateRepository;

	@Autowired
	private JobDescriptionRepository jobDescriptionRepository;

	@SuppressWarnings("rawtypes")
	public List getCompanyList() {

		List<CompanyProfileModel> companyProfile = companyProfileRepository.findAll();
		return companyProfile;
	}

	
	  @SuppressWarnings("rawtypes")
	  public List getUserList() {
	  List<UserProfile> userList=profileCompleteRepository.getUserByRole(1);
	  return userList; }
	 

	public List getCityList() {
		List<City> cityList = cityRepository.findAll();
		return cityList;
	}

	public List getStateList() {
		return stateRepository.findAll();

	}

	public List<CompanyProfileModel> getCompanyBySearch(String name, Integer city) {
		// Integer city=Integer.parseInt(cityId);
		return companyProfileRepository.searchCompanyCommon(name, city);

	}

	public List<CompanyProfileModel> getCompanyBySearch(String name) {
		// Integer city=Integer.parseInt(cityId);
		return companyProfileRepository.searchCompanyCommon(name);

	}

	public List getUserListBySer(String name, Integer loc,Integer exp) 
	{
        List<UserProfile> companySearchList=  profileCompleteRepository.getUserSearchCommon(name,loc,exp);
        return companySearchList;
	}

	public List<Registration> getListByRoleId(int id) {
		List<Registration> list = registrationRepository.getUserListByRole(id);
		return list;
	}

	public List<JobDescription> searchJdListByJobtitle(String jobTitle) {
		List<JobDescription> jobDescriptions = jobDescriptionRepository.searchByJobTitle(jobTitle);
		return jobDescriptions;
	}

	public List<JobDescription> searchJdListByLocation(int searchByLocation) {
		List<JobDescription> jobDescriptions = jobDescriptionRepository.searchByLocation(searchByLocation);
		return jobDescriptions;
	}

	public List<JobDescription> searchJdListByJobtitleAndLocation(String jobTitle, int location) {

		List<JobDescription> jobDescriptions = jobDescriptionRepository.searchJdListByJobtitleAndLocation(jobTitle,
						location);
		return jobDescriptions;
	}

	public List<JobDescription> searchJdListByExperience(String exp) {
		List<JobDescription> jobDescriptions = jobDescriptionRepository.searchJdListByExperience(exp);
		return jobDescriptions;
	}

	public List<JobDescription> searchJdListByJobtitleAndExperience(String searchByJobTitle, String searchByExp) {
		List<JobDescription> jobDescriptions = jobDescriptionRepository.searchJdListByJobtitleAndExperience(
						searchByJobTitle, searchByExp);
		return jobDescriptions;
	}

	public List<JobDescription> searchJDCommon(String searchByTitle, int searchByLocation, String searchByExp) {
		List<JobDescription> jobDescriptions = jobDescriptionRepository.searchJdCommon(searchByTitle, searchByLocation,
						searchByExp);
		return jobDescriptions;
	}

	public List<JobDescription> searchJDCommon(String searchByTitle, String searchByExp) {
		List<JobDescription> jobDescriptions = jobDescriptionRepository.searchJdCommon(searchByTitle, searchByExp);
		return jobDescriptions;
	}

	/*
	 * public List getUserListBySer(String name, Integer loc) { // TODO
	 * Auto-generated method stub return null; }
	 */

	/*
	 * public List getCompanyBySearch(String name, String cityId) { // TODO
	 * Auto-generated method stub return null; }
	 */
	/*
	 * public List getCompanyList() { List companyList
	 * =companyProfileRepository.findAll(); return companyList; }
	 */

	/*
	 * public List getCompanyBySearch(String name, String cityId) { // TODO
	 * Auto-generated method stub return null; }
	 */

}
