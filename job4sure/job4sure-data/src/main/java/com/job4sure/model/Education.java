package com.job4sure.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "education")
public class Education {

	
	@Column(name="GRADUATION")
	private String graduation;
	@Column(name="SPECIALIZATION")
	private String specialization;
	@Column(name="INSTITUTE")
	private String institute;
	
	
	
	@Column(name="POSTGRADUATION")
	private String postgraduation;
	@Column(name="POSTSPECIALIZATION")
	private String post_specialization;
	@Column(name="POSTINSTITUTE")
	private String post_institute;
	
	@Column(name="POSTYEAR")
	private String post_yearr;
	
	@Column(name="POSTEDUCATION")
	private String posteducation;
	
	
	public String getPostgraduation() {
		return postgraduation;
	}

	public void setPostgraduation(String postgraduation) {
		this.postgraduation = postgraduation;
	}

	public String getPost_specialization() {
		return post_specialization;
	}

	public void setPost_specialization(String post_specialization) {
		this.post_specialization = post_specialization;
	}

	public String getPost_institute() {
		return post_institute;
	}

	public void setPost_institute(String post_institute) {
		this.post_institute = post_institute;
	}

	public String getPost_yearr() {
		return post_yearr;
	}

	public void setPost_yearr(String post_yearr) {
		this.post_yearr = post_yearr;
	}

	public String getPosteducation() {
		return posteducation;
	}

	public void setPosteducation(String posteducation) {
		this.posteducation = posteducation;
	}

	public String getDoctorate() {
		return doctorate;
	}

	public void setDoctorate(String doctorate) {
		this.doctorate = doctorate;
	}

	public String getDoc_specialization() {
		return doc_specialization;
	}

	public void setDoc_specialization(String doc_specialization) {
		this.doc_specialization = doc_specialization;
	}

	public String getDoc_institute() {
		return doc_institute;
	}

	public void setDoc_institute(String doc_institute) {
		this.doc_institute = doc_institute;
	}

	public String getDoc_yearr() {
		return doc_yearr;
	}

	public void setDoc_yearr(String doc_yearr) {
		this.doc_yearr = doc_yearr;
	}

	public String getDoc_education() {
		return doc_education;
	}

	public void setDoc_education(String doc_education) {
		this.doc_education = doc_education;
	}

	@Column(name="DOCTORATE")
	private String doctorate;
	@Column(name="DOC_SPECIALIZATION")
	private String doc_specialization;
	@Column(name="DOC_INSTITUTE")
	private String doc_institute;
	
	@Column(name="DOC_YEAR")
	private String doc_yearr;
	
	@Column(name="DOC_EDUCATION")
	private String doc_education;
	
	

	public String getGraduation() {
		return graduation;
	}

	public void setGraduation(String graduation) {
		this.graduation = graduation;
	}

	public String getSpecialization() {
		return specialization;
	}

	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}

	public String getInstitute() {
		return institute;
	}

	public void setInstitute(String institute) {
		this.institute = institute;
	}

	public String getYearr() {
		return yearr;
	}

	public void setYearr(String yearr) {
		this.yearr = yearr;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public Integer getEducation_id() {
		return education_id;
	}

	public void setEducation_id(Integer education_id) {
		this.education_id = education_id;
	}

	
	@Column(name="YEAR")
	private String yearr;
	
	@Column(name="EDUCATION")
	private String education;

	@Id
	@GeneratedValue
	@Column(name = "EDUCATION_ID", unique = true, nullable = false)
	private Integer education_id;

	@ManyToOne(targetEntity = Registration.class)
	@JoinColumn(name = "REGISTRATION_ID", referencedColumnName = "registration_Id",insertable=false, updatable=false)
	private Registration registration;

	@Column(name="REGISTRATION_ID")
	private Integer registration_id;


	public Registration getRegistration() {
		return registration;
	}

	public void setRegistration(Registration registration) {
		this.registration = registration;
	}

	public Integer getRegistration_id() {
		return registration_id;
	}

	public void setRegistration_id(Integer registration_id) {
		this.registration_id = registration_id;
	}
}
