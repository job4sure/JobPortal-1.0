package com.job4sure.service;

import java.util.List;

import com.job4sure.model.JobDescription;

public interface AdminJobDescriptionService {

	List<JobDescription> getAllAprovedJobDescriptions(int jdApprovedStatus);

	List<JobDescription> getAllPendingJobDescriptions(Integer jdApprovedStatus);

	List<JobDescription> getAllRejectedJobDescriptions(Integer jdApprovedStatus);

	JobDescription viewJobDescription(Integer jobId);

	boolean approveJobDescription(Integer jobId);

	boolean rejectJobDescription(Integer jobId);

}
