package com.job4sure.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "login")
public class Registration {
	@Id
	@GeneratedValue
	@Column(name = "REGISTRATION_ID")
	private Integer registrationId;

	@Column(name = "ROLE_TYPE")
	private Integer roleType;

	@Column(name = "FULL_NAME")
	private String fullName;

	@Column(name = "EMAIL")
	private String email;
	
	@Column(name = "PASSWORD")
	private String password;
	
	@Column(name = "MOBILE_NO")
	private String mobileNo;
	
	@Column(name = "ENABLED")
	private Integer enabled;
	
	@Column(name = "ENCRYPTED")
	private String encrypted;
	
	@Column(name = "VALID_UP_TO")
	 private String validUpTo;
	
	public String getValidUpTo() {
		return validUpTo;
	}

	public void setValidUpTo(String validUpTo) {
		this.validUpTo = validUpTo;
	}

	@Transient
	private String conformPassword;

	public String getCompanyurl() {
		return Companyurl;
	}

	public void setCompanyurl(String companyurl) {
		Companyurl = companyurl;
	}

	@Column(name = "COMPANY_URL")
	private String Companyurl;
	
	public Integer getEnabled() {
		return enabled;
	}

	public void setEnabled(Integer enabled) {
		this.enabled = enabled;
	}

	public String getEncripted() {
		return encrypted;
	}

	public void setEncripted(String encripted) {
		this.encrypted = encripted;
	}
	
	public Integer getRegistrationId() {
		return registrationId;
	}

	public void setRegistrationId(Integer registrationId) {
		this.registrationId = registrationId;
	}

	public Integer getRollType() {
		return roleType;
	}

	public void setRollType(Integer rollType) {
		this.roleType = rollType;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getConformPassword() {
		return conformPassword;
	}

	public void setConformPassword(String conformPassword) {
		this.conformPassword = conformPassword;
	}

}
