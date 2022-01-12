package com.project.UsERP.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.google.firebase.messaging.FirebaseMessagingException;

public interface AdService {

	// 이재홍 - 기초 등록 - 계좌 리스트
	public void bankList(HttpServletRequest req, Model model);

	// 강재현 - 기초 등록 - 계정 리스트
	public void accountList(HttpServletRequest req, Model model);

	// 강재현 - 회계보고서 - 재무상태표
	public void get12(HttpServletRequest req, Model model);

	// 이재홍 - 회계보고서 - 손익계산서
	public void sum(HttpServletRequest req, Model model);

	// 강재현 - 전표 관리 - 회계 전표 리스트
	public void statementList(HttpServletRequest req, Model model);

	// 강재현 - 전표 관리 회계 전표 상세페이지
	public void content(HttpServletRequest req, Model model);

	// 강재현 - 전표 관리 - 회계 전표 (승인)
	public void acstatmentAction(HttpServletRequest req, Model model);

	// 강재현 - 전표 관리 - 회계 전표 (미승인)
	public void acstatmentdelAction(HttpServletRequest req, Model model);

	// 강재현 - 전표 관리 - 급여 전표 리스트
	public void salarystatementList(HttpServletRequest req, Model model);

	// 강재현 - 전표 관리 - 급여 전표 상세페이지
	public void sacontent(HttpServletRequest req, Model model);

	// 강재현 - 전표 관리 - 급여 전표 (승인)
	public void sastatmentAction(HttpServletRequest req, Model model)  throws FirebaseMessagingException;

	// 강재현 - 전표 관리 - 급여 전표 (미승인)
	public void sastatmentdelAction(HttpServletRequest req, Model model);

	// 이재홍 - 전표 관리 - 채권/채무 조회
	public void bondDebtList(HttpServletRequest req, Model model);

	// 이재홍 - 전표 관리 - 채권/채무 상세페이지
	public void bdContent(HttpServletRequest req, Model model);
}
