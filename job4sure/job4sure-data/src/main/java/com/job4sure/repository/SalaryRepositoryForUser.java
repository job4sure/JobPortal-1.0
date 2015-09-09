package com.job4sure.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.job4sure.model.Salary;
import com.job4sure.model.SalaryForUser;

public interface SalaryRepositoryForUser extends JpaRepository<SalaryForUser, Integer> {

}
