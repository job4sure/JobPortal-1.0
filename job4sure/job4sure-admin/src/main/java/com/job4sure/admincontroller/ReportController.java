package com.job4sure.admincontroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.job4sure.model.City;
import com.job4sure.model.CompanyProfileModel;
import com.job4sure.model.CompanySearch;
import com.job4sure.model.JobDescription;
import com.job4sure.model.Registration;
import com.job4sure.model.UserProfile;
import com.job4sure.repository.CompanyReportRepository;
import com.job4sure.service.AdminJobDescriptionService;
import com.job4sure.service.JobDescriptionService;
import com.job4sure.service.ReportService;
import com.job4sure.service.UserProfileService;
import com.job4sure.util.IConstant;

@Controller
public class ReportController {
	@Autowired
	private ReportService reportService;

	@Autowired
	private UserProfileService userProfileService;

	@Autowired
	private JobDescriptionService jobDescriptionService;

	@Autowired
	AdminJobDescriptionService adminJobDescriptionService;

	@Autowired
	CompanyReportRepository companyReportRepository;

	@RequestMapping(value = "/companyList", method = RequestMethod.GET)
	public String ShowCompanyList(ModelMap model) {
		@SuppressWarnings("unchecked")
		List<CompanyProfileModel> companyList = reportService.getCompanyList();
		model.addAttribute("companyList", companyList);
		model.addAttribute("cityList", reportService.getCityList());
		model.addAttribute("stateList", reportService.getStateList());
		model.addAttribute("companySearch", new CompanySearch());
		return "CompanyList";
	}

	@SuppressWarnings("unused")
	@RequestMapping(value = "/companySearch", method = RequestMethod.POST)
	public String companySearchresult(ModelMap map, @ModelAttribute("companySearch") CompanySearch companySearch) {
		String cityLoc = companySearch.getCityId();
		String companyName = companySearch.getTxtSearch();

		if (companyName == "" && Integer.parseInt(cityLoc) == 0) {
			map.addAttribute("msg","please select one feild");
			List<Registration> joblist = reportService.getCompanyList();
			map.addAttribute("cityList", reportService.getCityList());
			map.addAttribute("stateList", reportService.getStateList());
			map.addAttribute("companyList", joblist);
		}

		if (companyName != "" && Integer.parseInt(cityLoc) != 0) {
			List<CompanyProfileModel> companyBySearch = reportService.getCompanyBySearch(companyName, Integer.parseInt(cityLoc));

			if (companyBySearch.isEmpty()) {
				map.addAttribute("msg", "NO MACHING FOUND");
				List<Registration> joblist = reportService.getCompanyList();
				map.addAttribute("cityList", reportService.getCityList());
				map.addAttribute("stateList", reportService.getStateList());
				map.addAttribute("companyList", joblist);

			} else {
				map.addAttribute("msg", companyBySearch.size() + " Result Found");
				map.addAttribute("cityList", reportService.getCityList());
				map.addAttribute("stateList", reportService.getStateList());
				map.addAttribute("companyList", companyBySearch);
			}

		}
		if (companyName != "" && Integer.parseInt(cityLoc) == 0) {
			List<CompanyProfileModel> companyBySearch = reportService.getCompanyBySearch(companyName);
			if (companyBySearch.isEmpty()) {
				map.addAttribute("msg", "NO MACHING FOUND");
				List<Registration> joblist = reportService.getCompanyList();
				map.addAttribute("cityList", reportService.getCityList());
				map.addAttribute("stateList", reportService.getStateList());
				map.addAttribute("companyList", joblist);

			} else {
				map.addAttribute("msg", companyBySearch.size() + " Result Found");
				map.addAttribute("cityList", reportService.getCityList());
				map.addAttribute("stateList", reportService.getStateList());
				map.addAttribute("companyList", companyBySearch);
			}
		}

		return "CompanyList";
	}

