package com.job4sure.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Industry")
public class Industry {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ID")
	private int id;
	@Column(name="INDUSTRY")
	private String jobIndustry;
	public String getJobIndustry() {
		return jobIndustry;
	}
	public void setJobIndustry(String jobIndustry) {
		this.jobIndustry = jobIndustry;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
}
