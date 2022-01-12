package com.project.UsERP.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.UsERP.service.PdServiceImpl;

// 구매 관리
@Controller
public class PdController {

	private static final Logger logger = LoggerFactory.getLogger(PdController.class);

	@Autowired
	PdServiceImpl pdService;

	// 최유성 - 기초 등록 - 판매 거래처 & 상품 목록
	@RequestMapping("/pdBasicReg")
	public String pdBasicReg(HttpServletRequest req, Model model) {
		logger.info("url: 기초 등록");

		pdService.pdBasicReg(req, model);

		return "pd/pdBasicReg";
	}

	// 최유성 - 기초 등록 - 구매 거래처 상세페이지
	@RequestMapping("/pdcomContent")
	public String comContent(HttpServletRequest req, Model model) {
		logger.info("url: 기초 등록 - 구매 거래처 상세페이지");

		// 상세페이지
		pdService.pdcomContent(req, model);

		return "pd/ajax/comPage";
	}

	// 최유성 - 기초 등록 - 상품 상세페이지
	@RequestMapping("/pdproContent")
	public String pdproContent(HttpServletRequest req, Model model) {
		logger.info("url: 기초 등록 - 상품 상세페이지");

		// 상세페이지
		pdService.pdproContent(req, model);

		return "pd/ajax/proPage";
	}

	// 최유성 - 재고 현황
	@RequestMapping("/pdInvenStatus")
	public String pdInvenStatus(HttpServletRequest req, Model model) {
		logger.info("url: 재고 현황");

		return "pd/pdInvenStatus";
	}

	// 최유성 - 재고 현황 - 재고 현황 검색 조회
	@RequestMapping("/pdInvenStatusList")
	public String pdInvenStatusList(HttpServletRequest req, Model model) {
		logger.info("url: 재고 현황 - 재고 현황 검색 조회");

		pdService.inventoryStatusList(req, model);

		return "pd/ajax/pdInvenStatusList";
	}

	// 이재홍 - 구매 현황 - 구매 내역 & 승인 내역 & 부족수량
	@RequestMapping("/pdStatus")
	public String pdStatus(HttpServletRequest req, Model model) {
		logger.info("url: 구매 현황 - 구매 내역 & 승인 내역 & 부족수량");

		// 구매 내역 & 승인 내역
		pdService.purStatus(req, model);

		// 구매 거래처 목록 & 상품 목록
		pdService.pdBasicReg(req, model);

		// 부족 수량 내역 조회
		pdService.logsshortage(req, model);

		return "pd/pdStatus";
	}

	// 이재홍 - 구매 현황 - 구매 내역 상세페이지
	@RequestMapping("/pdContent")
	public String pdContent(HttpServletRequest req, Model model) {
		logger.info("url: 구매 현황 - 구매 내역 상세페이지");

		pdService.pdContent(req, model);

		return "pd/ajax/pdPage";
	}

	// 부족수량 상세페이지
	@RequestMapping("/logsContent")
	public String logsContent(HttpServletRequest req, Model model) {
		logger.info("url: 부족수량 상세페이지 ");

		// 부족수량 상세페이지
		pdService.logsshortageContent(req, model);

		// 구매 거래처 목록 & 상품 목록
		pdService.pdBasicReg(req, model);

		return "pd/ajax/logacontent";
	}

	// 이재홍 - 구매 현황 - 구매 전표 등록
	@RequestMapping("/pdpdAppInsert")
	public String pdpdAppInsert(HttpServletRequest req, Model model) {
		logger.info("url: 구매 현황 - 구매 전표 등록");

		pdService.insertBuyStatement(req, model);

		return "pd/pdPro/pdpdaddAc";
	}

	// 이재홍 - 구매 현황 - 부족수량 구매 전표 등록
	@RequestMapping("/logsAppInsert")
	public String logsAppInsert(HttpServletRequest req, Model model) {
		logger.info("url: 구매 현황 - 부족수량 구매 전표 등록");

		pdService.insertLogStatement(req, model);

		return "pd/pdPro/pdpdaddAc";
	}

	// 최유성 - 입고 현황 - 입고 내역
	@RequestMapping("/pdRecStatus")
	public String pdRecStatus(HttpServletRequest req, Model model) {
		logger.info("url: 입고 현황 - 입고 내역");

		pdService.pdRecStatus(req, model);

		return "pd/pdRecStatus";
	}

	// 최유성 - 입고 현황 - 입고 내역 상세 페이지
	@RequestMapping("/pdRecStatusAjax")
	public String pdRecStatusAjax(HttpServletRequest req, Model model) {
		logger.info("url: 입고 현황 - 입고 내역 상세 페이지");

		pdService.pdRecStatusAjax(req, model);

		return "pd/ajax/pdRecStatusAjax";
	}

	// 최유성 - 입고 현황 - 회계 전표 내역
	@RequestMapping("/pdRecStatusAjax2")
	public String pdRecStatusAjax2(HttpServletRequest req, Model model) {
		logger.info("url: 입고 전표 등록 - 입고 전표 등록 페이지");

		pdService.pdRecStatusAjax2(req, model);

		return "pd/ajax/pdRecStatusAjax2";
	}

	// 최유성 - 입고 현황 - 입고 전표 등록
	@RequestMapping("/logsPdInsert")
	public String logsPdInsert(HttpServletRequest req, Model model) {
		logger.info("url: 입고 전표 등록 - 입고 전표 등록");

		pdService.logsPdInsert(req, model);

		return "pd/pdPro/logsPdInsert";
	}

}