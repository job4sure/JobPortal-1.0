package com.job4sure.service;

import java.util.List;

import com.job4sure.model.CompanyProfileModel;
import com.job4sure.model.JobDescription;
import com.job4sure.model.Registration;

public interface ReportService {
    public List getCompanyList();

    public List getUserList();

    public List getUserListBySer(String name, String loc);

    public List getCityList();

    public List getStateList();

    public List<CompanyProfileModel> getCompanyBySearch(String name, Integer cityId);
    public List<CompanyProfileModel> getCompanyBySearch(String name);

    public List<Registration> getListByRoleId(int roleId);
    
    public List<JobDescription> searchJdListByJobtitle(String jobTitle);
    
    public List<JobDescription> searchJdListByLocation(int searchByLocation);
    public List<JobDescription> searchJdListByJobtitleAndLocation(String jobTitle,int location);
    
    public List<JobDescription> searchJdListByExperience(String exp);
    
    public List<JobDescription> searchJdListByJobtitleAndExperience(String searchByJobTitle,String searchByExp);

    public List<JobDescription> searchJDCommon(String searchByTitle, int searchByLocation, String searchByExp);

	public List<JobDescription> searchJDCommon(String searchByTitle, String searchByExp);

}
