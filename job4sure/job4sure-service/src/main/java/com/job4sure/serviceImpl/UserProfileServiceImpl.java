package com.job4sure.serviceImpl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.job4sure.model.Attachment;
import com.job4sure.model.City;
import com.job4sure.model.Education;
import com.job4sure.model.UserProfile;
import com.job4sure.repository.AttachmentRepository;
import com.job4sure.repository.CityRepository;
import com.job4sure.repository.EducationRepository;
import com.job4sure.repository.IndustryRepository;
import com.job4sure.repository.ProfileCompleteRepository;
import com.job4sure.repository.RoleRepository;
import com.job4sure.repository.StateRepository;
import com.job4sure.service.UserProfileService;
import com.job4sure.util.DownloadResume;
import com.job4sure.util.IConstant;

@Service
public class UserProfileServiceImpl implements UserProfileService {

    @Autowired
    private ProfileCompleteRepository profileCompleteRepository;

    @Autowired
    private AttachmentRepository attachmentRepository;

    @Autowired
    private EducationRepository EducationRepository;

    @Autowired
    private RoleRepository role;

    @Autowired
    private IndustryRepository industry;

    @Autowired
    private CityRepository cityRepository;

    @Autowired
    private StateRepository stateRepository;

    @SuppressWarnings("resource")
    @Transactional
    public boolean saveCompleteUserProfile(UserProfile userProfile, CommonsMultipartFile[] upload) {
	String attchmentName = null;
	OutputStream outputStream = null;
	InputStream inputStream = null;
	if (userProfile != null) {
	    if (upload != null && upload.length > 0) {
		for (CommonsMultipartFile multipartFile : upload) {
		    attchmentName = multipartFile.getOriginalFilename();
		    try {
			inputStream = multipartFile.getInputStream();
			if (userProfile.getHomeCity() != null) {
			    if (userProfile.getHomeCity().getId() == 0) {
				userProfile.setHomeCity(null);
			    }
			}
			if (userProfile.getCityId() != null) {
			    if (userProfile.getCityId().getId() == 0) {
				userProfile.setCityId(null);
			    }
			}
			if (userProfile.getCurrentCityId() != null) {
			    if (userProfile.getCurrentCityId().getId() == 0) {
				userProfile.setCurrentCityId(null);
			    }
			}
			UserProfile currentUserProfile = profileCompleteRepository.save(userProfile);
			File newFile = new File(IConstant.FILE_PATH);
			File filePath = new File(newFile + File.separator + currentUserProfile.getRegistrationId()
					+ "_" + attchmentName);
			if (!newFile.exists()) {
			    newFile.mkdir();
			    filePath.createNewFile();
			}
			outputStream = new FileOutputStream(filePath);
			int read = 0;
			int length = (int) attchmentName.length();
			byte[] bytes = new byte[length];
			while ((read = inputStream.read(bytes)) != -1) {
			    outputStream.write(bytes, 0, read);
			}
			String profilePic = FilenameUtils.getExtension(multipartFile.getOriginalFilename());
			if (profilePic.equals("jpg") || profilePic.equals("png") || profilePic.equals("bpg")
					|| profilePic.equals("jpeg")) {
			    String attchmentType = "profilePic";
			    Attachment attchment = new Attachment();
			    Attachment oldAttchment = new Attachment();
			    oldAttchment = attachmentRepository.getProfilePicAttachment(
					    currentUserProfile.getRegistrationId(), attchmentType);
			    if (oldAttchment != null) {
				attchment = oldAttchment;
			    }
			    attchment.setAttachmentType(attchmentType);
			    attchment.setAttachmentName(attchmentName);
			    attchment.setPath(newFile + File.separator + currentUserProfile.getRegistrationId() + "_"
					    + attchmentName);
			    attchment.setRegistrationId(currentUserProfile.getRegistrationId());
			    attachmentRepository.save(attchment);
			} else {
			    if (profilePic.equals("txt") || profilePic.equals("doc") || profilePic.equals("sql")) {
				String attchmentType = "resume";
				Attachment attchment = new Attachment();
				Attachment oldAttchment = new Attachment();
				oldAttchment = attachmentRepository.getProfilePicAttachment(
						currentUserProfile.getRegistrationId(), attchmentType);
				if (oldAttchment != null) {
				    attchment = oldAttchment;
				}
				attchment.setAttachmentType(attchmentType);
				attchment.setAttachmentName(attchmentName);
				attchment.setPath(newFile + File.separator + currentUserProfile.getRegistrationId()
						+ "_" + attchmentName);
				attchment.setRegistrationId(currentUserProfile.getRegistrationId());
				attachmentRepository.save(attchment);
			    }
			}
		    } catch (IOException e) {
			e.printStackTrace();
		    }
		}
		return true;
	    } else {
		return false;
	    }
	}
	return true;
    }

    public UserProfile getLoggedInUserCompleteInfo(Integer registrationId) {
	UserProfile userProfile = profileCompleteRepository.getLoggedInUserCompleteInfo(registrationId);
	return userProfile;
    }

    public int getprofileCompletedInPercent(Integer registrationId) {
	int noOfTables = 3;
	int noOfTablesField = 1;

	UserProfile userProfile = profileCompleteRepository.getLoggedInUserCompleteInfo(registrationId);

	if (userProfile != null) {
	    noOfTablesField++;
	}

	Education education = EducationRepository.viewEducation(registrationId);
	if (education == null) {

	} else {
	    noOfTablesField++;
	}

	float per = (noOfTablesField * 100 / noOfTables);
	int profileCompleted = (int) per;
	return profileCompleted;
    }

    public List industryData() {
	List industrydata = industry.findAll();
	return industrydata;
    }

    @SuppressWarnings("rawtypes")
    public List roleData() {
	List roletype = role.findAll();
	return roletype;
    }

    public Attachment getProfilePic(Integer registrationId) {
	Attachment attachment = null;
	if (registrationId != null) {
	    String attchmentType = "profilePic";
	    Attachment profilepicattachment = attachmentRepository.getProfilePicAttachment(registrationId,
			    attchmentType);
	    if (profilepicattachment != null) {
		return profilepicattachment;
	    }

	}
	return attachment;
    }

    public boolean getUserResume(Integer registrationId, HttpServletResponse response) throws IOException {
	String attchmentType = "resume";
	boolean status = false;
	Attachment attachment = attachmentRepository.getProfilePicAttachment(registrationId, attchmentType);
	if (attachment != null) {
	    DownloadResume.downloadResume(attachment.getAttachmentName(), attachment.getPath(), response,
			    attachment.getAttachmentType());
	    status = true;
	    return status;
	}
	return status;
    }

    public List<City> getCity(Integer stateId) {
	List<City> city = cityRepository.getCity(stateId);
	return city;
    }

    public List getAllState() {
	return stateRepository.findAll();

    }
}
