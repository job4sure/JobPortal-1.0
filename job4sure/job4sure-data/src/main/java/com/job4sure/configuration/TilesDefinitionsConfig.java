package com.job4sure.configuration;

import java.util.HashMap;
import java.util.Map;

import org.apache.tiles.Attribute;
import org.apache.tiles.Definition;
import org.apache.tiles.definition.DefinitionsFactory;

public final class TilesDefinitionsConfig implements DefinitionsFactory {
	private static final Map<String, Definition> tilesDefinitions = new HashMap<String, Definition>();
	private static final Attribute BASE_TEMPLATE = new Attribute(
			"/WEB-INF/layout/defaultLayout.jsp");

	// private static final org.apache.tiles.Attribute BASE_TEMPLATE = new
	// org.apache.tiles.Attribute("/WEB-INF/layout/defaultLayout.jsp");
	public Definition getDefinition(String name,
			org.apache.tiles.request.Request tilesContext) {
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
	private static void addDefaultLayoutDef(String name, String title,
			String body,String header) {
		Map<String, Attribute> attributes = new HashMap<String, Attribute>();

		attributes.put("title", new Attribute(title));
		attributes.put("header", new Attribute(header));
		attributes.put("body", new Attribute(body));
		attributes.put("footer", new Attribute("/WEB-INF/layout/footer.jsp"));
		tilesDefinitions.put(name, new Definition(name, BASE_TEMPLATE,
				attributes));
	}

	public static void addDefinitions() {
		addDefaultLayoutDef("welcome", "welcme", "/WEB-INF/jsp/welcome.jsp","/WEB-INF/layout/header.jsp");
		addDefaultLayoutDef("registration", "register", "/WEB-INF/jsp/registration.jsp","/WEB-INF/layout/header.jsp");
		addDefaultLayoutDef("loginPage", "login", "/WEB-INF/jsp/login.jsp","/WEB-INF/layout/header.jsp");
		addDefaultLayoutDef("successpage", "success", "/WEB-INF/jsp/success.jsp","/WEB-INF/layout/header.jsp");
		addDefaultLayoutDef("userPage", "UserPage", "/WEB-INF/jsp/user.jsp","/WEB-INF/layout/header.jsp");
		addDefaultLayoutDef("compPage", "CompanyPage", "/WEB-INF/jsp/comp.jsp","/WEB-INF/layout/companyHeader.jsp");
		addDefaultLayoutDef("userProfilePage", "userProfile", "/WEB-INF/jsp/userProfile.jsp","/WEB-INF/layout/header.jsp");
		addDefaultLayoutDef("addJobDesc", "Add Job Description", "/WEB-INF/jsp/addJobDesc.jsp","/WEB-INF/layout/companyHeader.jsp");
		addDefaultLayoutDef("viewAllJobDesc", "View All Job", "/WEB-INF/jsp/viewAllJobDesc.jsp","/WEB-INF/layout/companyHeader.jsp");
		addDefaultLayoutDef("complteprofile", "cmpltprofile", "/WEB-INF/jsp/complteprofile.jsp","/WEB-INF/layout/header.jsp");
		addDefaultLayoutDef("companyProfilePage", "companyProfile", "/WEB-INF/jsp/companyProfile.jsp","/WEB-INF/layout/companyHeader.jsp");
		addDefaultLayoutDef("companyviewProfile12", "companyviewProfile", "/WEB-INF/jsp/companyviewProfile.jsp","/WEB-INF/layout/companyHeader.jsp");
		addDefaultLayoutDef("forgotPassPage", "Forgot Password", "/WEB-INF/jsp/forgotPass.jsp","/WEB-INF/layout/header.jsp");
		addDefaultLayoutDef("newPassword", "New Password", "/WEB-INF/jsp/createNewPassword.jsp","/WEB-INF/layout/companyHeader.jsp");
		addDefaultLayoutDef("userBasicInfoPage", "userBasicInfo", "/WEB-INF/jsp/userBasicInfo.jsp","/WEB-INF/layout/header.jsp");
		addDefaultLayoutDef("CompanyDetailsViewPage", "CompanyDetailsView", "/WEB-INF/jsp/CompanyDetailsView.jsp","/WEB-INF/layout/companyHeader.jsp");
		addDefaultLayoutDef("updateCompanyBasicProfilePage", "updateCompanyBasicProfile", "/WEB-INF/jsp/updateCompanyBasicProfile.jsp","/WEB-INF/layout/companyHeader.jsp");
		addDefaultLayoutDef("userHomePage", "userHome", "/WEB-INF/jsp/userHome.jsp","/WEB-INF/layout/header.jsp");
	}
}
