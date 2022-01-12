package com.project.UsERP.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.firebase.messaging.FirebaseMessagingException;
import com.project.UsERP.persistence.AdDAO;
import com.project.UsERP.service.AdServiceImpl;
import com.project.UsERP.vo.AccountStatementVO;
import com.project.UsERP.vo.SalaryStatementVO;

// 회계 관리
@Controller
public class AdController {

	private static final Logger logger = LoggerFactory.getLogger(AdController.class);

	@Autowired
	AdServiceImpl adservice;
	
	@Autowired
	AdDAO addao;

	// 이재홍 & 강재현 - 기초 등록 
	@RequestMapping("/adBasicReg")
	public String adBasicReg(HttpServletRequest req, Model model) {
		logger.info("url: 기초 등록");

		return "ad/adBasicReg";
	}

	// 이재홍 - 기초 등록 - 계좌 리스트
	@RequestMapping("/banklist")
	public String banklist(HttpServletRequest req, Model model) {
		logger.info("url: 계정 관리 - 계정 리스트");

		adservice.bankList(req, model);

		return "ad/ajax/banklist";
	}

	// 이재홍 - 기초 등록 - 리액트 계좌 등록
	@RequestMapping("/bankadd")
	public String bankadd(HttpServletRequest req, Model model) {
		logger.info("url: 계좌 관리 - 리액트 계좌 등록");

		return "ad/ajax/bank";
	}

	// 강재현 - 기초 등록 - 계정 리스트
	@RequestMapping("/accountlist")
	public String accountlist(HttpServletRequest req, Model model) {
		logger.info("url: 계정 관리 - 계정 리스트");

		adservice.accountList(req, model);

		return "ad/ajax/accountList";
	}

	// 강재현 - 기초 등록 - 리액트 계정 등록
	@RequestMapping("/accountadd")
	public String accountadd(HttpServletRequest req, Model model) {
		logger.info("url: 계정 관리 - 리액트 계정 등록");

		return "ad/ajax/account";
	}

	// 강재현 & 이재홍 - 회계 보고서 
	@RequestMapping("/adReport")
	public String adReport(HttpServletRequest req, Model model) {
		logger.info("url: 회계 보고서");
		
		List<AccountStatementVO> list = addao.statementList();
		List<SalaryStatementVO> list1 = addao.salarystatementList();
		if(list.size() > 0 && list1.size() > 0) {			
			// 강재현 : 재무상태표	
			adservice.get12(req, model);
			
			// 이재홍 : 손익계산서 		
			adservice.sum(req, model);
		}
		return "ad/adReport";
	}

	// 강재현 & 이재홍 - 전표 관리
	@RequestMapping("/adStatementManagement")
	public String adStatementManagement(HttpServletRequest req, Model model) {
		logger.info("url: 전표 관리");

		// 강재현 - 회계 전표 리스트
		adservice.statementList(req, model);

		// 강재현 - 급여 전표 리스트
		adservice.salarystatementList(req, model);

		// 이재홍 - 채권,채무 전표 리스트
		adservice.bondDebtList(req, model);
		
		return "ad/adStatementManagement";
	}

	// 강재현 - 전표 관리 - 회계 전표 승인 + 미승인 상세페이지
	@RequestMapping("/content")
	public String content(HttpServletRequest req, Model model) {
		logger.info("url: 전표 관리 - 회계 전표 승인 + 미승인 상세페이지");

		adservice.content(req, model);

		return "ad/ajax/page";
	}
	
	// 강재현 - 전표 관리 - 회계 전표 승인
	@RequestMapping("/appr")
	public String appr(HttpServletRequest req, Model model) {
		logger.info("url: 전표 관리 - 회계 전표 승인");

		adservice.acstatmentAction(req, model);

		return "ad/adPro/apprAction";
	}

	// 강재현 - 전표 관리 - 회계 전표 승인 거부
	@RequestMapping("/reappr")
	public String reappr(HttpServletRequest req, Model model) {
		logger.info("url: 전표 관리 - 회계 전표 승인 거부");

		adservice.acstatmentdelAction(req, model);

		return "ad/adPro/apprAction";
	}
	
	// 강재현 - 전표 관리 - 급여 전표 승인 + 미승인 상세페이지
	@RequestMapping("/content1")
	public String content1(HttpServletRequest req, Model model) {
		logger.info("url: 전표 관리 - 급여 전표 승인 + 미승인 상세페이지");

		adservice.sacontent(req, model);

		return "ad/ajax/page2";
	}

	// 강재현 - 전표 관리 - 급여 전표 승인
	@RequestMapping("/saappr")
	public String saappr(HttpServletRequest req, Model model) throws FirebaseMessagingException {
		logger.info("url: 전표 관리 - 급여 전표 승인");

		adservice.sastatmentAction(req, model);

		return "ad/adPro/apprAction";
	}

	// 강재현 - 전표 관리 - 급여 전표 승인 거부
	@RequestMapping("/sareappr")
	public String sareappr(HttpServletRequest req, Model model) {
		logger.info("url: 전표 관리 - 급여 전표 승인 거부");

		adservice.sastatmentdelAction(req, model);

		return "ad/adPro/apprAction";
	}

	// 이재홍 - 전표 관리 - 채권 상세페이지
	@RequestMapping("/bondContent")
	public String content5(HttpServletRequest req, Model model) {
		logger.info("url: 전표 관리 - 채권 상세페이지");

		// 상세페이지
		adservice.bdContent(req, model);

		return "ad/ajax/bondDebPage";
	}

	// 이재홍 - 전표 관리 - 채무 상세페이지
	@RequestMapping("/debtContent")
	public String content6(HttpServletRequest req, Model model) {
		logger.info("url: 전표 관리 - 채무 상세페이지");

		// 상세페이지
		adservice.bdContent(req, model);

		return "ad/ajax/bondDebPage";
	}
	
	
}
