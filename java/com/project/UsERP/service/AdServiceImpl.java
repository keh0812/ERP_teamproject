package com.project.UsERP.service;

import java.io.FileInputStream;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.client.RestTemplate;

import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.google.firebase.messaging.FirebaseMessagingException;
import com.project.UsERP.persistence.AdDAO;
import com.project.UsERP.vo.AccountStatementVO;
import com.project.UsERP.vo.AccountVO;
import com.project.UsERP.vo.BankVO;
import com.project.UsERP.vo.SalaryStatementVO;

@Service
public class AdServiceImpl implements AdService {

	@Autowired
	AdDAO addao;

	// 이재홍 - 기초 등록 - 계좌 리스트
	@Override
	public void bankList(HttpServletRequest req, Model model) {
		List<BankVO> list = addao.bankList();

		model.addAttribute("bank", list);
	}

	// 강재현 - 기초 등록 - 계정 리스트
	@Override
	public void accountList(HttpServletRequest req, Model model) {

		List<AccountVO> list = addao.accountList();

		model.addAttribute("account", list);

	}

	// 강재현 - 회계보고서 - 재무상태표
	@Override
	public void get12(HttpServletRequest req, Model model) {
		
		int get1 = addao.get1();
		int get2 = addao.get2();
		int get3 = addao.get3();
		int get4 = addao.get4();
		model.addAttribute("get1", get1);
		model.addAttribute("get2", get2);
		model.addAttribute("get3", get3);
		model.addAttribute("get4", get4);
	}

	// 이재홍 - 회계보고서 - 손익계산서
	@Override
	public void sum(HttpServletRequest req, Model model) {
		int sum = addao.sum();
		int sum1 = addao.sum1();
		int sum2 = addao.sum2();
		model.addAttribute("sum", sum);
		model.addAttribute("sum1", sum1);
		model.addAttribute("sum2", sum2);
	}

	// 강재현 - 전표 관리 - 회계 전표 리스트
	@Override
	public void statementList(HttpServletRequest req, Model model) {
		List<AccountStatementVO> list = addao.statementList();

		model.addAttribute("statement", list);
	}

	// 강재현 - 전표 관리 회계 전표 상세페이지
	@Override
	public void content(HttpServletRequest req, Model model) {
		int accs_code = Integer.parseInt(req.getParameter("accs_code"));

		AccountStatementVO list = addao.getStamentDetail(accs_code);

		model.addAttribute("content", list);

	}

	// 강재현 - 전표 관리 - 회계 전표 (승인)
	@Override
	public void acstatmentAction(HttpServletRequest req, Model model) {
		int accs_code = Integer.parseInt(req.getParameter("accs_code"));
		AccountStatementVO vo = new AccountStatementVO();
		vo.setAccs_state(1);
		vo.setAccs_update_date(new Timestamp(System.currentTimeMillis()));
		vo.setAccs_code(accs_code);

		int updateCnt = addao.acupdatestatment(vo);

		

		model.addAttribute("num", accs_code);
		model.addAttribute("updateCnt", updateCnt);

	}

	// 강재현 - 전표 관리 - 회계 전표 (미승인)
	@Override
	public void acstatmentdelAction(HttpServletRequest req, Model model) {
		int accs_code = Integer.parseInt(req.getParameter("accs_code"));
		AccountStatementVO vo = new AccountStatementVO();
		vo.setAccs_state(-1);
		vo.setAccs_update_date(new Timestamp(System.currentTimeMillis()));
		vo.setAccs_code(accs_code);
		int deleteCnt = addao.acupdatestatment(vo);


		model.addAttribute("deleteCnt", deleteCnt);

	}

	// 강재현 - 전표 관리 - 급여 전표 리스트
	@Override
	public void salarystatementList(HttpServletRequest req, Model model) {
		List<SalaryStatementVO> list = addao.salarystatementList();
		model.addAttribute("salarystatement", list);
	}

	// 강재현 - 전표 관리 - 급여 전표 상세페이지
	@Override
	public void sacontent(HttpServletRequest req, Model model) {
		int ss_code = Integer.parseInt(req.getParameter("ss_code"));
		SalaryStatementVO list = addao.getsaStamentDetail(ss_code);
		model.addAttribute("sccontent", list);

	}

