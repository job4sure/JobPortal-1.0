package com.job4sure.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.job4sure.model.Salary;

public interface SalaryRepositoryForUser extends JpaRepository<Salary, Integer> {

}
