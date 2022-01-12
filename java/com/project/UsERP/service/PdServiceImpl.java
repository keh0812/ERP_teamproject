package com.project.UsERP.service;

import java.sql.Timestamp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.UsERP.persistence.LdDAO;
import com.project.UsERP.persistence.PdDAO;
import com.project.UsERP.persistence.StDAO;
import com.project.UsERP.vo.AccountStatementVO;
import com.project.UsERP.vo.CompanyVO;
import com.project.UsERP.vo.LogisticsStatementVO;
import com.project.UsERP.vo.ProductVO;
import com.project.UsERP.vo.StockVO;

@Service
public class PdServiceImpl implements PdService {

	@Autowired
	PdDAO pddao;

	@Autowired
	LdDAO lddao;

	@Autowired
	StDAO stdao;

	// 최유성 - 기초등록
	@Override
	public void pdBasicReg(HttpServletRequest req, Model model) {

		List<CompanyVO> company = pddao.pdCompanySelect();

		List<ProductVO> product = pddao.pdProductSelect();

		model.addAttribute("company", company);
		model.addAttribute("product", product);
	}

	// 최유성 - 기초등록 - 구매 거래처 목록 상세페이지
	public void pdcomContent(HttpServletRequest req, Model model) {
		int com_code = Integer.parseInt(req.getParameter("com_code"));
		CompanyVO company = pddao.pdcompanyDetail(com_code);

		model.addAttribute("company", company);
	}

	// 최유성 - 기초등록 - 상품 상세페이지
	@Override
	public void pdproContent(HttpServletRequest req, Model model) {
		int pro_code = Integer.parseInt(req.getParameter("pro_code"));
		ProductVO product = pddao.pdproductDetail(pro_code);

		model.addAttribute("product", product);

	}

	// 김민수 - 재고 현황
	@Override
	public void inventoryStatusList(HttpServletRequest req, Model model) {
		String ssKeyword = req.getParameter("ssKeyword");

		int pageSize = 15;
		int pageBlock = 3;

		int cnt = 0;
		int start = 0;
		int end = 0;

		int pageCnt = 0;
		int startPage = 0;
		int endPage = 0;

		String pageNum = "";
		int currentPage = 0;

		cnt = lddao.getStockCnt(ssKeyword);

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1";
		}

		currentPage = Integer.parseInt(pageNum);
		pageCnt = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		start = (currentPage - 1) * pageSize + 1;
		end = start + pageSize - 1;

		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;

		endPage = startPage + pageBlock - 1;
		if (endPage > pageCnt)
			endPage = pageCnt;

		model.addAttribute("ssKeyword", ssKeyword);
		model.addAttribute("cnt", cnt);
		model.addAttribute("pageNum", pageNum);

		if (cnt > 0) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("ssKeyword", ssKeyword);
			map.put("start", start);
			map.put("end", end);

