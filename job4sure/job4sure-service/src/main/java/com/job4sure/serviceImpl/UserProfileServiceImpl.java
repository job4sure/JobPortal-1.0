package com.job4sure.serviceImpl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.job4sure.model.Attachment;
import com.job4sure.model.Education;
import com.job4sure.model.UserProfile;
import com.job4sure.repository.AttachmentRepository;
import com.job4sure.repository.EducationRepository;
import com.job4sure.repository.IndustryRepository;
import com.job4sure.repository.LocationRepository;
import com.job4sure.repository.PrefferedLocationRepository;
import com.job4sure.repository.ProfileCompleteRepository;
import com.job4sure.repository.RoleRepository;
import com.job4sure.repository.SalaryRepositoryForUser;
import com.job4sure.service.UserProfileService;
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
	private PrefferedLocationRepository prefferedlocation;
	
	@Autowired
	private SalaryRepositoryForUser salary;
	
	@Autowired
	private LocationRepository currentlocation;

	@SuppressWarnings("resource")
	public boolean saveCompleteUserProfile(UserProfile userProfile, MultipartFile filePart,
			CommonsMultipartFile[] upload, String attchmentName) {
		OutputStream outputStream = null;
		InputStream inputStream = null;
		if (userProfile != null) {
			if (upload != null && upload.length > 0) {
				int i = 1, j = 0;
				for (CommonsMultipartFile multipartFile : upload) {
					attchmentName = multipartFile.getOriginalFilename();
					try {
						inputStream = filePart.getInputStream();
						UserProfile userProfile2 = profileCompleteRepository.save(userProfile);
						File newFile = new File(IConstant.FILE_PATH);
						File filePath = new File(newFile + File.separator + userProfile2.getRegistrationId() + "_"
								+ attchmentName);
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
						Attachment attchment = new Attachment();
						if (attchmentName != null && attchmentName != "" && attchment != null) {
							attchment.setAttachmentName(attchmentName);
							attchment.setPath(newFile + File.separator + userProfile2.getRegistrationId() + "_"
									+ attchmentName);
							attchment.setRegistrationId(userProfile2.getRegistrationId());
							attchment.setProfilePic(i);
							attchment.setResume(j);
							attachmentRepository.save(attchment);
							i--;
							j++;
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
		
		Education education=EducationRepository.viewEducation(registrationId);
		if(education==null){
			
		}
		else{
			noOfTablesField++;
		}

		float per = (noOfTablesField * 100 / noOfTables);
		int profileCompleted = (int) per;
		return profileCompleted;
	}
	public List salaryAnnual() {
		List	salarydata=salary.findAll();
			return salarydata;
		}

		public List industryData() {
			List industrydata=industry.findAll();
			return industrydata;
		}

		public List currentLocation() {
		List currentlocation1=currentlocation.findAll();
			return currentlocation1;
		}

		public List prefferedLocation() {
			List preferedlocation=prefferedlocation.findAll();
			return preferedlocation;
		}

		public List roleData() {
		List roletype=	role.findAll();
			return roletype;
		}

}
