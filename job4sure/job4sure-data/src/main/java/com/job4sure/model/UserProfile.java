package com.job4sure.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "userprofile")
public class UserProfile {
    @Id
    @GeneratedValue
    @Column(name = "USERID")
    private Integer userId;

    @Column(name = "REGISTRATION_ID")
    private Integer registrationId;

    @ManyToOne(optional = false)
    @JoinColumn(name = "REGISTRATION_ID", referencedColumnName = "REGISTRATION_ID", insertable = false, updatable = false)
    private Registration registration;

    @Column(name = "RESUME_TITLE")
    private String resume;

    @Column(name = "CURRENT_LOCATION")
    private String currentlocation;

    @OneToOne(targetEntity = Salary.class)
    @JoinColumn(name = "MIN_SALARY_ID", referencedColumnName = "SALARY_ID")
    private Salary minSalary;

    public Salary getMinSalary() {
	return minSalary;
    }

    public void setMinSalary(Salary minSalary) {
	this.minSalary = minSalary;
    }

    @OneToOne(targetEntity = Salary.class)
    @JoinColumn(name = "MAX_SALARY_ID", referencedColumnName = "SALARY_ID")
    private Salary maxSalary;

    public Salary getMaxSalary() {
	return maxSalary;
    }

    public void setMaxSalary(Salary maxSalary) {
	this.maxSalary = maxSalary;
    }

    @OneToOne(targetEntity = State.class)
    @JoinColumn(name = "PREFERRED_STATE_ID", referencedColumnName = "STATE_ID")
    private State stateId;

    @OneToOne(targetEntity = City.class)
    @JoinColumn(name = "PREFERRED_CITY_ID", referencedColumnName = "CITY_ID")
    private City cityId;

    @OneToOne(targetEntity = State.class)
    @JoinColumn(name = "CURRENT_STATE_ID", referencedColumnName = "STATE_ID")
    private State currentStateId;

    @OneToOne(targetEntity = City.class)
    @JoinColumn(name = "CURRENT_CITY_ID", referencedColumnName = "CITY_ID")
    private City currentCityId;

    
    @OneToOne(targetEntity = State.class)
    @JoinColumn(name = "HOME_STATE_ID", referencedColumnName = "STATE_ID")
    private State homeState;

    @OneToOne(targetEntity = City.class)
    @JoinColumn(name = "HOME_CITY_ID", referencedColumnName = "CITY_ID")
    private City homeCity;
    
    
    @Column(name = "INDUSTRY")
    private String Industry;

    @Column(name = "ROLE")
    private String roletype;

    @Column(name = "DATE_OF_BIRTH")
    private String dob;

    @Column(name = "GENDER")
    private String gender;

    @OneToOne(targetEntity = Experience.class)
    @JoinColumn(name = "MIN_EXPERIENCE_ID", referencedColumnName = "EXPERIENCE_ID")
    private Experience minExperience;

    public Experience getMinExperience() {
	return minExperience;
    }

    public void setMinExperience(Experience minExperience) {
	this.minExperience = minExperience;
    }

    @OneToOne(targetEntity = Experience.class)
    @JoinColumn(name = "MAX_EXPERIENCE_ID", referencedColumnName = "EXPERIENCE_ID")
    private Experience maxExperience;

    public Experience getMaxExperience() {
	return maxExperience;
    }

    public void setMaxExperience(Experience maxExperience) {
	this.maxExperience = maxExperience;
    }

    @Column(name = "MARITAL_STATUS")
    private String maritalstatus;

    @Column(name = "PHONE")
    private String phone;

    @Column(name = "ADDRESS")
    private String address;

    @Column(name = "ZIP")
    private String zip;

    public Integer getUserId() {
	return userId;
    }

    public void setUserId(Integer userId) {
	this.userId = userId;
    }

    public Integer getRegistrationId() {
	return registrationId;
    }

    public void setRegistrationId(Integer registrationId) {
	this.registrationId = registrationId;
    }

    public Registration getRegistration() {
	return registration;
    }

    public void setRegistration(Registration registration) {
	this.registration = registration;
    }

    public String getResume() {
	return resume;
    }

    public void setResume(String resume) {
	this.resume = resume;
    }

    public String getCurrentlocation() {
	return currentlocation;
    }

    public void setCurrentlocation(String currentlocation) {
	this.currentlocation = currentlocation;
    }

    public State getStateId() {
	return stateId;
    }

    public void setStateId(State stateId) {
	this.stateId = stateId;
    }

    public City getCityId() {
	return cityId;
    }

    public void setCityId(City cityId) {
	this.cityId = cityId;
    }

    public String getIndustry() {
	return Industry;
    }

    public void setIndustry(String industry) {
	Industry = industry;
    }

    public String getRoletype() {
	return roletype;
    }

    public void setRoletype(String roletype) {
	this.roletype = roletype;
    }

    public String getDob() {
	return dob;
    }

    public void setDob(String dob) {
	this.dob = dob;
    }

    public String getGender() {
	return gender;
    }

    public void setGender(String gender) {
	this.gender = gender;
    }

    public String getMaritalstatus() {
	return maritalstatus;
    }

    public void setMaritalstatus(String maritalstatus) {
	this.maritalstatus = maritalstatus;
    }

    public String getPhone() {
	return phone;
    }

    public void setPhone(String phone) {
	this.phone = phone;
    }

    public String getAddress() {
	return address;
    }

    public void setAddress(String address) {
	this.address = address;
    }

    public String getZip() {
	return zip;
    }

    public void setZip(String zip) {
	this.zip = zip;
    }

    public State getCurrentStateId() {
	return currentStateId;
    }

    public void setCurrentStateId(State currentStateId) {
	this.currentStateId = currentStateId;
    }

    public City getCurrentCityId() {
	return currentCityId;
    }

    public void setCurrentCityId(City currentCityId) {
	this.currentCityId = currentCityId;
    }

    public State getHomeState() {
        return homeState;
    }

    public void setHomeState(State homeState) {
        this.homeState = homeState;
    }

    public City getHomeCity() {
        return homeCity;
    }

    public void setHomeCity(City homeCity) {
        this.homeCity = homeCity;
    }
}
