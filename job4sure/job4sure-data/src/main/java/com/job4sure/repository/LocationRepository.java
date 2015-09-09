package com.job4sure.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.job4sure.model.Location;

public interface LocationRepository extends JpaRepository<Location, Integer> {

}
