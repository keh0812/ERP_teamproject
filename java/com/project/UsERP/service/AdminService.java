package com.project.UsERP.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface AdminService {

	// 조명재 - 사원확인 - 사원번호를 확인한다
	public void confirm(HttpServletRequest req, Model model);

	// 조명재 - 사원확인 - 사원확인 전송 클릭
	public void signinPro(HttpServletRequest req, Model model);
	
	// 김은희 - 내 정보 수정 페이지
	public void myPageDetail(HttpServletRequest req, Model model);
	
	// 김은희 - 내 정보 수정 처리
	public void mypageUpdateAction(MultipartHttpServletRequest req, Model model);
	
	// 김은희 - 파이썬 날씨 정보 위젯 
	public void weatherWidget(HttpServletRequest req, Model model);
}
