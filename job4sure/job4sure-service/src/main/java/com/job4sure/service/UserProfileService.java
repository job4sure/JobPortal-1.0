package com.job4sure.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.job4sure.model.Attachment;
import com.job4sure.model.City;
import com.job4sure.model.Industry;
import com.job4sure.model.UserProfile;

public interface UserProfileService {

    public UserProfile getLoggedInUserCompleteInfo(Integer registrationId);

    public Attachment getAllAttachment(Integer registrationId);

    public int getprofileCompletedInPercent(Integer registrationId);

    public List<Industry> industryData();

    public List roleData();

    public boolean saveCompleteUserProfile(UserProfile userProfile, CommonsMultipartFile[] upload);

    public String getUserResume(Integer registrationId, HttpServletResponse response) throws IOException;

    public List<City> getCity(Integer stateId);

    public List getAllState();

}
