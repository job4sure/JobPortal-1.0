package com.job4sure.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "jd_approval_status")
public class JobDescriptionApprovalStatus {

    @Id
    @Column(name = "JD_APPROVAL_STATUS_ID")
    private Integer statusId;

    @Column(name = "JD_APPROVAL_STATUS")
    private String status;

    @OneToOne()
    @JoinColumn(name = "JD_APPROVAL_STATUS_ID")
    private JobDescription jobDescription;
    
    public JobDescription getJobDescription() {
	return jobDescription;
    }

    public void setJobDescription(JobDescription jobDescription) {
	this.jobDescription = jobDescription;
    }

    public Integer getStatusId() {
        return statusId;
    }

    public void setStatusId(Integer statusId) {
        this.statusId = statusId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

   
   
}