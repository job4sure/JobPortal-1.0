package com.job4sure.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "userprofile")
public class userProfile {
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

	@Column(name = "SALARY")
	private String salary;
	@Column(name = "PREFFERED_LOCATION")
	private String prefferedlocation;
	@Column(name = "INDUSTRY")
	private String Industry;

	@Column(name = "ROLE")
	private String roletype;
	@Column(name = "DOB_MONTH")
	private String DOBmonth;
	@Column(name = "DOB_DAY")
	private String DOBday;
	@Column(name = "DOB_YEAR")
	private String DOByear;
	@Column(name = "GENDER")
	private String gender;

	@Column(name = "ADDRESS")
	private String address;

	@Column(name = "CITY")
	private String city;

	@Column(name = "STATE")
	private String State;

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

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getPrefferedlocation() {
		return prefferedlocation;
	}

	public void setPrefferedlocation(String prefferedlocation) {
		this.prefferedlocation = prefferedlocation;
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

	public String getDOBmonth() {
		return DOBmonth;
	}

	public void setDOBmonth(String dOBmonth) {
		DOBmonth = dOBmonth;
	}

	public String getDOBday() {
		return DOBday;
	}

	public void setDOBday(String dOBday) {
		DOBday = dOBday;
	}

	public String getDOByear() {
		return DOByear;
	}

	public void setDOByear(String dOByear) {
		DOByear = dOByear;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return State;
	}

	public void setState(String state) {
		State = state;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

}