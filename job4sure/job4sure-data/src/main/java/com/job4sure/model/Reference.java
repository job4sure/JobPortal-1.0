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
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "reference")
public class Reference implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    private int id;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "REFER_BY", referencedColumnName = "REGISTRATION_ID", updatable = false)
    private Registration registration;

    @ManyToOne
    @JoinColumn(name = "JOB_ID", updatable = false)
    private JobDescription jobDescription;

    @OneToOne
    @JoinColumn(name = "ATTACHMENT_ID")
    private Attachment attachment;

    @Column(name = "NOTE")
    private String note;

    public int getId() {
	return id;
    }

    public void setId(int id) {
	this.id = id;
    }

    public Attachment getAttachment() {
	return attachment;
    }

    public void setAttachment(Attachment attachment) {
	this.attachment = attachment;
    }

    public Registration getRegistration() {
	return registration;
    }

    public void setRegistration(Registration registration) {
	this.registration = registration;
    }

    public JobDescription getJobDescription() {
	return jobDescription;
    }

    public void setJobDescription(JobDescription jobDescription) {
	this.jobDescription = jobDescription;
    }

    public String getNote() {
	return note;
    }

    public void setNote(String note) {
	this.note = note;
    }

}