	/*
	 * @RequestMapping(value = "/forSearch", method = RequestMethod.POST) public
	 * String ShowSearchResult(ModelMap model, @ModelAttribute("UserProfile")
	 * UserProfile userProfile,
	 * 
	 * @RequestParam(required = false) String txtNamSer) {
	 * 
	 * System.out.println(); String loc = userProfile.getCityId() + "";
	 * 
	 * model.addAttribute("cityList", reportService.getCityList());
	 * System.out.println(txtNamSer + "name aa gya");
	 * 
	 * @SuppressWarnings("unchecked") List<Registration> userList =
	 * reportService.getUserListBySer(txtNamSer, loc);
	 * model.addAttribute("userList", userList);
	 * 
	 * return "UserList"; }
	 */

	
	/*  @RequestMapping(value = "/listByRole", method = RequestMethod.GET) public
	  String showSubAdminList(Map<String, Object> map, ModelMap model,
	  
	  @RequestParam(required = false) String id) { map.put("UserProfile", new
	  UserProfile()); if (!id.equals("JD")) { int roleId =
	  Integer.parseInt(id); List list=null; if(roleId==2) {
	  List<CompanyProfileModel>
	  companyProfileList=reportService.getCompanyList();
	  list=companyProfileList; model.addAttribute("companySearch",new
	  CompanySearch()); model.addAttribute("ComapnyProfile", new
	  CompanyProfileModel()); } if(roleId==1) { List<Registration> list1 =
	  reportService.getListByRoleId(roleId); list=list1;
	  model.addAttribute("UserProfile", new UserProfile()); } if(roleId==4)
	  {List<Registration> list2 = reportService.getListByRoleId(roleId);
	  list=list2; }
	  
	  List<Registration> list = reportService.getListByRoleId(roleId);
	  System.out.println("hhii"); model.addAttribute("list", list);
	  
	  
	  model.addAttribute("cityList", reportService.getCityList());
	  model.addAttribute("stateList", reportService.getStateList());
	  model.addAttribute("checkList", "role");
	  
	 
	  } else { List<JobDescription> joblist = adminJobDescriptionService
	  .getJobDescriptionList(IConstant.JD_APPROVED_STATUS); if
	  (joblist.isEmpty()) model.addAttribute("message", IConstant.EMPTY_LIST);
	  else {
	  
	  model.addAttribute("list", joblist); model.addAttribute("message",
	  IConstant.NOT_EMPTY_LIST); model.addAttribute("checkList", "JD"); } }
	  
	  map.put("UserProfile", new UserProfile()); model.addAttribute("userList",
	  userList); model.addAttribute("cityList", reportService.getCityList());
	  
	  return "UserList"; }
*/
	@RequestMapping(value = "/listOfJd", method = RequestMethod.GET)
	public String showApprovedJdList(Map<String, Object> map, ModelMap model) {

		List<JobDescription> joblist = adminJobDescriptionService.getJobDescriptionList(IConstant.JD_APPROVED_STATUS);
		if (joblist.isEmpty())
			model.addAttribute("message", IConstant.EMPTY_LIST);
		else {

			model.addAttribute("list", joblist);
			model.addAttribute("title", IConstant.NOT_EMPTY_JD_LIST_IN_REPORT);
			model.addAttribute("checkList", "JD");
		}
		model.addAttribute("experienceList", jobDescriptionService.getAllExperience());
		map.put("JobDescription", new JobDescription());
		model.addAttribute("stateList", reportService.getStateList());

		/*
		 * map.put("UserProfile", new UserProfile());
		 * model.addAttribute("userList", userList);
		 * model.addAttribute("cityList", reportService.getCityList());
		 */
		return "approvedJdList";
	}

