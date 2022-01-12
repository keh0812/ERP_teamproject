package com.project.UsERP.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.UsERP.service.AdminService;
import com.project.UsERP.service.HrService;
import com.project.UsERP.service.WaService;

@Controller
public class UserpController {

	private static final Logger logger = LoggerFactory.getLogger(UserpController.class);

	@Autowired
	AdminService service;

	@Autowired
	WaService waService;
	
	@Autowired
	HrService hrService; 
	

	@RequestMapping("/")
	public String main(HttpServletRequest req, Model model) {
		logger.info("url: 메인 화면");
		
		service.weatherWidget(req, model);

		return "main";
	}

	// 강재현 - 메인 화면
	// 김은희 - 파이썬 날씨 정보 위젯 
	@RequestMapping("/main")
	public String main2(HttpServletRequest req, Model model) {
		logger.info("url: 메인 화면");
		
		service.weatherWidget(req, model);

		return "main";
	}

	// 강재현 - 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		logger.info("url: 로그아웃");

		session.invalidate();

		return "logout";
	}

	// 조명재 - 사원확인 - 사원확인 화면으로 이동한다
	@RequestMapping("/signin")
	public String signin(HttpServletRequest req, Model model) {
		logger.info("url: 사원확인 화면");

		return "signin";
	}

	// 조명재 - 사원확인 - 사원번호를 확인한다
	@RequestMapping("/confirm")
	public String confirm(HttpServletRequest req, Model model) {
		logger.info("url: 사원확인 팝업");

		service.confirm(req, model);

		return "confirm";
	}

	// 조명재 - 사원확인 - 사원확인 전송 클릭
	@RequestMapping("/signinPro")
	public String signinPro(HttpServletRequest req, Model model) {
		logger.info("url: 사원확인");

		service.signinPro(req, model);

		return "signinPro";
	}

	// 김은희 - 내 정보 수정페이지
	@RequestMapping("/mypage")
	public String mypage(HttpServletRequest req, Model model) {
		logger.info("url: 내 정보 수정페이지");
		
		hrService.depList(req, model);
		hrService.hrCodePosList(req, model);
		service.myPageDetail(req, model);

		return "mypage";
	}
	
	// 김은희 - 내 정보 수정 처리
	@RequestMapping("/mypageUpdateAction")
	public String mypageUpdateAction(MultipartHttpServletRequest req, Model model) {
		logger.info("url: 내 정보 수정 처리");
		
		service.mypageUpdateAction(req, model);
		
		return "mypageUpdateAction";
	}
	

}
