package com.job4sure.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "DOBmonth")
public class DOBmonth {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ID")
	private int id;
	@Column(name="DOB_MONTH")
	private String DOBmonth;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDOBmonth() {
		return DOBmonth;
	}
	public void setDOBmonth(String dOBmonth) {
		DOBmonth = dOBmonth;
	}
	
	
}
