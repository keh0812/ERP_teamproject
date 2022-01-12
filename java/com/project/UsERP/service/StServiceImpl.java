package com.project.UsERP.service;

import java.sql.Timestamp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.UsERP.persistence.AdDAO;
import com.project.UsERP.persistence.LdDAO;
import com.project.UsERP.persistence.PdDAO;
import com.project.UsERP.persistence.StDAO;
import com.project.UsERP.vo.AccountStatementVO;
import com.project.UsERP.vo.CompanyVO;
import com.project.UsERP.vo.LogisticsStatementVO;
import com.project.UsERP.vo.ProductVO;
import com.project.UsERP.vo.StockVO;

@Service
public class StServiceImpl implements StService {

	@Autowired
	StDAO stdao;

	@Autowired
	PdDAO pddao;

	@Autowired
	AdDAO addao;
	
	@Autowired
	LdDAO lddao;

	// 강재현 - 기초등록 - 판매 거래처 목록 & 상품 목록
	@Override
	public void salesBasicReg(HttpServletRequest req, Model model) {
		// 판매 거래처 목록
		List<CompanyVO> company = stdao.salesCompanySelect();
		// 상품 목록
		List<ProductVO> product = stdao.salesProductSelect();

		model.addAttribute("company", company);
		model.addAttribute("product", product);
	}

	// 강재현 - 기초등록 - 판매 거래처 목록 상세페이지
	public void comContent(HttpServletRequest req, Model model) {
		int com_code = Integer.parseInt(req.getParameter("com_code"));
		CompanyVO company = stdao.companyDetail(com_code);

		model.addAttribute("company", company);
	}

	// 강재현 : 재고현황
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

		cnt = stdao.getStockCnt(ssKeyword);

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

			List<StockVO> list = stdao.StockStatusList(map);
			model.addAttribute("stocklist", list);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("pageCnt", pageCnt);
			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);

		}

	}

	// 이재홍 - 판매 현황 - 판매 내역 & 승인 내역
	@Override
	public void salesStatus(HttpServletRequest req, Model model) {
		List<AccountStatementVO> list = stdao.salesList();
		model.addAttribute("sales", list);

	}

	// 이재홍 - 판매 전표 상세페이지
	@Override
	public void stContent(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("accs_code"));

		AccountStatementVO list = stdao.stStatementDetail(num);

		model.addAttribute("stContent", list);
	}

	// 이재홍 - 판매 전표 등록
	@Override
	public void insertSalesStatement(HttpServletRequest req, Model model) {
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
		int insertCnt = stdao.insertSalesStatement(vo);
		
		model.addAttribute("insertCnt", insertCnt);
	}

	// 강재현 - 출고현황 - 출고 내역
	@Override
	public void salesRecStatus(HttpServletRequest req, Model model) {
		List<LogisticsStatementVO> strel = stdao.logisticsList();
		model.addAttribute("strel", strel);
	}

	// 강재현 - 판매 현황 - 판매 전표 등록 - 회계 전표 내역
	@Override
	public void stList(HttpServletRequest req, Model model) {
		List<AccountStatementVO> acco = stdao.stList();
		model.addAttribute("acco", acco);

	}

	// 강재현 - 출고현황 - 회계 전표 내역 상세
	@Override
	public void selectList(HttpServletRequest req, Model model) {
		int accs_code = Integer.parseInt(req.getParameter("accs_code"));
		AccountStatementVO account = stdao.insertList(accs_code);

		model.addAttribute("account", account);
	}


	@Override
	public void insertLogsStatement(HttpServletRequest req, Model model) {
		LogisticsStatementVO vo = new LogisticsStatementVO();

		vo.setLogs_type(6);
		vo.setLogs_reg_date(new Timestamp(System.currentTimeMillis()));
		vo.setLogs_state(0);
		vo.setLogs_quantity(Integer.parseInt(req.getParameter("logs_quantity")));
		vo.setEmp_code(req.getParameter("emp_code"));
		vo.setPro_code(Integer.parseInt(req.getParameter("pro_code")));
		vo.setCom_code(Integer.parseInt(req.getParameter("com_code")));

		int ware_code = pddao.getWareCode(1); 
		vo.setWare_code(ware_code); 
		int pro_code = vo.getPro_code();
		int accs_code = Integer.parseInt(req.getParameter("accs_code")); 

		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("accs_code", accs_code);
		map2.put("ware_code", ware_code);
		map2.put("pro_code", pro_code);

		int sto_code = Integer.parseInt(pddao.getStock(map2).toString()); 
		if (sto_code == 0) {
			
			Map<String, Object> scimap = new HashMap<String, Object>();
			scimap.put("sto_quantity", 0); 
			scimap.put("ware_code", ware_code);
			scimap.put("pro_code", pro_code);

			int stockInsertCnt = lddao.stockInsert(scimap); 
		} 

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ware_code", ware_code); 
		map.put("pro_code", pro_code);

		StockVO svo = stdao.getStock(map);

		sto_code = svo.getSto_code();

		int sto_quantity = svo.getSto_quantity(); 
		int logs_quantity = vo.getLogs_quantity(); 
		int logs_shortage = 0; 

		if (logs_quantity > sto_quantity) { 
			logs_shortage = logs_quantity - sto_quantity; 
		}

		vo.setSto_code(sto_code); 
		vo.setLogs_shortage(logs_shortage); 


		int insertCnt = stdao.insertLogsStatement(vo);


		AccountStatementVO vo1 = new AccountStatementVO();
		vo1.setAccs_state(3);
		vo1.setAccs_code(Integer.parseInt(req.getParameter("accs_code")));

		int intsterCnt2 = stdao.updatestatement(vo1);

		model.addAttribute("insertCnt1", insertCnt);
		model.addAttribute("intsterCnt1", intsterCnt2);

	}
}
