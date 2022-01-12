package com.project.UsERP.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.UsERP.service.LdServiceImpl;

// 물류 관리
@Controller
public class LdController {

	private static final Logger logger = LoggerFactory.getLogger(LdController.class);

	@Autowired
	LdServiceImpl ldservice;
	
	// 김민수 - 기초 등록
	@RequestMapping("/ldBasicReg")
	public String ldBasicReg(HttpServletRequest req, Model model) {
		logger.info("url: 기초 등록");
		
		return "ld/ldBasicReg";
	}
	
	// 김민수 - 검색 거래처 조회 
	@RequestMapping("/compSearchList")
	public String compSearchList(HttpServletRequest req, Model model) {
		logger.info("url : 검색 거래처 조회 ");
		
		ldservice.companyList(req, model);
		
		return "ld/ajax/compSearchList";
	}
	
	// 김민수 - 거래처 상세 페이지
	@RequestMapping("/logCompanyDetail")
	public String logCompanyDetail(HttpServletRequest req, Model model) {
		logger.info("url : 거래처 상세 페이지 ");
		
		ldservice.compInfoDetail(req, model);
		
		return "ld/ajax/logCompanyDetail";
	}
	
	// 김민수 - 검색 상품 조회
	@RequestMapping("/proSearchList")
	public String proSearchList(HttpServletRequest req, Model model) {
		logger.info("url : 검색 상품 조회 ");
		
		ldservice.productList(req, model);
		
		return "ld/ajax/proSearchList";
	}
	
	 // 김민수 - 창고 목록 AJAX
	@RequestMapping("/logWarehouseList")
	public String logWarehouseList(HttpServletRequest req, Model model) {
		logger.info("url: 창고 목록 AJAX");
		 
		ldservice.warehouseList(req, model);
		
		return "ld/ajax/logWarehouseList";
	}
	
	// 김민수 - 창고 목록 상세페이지 AJAX
	@RequestMapping("/logWarehouseDetail")
	public String logWarehouseDetail(HttpServletRequest req, Model model) {
		logger.info("url: 창고 목록 상세페이지 AJAX");
		
		ldservice.warehouseDetail(req, model);
		
		return "ld/ajax/logWarehouseDetail";
	}
	
	// 김민수 - 창고 관리 - 리액트 창고 등록
	@RequestMapping("/warehouseadd")
	public String codeadd(HttpServletRequest req, Model model) {
		logger.info("url: 리액트 창고 등록");

		return "ld/ajax/warehouse";
	}
	
	// 김민수 - 창고 정보 수정
	@RequestMapping("/wareModifyAction")
	public String wareModifyAction(HttpServletRequest req, Model model) {
		logger.info("url: 창고 정보 수정");

		ldservice.warehouseModify(req, model);
		
		return "ld/ldPro/wareModifyAction";
	}

	// 전표 관리 - 최유성
	@RequestMapping("/ldStatementManagement")
	public String ldStatementManagement(HttpServletRequest req, Model model) {
		logger.info("url: 전표 관리");
		
		ldservice.ldStatementManagement(req, model);
		
		return "ld/ldStatementManagement";
	}
	
	// 전표 관리 입고 승인 - 최유성
	@RequestMapping("/stockInAction")
	public String stockInAction(HttpServletRequest req, Model model) {
		logger.info("url: 전표 관리 입고 승인");
		
		ldservice.stockInAction(req, model);
		
		return "ld/stockInAction";
	}
	
	// 전표 관리 출고준비완료 승인 - 최유성
	@RequestMapping("/stockOutReady")
	public String stockOutReady(HttpServletRequest req, Model model) {
		logger.info("url: 전표 관리 출고준비완료 승인");
		
		ldservice.stockOutReady(req, model);
		
		return "ld/stockOutReady";
	}

	// 전표 관리 - 최유성 - 물류 전표 상세페이지 - 입고 미승인 전표 조회
	@RequestMapping("/ldStatementManagementContentAjax1")
	public String ldStatementManagementContentAjax1(HttpServletRequest req, Model model) {
		logger.info("url: 물류 전표 상세페이지 - 입고 미승인 전표 조회");
		
		ldservice.ldStatementManagementContent(req, model);
		
		return "ld/ajax/ldStatementManagementContentAjax1";
	}
	
	// 전표 관리 - 최유성 - 물류 전표 상세페이지 - 입고 승인 전표 조회
	@RequestMapping("/ldStatementManagementContentAjax2")
	public String ldStatementManagementContentAjax2(HttpServletRequest req, Model model) {
		logger.info("url: 물류 전표 상세페이지 - 입고 승인 전표 조회");
		
		ldservice.ldStatementManagementContent(req, model);
		
		return "ld/ajax/ldStatementManagementContentAjax2";
	}
	
	// 전표 관리 - 최유성 - 물류 전표 상세페이지 - 출고 미승인 전표 조회
	@RequestMapping("/ldStatementManagementContentAjax3")
	public String ldStatementManagementContentAjax3(HttpServletRequest req, Model model) {
		logger.info("url: 물류 전표 상세페이지 - 출고 미승인 전표 조회");
		
		ldservice.ldStatementManagementContent(req, model);
		
		return "ld/ajax/ldStatementManagementContentAjax3";
	}
	
