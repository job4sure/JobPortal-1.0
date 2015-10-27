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
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.job4sure.model.Attachment;
import com.job4sure.model.Reference;
import com.job4sure.repository.AttachmentRepository;
import com.job4sure.repository.RefrenceRepository;
import com.job4sure.repository.RegistrationRepository;
import com.job4sure.service.RefrenceService;
import com.job4sure.util.IConstant;

@Service
public class RefrenceServiceImpl implements RefrenceService {

    @Autowired
    private RefrenceRepository refrenceRepository;

    @Autowired
    private RegistrationRepository registrationRepository;

    @Autowired
    private AttachmentRepository attachmentRepository;

    @Transactional
    public Boolean save(Reference reference, CommonsMultipartFile[] upload) {
	Boolean inserted = false;
	String attchmentName = null;
	OutputStream outputStream = null;
	InputStream inputStream = null;
	Attachment attachment = null;
	Integer registrationId = reference.getRegistration().getRegistrationId();

	if (upload != null && upload.length > 0) {
	    for (CommonsMultipartFile multipartFile : upload) {
		attchmentName = multipartFile.getOriginalFilename();
		try {
		    inputStream = multipartFile.getInputStream();

		    File newFile = new File(IConstant.FILE_PATH);
		    File filePath = new File(newFile + File.separator + registrationId + "_" + attchmentName);
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
		    if (profilePic.equals("pdf") || profilePic.equals("doc") || profilePic.equals("docx")) {
			String attchmentType = "resume";
			attachment = new Attachment();

			attachment.setAttachmentType(attchmentType);
			attachment.setAttachmentName(attchmentName);
			attachment.setPath(newFile + File.separator + registrationId + "_" + attchmentName);
			attachment.setRegistrationId(registrationId);
			attachmentRepository.save(attachment);
		    }
		} catch (IOException e) {
		    e.printStackTrace();
		}
	    }
	}

	reference.setRegistration(registrationRepository.findOne(reference.getRegistration().getRegistrationId()));
	if (attachment != null) {
	    reference.setAttachment(attachment);
	}
	reference = refrenceRepository.save(reference);
	if (reference != null) {
	    inserted = true;
	}
	return inserted;
    }

    public List<Reference> getRefrenceByJobIdAndUser(Integer jobId, Integer registrationId) {
	List<Reference> reference;
	reference = refrenceRepository.getRefrenceByJobIdAndUser(jobId, registrationId);
	return reference;
    }
}
