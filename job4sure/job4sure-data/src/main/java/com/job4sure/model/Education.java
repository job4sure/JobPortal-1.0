package com.job4sure.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "education")
public class Education {

    @Column(name = "GRADUATION")
    private String graduation;

    @Column(name = "SPECIALIZATION")
    private String specialization;

    @Column(name = "INSTITUTE")
    private String institute;

    @Column(name = "POSTGRADUATION")
    private String postgraduation;

    @Column(name = "POSTSPECIALIZATION")
    private String postSpecialization;

    @Column(name = "POSTINSTITUTE")
    private String postInstitute;

    @Column(name = "POSTYEAR")
    private String postYear;

    @Column(name = "POSTEDUCATION")
    private String posteducation;

    @Column(name = "DOCTORATE")
    private String doctorate;

    @Column(name = "DOC_SPECIALIZATION")
    private String docSpecialization;

    @Column(name = "DOC_INSTITUTE")
    private String docInstitute;

    @Column(name = "DOC_YEAR")
    private String docYear;

    @Column(name = "DOC_EDUCATION")
    private String docEducation;

    @Column(name = "YEAR")
    private String year;

    @Column(name = "EDUCATION")
    private String education;

    public String getPostgraduation() {
	return postgraduation;
    }

    public void setPostgraduation(String postgraduation) {
	this.postgraduation = postgraduation;
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

    public String getEducation() {
	return education;
    }

    public void setEducation(String education) {
	this.education = education;
    }

    @Id
    @GeneratedValue
    @Column(name = "EDUCATION_ID", unique = true, nullable = false)
    private Integer educationId;

    @ManyToOne(targetEntity = Registration.class)
    @JoinColumn(name = "REGISTRATION_ID", referencedColumnName = "registration_Id", insertable = false, updatable = false)
    private Registration registration;

    @Column(name = "REGISTRATION_ID")
    private Integer registrationId;

    public Registration getRegistration() {
	return registration;
    }

    public void setRegistration(Registration registration) {
	this.registration = registration;
    }

    public Integer getRegistrationId() {
	return registrationId;
    }

    public void setRegistrationId(Integer registrationId) {
	this.registrationId = registrationId;
    }

    public String getPostSpecialization() {
	return postSpecialization;
    }

    public void setPostSpecialization(String postSpecialization) {
	this.postSpecialization = postSpecialization;
    }

    public String getPostInstitute() {
	return postInstitute;
    }

    public void setPostInstitute(String postInstitute) {
	this.postInstitute = postInstitute;
    }

    public String getPostYear() {
	return postYear;
    }

    public void setPostYear(String postYear) {
	this.postYear = postYear;
    }

    public String getDocSpecialization() {
	return docSpecialization;
    }

    public void setDocSpecialization(String docSpecialization) {
	this.docSpecialization = docSpecialization;
    }

    public String getDocInstitute() {
	return docInstitute;
    }

    public void setDocInstitute(String docInstitute) {
	this.docInstitute = docInstitute;
    }

    public String getDocYear() {
	return docYear;
    }

    public void setDocYear(String docYear) {
	this.docYear = docYear;
    }

    public String getDocEducation() {
	return docEducation;
    }

    public void setDocEducation(String docEducation) {
	this.docEducation = docEducation;
    }

    public Integer getEducationId() {
	return educationId;
    }

    public void setEducationId(Integer educationId) {
	this.educationId = educationId;
    }

    public String getYear() {
	return year;
    }

    public void setYear(String year) {
	this.year = year;
    }
}
