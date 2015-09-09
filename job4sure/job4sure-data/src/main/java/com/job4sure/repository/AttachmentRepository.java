package com.job4sure.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.job4sure.model.Attachment;

public interface AttachmentRepository extends JpaRepository<Attachment, Integer> {

}
