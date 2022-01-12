package com.project.UsERP.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface PdService {

	// 최유성 - 기초 등록
	public void pdBasicReg(HttpServletRequest req, Model model);

	// 최유성 - 기초 등록 - 구매 거래처 목록 상세페이지
	public void pdcomContent(HttpServletRequest req, Model model);

	// 최유성 - 기초 등록 - 상품 상세페이지
	public void pdproContent(HttpServletRequest req, Model model);

	// 김민수 - 재고 현황
	public void inventoryStatusList(HttpServletRequest req, Model model);

	// 이재홍 - 구매 현황 - 구매 내역 & 승인 내역
	public void purStatus(HttpServletRequest req, Model model);

	// 이재홍 - 구매 현황 - 구매 내역 상세페이지
	public void pdContent(HttpServletRequest req, Model model);

	// 이재홍 - 구매 현황 - 구매 전표 등록
	public void insertBuyStatement(HttpServletRequest req, Model model);

	// 이재홍 - 구매현황 - 부족수량 업데이트
	public void insertLogStatement(HttpServletRequest req, Model model);

	// 최유성 - 입고 현황
	public void pdRecStatus(HttpServletRequest req, Model model);

	// 최유성 - 입고 현황 - 회계 전표 내역
	public void pdRecStatusAjax(HttpServletRequest req, Model model);

	// 최유성 - 입고 현황 - 회계 전표 내역 상세
	public void pdRecStatusAjax2(HttpServletRequest req, Model model);

	// 최유성 - 입고 현황 - 입고 전표 등록
	public void logsPdInsert(HttpServletRequest req, Model model);

	// 부족 수량 내역 조회
	public void logsshortage(HttpServletRequest req, Model model);

	// 부족 수량 상세페이지
	public void logsshortageContent(HttpServletRequest req, Model model);

}