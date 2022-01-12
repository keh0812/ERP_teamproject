package com.project.UsERP.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.UsERP.service.LdServiceImpl;
import com.project.UsERP.service.PdServiceImpl;
import com.project.UsERP.service.StServiceImpl;

// 판매 관리
@Controller
public class StController {

	private static final Logger logger = LoggerFactory.getLogger(StController.class);

	@Autowired
	StServiceImpl stService;

	@Autowired
	LdServiceImpl ldService;

	@Autowired
	PdServiceImpl pdService;

	// 강재현 - 기초 등록 - 판매 거래처 & 상품 목록 
	@RequestMapping("/stBasicReg")
	public String stBasicReg(HttpServletRequest req, Model model) {
		logger.info("url: 강재현 : 판매 거래처 목록 & 상품 목록");

		stService.salesBasicReg(req, model);

		return "st/stBasicReg";
	}

	// 강재현 - 기초 등록 - 판매 거래처 상세페이지
	@RequestMapping("/comContent")
	public String comContent(HttpServletRequest req, Model model) {
		logger.info("url: 판매 내역 상세페이지");

		// 상세페이지
		stService.comContent(req, model);

		return "st/ajax/comPage";
	}

	// 강재현 - 기초 등록 - 리액트 거래처 등록
	@RequestMapping("/clientadd")
	public String clientadd(HttpServletRequest req, Model model) {
		logger.info("url: 리액트 거래처 등록");

		return "st/ajax/client";
	}

	// 강재현 - 기초 등록 - 리액트 상품 등록
	@RequestMapping("/productadd")
	public String productadd(HttpServletRequest req, Model model) {
		logger.info("url: 리액트 상품 등록");

		return "st/ajax/product";
	}

	// 강재현 - 재고 현황
	@RequestMapping("/stInvenStatus")
	public String stInvenStatus(HttpServletRequest req, Model model) {
		logger.info("url: 회계 보고서");

		return "st/stInvenStatus";
	}
		
	// 강재현 - 재고 현황 검색 조회
	@RequestMapping("/stInvenStatusList")
	public String stInvenStatusList(HttpServletRequest req, Model model) {
		logger.info("url: 재고 현황 검색 조회");
			 
		stService.inventoryStatusList(req, model);
			
		return "st/ajax/stInvenStatusList";
	}

	// 이재홍 - 판매 현황 - 판매 내역 & 승인 내역
	@RequestMapping("/stStatus")
	public String stStatus(HttpServletRequest req, Model model) {
		logger.info("url: 이재홍 : 판매 현황 - 판매 내역 & 승인 내역");

		// 판매 내역 & 승인 내역
		stService.salesStatus(req, model);

		// 판매 거래처 목록 & 상품 목록
		stService.salesBasicReg(req, model);

		return "st/stStatus";
	}

	// 이재홍 - 판매 현황 - 판매 내역 상세페이지
	@RequestMapping("/stContent")
	public String stContent(HttpServletRequest req, Model model) {
		logger.info("url: 판매 내역 상세페이지");

		// 상세페이지
		stService.stContent(req, model);

		return "st/ajax/stPage";
	}

	// 이재홍 - 판매 현황 - 판매 전표 등록
	@RequestMapping("/ststAppInsert")
	public String ststAppInsert(HttpServletRequest req, Model model) {
		logger.info("url: 판매 전표 등록");

		stService.insertSalesStatement(req, model);

		return "st/stPro/ststaddAc";
	}

	// 강재현 - 출고 현황 - 출고 내역
	@RequestMapping("/stRelStatus")
	public String stRelStatus(HttpServletRequest req, Model model) {
		logger.info("url: 출고 내역");

		// 출고 내역
		stService.salesRecStatus(req, model);

		// 회계 전표 불러오기
		stService.stList(req, model);

		// 판매 거래처 목록 & 상품 목록
		stService.salesBasicReg(req, model);
		return "st/stRelStatus";
	}

	// 강재현 - 출고 현황 - 회계 전표 내역
	@RequestMapping("/select")
	public String select(HttpServletRequest req, Model model) {
		logger.info("url: 승인된 회계 전표 불러오기");

		stService.selectList(req, model);

		return "st/ajax/select";
	}

	// 강재현 - 출고 현황 - 출고 전표 등록
	@RequestMapping("/logsstInsert")
	public String logsstInsert(HttpServletRequest req, Model model) {
		logger.info("url: 출고 전표 등록");

		// 판매내역
		stService.insertLogsStatement(req, model);

		return "st/stPro/ststaddAc";
	}
}
