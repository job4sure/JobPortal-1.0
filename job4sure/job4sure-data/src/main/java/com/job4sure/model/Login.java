package com.job4sure.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "login")
public class Login {

	@Id
	@GeneratedValue
	@Column(name = "REGISTRATION_ID")
	private Integer registration_Id;

	@Column(name = "FULL_NAME")
	private String fullName;

	@Column(name = "EMAIL")
	private String email;

	@Column(name = "ENCRYPTED")
	private String password;

	@Column(name = "VALID_UP_TO")
	private String validUpTo;

	@Column(name = "ENABLED")
	private boolean enabled;
/*
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "ROLE_TYPE")*/
	
	
	
	
	@ManyToOne(targetEntity = UserRole.class)
    @JoinColumn(name = "ROLE_TYPE", referencedColumnName = "USER_ROLE_ID")
	private UserRole userRole;

	public String getValidUpTo() {
		return validUpTo;
	}

	public void setValidUpTo(String validUpTo) {
		this.validUpTo = validUpTo;
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

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public UserRole getUserRole() {
		return userRole;
	}

	public void setUserRole(UserRole userRole) {
		this.userRole = userRole;
	}

	public Integer getRegistration_Id() {
		return registration_Id;
	}

	public void setRegistration_Id(Integer registration_Id) {
		this.registration_Id = registration_Id;
	}
}
