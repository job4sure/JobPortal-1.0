package com.job4sure.serviceImpl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.job4sure.model.Attachment;
import com.job4sure.model.CompanyProfileModel;
import com.job4sure.repository.AttachmentRepository;
import com.job4sure.repository.CompanyProfileRepository;
import com.job4sure.service.CompanyProfileService;
import com.job4sure.util.IConstant;

@Service
public class CompanyProfileServiceImp implements CompanyProfileService {

    @Autowired
    private CompanyProfileRepository companyProfileRepository;

    @Autowired
    private AttachmentRepository attachmentRepository;

    @SuppressWarnings("resource")
    @Transactional
    public boolean saveCompanyProfile(CompanyProfileModel companyProfile, MultipartFile filePart,
		    CommonsMultipartFile[] upload, String attchmentName) {
	OutputStream outputStream = null;
	InputStream inputStream = null;
	if (companyProfile != null) {
	    if (upload != null && upload.length > 0) {
		for (CommonsMultipartFile multipartFile : upload) {
		    attchmentName = multipartFile.getOriginalFilename();
		    try {
			inputStream = filePart.getInputStream();
			CompanyProfileModel companyProfile2 = companyProfileRepository.save(companyProfile);
			File newFile = new File(IConstant.FILE_PATH);
			File filePath = new File(newFile + File.separator + companyProfile2.getRegistrationId() + "_"
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
			String profilePic = FilenameUtils.getExtension(multipartFile.getOriginalFilename());
			if (profilePic.equals("jpg") || profilePic.equals("png") || profilePic.equals("bpg")
					|| profilePic.equals("jpeg")) {
			    String attchmentType = "companyLogo";
			    Attachment attchment = new Attachment();
			    Attachment oldAttchment = new Attachment();
			    oldAttchment = attachmentRepository.getProfilePicAttachment(
					    companyProfile2.getRegistrationId(), attchmentType);
			    if (oldAttchment != null) {
				attchment = oldAttchment;
			    }
			    attchment.setAttachmentType(attchmentType);
			    attchment.setAttachmentName(attchmentName);
			    attchment.setPath(newFile + File.separator + companyProfile2.getRegistrationId() + "_"
					    + attchmentName);
			    attchment.setRegistrationId(companyProfile2.getRegistrationId());
			    attachmentRepository.save(attchment);
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

    public CompanyProfileModel getCompanyCompleteInfo(Integer registrationId) {
	CompanyProfileModel companyProfile = companyProfileRepository.getLoggedInCompanyCompleteInfo(registrationId);
	return companyProfile;

    }

    public Attachment getCompanyAttachment(Integer registrationId) {
	Attachment attachment = null;
	if (registrationId != null) {
	    List<Attachment> list = attachmentRepository.getAllAttachment(registrationId);
	    if (list != null) {
		attachment = null;
		for (Object object : list) {
		    attachment = (Attachment) object;
		    if (attachment.getAttachmentType().equals("companyLogo")) {
			return attachment;
		    }

		}
	    }
	}
	return attachment;
    }

}