	// 강재현 - 전표 관리 - 급여 전표 (승인)
	@Override
	public void sastatmentAction(HttpServletRequest req, Model model) throws FirebaseMessagingException {
		int ss_code = Integer.parseInt(req.getParameter("ss_code"));
		SalaryStatementVO vo = new SalaryStatementVO();
		vo.setSs_state(1);
		vo.setSs_sal_date(new Timestamp(System.currentTimeMillis()));
		vo.setSs_code(ss_code);
		int updateCnt = addao.saupdatestatment(vo);

		try {

			String path = "C:\\Dev76\\workspace\\UsERP\\src\\main\\webapp\\resources\\google\\userp-88ec6-firebase-adminsdk-vry15-2ff62ee2af.json";
			String MESSAGING_SCOPE = "https://www.googleapis.com/auth/firebase.messaging";
			String[] SCOPES = { MESSAGING_SCOPE };

			GoogleCredential googleCredential = GoogleCredential.fromStream(new FileInputStream(path))
					.createScoped(Arrays.asList(SCOPES));
			googleCredential.refreshToken();

			HttpHeaders headers = new HttpHeaders();
			headers.add("content-type", MediaType.APPLICATION_JSON_VALUE);
			headers.add("Authorization", "Bearer " + googleCredential.getAccessToken());

			Map<String, Object> notification = new HashMap<>();
			notification.put("title", "월급이 지급되었습니다.");
			notification.put("body", "즐거운하루되세요.");
			
			Map<String, Object> message = new HashMap<>(); 

			message.put("token",
					"eSeWGb4MQS27LWK7ZmgLuC:APA91bHXMpuPIeA8TWubP9xZTIx9KGKrlOaj-aFofjtc12LhQ5dhV2Oe_Qg0cE51aKb9HwXvKM_XRPHzgte6bj_OgaANmBOwgjgzRLPw6s5TN4FDZurWEzGmYVcjlZ6MbcKj7nFRuocm");
			message.put("notification", notification);
			
			Map<String, Object> jsonParams = new HashMap<>();
			jsonParams.put("message", message);

			HttpEntity<Map<String, Object>> httpEntity = new HttpEntity<>(jsonParams, headers);
			RestTemplate rt = new RestTemplate();

			ResponseEntity<String> res = rt.exchange("https://fcm.googleapis.com/v1/projects/userp-88ec6/messages:send",
					HttpMethod.POST, httpEntity, String.class);

//	            if (res.getStatusCode() != HttpStatus.OK) {
//	                log.debug("FCM-Exception");
//	                log.debug(res.getStatusCode().toString());
//	                log.debug(res.getHeaders().toString());
//	                log.debug(res.getBody().toString());
//	                
//	            } else {
//	                log.debug(res.getStatusCode().toString());
//	                log.debug(res.getHeaders().toString());
//	                log.debug(res.getBody().toLowerCase());
//	                
//	            }
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		model.addAttribute("num", ss_code);
		model.addAttribute("updateCnt", updateCnt);

	}

	// 강재현 - 전표 관리 - 급여 전표 (미승인)
	@Override
	public void sastatmentdelAction(HttpServletRequest req, Model model) {

		int ss_code = Integer.parseInt(req.getParameter("ss_code"));
	
		SalaryStatementVO vo = new SalaryStatementVO();
		vo.setSs_state(-1);
		vo.setSs_sal_date(new Timestamp(System.currentTimeMillis()));
		vo.setSs_code(ss_code);
		int deleteCnt = addao.saupdatestatment(vo);

		model.addAttribute("num", ss_code);
		model.addAttribute("deleteCnt", deleteCnt);

	}

	// 이재홍 - 전표 관리 - 채권/채무 조회
	@Override
	public void bondDebtList(HttpServletRequest req, Model model) {
		List<AccountStatementVO> list = addao.bondDebtList();

		model.addAttribute("bondDebt", list);
	}

	// 이재홍 - 전표 관리 - 채권/채무 상세페이지
	@Override
	public void bdContent(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("accs_code"));

		AccountStatementVO list = addao.bdStatementDetail(num);

		model.addAttribute("bdContent", list);
	}
}