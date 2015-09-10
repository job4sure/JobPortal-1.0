package com.job4sure.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "salary")
public class Salary {

    @Id
    @Column(name = "SALARY_ID")
    private Integer salaryId;

    @Column(name = "SALARY")
    private String salary;

    @OneToOne()
    @JoinColumn(name = "SALARY_ID")
    private JobDescription jobDescription;
    
    @OneToOne()
    @JoinColumn(name = "SALARY_ID")
    private JobDescription jobDescription1;
    
    public JobDescription getJobDescription() {
	return jobDescription;
    }

    public void setJobDescription(JobDescription jobDescription) {
	this.jobDescription = jobDescription;
    }

    public Integer getSalaryId() {
        return salaryId;
    }

    public void setSalaryId(Integer salaryId) {
        this.salaryId = salaryId;
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }

    public JobDescription getJobDescription1() {
        return jobDescription1;
    }

    public void setJobDescription1(JobDescription jobDescription1) {
        this.jobDescription1 = jobDescription1;
    }
}