	@RequestMapping(value = "/searchForJd", method = RequestMethod.POST)
	public String searchResultForJd(ModelMap model, @ModelAttribute("JobDescription") JobDescription jobDescription,
					@RequestParam(required = false) String searchByTitle,
					@RequestParam(required = false) String searchByLocation,
					@RequestParam(required = false) String searchByExp) {
		List<JobDescription> list = null;
		if (searchByTitle == "") {
			searchByTitle = "";

		}

		if (searchByExp.equals("-1")) {
			searchByExp = "";

		}
		if (searchByTitle == "" && Integer.parseInt(searchByLocation) == 0 && searchByExp == "") {
			// error
		} else if (Integer.parseInt(searchByLocation) == 0) {
			list = reportService.searchJDCommon(searchByTitle, searchByExp);
		} else {
			list = reportService.searchJDCommon(searchByTitle, Integer.parseInt(searchByLocation), searchByExp);

		}
		model.addAttribute("list", list);

		/*
		 * System.out.println("jj"); if(searchByTitle == "" && searchByTitle ==
		 * "" && searchByExp.equals("-1")){ model.addAttribute("message",
		 * "Please fill any one box."); List<JobDescription> joblist =
		 * adminJobDescriptionService
		 * .getJobDescriptionList(IConstant.JD_APPROVED_STATUS);
		 * model.addAttribute("list", joblist); } if (searchByTitle != null &&
		 * searchByTitle != "") { List<JobDescription> jobDescriptionList =
		 * reportService.searchJdListByJobtitle(searchByTitle); if
		 * (jobDescriptionList.isEmpty()) { model.addAttribute("message",
		 * "No result found.please try with different keywords");
		 * List<JobDescription> joblist = adminJobDescriptionService
		 * .getJobDescriptionList(IConstant.JD_APPROVED_STATUS);
		 * model.addAttribute("list", joblist); } else{
		 * model.addAttribute("message",
		 * jobDescriptionList.size()+" results founds");
		 * model.addAttribute("list", jobDescriptionList);
		 * model.addAttribute("title", IConstant.NOT_EMPTY_JD_LIST_IN_REPORT); }
		 * 
		 * } if (!searchByLocation.equals("0")) { List<JobDescription>
		 * jobDescriptionList = reportService.searchJdListByLocation(Integer
		 * .parseInt(searchByLocation)); if (jobDescriptionList.isEmpty()) {
		 * model.addAttribute("message",
		 * "No result found.please try with different city");
		 * List<JobDescription> joblist = adminJobDescriptionService
		 * .getJobDescriptionList(IConstant.JD_APPROVED_STATUS);
		 * model.addAttribute("list", joblist); } else{
		 * model.addAttribute("list", jobDescriptionList);
		 * model.addAttribute("message",
		 * jobDescriptionList.size()+" results founds");
		 * model.addAttribute("title", IConstant.NOT_EMPTY_JD_LIST_IN_REPORT); }
		 * 
		 * }
		 * 
		 * if (searchByTitle != null && searchByTitle != "" &&
		 * !searchByLocation.equals("0")) { List<JobDescription>
		 * jobDescriptionList =
		 * reportService.searchJdListByJobtitleAndLocation(searchByTitle,
		 * Integer.parseInt(searchByLocation));
		 * if(jobDescriptionList.isEmpty()){ model.addAttribute("message",
		 * "No result found.please try with different keywords");
		 * List<JobDescription> joblist = adminJobDescriptionService
		 * .getJobDescriptionList(IConstant.JD_APPROVED_STATUS);
		 * model.addAttribute("list", joblist); } else{
		 * model.addAttribute("message",
		 * jobDescriptionList.size()+" results founds");
		 * model.addAttribute("list", jobDescriptionList);
		 * model.addAttribute("title", IConstant.NOT_EMPTY_JD_LIST_IN_REPORT); }
		 * } if(!searchByExp.equals("-1")){ List<JobDescription>
		 * jobDescriptionList =
		 * reportService.searchJdListByExperience(searchByExp);
		 * if(jobDescriptionList.isEmpty()){ model.addAttribute("message",
		 * "No result found.please try with different experience");
		 * List<JobDescription> joblist = adminJobDescriptionService
		 * .getJobDescriptionList(IConstant.JD_APPROVED_STATUS);
		 * model.addAttribute("list", joblist); } else{
		 * model.addAttribute("list", jobDescriptionList);
		 * model.addAttribute("message",
		 * jobDescriptionList.size()+" results founds");
		 * model.addAttribute("title", IConstant.NOT_EMPTY_JD_LIST_IN_REPORT); }
		 * }
		 * 
		 * if(searchByTitle!=null&&!searchByExp.equals("-1")){
		 * List<JobDescription> jobDescriptionList =
		 * reportService.searchJdListByJobtitleAndExperience
		 * (searchByTitle,searchByExp); if(jobDescriptionList.isEmpty()){
		 * model.addAttribute("message",
		 * "No result found.please try with different keywords");
		 * List<JobDescription> joblist = adminJobDescriptionService
		 * .getJobDescriptionList(IConstant.JD_APPROVED_STATUS);
		 * model.addAttribute("list", joblist); } else{
		 * model.addAttribute("list", jobDescriptionList);
		 * model.addAttribute("message",
		 * jobDescriptionList.size()+" results founds");
		 * model.addAttribute("title", IConstant.NOT_EMPTY_JD_LIST_IN_REPORT); }
		 * }
		 */
		model.addAttribute("experienceList", jobDescriptionService.getAllExperience());
		model.addAttribute("stateList", reportService.getStateList());

		return "approvedJdList";
	}

	@RequestMapping(value = "/getCityListByStateId", method = { RequestMethod.GET })
	@ResponseBody
	public Map<String, List<City>> getAllCityByStateId(@RequestParam Integer stateId) {
		Map<String, List<City>> cityListMap = new HashMap<String, List<City>>();
		List<City> cityList = userProfileService.getCity(stateId);
		cityListMap.put("cityList", cityList);
		return cityListMap;

	}

}
