package com.job4sure.configuration;

import java.util.HashMap;
import java.util.Map;

import org.apache.tiles.Attribute;
import org.apache.tiles.Definition;
import org.apache.tiles.definition.DefinitionsFactory;

import com.job4sure.util.IConstant;

public final class TilesDefinitionsConfig implements DefinitionsFactory {
	private static final Map<String, Definition> tilesDefinitions = new HashMap<String, Definition>();
	private static final Attribute BASE_TEMPLATE = new Attribute("/WEB-INF/layout/defaultLayout.jsp");

	// private static final org.apache.tiles.Attribute BASE_TEMPLATE = new
	// org.apache.tiles.Attribute("/WEB-INF/layout/defaultLayout.jsp");
	public Definition getDefinition(String name, org.apache.tiles.request.Request tilesContext) {
		return tilesDefinitions.get(name);
	}

	/**
	 * @param name
	 *            <code>Name of the view</code>
	 * @param title
	 *            <code>Page title</code>
	 * @param body
	 *            <code>Body JSP file path</code>
	 * 
	 *            <code>Adds default layout definitions</code>
	 */
	private static void addDefaultLayoutDef(String name, String title, String body, String header) {
		Map<String, Attribute> attributes = new HashMap<String, Attribute>();

		attributes.put("title", new Attribute(title));
		attributes.put("header", new Attribute(header));
		attributes.put("body", new Attribute(body));
		attributes.put("footer", new Attribute("/WEB-INF/layout/footer.jsp"));
		tilesDefinitions.put(name, new Definition(name, BASE_TEMPLATE, attributes));
	}

