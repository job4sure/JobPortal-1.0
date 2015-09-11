package com.job4sure.service;

import com.job4sure.model.Education;
/**
 * @author ankit.sharma
 * 
 */
public interface EducationService {
	public Education viewEducation(Integer regid);
	public void save(Education ed);
}
