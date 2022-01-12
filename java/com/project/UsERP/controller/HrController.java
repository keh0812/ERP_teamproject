package com.project.UsERP.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.UsERP.service.HrService;

// 인사 관리 
@Controller
public class HrController {
 
	private static final Logger logger = LoggerFactory.getLogger(HrController.class);

	@Autowired
	HrService hrService;
	

	// 기초 등록
	@RequestMapping("/hrBasicReg")
	public String hrBasicReg(HttpServletRequest req, Model model) {
		logger.info("url: 기초 등록");
		hrService.hrCodeGroupList(req, model);
		hrService.hrCodeList(req, model);
		hrService.depList(req, model);
		return "hr/hrBasicReg";
	}
	
	// 김은희 - 인사 코드 그룹 조회 상세페이지
	@RequestMapping("/hrRegDetail")
	public String hrRegDetail(HttpServletRequest req, Model model) {
		logger.info("url: 인사 코드 그룹 조회 상세페이지");
		
		hrService.hrRegDetail(req, model);
		
		return "hr/ajax/hrRegDetail";
	}
	
	// 김은희 - 인사 코드 등록
	@RequestMapping("/hrCodeInsert")
	public String hrCodeInsert(HttpServletRequest req, Model model) {
		logger.info("url: 인사 코드 등록");
		
		hrService.hrCodeInsert(req, model);
  
		return "hr/hrPro/hrCodePro";
	}
	
	// 김은희 - 인사 코드 중복확인
	@RequestMapping("/hrConfirmHrCode")
	public String hrConfirmHrCode(HttpServletRequest req, Model model) {
		logger.info("url: 인사 코드 중복확인");
		
		hrService.hrConfirmHrCode(req, model);
		
		return "hr/hrConfirmHrCode";
	}
	
	// 김은희 - 인사 코드명 중복확인
	@RequestMapping("/hrConfirmHrName")
	public String hrConfirmHrName(HttpServletRequest req, Model model) {
		logger.info("url: 인사 코드명 중복확인");
		
		hrService.hrConfirmHrName(req, model);
		
		return "hr/hrConfirmHrName";
	}
	
	// 김은희 - 기초 등록 - 리액트 인사코드 그룹 등록
	@RequestMapping("/hrCodeGroupAdd")
	public String codegroupadd(HttpServletRequest req, Model model) {
		logger.info("url: 리액트 인사코드 그룹 등록");

		return "hr/ajax/hrCodeGroup";
	}

	// 김은희 - 기초 등록 - 리액트 인사코드 등록
	@RequestMapping("/hrCodeAdd")
	public String codeadd(HttpServletRequest req, Model model) {
		logger.info("url: 리액트 인사코드 등록");

		return "hr/ajax/hrCode";
	}

	// 조명재 - 기초 등록 - 리액트 부서 등록
	@RequestMapping("/departmentAdd")
	public String departmentadd(HttpServletRequest req, Model model) {
		logger.info("url: 리액트 부서 등록");

		return "hr/ajax/department";
	}
	
	// 조명재 - 인사 발령(중메뉴) - 인사 발령 조회
	@RequestMapping("/hrAppointment")
	public String hrAppointment(HttpServletRequest req, Model model) {
		logger.info("url: 인사 발령 조회");
		
		hrService.appointmentList(req, model);
		hrService.depList(req, model);
		hrService.hrCodePosList(req, model);

		return "hr/hrAppointment";
	}
	
	
	// 조명재 - 인사 발령(중메뉴) - 사원번호 확인
	@RequestMapping("/hrConfirmAppoint")
	public String hrConfirmAppoint(HttpServletRequest req, Model model) {
		logger.info("url: 사원번호 확인");
		
		hrService.hrConfirmAppoint(req, model);
		
		return "hr/hrConfirmAppoint";
	}
	
	// 조명재 - 인사 발령(중메뉴) - 인사 발령
	@RequestMapping("/hrAppointmentPro")
	public String hrAppointmentPro(HttpServletRequest req, Model model) {
		logger.info("url: 인사 발령");
		
		hrService.hrAppointmentPro(req, model);
		
		return "hr/hrPro/hrAppointmentPro";
	}

	// 인사 카드
	@RequestMapping("/hrCard")
	public String hrCard(HttpServletRequest req, Model model) {
		logger.info("url: 인사 카드");
		
		hrService.depList(req, model);
		hrService.hrCodePosList(req, model);
		hrService.hrCardList(req, model);
		hrService.hrLeaveList(req, model);
		hrService.hrRetireList(req, model);
		hrService.notdepList(req, model);
		
		return "hr/hrCard";
	}
	
	// 김은희 - 인사 카드 상세페이지 조회
	@RequestMapping("/hrCardDetail")
	public String hrCardDetail(HttpServletRequest req, Model model) {
		logger.info("url: 인사 카드 상세페이지 조회");
		
		hrService.hrCardDetail(req, model);
		
		return "hr/ajax/hrCardDetail";
	}
	
	// 김은희 - 인사 카드 등록
	@RequestMapping("/hrCardInsert")
	public String hrCardInsert(MultipartHttpServletRequest req, Model model) {
		logger.info("url: 인사 카드 등록");
		
		hrService.hrCardInsert(req, model);
  
		return "hr/hrPro/hrCardPro";
	}
	
	// 김은희 - 인사 카드 사번 중복확인
	@RequestMapping("/hrConfirmCode")
	public String hrConfirmCode(HttpServletRequest req, Model model) {
		logger.info("url: 인사 카드 사번 중복확인");
		
		hrService.hrConfirmCode(req, model);
		
		return "hr/hrConfirmCode";
	}
	
	// 조명재 - 급여
	@RequestMapping("/hrSalary")
	public String hrSalary(HttpServletRequest req, Model model) {
		logger.info("url: 급여");
		
		hrService.hrSalaryList(req, model);
		
		return "hr/hrSalary";
	}
	
	// 조명재 - 급여 - 사원번호 확인
	@RequestMapping("/hrSalaryCheck")
	public String hrSalaryCheck(HttpServletRequest req, Model model) {
		logger.info("url: 사원번호 확인");
		
		hrService.hrSalaryCheck(req, model);
		
		return "hr/hrSalaryCheck";
	}
	
	// 조명재 - 급여 전표 등록
	@RequestMapping("/hrSalaryInsert")
	public String hrSalaryInsert(HttpServletRequest req, Model model) {
		logger.info("url: 급여 전표 등록");
		
		hrService.hrSalaryInsert(req, model);
		
		return "hr/hrPro/hrSalaryInsPro";
	}
	
}