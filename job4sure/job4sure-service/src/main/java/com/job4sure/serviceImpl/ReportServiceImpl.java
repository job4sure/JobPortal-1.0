package com.job4sure.serviceImpl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.job4sure.model.City;
import com.job4sure.model.CompanyProfileModel;
import com.job4sure.model.Registration;
import com.job4sure.model.State;
import com.job4sure.model.UserProfile;
import com.job4sure.repository.CityRepository;
import com.job4sure.repository.CompanyProfileRepository;
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

    /*
     * @SuppressWarnings("rawtypes") public List getCompanyList() {
     * 
     * List<CompanyProfileModel> companyProfile =
     * companyProfileRepository.findAll(); return companyProfile; }
     */
    /*
     * @SuppressWarnings("rawtypes") public List getUserList() {
     * List<Registration> userList =
     * registrationRepository.getUserListByRole(1); return userList; }
     */

    public List getCityList() {
	List<City> cityList = cityRepository.findAll();
	return cityList;
    }

    public List getStateList() {
	return stateRepository.findAll();

    }

    public List getCompanyBySearch(String name, String cityId) {
	Integer city = Integer.parseInt(cityId);
	return companyProfileRepository.CompanyBySearch(name, city);

    }

    public List getUserListBySer(String name, String cityId) {
	List<Registration> regList = null;
	List<UserProfile> profList = null;

	Integer intg = Integer.parseInt(cityId);
	profList = profileCompleteRepository.getLoggedInUserInfoList(intg, name);

	Registration rrr = null;

	try {

	    if (profList != null) {
		regList = new ArrayList<Registration>();
		for (UserProfile userProfile : profList) {
		    rrr = (userProfile.getRegistration());
		    regList.add(rrr);
		}
	    }
	} catch (Exception e) {

	    e.printStackTrace();
	}

	// if(cityName!=null)
	// {
	// City c=cityRepository.getCitySer(cityName);
	// profList=
	// profileCompleteRepository.getLoggedInUserInfoList(c.getId(), name)
	// }
	//
	// ArrayList<Registration> userList = null;
	//
	// for(int i=0;i<=regList.size();i++){
	//
	// if(profList!=null)
	// for (int j=0;j<=profList.size();j++)
	// {if(profList.get(i).getRegistrationId()==regList.get(i).getRegistrationId())
	// {
	// userList.add(regList.get(j)) ;
	// }
	// }
	//
	// }
	//
	return regList;
    }

    public List<Registration> getListByRoleId(int id) {
	List<Registration> list = registrationRepository.getUserListByRole(id);
	return list;
    }

}
