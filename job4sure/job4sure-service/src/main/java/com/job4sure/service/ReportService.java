package com.job4sure.service;

import java.util.List;

import com.job4sure.model.Registration;

public interface ReportService {
    /* public List getCompanyList(); */

    /* public List getUserList(); */

    public List getUserListBySer(String name, String loc);

    public List getCityList();

    public List getStateList();

    public List getCompanyBySearch(String name, String cityId);

    public List<Registration> getListByRoleId(int roleId);
}
