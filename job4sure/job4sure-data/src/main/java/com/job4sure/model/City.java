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
@Table(name="city")
public class City {

	@Id
	@GeneratedValue
	@Column(name="CITY_ID")
	private int id;
	@Column(name="CITY")
	private String cityname;
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="STATE_ID",referencedColumnName="STATE_ID")
	private State state;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCityname() {
		return cityname;
	}
	public void setCityname(String cityname) {
		this.cityname = cityname;
	}
	public State getState() {
		return state;
	}
	public void setState(State state) {
		this.state = state;
	}
	
	
}
