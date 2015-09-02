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
 @Column(name = "userId")
 private Integer userId;
 
  @Column(name="registrationId")
 private Integer registrationId;
 
 
 @ManyToOne( optional=false)
 @JoinColumn(name="registrationId",referencedColumnName="registration_Id",insertable=false, updatable=false)
 private Registration registration;
 
 public Integer getUserId() {
  return userId;
 }

 public void setUserId(Integer userId) {
  this.userId = userId;
 }

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

 public String getFirstName() {
  return firstName;
 }

 public void setFirstName(String firstName) {
  this.firstName = firstName;
 }

 public String getLastName() {
  return lastName;
 }

 public void setLastName(String lastName) {
  this.lastName = lastName;
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

 @Column(name = "firstName")
 private String firstName;
 
 @Column(name = "lastName")
 private String lastName;
 
 @Column(name = "address")
 private String address;
 
 @Column(name = "city")
 private String city;
 
 @Column(name = "State")
 private String State;
 
 @Column(name = "zip")
 private String zip;
}