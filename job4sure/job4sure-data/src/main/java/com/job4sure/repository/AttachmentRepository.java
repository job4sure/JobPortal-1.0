package com.job4sure.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.job4sure.model.Attachment;

public interface AttachmentRepository extends JpaRepository<Attachment, Integer> {

	
	@Query("select attachment from Attachment attachment where attachment.registrationId=:regId")
	List<Attachment> getAllAttachment(@Param("regId") Integer regId);

}
