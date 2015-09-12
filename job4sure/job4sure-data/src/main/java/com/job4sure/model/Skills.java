package com.job4sure.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name = "skills")
public class Skills implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "SKILLS_ID")
	private Integer skillsId;
	
	@Column(name = "SKILLS_NAME")
	private String skillsName;

	public Integer getSkillsId() {
		return skillsId;
	}

	public void setSkillsId(Integer skillsId) {
		this.skillsId = skillsId;
	}

	public String getSkillsName() {
		return skillsName;
	}

	public void setSkillsName(String skillsName) {
		this.skillsName = skillsName;
	}
	
	@ManyToMany(mappedBy="skillsSet",cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	private Set<JobDescription> jobDescription = new HashSet<JobDescription>();

	public Set<JobDescription> getJobDescription() {
		return jobDescription;
	}

	public void setJobDescription(Set<JobDescription> jobDescription) {
		this.jobDescription = jobDescription;
	}
}
