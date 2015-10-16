package com.job4sure.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.job4sure.model.City;
import com.job4sure.service.UserProfileService;

@Controller
public class CommonController {

    @Autowired
    private UserProfileService userProfileService;

    @RequestMapping(value = "/getCityListByStateId", method = { RequestMethod.GET })
    @ResponseBody
    public Map<String, List<City>> getAllCityByStateId(@RequestParam Integer stateId) {
	Map<String, List<City>> cityListMap = new HashMap<String, List<City>>();
	List<City> cityList = userProfileService.getCity(stateId);
	cityListMap.put("cityList", cityList);
	return cityListMap;

    }
}