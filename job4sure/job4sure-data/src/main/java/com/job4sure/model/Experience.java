package com.job4sure.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "experience")
public class Experience {

    @Id
    @Column(name = "EXPERIENCE_ID")
    private Integer experienceId;

    @Column(name = "EXPERIENCE")
    private String experience;
    
    
    @OneToOne()
    @JoinColumn(name = "EXPERIENCE_ID")
    private JobDescription minJobDescription;
    
    
    public JobDescription getMinJobDescription() {
        return minJobDescription;
    }

    public void setMinJobDescription(JobDescription minJobDescription) {
        this.minJobDescription = minJobDescription;
    }
    
    
    @OneToOne()
    @JoinColumn(name = "EXPERIENCE_ID")
    private JobDescription maxJobDescription;
    
    public JobDescription getMaxJobDescription() {
        return maxJobDescription;
    }

    public void setMaxJobDescription(JobDescription maxJobDescription) {
        this.maxJobDescription = maxJobDescription;
    }

    public Integer getExperienceId() {
        return experienceId;
    }

    public void setExperienceId(Integer experienceId) {
        this.experienceId = experienceId;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

   

   
   

   

    

}