	public static void addDefinitions() {

		// Common Jsp related configurations
		addDefaultLayoutDef("welcome", "welcme", "/WEB-INF/jsp/welcome.jsp", IConstant.COMMON_HEADER);
		addDefaultLayoutDef("registration", "register", "/WEB-INF/jsp/registration.jsp", IConstant.COMMON_HEADER);
		addDefaultLayoutDef("loginPage", "login", "/WEB-INF/jsp/login.jsp", IConstant.COMMON_HEADER);
		addDefaultLayoutDef("successpage", "success", "/WEB-INF/jsp/success.jsp", IConstant.COMMON_HEADER);
		addDefaultLayoutDef("userPage", "UserPage", "/WEB-INF/jsp/user.jsp", IConstant.COMMON_HEADER);
		addDefaultLayoutDef("userProfilePage", "userProfile", "/WEB-INF/jsp/userProfile.jsp", IConstant.COMMON_HEADER);
		addDefaultLayoutDef("forgotPassPage", "Forgot Password", "/WEB-INF/jsp/forgotPass.jsp", IConstant.COMMON_HEADER);
		addDefaultLayoutDef("adminRegistration", "Admin Registration", "/WEB-INF/jsp/adminRegistration.jsp",
		                IConstant.COMMON_HEADER);
		addDefaultLayoutDef("contactUs", "contactus", "/WEB-INF/jsp/contactUS.jsp", IConstant.COMMON_HEADER);
		// Company related Jsp's configuration
		addDefaultLayoutDef("companyHomePage", "CompanyPage", "/WEB-INF/jsp/companyHome.jsp", IConstant.COMPANY_HEADER);
		addDefaultLayoutDef("addJobDesc", "Add Job Description", "/WEB-INF/jsp/addJobDesc.jsp",
		                IConstant.COMPANY_HEADER);
		addDefaultLayoutDef("viewAllJobDesc", "View All Job", "/WEB-INF/jsp/viewAllJobDesc.jsp",
		                IConstant.COMPANY_HEADER);
		addDefaultLayoutDef("companyProfilePage", "companyProfile", "/WEB-INF/jsp/companyProfile.jsp",
		                IConstant.COMPANY_HEADER);
		addDefaultLayoutDef("companyviewProfile12", "companyviewProfile", "/WEB-INF/jsp/companyviewProfile.jsp",
		                IConstant.COMPANY_HEADER);
		addDefaultLayoutDef("newPassword", "New Password", "/WEB-INF/jsp/createNewPassword.jsp",
		                IConstant.COMPANY_HEADER);
		addDefaultLayoutDef("newUserPasswordForComp", "New Password", "/WEB-INF/jsp/createNewPassword.jsp",
		                IConstant.COMPANY_HEADER);
		addDefaultLayoutDef("companyDetailsViewPage", "CompanyDetailsView", "/WEB-INF/jsp/companyDetailsView.jsp",
		                IConstant.COMPANY_HEADER);
		addDefaultLayoutDef("updateCompanyBasicProfilePage", "updateCompanyBasicProfile",
		                "/WEB-INF/jsp/updateCompanyBasicProfile.jsp", IConstant.COMPANY_HEADER);
		// User related Jsp's configuration
		addDefaultLayoutDef("userCompleteInfo", "User Complete info", "/WEB-INF/jsp/userCompleteInfo.jsp",
		                IConstant.USER_HEADER);
		addDefaultLayoutDef("newUserPassword", "New Password", "/WEB-INF/jsp/createNewPassword.jsp",
		                IConstant.USER_HEADER);
		addDefaultLayoutDef("userBasicInfoPage", "userBasicInfo", "/WEB-INF/jsp/userBasicInfo.jsp",
		                IConstant.USER_HEADER);
		addDefaultLayoutDef("userHomePage", "userHome", "/WEB-INF/jsp/userHome.jsp", IConstant.USER_HEADER);
		addDefaultLayoutDef("educationUpdate", "education", "/WEB-INF/jsp/viewEducationDetails.jsp",
		                IConstant.USER_HEADER);
		addDefaultLayoutDef("userProfileView", "userProfileViewPage", "/WEB-INF/jsp/userProfileView.jsp",
		                IConstant.USER_HEADER);
		addDefaultLayoutDef("viewJobDesc", "showJobDescription", "/WEB-INF/jsp/userViewJobDescription.jsp",
		                IConstant.USER_HEADER);
		addDefaultLayoutDef("viewApprovedJobDescriptionInUser", "ViewApprovedJobDescriptionInUser",
		                "/WEB-INF/jsp/userViewJobDescription.jsp", IConstant.USER_HEADER);
		addDefaultLayoutDef("viewSingleJobDescription", "show Job Description", "/WEB-INF/jsp/viewJobDescription.jsp",
		                IConstant.USER_HEADER);
		// Admin related Jsp's configuration
		addDefaultLayoutDef("adminHomePage", "adminHome", "/WEB-INF/jsp/adminHome.jsp", IConstant.ADMIN_HEADER);
		addDefaultLayoutDef("jobDescriptionList", "showJobDescription", "/WEB-INF/jsp/jobDescriptionList.jsp",
		                IConstant.ADMIN_HEADER);
		addDefaultLayoutDef("viewJobDescription", "show Job Description", "/WEB-INF/jsp/viewJobDescription.jsp",
		                IConstant.ADMIN_HEADER);
		addDefaultLayoutDef("addSubAdmin", "addadmin", "/WEB-INF/jsp/addSubAdmin.jsp", IConstant.ADMIN_HEADER);
		addDefaultLayoutDef("adforgotPassPage", "forget password", "/WEB-INF/jsp/adforgot.jsp", IConstant.COMMON_HEADER);
		addDefaultLayoutDef("adNewPassword", "New Password", "/WEB-INF/jsp/createNewPass.jsp", IConstant.ADMIN_HEADER);
		addDefaultLayoutDef("CompanyList", "companyList", "/WEB-INF/jsp/companyReportList.jsp", IConstant.ADMIN_HEADER);
		addDefaultLayoutDef("UserList", "userlist", "/WEB-INF/jsp/userReportList.jsp", IConstant.ADMIN_HEADER);
		addDefaultLayoutDef("groupMailToSubAdminsPage", "Sub Admins List", "/WEB-INF/jsp/groupMailToSubAdmins.jsp",IConstant.ADMIN_HEADER);
		addDefaultLayoutDef("groupMailToEmployersPage", "Employer List", "/WEB-INF/jsp/groupMailToEmployers.jsp",IConstant.ADMIN_HEADER);
		addDefaultLayoutDef("groupMailToUsersPage", "User List", "/WEB-INF/jsp/groupMailToUsersPage.jsp",IConstant.ADMIN_HEADER);
	}

}
