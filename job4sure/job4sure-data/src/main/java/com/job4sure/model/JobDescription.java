package com.job4sure.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "job_description", catalog = "jobportal")
public class JobDescription implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer jobDescriptionId;
    private String jobTitle;
    private String jobDesc;
    private String jobLocation;
    // private String salary;
    private Integer noOfCandidates;
    private String postedDate;
    private String jobValidDate;
    private String education;
    private String role;
    // private Integer jdApprovalStatus;
    private Registration registration;
    private Set<Skills> skillsSet=new HashSet<Skills>();
    private String skill;
    private JobDescriptionApprovalStatus approvalStatus;
    private Salary minSalary;
    private Salary maxSalary;
    private Experience minExperience;
    private Experience maxExperience;

    
    @ManyToMany(fetch=FetchType.EAGER)//cascade = CascadeType.ALL,
    @JoinTable(name = "DESCRIPTION_SKILLS", joinColumns = { @JoinColumn(name = "JOB_ID") }, inverseJoinColumns = { @JoinColumn(name = "SKILLS_ID") })
    @JsonIgnore
    public Set<Skills> getSkillsSet() {
	return skillsSet;
    }

    public void setSkillsSet(Set<Skills> skillsSet) {
	this.skillsSet = skillsSet;
    }
    
    
    @OneToOne(targetEntity = Experience.class)
    @JoinColumn(name = "MIN_EXPERIENCE_ID", referencedColumnName = "EXPERIENCE_ID")
    public Experience getMinExperience() {
	return minExperience;
    }

    public void setMinExperience(Experience minExperience) {
	this.minExperience = minExperience;
    }

    @OneToOne(targetEntity = Experience.class)
    @JoinColumn(name = "MAX_EXPERIENCE_ID", referencedColumnName = "EXPERIENCE_ID")
    public Experience getMaxExperience() {
	return maxExperience;
    }

    public void setMaxExperience(Experience maxExperience) {
	this.maxExperience = maxExperience;
    }
    
    @OneToOne(targetEntity = Salary.class)
    @JoinColumn(name = "MIN_SALARY_ID", referencedColumnName = "SALARY_ID")
    public Salary getMinSalary() {
	return minSalary;
    }

    public void setMinSalary(Salary minSalary) {
	this.minSalary = minSalary;
    }

    @OneToOne(targetEntity = Salary.class)
    @JoinColumn(name = "MAX_SALARY_ID", referencedColumnName = "SALARY_ID")
    public Salary getMaxSalary() {
	return maxSalary;
    }

    public void setMaxSalary(Salary maxSalary) {
	this.maxSalary = maxSalary;
    }

    @OneToOne(targetEntity = JobDescriptionApprovalStatus.class)
    @JoinColumn(name = "JD_APPROVAL_STATUS_ID")
    public JobDescriptionApprovalStatus getApprovalStatus() {
	return approvalStatus;
    }

    public void setApprovalStatus(JobDescriptionApprovalStatus approvalStatus) {
	this.approvalStatus = approvalStatus;
    }

    

    @Transient
    public String getSkill() {
	return skill;
    }

    @Transient
    public void setSkill(String skill) {
	this.skill = skill;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "JOB_ID", unique = true, nullable = false)
    public Integer getJobDescriptionId() {
	return jobDescriptionId;
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

    /*
     * @Column(name = "SALARY", length = 10) public String getSalary() { return
     * salary; }
     * 
     * public void setSalary(String salary) { this.salary = salary; }
     */

    @Column(name = "NO_OF_CANDIDATES")
    public Integer getNoOfCandidates() {
	return noOfCandidates;
    }

    public void setNoOfCandidates(Integer noOfCandidates) {
	this.noOfCandidates = noOfCandidates;
    }

    // ===sandeep
    /*
     * @Column(name = "JD_APPROVAL_STATUS_ID") public Integer
     * getJdApprovalStatus() { return jdApprovalStatus; } public void
     * setJdApprovalStatus(Integer jdApprovalStatus) { this.jdApprovalStatus =
     * jdApprovalStatus; }
     */
    // end sandeep
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

    @Column(name = "EDUCATION", length = 50)
    public String getEducation() {
	return education;
    }

    public void setEducation(String education) {
	this.education = education;
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
