package com.job4sure.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.job4sure.model.City;


public interface CityRepository extends JpaRepository<City, Integer> {

	@Query("select c from City c where c.state.stateId=:stateId")
	public List<City> getCity(@Param("stateId") Integer stateId);
	
}
