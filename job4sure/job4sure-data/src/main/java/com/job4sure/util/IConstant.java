package com.job4sure.util;

public class IConstant {

	// Mail:
	public static final String FROM_EMAIL_ID = "hrd@prestigepoint.in";
	public static final String FROM_PASSWORD = "prestigepoint@123";
	public static final String PASSWORD_RECOVERY_URL = "http://localhost:8080/job4sure-web/reCreatePass";
	public static final String REGISTRATION_URL = "http://localhost:8080/job4sure-web/verify";
	public static final String REGISTRATION_verfy_URL = "http://localhost:8080/job4sure-admin/adminRegistration";
	// public static final String
	// REGISTRATION_URL="http://job4sure-fasttofind.rhcloud.com/verify";
	// public static final String
	// PASSWORD_RECOVERY_URL="http://job4sure-fasttofind.rhcloud.com/reCreatePass";

	// Messages:
	public static final String REGISTRATION_SUCCESS_MESSAGE = "<p class='msg done'>Your registration has been completed successfully , please check your email and verify your account</p>";
	public static final String REGISTRATION_FAILURE_MESSAGE = "<h4 class = 'msg error'>Your registration is not successfull , Please try again!</h4>";
	public static final String FILUP__REGISTRATION__FORM_MESSAGE = "<p class='msg done'>Welcome SUB-ADMIN, please fillup your registration form </p>";
	public static final String JOB_DELETE_MESSAGE = "<p class='msg done'>Job deleted successfully!</p>";
	public static final String COMPANY_COMPLETE_INFO_MESSAGE = "Company profile created successfully!!";
	public static final String COMPANY_INFO_UPDATE_MESSAGE = "Company profile updated successfully!!";
	public static final String COMPANY_BASIC_INFO_UPDATE_MESSAGE = "Basic Info Successfully Updated !!";
	public static final String COMPANY_BASIC_INFO_UPDATE_FAILURE_MESSAGE = "Basic Info Successfully Updated !!";
	public static final String USER_COMPLETE_INFO_SUCCESS_MESSAGE = "SuccessFully complete your profile !!";
	public static final String USER_BASIC_INFO_SUCCESS_MESSAGE = "Basic Info Successfully Updated !!";
	public static final String USER_BASIC_INFO_FAILURE_MESSAGE = "Profile Updation failed, Please try again!";
	public static final String COMPLETE_USER_INFO_SUCCESS_MESSAGE = "SuccessFully complete your profile !!";
	public static final String FIRST_COMPLETE_INFO_MESSAGE = "First Complete your info!!";
	public static final String SUCCESS_MESSAGE = "<p class='msg done'>Welcome SUB-ADMIN, Your registration has been completed successfully </p>";
	public static final String FAILURE_MESSAGE = "<h4 class = 'msg error'>Your registration is not successfull , Please try again!</h4>";
	public static final String EDUCATION_SAVE = "<p class='msg done'>Your education details have been updated successfully!</p>";
	public static final String MAIL_SUCCESS_MESSAGE = "<p class='msg done'>Your request for re-create password is Successful, please check your email and create your New-password.</p>";
	public static final String MAIL_FAILURE_MESSAGE = "<h4 class = 'msg error'>Your request for re-create password is failed , Please try again with registered Email ID!</h4>";
	public static final String SUCCESSFULLY_MESSAGE = "<p class='msg done'>SuccessfullY send</p>";
	public static final String FAILURE_MESSAGE_ADMIN = "<p class='msg done'>Message error please try</p>";

	// Date format
	public static final String VALID_UP_TO_DATE_FORMAT = "yyyy-MM-dd hh:mm:ss";

	// path
	public static final String FILE_PATH = "F:/mm/";

	// Security roles:
	public static final String USER_ROLE = "USER";
	public static final String COMPANY_ROLE = "COMP";
	public static final String ADMIN_ROLE = "ADMIN";

	// Messages for viewAllJobDesc.jsp
	public static final String EMPTY_LIST = "<h2 id=" + "show" + ">You have not created any job.</h2>";
	public static final String NOT_EMPTY_LIST = "<h2 id=" + "show" + ">List of Job Descriptions : </h2>";

	// Messages for AdminHomeController
	public static final String WRONG_CREDENTIAL = "<h3 class='msg error'>Incorrect Username or Password</h3>";
	public static final String RIGHT_CREDENTIAL = "<p class='msg done'>You've been logged out successfully.</p>";

	// Messages for HomeController
	public static final String PASSWORD_UPDATED = "<p class='msg done'>Your password successfully updated.</p>";

	// Message for UserProfileController
	public static final String MOBILE_LENGTH_VALIDATION = "Mobile number should be 10 digit";

	//Message for AdminJobDescriptionController
	public static final int JD_PENDING_STATUS=1;
	public static final int JD_APPROVED_STATUS=2;
	public static final int JD_REJECTED_STATUS=3;
	public static final String JD_APPROVED_MSG="Successfully approved job description";
	public static final String JD_REJECTED_MSG="Successfully rejected job description";
	
}
