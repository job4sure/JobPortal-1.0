package com.job4sure.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name = "job_skills")
public class JobSkills implements Serializable  {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "JOB_SKILLS_ID")
	private Integer jobSkillsId;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "JOB_ID")
	private JobDescription jobDescription;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "SKILLS_ID")
	private Skills skills;
	
	public Integer getJobSkillsId() {
		return jobSkillsId;
	}

	public void setJobSkillsId(Integer jobSkillsId) {
		this.jobSkillsId = jobSkillsId;
	}

	public JobDescription getJobDescription() {
		return jobDescription;
	}

	public void setJobDescription(JobDescription jobDescription) {
		this.jobDescription = jobDescription;
	}

	public Skills getSkills() {
		return skills;
	}

	public void setSkills(Skills skills) {
		this.skills = skills;
	}
}
