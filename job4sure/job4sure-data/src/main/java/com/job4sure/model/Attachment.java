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
@Table(name = "attachment")
public class Attachment implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ATTACHMENT_ID")
	private Integer attachmentId;

	@Column(name = "PATH")
	private String path;

	@Column(name = "ATTACHMENT_NAME")
	private String attachmentName;

	@Column(name = "PROFILE_PIC")
	private Integer profilePic;

	@Column(name = "RESUME")
	private Integer resume;

	@Column(name = "REGISTRATION_ID")
	private Integer registrationId;

	public Integer getAttachmentId() {
		return attachmentId;
	}

	public void setAttachmentId(Integer attachmentId) {
		this.attachmentId = attachmentId;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getAttachmentName() {
		return attachmentName;
	}

	public void setAttachmentName(String attachmentName) {
		this.attachmentName = attachmentName;
	}

	public Integer getProfilePic() {
		return profilePic;
	}

	public void setProfilePic(Integer profilePic) {
		this.profilePic = profilePic;
	}

	public Integer getResume() {
		return resume;
	}

	public void setResume(Integer resume) {
		this.resume = resume;
	}

	public Integer getRegistrationId() {
		return registrationId;
	}

	public void setRegistrationId(Integer registrationId) {
		this.registrationId = registrationId;
	}

}
