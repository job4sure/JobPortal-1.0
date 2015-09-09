package com.job4sure.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="PrefferedLocation")
public class PrefferedLocation {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ID")
	private int id;
	@Column(name="PREFFERED_LOCATION")
	private String prefferedlocation;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPrefferedlocation() {
		return prefferedlocation;
	}
	public void setPrefferedlocation(String prefferedlocation) {
		this.prefferedlocation = prefferedlocation;
	}
	
	
}