			List<StockVO> list = lddao.StockStatusList(map);
			model.addAttribute("stocklist", list);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("pageCnt", pageCnt);
			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);

		}

	}

	// 이재홍 - 구매현황 - 구매 내역 & 승인 내역
	@Override
	public void purStatus(HttpServletRequest req, Model model) {
		List<AccountStatementVO> list = pddao.buyList();
		model.addAttribute("buy", list);

	}

	// 이재홍 - 구매현황 - 구매 내역 상세페이지
	@Override
	public void pdContent(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("accs_code"));

		AccountStatementVO list = pddao.pdStatementDetail(num);

		model.addAttribute("pdContent", list);
	}

	// 이재홍 - 구매현황 - 구매 전표 등록
	@Override
	public void insertBuyStatement(HttpServletRequest req, Model model) {
		int price = Integer.parseInt(req.getParameter("accs_price"));

		AccountStatementVO vo = new AccountStatementVO();

		vo.setAccs_type(Integer.parseInt(req.getParameter("accs_type")));
		vo.setAccs_content(req.getParameter("accs_content"));
		vo.setAccs_price(price);
		vo.setAccs_quantity(Integer.parseInt(req.getParameter("accs_quantity")));
		vo.setAccs_reg_date(new Timestamp(System.currentTimeMillis()));
		vo.setAccs_sum(Integer.parseInt(req.getParameter("accs_sum")));
		vo.setAccs_state(0);
		vo.setEmp_code(req.getParameter("emp_code"));
		vo.setPro_code(Integer.parseInt(req.getParameter("pro_code")));
		vo.setCom_code(Integer.parseInt(req.getParameter("com_code")));
		int insertCnt = pddao.insertBuyStatement(vo);

		model.addAttribute("insertCnt", insertCnt);

	}

	// 부족 수량 내역 조회
	@Override
	public void logsshortage(HttpServletRequest req, Model model) {
		List<LogisticsStatementVO> list = pddao.logsshortage();

		model.addAttribute("logslist", list);

	}

	// 부족 수량 상세페이지
	@Override
	public void logsshortageContent(HttpServletRequest req, Model model) {
		int logs_code = Integer.parseInt(req.getParameter("logs_code"));

		LogisticsStatementVO list = pddao.logsshortageDetail(logs_code);

		model.addAttribute("shortContent", list);
	}

	// 이재홍 - 구매현황 - 부족수량 업데이트
	@Override
	public void insertLogStatement(HttpServletRequest req, Model model) {
		int price = Integer.parseInt(req.getParameter("accs_price"));
		int logs_code = Integer.parseInt(req.getParameter("logs_code"));
		
		AccountStatementVO vo = new AccountStatementVO();

		vo.setAccs_type(Integer.parseInt(req.getParameter("accs_type")));
		vo.setAccs_content(req.getParameter("accs_content"));
		vo.setAccs_price(price);
		vo.setAccs_quantity(Integer.parseInt(req.getParameter("accs_quantity")));
		vo.setAccs_reg_date(new Timestamp(System.currentTimeMillis()));
		vo.setAccs_sum(Integer.parseInt(req.getParameter("accs_sum")));
		vo.setAccs_state(0);
		vo.setEmp_code(req.getParameter("emp_code"));
		vo.setPro_code(Integer.parseInt(req.getParameter("pro_code")));
		vo.setCom_code(Integer.parseInt(req.getParameter("com_code")));
		int insertCnt = pddao.insertBuyStatement(vo);

		if(insertCnt == 1) {
			LogisticsStatementVO vo1 = new LogisticsStatementVO();
			vo1.setLogs_state(3);
			vo1.setLogs_code(logs_code);

			int updateCnt = lddao.logsupdate(vo1);
			model.addAttribute("updateCnt", updateCnt);
		}
		
		model.addAttribute("insertCnt", insertCnt);

	}

	// 최유성 - 입고현황
	@Override
	public void pdRecStatus(HttpServletRequest req, Model model) {

		List<LogisticsStatementVO> SIlist = pddao.pdStockInOrder();

		List<AccountStatementVO> AList = pddao.AccountStatement();

		model.addAttribute("SIlist", SIlist);
		model.addAttribute("AList", AList);
	}

	// 최유성 - 입고 내역 상세 페이지
	@Override
	public void pdRecStatusAjax(HttpServletRequest req, Model model) {

		int logs_code = Integer.parseInt(req.getParameter("logs_code")); 

		LogisticsStatementVO vo = lddao.getLdDetail(logs_code);

		model.addAttribute("vo", vo);
	}

	// 최유성 - 입고 전표 등록 페이지 띄우기
	@Override
	public void pdRecStatusAjax2(HttpServletRequest req, Model model) {

		int accs_code = Integer.parseInt(req.getParameter("accs_code")); 

		String emp_code = req.getParameter("emp_code"); 

		String emp_name = pddao.getEmpName(emp_code); 

		AccountStatementVO vo = pddao.getAccountStatement(accs_code);

		model.addAttribute("emp_name", emp_name);
		model.addAttribute("vo", vo);
	}

	// 최유성 - 입고 전표 등록(insert)
	@Override
	public void logsPdInsert(HttpServletRequest req, Model model) {
		String emp_code = req.getParameter("emp_code"); 
		int logs_quantity = Integer.parseInt(req.getParameter("logs_quantity")); 
		int pro_code = Integer.parseInt(req.getParameter("pro_code")); 
		int com_code = Integer.parseInt(req.getParameter("com_code")); 
		int accs_code = Integer.parseInt(req.getParameter("accs_code")); 

		int insertCnt = 0; 
		int updateCnt = 0; 

		LogisticsStatementVO vo = new LogisticsStatementVO();

		vo.setLogs_type(5);
		vo.setLogs_state(0);
		vo.setLogs_quantity(logs_quantity);
		vo.setEmp_code(emp_code);
		vo.setPro_code(pro_code);
		vo.setCom_code(com_code);

		int ware_code = pddao.getWareCode(1);
		vo.setWare_code(ware_code);


		Map<String, Object> map = new HashMap<String, Object>();
		map.put("accs_code", accs_code);
		map.put("ware_code", ware_code); 
		map.put("pro_code", pro_code);

		int sto_code = Integer.parseInt(pddao.getStock(map).toString()); 


		vo.setSto_code(sto_code); 
		vo.setLogs_shortage(0);
		insertCnt = pddao.logsPdInsert(vo); 

		AccountStatementVO avo = new AccountStatementVO();
		avo.setAccs_state(3);
		avo.setAccs_code(accs_code);

		if (insertCnt == 1) {
			updateCnt = pddao.updatestatement(avo); 

		}

		model.addAttribute("insertCnt1", insertCnt);
		model.addAttribute("updateCnt", updateCnt);

	}
}