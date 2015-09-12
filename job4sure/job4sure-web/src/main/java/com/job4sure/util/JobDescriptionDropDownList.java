package com.job4sure.util;

import java.util.List;

import org.springframework.ui.Model;

import com.job4sure.model.Experience;
import com.job4sure.model.Salary;
import com.job4sure.model.Skills;
import com.job4sure.service.JobDescriptionService;

public class JobDescriptionDropDownList {
    
    public static Model getAllJobDescriptionDropDownList(Model model,JobDescriptionService jobDescriptionService){
	List<Skills> skillsList = jobDescriptionService.getAllSkills();
	List<Salary> salaryList = jobDescriptionService.getAllSalary();
	List<Experience> experienceList = jobDescriptionService.getAllExperience();
	model.addAttribute("salaryList", salaryList);
	model.addAttribute("experienceList", experienceList);
	model.addAttribute("skillsList", skillsList);
	return model;
    }
	
}