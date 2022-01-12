package com.project.UsERP.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface StService {

	// 강재현 - 기초등록 - 판매 거래처 목록 & 상품 목록
	public void salesBasicReg(HttpServletRequest req, Model model);

	// 강재현 - 기초등록 - 판매 거래처 목록 상세페이지
	public void comContent(HttpServletRequest req, Model model);

	// 강재현 - 재고현황
	public void inventoryStatusList(HttpServletRequest req, Model model);

	// 이재홍 - 판매 현황 - 판매 내역 & 승인 내역
	public void salesStatus(HttpServletRequest req, Model model);

	// 이재홍 - 판매 현황 - 판매 전표 상세페이지
	public void stContent(HttpServletRequest req, Model model);

	// 이재홍 - 판매 현황 - 판매 전표 등록
	public void insertSalesStatement(HttpServletRequest req, Model model);

	// 강재현 - 출고 현황 - 출고 내역
	public void salesRecStatus(HttpServletRequest req, Model model);

	// 강재현 - 판매 현황 - 회계 전표 내역
	public void stList(HttpServletRequest req, Model model);

	// 강재현 - 출고 현황 - 회계 전표 내역 상세
	public void selectList(HttpServletRequest req, Model model);

	// 강재현 - 출고 현황 - 출고 전표 등록
	public void insertLogsStatement(HttpServletRequest req, Model model);
}
