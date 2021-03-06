package com.job4sure.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "job_description", catalog = "jobportal")
public class JobDescription implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer jobDescriptionId;
    private String jobTitle;
    private String jobDesc;
    private String jobLocation;
    private String salary;
    private Integer noOfCandidates;
    private String postedDate;
    private String jobValidDate;
    private String experience;
    private String education;
    private String skills;
    private String role;
    private Registration registration;
  
    private String checkbox;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "JOB_ID", unique = true, nullable = false)
    public Integer getJobDescriptionId() {
	return jobDescriptionId;
    }

   	public String getCheckbox() {
   		return checkbox;
   	}

   	public void setCheckbox(String checkbox) {
   		this.checkbox = checkbox;
   	}
    public void setJobDescriptionId(Integer jobDescriptionId) {
	this.jobDescriptionId = jobDescriptionId;
    }

    @Column(name = "JOB_TITLE", length = 25)
    public String getJobTitle() {
	return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
	this.jobTitle = jobTitle;
    }

    @Column(name = "JOB_DESC", length = 200)
    public String getJobDesc() {
	return jobDesc;
    }

    public void setJobDesc(String jobDesc) {
	this.jobDesc = jobDesc;
    }

    @Column(name = "JOB_LOCATION", length = 30)
    public String getJobLocation() {
	return jobLocation;
    }

    public void setJobLocation(String jobLocation) {
	this.jobLocation = jobLocation;
    }

    @Column(name = "SALARY", length = 10)
    public String getSalary() {
	return salary;
    }

    public void setSalary(String salary) {
	this.salary = salary;
    }

    @Column(name = "NO_OF_CANDIDATES")
    public Integer getNoOfCandidates() {
	return noOfCandidates;
    }

    public void setNoOfCandidates(Integer noOfCandidates) {
	this.noOfCandidates = noOfCandidates;
    }

    @Column(name = "POSTED_DATE", length = 10)
    public String getPostedDate() {
	return postedDate;
    }

    public void setPostedDate(String postedDate) {
	this.postedDate = postedDate;
    }

    @Column(name = "JOB_VALID_DATE", length = 10)
    public String getJobValidDate() {
	return jobValidDate;
    }

    public void setJobValidDate(String jobValidDate) {
	this.jobValidDate = jobValidDate;
    }

    @Column(name = "EXPERIENCE", length = 30)
    public String getExperience() {
	return experience;
    }

    public void setExperience(String experience) {
	this.experience = experience;
    }

    @Column(name = "EDUCATION", length = 50)
    public String getEducation() {
	return education;
    }

    public void setEducation(String education) {
	this.education = education;
    }

    @Column(name = "SKILLS", length = 100)
    public String getSkills() {
	return skills;
    }

    public void setSkills(String skills) {
	this.skills = skills;
    }

    @Column(name = "ROLE", length = 30)
    public String getRole() {
	return role;
    }

    public void setRole(String role) {
	this.role = role;
    }

    @ManyToOne(targetEntity = Registration.class)
    @JoinColumn(name = "COMPANY_ID", referencedColumnName = "registration_Id")
    public Registration getRegistration() {
	return registration;
    }

    public void setRegistration(Registration registration) {
	this.registration = registration;
    }

}
