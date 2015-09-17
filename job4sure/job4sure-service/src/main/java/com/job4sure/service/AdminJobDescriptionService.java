package com.job4sure.service;

import java.util.List;

import com.job4sure.model.JobDescription;

public interface AdminJobDescriptionService {

    List<JobDescription> getJobDescriptionList(int jdApprovedStatus);

    boolean approveOrRejectJobDescription(Integer jobId, Integer statusId);

    JobDescription viewJobDescription(Integer jobId);

}
