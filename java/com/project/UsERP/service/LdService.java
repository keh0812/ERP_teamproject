package com.project.UsERP.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface LdService {
	
	// 최유성 - 전표 관리
	public void ldStatementManagement(HttpServletRequest req, Model model);
	
	// 최유성 - 입고 전표 승인 액션
	public void stockInAction(HttpServletRequest req, Model model);

	// 최유성 - 출고 준비 완료로 상태 변경 - 양품창고에서 출고대기창고로 물품 이동
	public void stockOutReady(HttpServletRequest req, Model model);

	// 최유성 - 물류 전표 상세페이지
	public void ldStatementManagementContent(HttpServletRequest req, Model model);

	// 김민수 - 창고 등록
	public void insertWarehouse(HttpServletRequest req, Model model);

	// 김민수 - 창고 목록
	public void warehouseList(HttpServletRequest req, Model model);

	// 김민수 - 창고 상세 목록
	public void warehouseDetail(HttpServletRequest req, Model model);

	// 김민수 - 창고 정보 수정
	public void warehouseModify(HttpServletRequest req, Model model);
	
	// 김민수 - 거래처 목록 조회(검색포함)
	public void companyList(HttpServletRequest req, Model model);
	
	// 김민수 - 거래처 상세 페이지
	public void compInfoDetail(HttpServletRequest req, Model model);
	
	// 김민수 - 상품 목록 조회(검색포함)
	public void productList(HttpServletRequest req, Model model);
	
	// 김민수 - 재고 현황(검색포함)
	public void inventoryStatusList(HttpServletRequest req, Model model);
	
	// 김민수 - 재고 관리 상품 조회
	public void selectProduct(HttpServletRequest req, Model model);
	
	// 김민수 - 재고 관리 창고 조회
	public void selectWarehouse(HttpServletRequest req, Model model);
	
	// 김민수 - 재고 이동 등록, 창고등록(불량품,출고대기), 수불부 내역등록
	public void moveWareInsert(HttpServletRequest req, Model model);
	
	// 김민수 - 재고 이동 출고 상태변경 / 재고수불부 등록
	public void moveStockOutUpIn(HttpServletRequest req, Model model);
	
	// 김민수 - 재고 조정 재고테이블 수량 가져오기
	public String adjGetStock(HttpServletRequest req, Model model);
	
	// 김민수 - 재고 조정 등록
	public void adjNewInsert(HttpServletRequest req, Model model);
	
	// 김민수 - 재고 조정 내역
	public void adjustmentList(HttpServletRequest req, Model model);
	
	// 김민수  - 재고 수불부 내역
	public void supplyList(HttpServletRequest req, Model model);
	
	// 김민수 - 부족수량 출고물류전표 조회
	public void logsCodeShortList(HttpServletRequest req, Model model);
	
	// 김민수 - 입출고 내역 조회
	public void shiRecList(HttpServletRequest req, Model model);
	
	// 김민수 - 구매팀 요청 보내기
	public void logsAction(HttpServletRequest req, Model model);
}
