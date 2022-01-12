package com.project.UsERP.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface WaService {
	
	// 김은희 - 출퇴근 조회
	public void commuteList(HttpServletRequest req, Model model);
	
	// 김은희 - 근태 조회
	public void waList(HttpServletRequest req, Model model);
	
	// 김은희 - 근태 신청 사원 확인
	public void empComfirm(HttpServletRequest req, Model model);
	
	// 김은희 - 근태 신청 
	public void waAppInsert(HttpServletRequest req, Model model);
	
	// 김은희 - 출근 버튼 클릭
	public void waStartClick(HttpServletRequest req, Model model);
	
	// 김은희 - 퇴근 버튼 클릭
	public void waEndAction(HttpServletRequest req, Model model);
	
	// 김은희 - 야근 버튼 클릭
	public void waNightClick(HttpServletRequest req, Model model);
	
	// 김은희 - 인사 코드 조회 - 근태유형
	public void waCodeTyList(HttpServletRequest req, Model model);
	
	// 김은희 - 근태 신청 조회
	public void waAppSelect(HttpServletRequest req, Model model); 
	
	// 김은희 - 근태 신청 승인 상세페이지
	public void waDetail(HttpServletRequest req, Model model); 
	
	// 김은희 - 근태 신청 승인 처리
	public void waConfirmAction(HttpServletRequest req, Model model); 
	
	// 김은희 - 근태 신청 철회 처리
	public void waDeleteAction(HttpServletRequest req, Model model); 
	
	
	
}