package com.job4sure.service;

import java.util.List;

public interface ReportService
{
  public List getCompanyList();
  public List getUserList();
public List getUserListBySer(String name, String loc);
public List getCityList();
public List getStateList();
public List getCompanyBySearch(String name,String cityId);
}
