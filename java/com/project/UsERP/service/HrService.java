package com.project.UsERP.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface HrService {

	// 김은희 - 인사 코드 그룹 조회
	public void hrCodeGroupList(HttpServletRequest req, Model model);

	// 김은희 - 인사 코드 조회
	public void hrCodeList(HttpServletRequest req, Model model);
	
	// 조명재 - 인사 코드 조회 - 직급
	public void hrCodePosList(HttpServletRequest req, Model model);
	
	// 김은희 - 인사 코드 등록
	public void hrCodeInsert(HttpServletRequest req, Model model);
		
	// 김은희 - 인사 코드 중복확인
	public void hrConfirmHrCode(HttpServletRequest req, Model model);
	
	// 김은희 - 인사 코드명 중복확인
	public void hrConfirmHrName(HttpServletRequest req, Model model);

	// 조명재 - 부서 조회
	public void depList(HttpServletRequest req, Model model);
	
	// 조명재 - 인사 발령(중메뉴) - 인사 발령 조회
	public void appointmentList(HttpServletRequest req, Model model);
	
	// 조명재 - 인사 발령(중메뉴) - 사원번호 확인
	public void hrConfirmAppoint(HttpServletRequest req, Model model);
	
	// 조명재 - 인사 발령(중메뉴) - 인사 발령
	public void hrAppointmentPro(HttpServletRequest req, Model model);
	
	// 김은희 - 인사카드 조회
	public void hrCardList(HttpServletRequest req, Model model); 
	
	// 김은희 - 인사카드 상세페이지 조회
	public void hrCardDetail(HttpServletRequest req, Model model); 
	
	// 조명재 - 휴직 퇴직 부서 조회
	public void notdepList(HttpServletRequest req, Model model);
	
	// 김은희 - 인사카드 등록
	public void hrCardInsert(MultipartHttpServletRequest req, Model model);
	
	// 김은희 - 인사 카드 사번 중복확인
	public void hrConfirmCode(HttpServletRequest req, Model model); 
	
	// 조명재 - 휴직자 조회
	public void hrLeaveList(HttpServletRequest req, Model model);
	
	// 조명재 - 퇴직자 조회
	public void hrRetireList(HttpServletRequest req, Model model);
	
	// 김은희 - 인사 코드 그룹 조회 상세페이지
	public void hrRegDetail(HttpServletRequest req, Model model);
	
	// 조명재 - 급여 내역
	public void hrSalaryList(HttpServletRequest req, Model model);
	
	// 조명재 - 급여 - 사원번호 확인
	public void hrSalaryCheck(HttpServletRequest req, Model model);
	
	// 조명재 - 급여 - 급여전표 등록
	public void hrSalaryInsert(HttpServletRequest req, Model model);
	
}
