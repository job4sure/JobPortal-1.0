package com.job4sure.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "login")
public class Login {

    @Id
    @GeneratedValue
    @Column(name = "registration_Id")
    private Integer registration_Id;

    @Column(name = "fullname")
    private String fullName;

    @Column(name = "email")
    private String email;

    @Column(name = "encripted")
    private String password;

    @Column(name = "validUpTo")
    private String validUpTo;

    @Column(name = "enabled")
    private boolean enabled;

    public String getValidUpTo() {
	return validUpTo;
    }

    public void setValidUpTo(String validUpTo) {
	this.validUpTo = validUpTo;
    }

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "rollType")
    private UserRole userRole;

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
