package com.project.UsERP.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.UsERP.service.HrService;
import com.project.UsERP.service.WaService;

// 근태 관리
@Controller
public class WaController {

	private static final Logger logger = LoggerFactory.getLogger(WaController.class);
	
	@Autowired
	WaService waService;
 
	@Autowired
	HrService hrService;
	
	// 김은희 - 근태 조회
	@RequestMapping("/waSelect")
	public String waSelect(HttpServletRequest req, Model model) {
		logger.info("url: 근태 조회");
	
		waService.commuteList(req, model);
		waService.waList(req, model);
		
		return "wa/waSelect";
	}
	
	// 김은희 - 근태 신청 페이지
	@RequestMapping("/waApplication")
	public String waApplication(HttpServletRequest req, Model model) {
		logger.info("url: 근태 신청 페이지");
		
		waService.waCodeTyList(req, model);
		hrService.depList(req, model);
		
		return "wa/waApplication";
	}
	
	// 김은희 - 근태 신청 사원 확인
	@RequestMapping("/empComfirm")
	public String empComfirm(HttpServletRequest req, Model model) {
		logger.info("url: 근태 신청 사원 확인");
	
		waService.empComfirm(req, model);
		
		return "wa/waComfirmEmp";
	}
	
	// 김은희 - 근태 신청 
	@RequestMapping("/waAppInsert")
	public String waAppInsert(HttpServletRequest req, Model model) {
		logger.info("url: 근태 신청");
		
		waService.waAppInsert(req, model);
	
		return "wa/waPro/waAppInsertPro";
	}
	
	// 김은희 - 출근 버튼 클릭
	@RequestMapping("/waStartClick")
	public String waStartClick(HttpServletRequest req, Model model) {
		logger.info("url: 출근 버튼 클릭");
		
		waService.waStartClick(req, model);
		waService.commuteList(req, model);
		
		return "wa/waPro/waStartClickPro";
	}
	
	// 김은희 - 퇴근 버튼 클릭
	@RequestMapping("/waEndClick")
	public String waEndClick(HttpServletRequest req, Model model) {
		logger.info("url: 퇴근 버튼 클릭");
		
		return "wa/waPro/waEndActionPro";
	}
	
	// 김은희 - 퇴근 처리
	@RequestMapping("/waEndAction")
	public String waEndAction(HttpServletRequest req, Model model) {
		logger.info("url: 퇴근 처리");
		
		waService.waEndAction(req, model);
		
		return "redirect:/waSelect";
	}
	
	// 김은희 - 야근 버튼 클릭
	@RequestMapping("/waNightClick")
	public String waNightClick(HttpServletRequest req, Model model) {
		logger.info("url: 야근 버튼 클릭");
		
		waService.waNightClick(req, model);
		
		return "wa/waPro/waNightActionPro";
	}
	
	// 김은희 - 근태 신청 승인 페이지
    @RequestMapping("/waConfirm")
    public String waConfirm(HttpServletRequest req, Model model) {
       logger.info("url: 근태 신청 승인 페이지");
       
	   waService.waAppSelect(req, model);
	   
       return "wa/waConfirm";
    }
	
	// 김은희 - 근태 신청 승인 상세페이지
    @RequestMapping("/waDetail")
    public String waDetail(HttpServletRequest req, Model model) {
       logger.info("url: 근태 신청 승인 상세페이지");
       
       waService.waDetail(req, model);
       waService.waAppSelect(req, model);
       
       return "wa/ajax/waDetail";
    }
    
    // 김은희 - 근태 신청 승인 처리
    @RequestMapping("/waConfirmAction")
    public String waConfirmAction(HttpServletRequest req, Model model) {
       logger.info("url: 근태 신청 승인 처리");
       
       waService.waConfirmAction(req, model);
       
       return "wa/waPro/waConfirmActionPro";
    }
    
    // 김은희 - 근태 신청 철회 처리
    @RequestMapping("/waDeleteAction")
    public String waDeleteAction(HttpServletRequest req, Model model) {
       logger.info("url: 근태 신청 철회 처리");
       
       waService.waDeleteAction(req, model);
       
       return "wa/waPro/waDeleteActionPro";
    }

    
	
}
