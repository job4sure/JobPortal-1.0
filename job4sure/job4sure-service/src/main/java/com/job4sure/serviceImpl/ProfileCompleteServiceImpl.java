package com.job4sure.serviceImpl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.job4sure.model.UploadImages;
import com.job4sure.model.userProfile;
import com.job4sure.repository.ProfileCompleteRepository;
import com.job4sure.repository.UploadImagesRepository;
import com.job4sure.service.ProfileCompleteService;
import com.job4sure.util.IConstant;

@Service
public class ProfileCompleteServiceImpl implements ProfileCompleteService {
	
	@Autowired
	private  ProfileCompleteRepository  profileCompleteRepository;
	
	@Autowired
	private  UploadImagesRepository  uploadImagesRepository;
	
	@SuppressWarnings("resource")
	public boolean saveCompleteUserProfile(userProfile userProfile, MultipartFile filePart,CommonsMultipartFile[] upload,String uploadImagesName) {
		 OutputStream outputStream = null;
			InputStream inputStream = null;
			if (userProfile != null) {
				if (upload != null && upload.length > 0) {
					for (CommonsMultipartFile multipartFile : upload) {
						uploadImagesName = multipartFile.getOriginalFilename();
					    try {
					        inputStream = filePart.getInputStream();
					        userProfile userProfile2 = profileCompleteRepository.save(userProfile);
					        File newFile = new File(IConstant.FILE_PATH);
					        File filePath = new File(newFile + File.separator + userProfile2.getRegistrationId() + "_" + uploadImagesName);
					        if (!newFile.exists()) {
					         newFile.mkdir();
					         filePath.createNewFile();
					        }
					        outputStream = new FileOutputStream(filePath);
					        int read = 0;
					        int length = (int) uploadImagesName.length();
					        byte[] bytes = new byte[length];
					        while ((read = inputStream.read(bytes)) != -1) {
					         outputStream.write(bytes, 0, read);
					        }
					       } catch (IOException e) {
					        e.printStackTrace();
					       }
					      }
					UploadImages uploadImages = new UploadImages();
					uploadImages.setProfilePic(uploadImagesName);
					uploadImagesRepository.save(uploadImages);
					return true;
				} else {
					return false;
				}
			}
			return true;
		}


	public userProfile getLoggedInUserCompleteInfo(Integer registrationId) {
		userProfile userProfile=profileCompleteRepository.getLoggedInUserCompleteInfo(registrationId);
		return userProfile;
	}


}
