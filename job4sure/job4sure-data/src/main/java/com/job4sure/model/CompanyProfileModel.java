package com.job4sure.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "companyprofile")
public class CompanyProfileModel {
	@Id
	@GeneratedValue
	@Column(name = "COMPANYID")
	private Integer compId;
	/*
	 * @Column(name = "companyName") private String companyName;
	 */
	@Column(name = "COMPANYSIZE")
	private String companySize;
	@Column(name = "ABOUTUS")
	private String aboutUs;
	@Column(name = "DOMAIN")
	private String domainName;
	@Column(name = "COMPANYURL")
	private String companyUrl;
	@Column(name = "COMPANYADDRESS")
	private String address1;
	@Column(name = "COMPANYADDRESS2")
	private String address2;


	@Transient
    private State currentStateId;

    @OneToOne(targetEntity = City.class)
    @JoinColumn(name = "CURRENT_CITY_ID", referencedColumnName = "CITY_ID")
    private City currentCityId;
	
	
	

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

	@Column(name = "ZIPCODE")
	private String zipcode;
	@Column(name = "REGISTRATION_ID")
	private Integer registrationId;

	@ManyToOne(optional = false)
	@JoinColumn(name = "REGISTRATION_ID", referencedColumnName = "REGISTRATION_ID", insertable = false, updatable = false)
	private Registration registration;

	public Integer getCompId() {
		return compId;
	}

	public void setCompId(Integer compId) {
		this.compId = compId;
	}

	/*
	 * public String getCompanyName() { return companyName; }
	 * 
	 * 
	 * public void setCompanyName(String companyName) { this.companyName =
	 * companyName; }
	 */

	public String getCompanySize() {
		return companySize;
	}

	public void setCompanySize(String companySize) {
		this.companySize = companySize;
	}

	public String getAboutUs() {
		return aboutUs;
	}

	public void setAboutUs(String aboutUs) {
		this.aboutUs = aboutUs;
	}

	

	public String getDomainName() {
		return domainName;
	}

	public void setDomainName(String domainName) {
		this.domainName = domainName;
	}

	public String getCompanyUrl() {
		return companyUrl;
	}

	public void setCompanyUrl(String companyUrl) {
		this.companyUrl = companyUrl;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}




	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
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
}