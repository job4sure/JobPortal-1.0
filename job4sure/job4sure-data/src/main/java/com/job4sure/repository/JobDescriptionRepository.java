package com.job4sure.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.job4sure.model.JobDescription;

public interface JobDescriptionRepository extends JpaRepository<JobDescription, Integer>{

}
