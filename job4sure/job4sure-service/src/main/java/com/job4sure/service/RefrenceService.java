package com.job4sure.service;

import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.job4sure.model.Reference;

public interface RefrenceService {

    public Reference changeStatus(Integer referenceId, String isRefer);

    public List<Reference> findByJobId(Integer jobId);

    public Boolean save(Reference reference, CommonsMultipartFile[] upload);

    public List<Reference> getRefrenceByJobIdAndUser(Integer jobId, Integer registrationId);
}
