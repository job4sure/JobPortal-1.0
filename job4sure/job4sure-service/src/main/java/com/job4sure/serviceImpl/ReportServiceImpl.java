package com.job4sure.serviceImpl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import javax.persistence.Query;

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
	
	@PersistenceContext(type = PersistenceContextType.TRANSACTION)
	private EntityManager entityManager;
	
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
	
	/*@Autowired
	private UserProfileSearchRepository userProfileSearchRepository;*/
	
	@SuppressWarnings("rawtypes")
	public List getCompanyList() {

		List<CompanyProfileModel> companyProfile = companyProfileRepository.findAll();
		return companyProfile;
	}

	@SuppressWarnings("rawtypes")
	public List getUserList() {
		List<UserProfile> userList = profileCompleteRepository.getUserByRole(1);
		return userList;
	}

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

	public List getUserListBySer(String name, Integer loc, Integer exp) {
		List<UserProfile> companySearchList = profileCompleteRepository.getUserSearchCommon(name, loc, exp);
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

	@SuppressWarnings("unused")
	public List<UserProfile> getUserSearchList(String searchByTitle, UserProfile userProfile) {
	
		Integer userCity = userProfile.getCityId().getId();
		Integer minExperience = userProfile.getMinExperience().getExperienceId();
		

		
		/*if(!searchByTitle.equals("")&&userCity!=0 && minExperience!=0){*/
		    String query ="SELECT u FROM UserProfile u";
			/*if(!searchByTitle.equals("")){
				query+= "registration.fullName= searchByTitle";*/
				
				List<UserProfile> resultList =entityManager.createQuery(query).getResultList();
						 
	        //List<UserProfile> userList = profileCompleteRepository.getAllUserList(query);
			/*	return null;
			}*/
	/*	}*/
		return resultList;
	}
	
	
	/*public List<UserProfile> getUserSearchList(String searchByTitle, UserProfile userProfile) {
		Integer userCity = userProfile.getCityId().getId();
		Integer minExperience = userProfile.getMinExperience().getExperienceId();
		if (searchByTitle != null && !searchByTitle.equals("")) {
			List<UserProfile> userList = profileCompleteRepository.getAllUserByName(searchByTitle);
			return userList;
		} else {
			if (userCity != 0) {
				List<UserProfile> userList = profileCompleteRepository.getAllUserByCity(userCity);
				return userList;
			} else {
				if (minExperience != 0) {
					List<UserProfile> userList = profileCompleteRepository.getAllUserByExperience(minExperience);
					return userList;
				}
			}
		}

		return null;

	}*/
	/*
	 * if(!searchByTitle.equals("") || userProfile.getCityId().getId()!=0 ||
	 * userProfile.getMinExperience().getExperienceId()!=0){ List<UserProfile>
	 * list = new ArrayList<UserProfile>(); Integer userCity=
	 * userProfile.getCityId().getId(); Integer userMinExperience=
	 * userProfile.getMinExperience().getExperienceId(); List<UserProfile>
	 * userProfileList =
	 * profileCompleteRepository.getAllUserByName(searchByTitle
	 * ,userCity,userMinExperience); if (userProfileList != null) { for
	 * (UserProfile userListProfile : userProfileList) { String fullName =
	 * userListProfile.getRegistration().getFullName(); Integer city=
	 * userListProfile.getCityId().getId(); Integer minExperience=
	 * userListProfile.getMinExperience().getExperienceId(); if
	 * (searchByTitle.equals(fullName)) { list.add(userListProfile); }else{
	 * if(userProfile.getCityId().getId()==city){ list.add(userListProfile);
	 * }else{ if(minExperience==
	 * userProfile.getMinExperience().getExperienceId()){
	 * list.add(userListProfile); } } } return userProfileList; }
	 * 
	 * return list; } return list; }else{ return null; } }
	 */
	/*
	public List<UserProfile> getAllUserList(String searchByTitle, UserProfile userProfile) {
		Integer userCity = userProfile.getCityId().getId();
		Integer minExperience = userProfile.getMinExperience().getExperienceId();
		if (!searchByTitle.equals("") && userCity!=0) {
			List<UserProfile> userList = profileCompleteRepository.getAllUserListByNameAndCity(searchByTitle,userCity);
			return userList;
		} else {
			if (!searchByTitle.equals("") && minExperience!=0) {
				List<UserProfile> userList = profileCompleteRepository.getAllUserListByNameAndExperience(searchByTitle,minExperience);
				return userList;
			} else {
				if (userCity!=0 && minExperience!=0) {
					List<UserProfile> userList = profileCompleteRepository.getAllUserListByCityAndExperience(userCity,minExperience);
					return userList;
				}
			}
		}

		return null;
	}

	public List<UserProfile> getSearchList(String searchByTitle, UserProfile userProfile) {
		Integer userCity = userProfile.getCityId().getId();
		Integer minExperience = userProfile.getMinExperience().getExperienceId();
		if (!searchByTitle.equals("") && userCity!=0 && minExperience!=0) {
			List<UserProfile> userList = profileCompleteRepository.getAllUserListByNameCityAndMinExperience(searchByTitle,userCity,minExperience);
			return userList;
		} else{
		return null;
		}
	}
*/
	/*
	 * if(!searchByTitle.equals("") || userProfile.getCityId().getId()!=0 ||
	 * userProfile.getMinExperience().getExperienceId()!=0){ List<UserProfile>
	 * list = new ArrayList<UserProfile>(); List<UserProfile> userProfileList =
	 * profileCompleteRepository.findAll(); if (userProfileList != null) { for
	 * (UserProfile userListProfile : userProfileList) { String fullName =
	 * userListProfile.getRegistration().getFullName(); Integer city=
	 * userListProfile.getCityId().getId(); Integer minExperience=
	 * userListProfile.getMinExperience().getExperienceId(); if
	 * (searchByTitle.equals(fullName)) { list.add(userListProfile); }else{
	 * if(userProfile.getCityId().getId()==city){ list.add(userListProfile);
	 * }else{ if(minExperience==
	 * userProfile.getMinExperience().getExperienceId()){
	 * list.add(userListProfile); } } } } return list; } return list; }else{
	 * return null; } }
	 */

	/*
	 * public List<UserProfile> getUserSearchList(String searchByTitle) { String
	 * query = profileCompleteRepository.getUserSearchList(); return null; }
	 */

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

