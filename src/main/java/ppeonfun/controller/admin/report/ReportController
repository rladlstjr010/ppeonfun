package ppeonfun.controller.admin.report;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ppeonfun.dto.Information;
import ppeonfun.dto.Member;
import ppeonfun.dto.Project;
import ppeonfun.dto.Report;
import ppeonfun.service.admin.report.ReportService;
import ppeonfun.service.user.main.MainService;
import ppeonfun.util.Paging;



@Controller("admin.ReportController")
public class ReportController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReportController.class);
	@Autowired private ReportService reportService; 
	
	@RequestMapping(value ="/reportList", method = RequestMethod.GET)
	public String reportList(Model model, HttpServletRequest req) {
		List<Report> allReport = reportService.selectAllReport();
		List<Information> allInformation = reportService.selectAllInformation();
		List<Member> allMember = reportService.selectAllMember();
		List<Project> allProject = reportService.selectAllProject();
		

		List<Report> reportList = new ArrayList<Report>();
		List<Information> informationList = new ArrayList<Information>();
		List<Member> memberList = new ArrayList<Member>();
		List<Project> projectList = new ArrayList<Project>();
		
		boolean exist = false;
		
		for(int i=0; i<allReport.size(); ++i)  
		{
			Report report = allReport.get(i);
			
			for(int j=0; j<allInformation.size(); ++j)
			{
				Information information = allInformation.get(j);
				if(report.getpNo() == information.getpNo())
				{
					informationList.add(information);
					exist = true;
					break;
				}
			}
			
			if(exist == false)
				informationList.add(new Information());
			exist = false;
			
			for(int j=0; j<allMember.size(); ++j)
			{
				Member member = allMember.get(j);
				if(report.getmReporterNo() == member.getmNo())
				{
					memberList.add(member);
					exist = true;
					break;
				}
			}
			
			if(exist == false)
				memberList.add(new Member());
			exist = false;
			
			for(int j=0; j<allProject.size(); ++j)
			{
				Project project = allProject.get(j);
				if(report.getpNo() == project.getpNo())
				{
					projectList.add(project);
					exist = true;
					break;
				}
			}		
			
			if(exist == false)
				projectList.add(new Project());		
			exist = false;
			
			reportList.add(report);
		}
		
		req.setAttribute("reportList", reportList); 
		req.setAttribute("informationList", informationList); 
		req.setAttribute("memberList", memberList);
		req.setAttribute("projectList", projectList);
		
		return "admin/reportList"; 
	}
	
	
	@RequestMapping(value ="/reportSearch", method = RequestMethod.GET) 
	public String reportSearch(Model model, HttpServletRequest req, @RequestParam("RepNo") int repNo) { 
		List<Report> allReport = reportService.selectAllReport();
		List<Information> allInformation = reportService.selectAllInformation();
		List<Member> allMember = reportService.selectAllMember();
		List<Project> allProject = reportService.selectAllProject();
		

		Report report = new Report();
		Information information = new Information();
		Member member = new Member();
		Project project = new Project();
		
		
		for(int i=0; i<allReport.size(); ++i)
		{
			if(allReport.get(i).getRepNo() == repNo)
			{
				report = allReport.get(i);
				break;
			}
		}
		
		for(int i=0; i<allInformation.size(); ++i)
		{
			if(allInformation.get(i).getpNo() == report.getpNo())
			{
				information = allInformation.get(i);
				break;
			}
		}
		
		for(int i=0; i<allMember.size(); ++i)
		{
			if(allMember.get(i).getmNo() == report.getmReporterNo())
			{
				member = allMember.get(i);
				break;
			}
		}
		
		for(int i=0; i<allProject.size(); ++i)
		{
			if(allProject.get(i).getpNo() == report.getpNo())
			{
				project = allProject.get(i);
				break;
			}
		}		
					

		System.out.println(repNo);
		req.setAttribute("report", report); 
		req.setAttribute("information", information);
		req.setAttribute("member", member);
		req.setAttribute("project", project);
		
		return "admin/reportSearch"; 
	}	
	
	@RequestMapping(value = "/reportDelete")
	public String reportDelete(Model model, HttpServletRequest req) {
		System.out.println(req.getParameter("RepNo"));

		return "redirect: reportList";
	}
	
	@RequestMapping(value = "/reportDelete", method = RequestMethod.POST)
	public void reportDeletePost(Model model, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		int num = Integer.parseInt(req.getParameter("RepNo")); 
		reportService.deleteByNum(num);
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = resp.getWriter(); 
		writer.println(""
				+ "<script>alert('삭제 성공'); "
				+ "location.href='reportList';"
				+ "</script>"); 
	}
	
	@RequestMapping(value = "/reportApprove")
	public String reportApprove(Model model, HttpServletRequest req) {
		System.out.println(req.getParameter("RepNo"));

		return "redirect: /eportList";
	}		
	
	@RequestMapping(value = "/reportApprove", method = RequestMethod.POST) 
	public void reportApprovePost(Model model, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		int num = Integer.parseInt(req.getParameter("RepNo"));
		reportService.approveByNum(num);
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = resp.getWriter(); 
		writer.println(""
				+ "<script>alert('승인 성공'); "
				+ "location.href='reportList';"
				+ "</script>"); 

	}	
	
	@RequestMapping(value = "/reportReject")
	public String reportReject(Model model, HttpServletRequest req) {
		System.out.println(req.getParameter("RepNo"));

		return "redirect: reportList";
	}		
	
	@RequestMapping(value = "/reportReject", method = RequestMethod.POST) 
	public void reportRejectPost(Model model, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		int num = Integer.parseInt(req.getParameter("RepNo"));
		System.out.println(num);
		reportService.rejectByNum(num);
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = resp.getWriter(); 
		writer.println(""
				+ "<script>alert('거부 성공'); "
				+ "location.href='reportList';"
				+ "</script>"); 
	}		
	
	@RequestMapping(value = "/reportManage")
	public String reportManage(Model model, HttpServletRequest req) {

		return "admin/reportManage";
	}		
	
	@RequestMapping(value = "/reportRegister") 
	public String reportRegister(Model model, HttpServletRequest req) {
		List<Member> allMember = reportService.selectAllMember();
		List<Project> allProject = reportService.selectAllProject();
		
		int pNo = -1;
		int mReporterNo = -1;
		
		String pName = req.getParameter("Name");
		String mName = req.getParameter("Writer");
		
		for(int i=0; i<allProject.size(); ++i) {
			if(allProject.get(i).getpName().equals(pName) )
			{
				pNo = allProject.get(i).getpNo();
				break;
			}
		}
		
		for(int i=0; i<allMember.size(); ++i) {
			if(allMember.get(i).getmName().equals(mName) )
			{
				mReporterNo = allMember.get(i).getmNo();
				break;
			}
		}
		
		System.out.println(pNo);
		System.out.println(mReporterNo);
		
		req.setAttribute("pNo", pNo);
		req.setAttribute("mReporterNo", mReporterNo);
		
		

		return "admin/reportRegister";
	}			
	

	
	@RequestMapping(value = "/reportRegister", method = RequestMethod.POST)
	public void reportRegisterPost(Model model, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		List<Member> allMember = reportService.selectAllMember();
		
		int repNo = Integer.parseInt(req.getParameter("repNo"));
		int pNo =  Integer.parseInt(req.getParameter("pNo"));
		int mReporterNo = Integer.parseInt(req.getParameter("mReporterNo"));
		String repContent = req.getParameter("repContent");
		Date repCreateDate = new Date();
		String repManagerContent =  req.getParameter("repManagerContent");
		String repState = "W";
		int mFounderNo = -1;
		

		String adminId = req.getParameter("adminId");
		
		for(int i=0; i<allMember.size(); ++i) {
			System.out.println(allMember.get(i).getmId());
			if(allMember.get(i).getmId().equals(adminId) )
			{
				mFounderNo = allMember.get(i).getmNo();
				break;
			}
		}
		
		
		Report report = new Report();
		
		report.setRepNo(repNo);
		report.setpNo(pNo);
		report.setmReporterNo(mReporterNo);
		report.setmFounderNo(mFounderNo);
		report.setRepContent(repContent);
		report.setRepCreateDate(repCreateDate);
		report.setRepManagerContent(repManagerContent);
		report.setRepState(repState);
		

		reportService.insertReport(report);
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = resp.getWriter(); 
		writer.println(""
				+ "<script>alert('등록 성공'); "
				+ "location.href='reportList';"
				+ "</script>"); 
	}		
	
}
