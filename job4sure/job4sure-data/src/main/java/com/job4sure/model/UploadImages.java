package com.job4sure.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name = "upload_images")
public class UploadImages implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "UPLOAD_IMAGES_ID")
	private Integer uploadImagesId;

	@Column(name = "UPLOAD_IMAGES_NAME")
	private String uploadImagesName;

	@Column(name = "PROFILE_PIC")
	private String profilePic;

	@Column(name = "RESUME")
	private String resume;

	public Integer getUploadImagesId() {
		return uploadImagesId;
	}

	public void setUploadImagesId(Integer uploadImagesId) {
		this.uploadImagesId = uploadImagesId;
	}

	public String getUploadImagesName() {
		return uploadImagesName;
	}

	public void setUploadImagesName(String uploadImagesName) {
		this.uploadImagesName = uploadImagesName;
	}

	public String getProfilePic() {
		return profilePic;
	}

	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}

	public String getResume() {
		return resume;
	}

	public void setResume(String resume) {
		this.resume = resume;
	}

}