	// 전표 관리 - 최유성 - 물류 전표 상세페이지 - 출고 승인 전표 조회
	@RequestMapping("/ldStatementManagementContentAjax4")
	public String ldStatementManagementContentAjax4(HttpServletRequest req, Model model) {
		logger.info("url: 물류 전표 상세페이지 - 출고 승인 전표 조회");
		
		ldservice.ldStatementManagementContent(req, model);
		
		return "ld/ajax/ldStatementManagementContentAjax4";
	}
	
	// 김민수 - 재고 관리 
	@RequestMapping("/ldInventoryControl")
	public String ldInventoryControl(HttpServletRequest req, Model model) {
		logger.info("url: 재고 관리");
		
		ldservice.ldStatementManagement(req, model);
		ldservice.shiRecList(req, model);
		
		return "ld/ldInventoryControl";
	}
	
	// 김민수 - 재고 현황 검색 조회 AJAX
	@RequestMapping("/logInvenStatus")
	public String logInvenStatus(HttpServletRequest req, Model model) {
		logger.info("url: 재고 현황 검색 조회 AJAX");
		
		ldservice.inventoryStatusList(req, model);
		
		return "ld/ajax/logInvenStatus";
	}
	  
	// 김민수 - 재고 이동 등록페이지 AJAX
	@RequestMapping("/logMoveWareInsert")
	public String logMoveWareInsert(HttpServletRequest req, Model model) {
		logger.info("url: 재고 이동 등록페이지 AJAX");
		
		ldservice.selectWarehouse(req, model);
		ldservice.selectProduct(req, model);
		ldservice.logsCodeShortList(req, model);
		
		return "ld/ajax/logMoveWareInsert";
	}
	
	// 김민수 - 입출고 상세페이지 AJAX
	@RequestMapping("/logMovehouseDetail")
	public String logMovehouseDetail(HttpServletRequest req, Model model) {
		logger.info("url: 재고 이동 상세페이지");
		
		ldservice.ldStatementManagementContent(req, model);
		
		return "ld/ajax/logMovehouseDetail";
	}
	
	// 김민수 - 입출고 승인페이지
	@RequestMapping("/moveWareSoInsert")
	public String moveWareSoInsert(HttpServletRequest req, Model model) {
		logger.info("url: 입출고 승인페이지");
		
		ldservice.moveStockOutUpIn(req, model);
		
		return "ld/ldPro/moveWareSoInsert";
	}
	
	  
	// 김민수 - 재고 조정페이지 AJAX
	@RequestMapping("/logInvenAdjustment")
	public String logInvenAdjustment(HttpServletRequest req, Model model) {
		logger.info("url: 재고 조정페이지 AJAX");
		
//		ldservice.selectWarehouse(req, model);
//		ldservice.selectProduct(req, model);
		ldservice.adjustmentList(req, model);
		
		return "ld/ajax/logInvenAdjustment";
	}
	
	// 김민수 - 재고 조정 신규등록페이지 AJAX
	@RequestMapping("/logAdjNewInsert")
	public String logAdjNewInsert(HttpServletRequest req, Model model) {
		logger.info("url: 재고 조정 신규등록페이지 AJAX");
		
		ldservice.selectWarehouse(req, model);
		ldservice.selectProduct(req, model);
		
		return "ld/ajax/logAdjNewInsert";
	}
	
	// 김민수 - 재고 조정 등록 리턴값 반환 AJAX
	@RequestMapping(value="/getAdjStock", method=RequestMethod.POST)
	public @ResponseBody String getAdjStock(HttpServletRequest req, Model model) {
		logger.info("url: 재고 조정 신규등록페이지 AJAX");
		return ldservice.adjGetStock(req, model);
	}
	
	// 김민수 - 재고 조정 등록
	@RequestMapping("/invenAdjInsert")
	public String invenAdjInsert(HttpServletRequest req, Model model) {
		logger.info("url: 재고 조정 등록");
		
		ldservice.adjNewInsert(req, model);
		
		return "ld/ldPro/invenAdjInsert";
	}
	
	// 김민수 - 재고 이동 처리(불량품창고, 부족수량 물류전표)
	@RequestMapping("/movelogsInsert")
	public String movelogsInsert(HttpServletRequest req, Model model) {
		logger.info("url: 재고 이동 처리");
		
		ldservice.moveWareInsert(req, model);
		
		return "ld/ldPro/movelogsInsert";
	}
	
	
	// 김민수 - 재고 수불부 AJAX
	@RequestMapping("/logInvenSupply")
	public String logInvenSupply(HttpServletRequest req, Model model) {
		logger.info("url: 재고 수불부AJAX");
		 
		return "ld/ajax/logInvenSupply";
	}
	
	// 김민수 - 재고 수불부 목록 AJAX
	@RequestMapping("/supplyListAction")
	public String supplyListAction(HttpServletRequest req, Model model) {
		logger.info("url: 재고 수불부 목록 AJAX");
		
		ldservice.supplyList(req, model);
		
		return "ld/ajax/supplyListAction";
	}
	
	// 부족 수량 구매팀한테 넘기기 
	@RequestMapping("/logsupdate")
	public String logsupdate(HttpServletRequest req, Model model) {
		logger.info("url: 재고 수불부 목록 AJAX");	
		ldservice.logsAction(req, model);
		return "ld/ldPro/logsAction";
	}
	
}
