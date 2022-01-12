package com.project.UsERP.service;

import java.sql.Timestamp;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.UsERP.persistence.LdDAO;
import com.project.UsERP.persistence.PdDAO;
import com.project.UsERP.vo.AccountStatementVO;
import com.project.UsERP.vo.CompanyVO;
import com.project.UsERP.vo.LogisticsStatementVO;
import com.project.UsERP.vo.ProductVO;
import com.project.UsERP.vo.StockSupplyVO;
import com.project.UsERP.vo.StockVO;
import com.project.UsERP.vo.WarehouseVO;

@Service
public class LdServiceImpl implements LdService {

	@Autowired
	LdDAO lddao;

	@Autowired
	PdDAO pddao;

	// 김민수 - 창고 등록
	@Override
	public void insertWarehouse(HttpServletRequest req, Model model) {
		int wareState = Integer.parseInt(req.getParameter("wareState"));
		String warehouseName = req.getParameter("warehouseName");
		String warehouseLoc = req.getParameter("warehouseLoc");

		WarehouseVO vo = new WarehouseVO();
		vo.setWare_name(warehouseName);
		vo.setWare_location(warehouseLoc);

		int insertCnt = 0;

		if (wareState == 1) {
			insertCnt = lddao.insertGoodWare(vo);
		} else if (wareState == 2) {
			insertCnt = lddao.insertBadWare(vo);
		} else if (wareState == 3) {
			insertCnt = lddao.insertWaitWare(vo);
		}

		model.addAttribute("insertCnt", insertCnt);
		model.addAttribute("wareState", wareState);

	}

	// 김민수 - 창고 목록
	@Override
	public void warehouseList(HttpServletRequest req, Model model) {
		List<WarehouseVO> list = lddao.warehouseList();
		WarehouseVO vo = new WarehouseVO();
		int wareCode = vo.getWare_code();

		model.addAttribute("wareCode", wareCode);
		model.addAttribute("warehouseList", list);
	}

	// 김민수 - 창고 상세 목록
	@Override
	public void warehouseDetail(HttpServletRequest req, Model model) {
		int ware_code = Integer.parseInt(req.getParameter("ware_code"));

		WarehouseVO vo = lddao.warehouseDetail(ware_code);

		model.addAttribute("warecode", ware_code);
		model.addAttribute("wareDetailVo", vo);
	}

	// 김민수 - 창고 정보 수정
	@Override
	public void warehouseModify(HttpServletRequest req, Model model) {
		int ware_code = Integer.parseInt(req.getParameter("warecode"));
		String ware_name = req.getParameter("warename");
		String ware_location = req.getParameter("warelocation");
		int ware_state = Integer.parseInt(req.getParameter("useWare"));

		WarehouseVO vo = new WarehouseVO();
		vo.setWare_name(ware_name);
		vo.setWare_location(ware_location);
		vo.setWare_state(ware_state);
		vo.setWare_code(ware_code);

		int updateCnt = 0;
		updateCnt = lddao.warehouseModify(vo);

		model.addAttribute("updateCnt", updateCnt);

	}

	// 김민수 - 거래처 목록 조회(검색포함)
	@Override
	public void companyList(HttpServletRequest req, Model model) {
		String compKeyword = req.getParameter("compKeyword");

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

		cnt = lddao.getCompanyCnt(compKeyword);

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

		model.addAttribute("compKeyword", compKeyword);
		model.addAttribute("cnt", cnt);
		model.addAttribute("pageNum", pageNum);

		if (cnt > 0) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("compKeyword", compKeyword);
			map.put("start", start);
			map.put("end", end);

			List<CompanyVO> list = lddao.CompanyList(map);
			model.addAttribute("complist", list);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("pageCnt", pageCnt);
			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);

		}
	}

	// 김민수 - 거래처 상세 페이지
	@Override
	public void compInfoDetail(HttpServletRequest req, Model model) {
		int com_code = Integer.parseInt(req.getParameter("com_code"));

		CompanyVO vo = lddao.companyDetail(com_code);

		model.addAttribute("compInfo", vo);
	}

	// 김민수 - 상품 목록 조회(검색포함)
	@Override
	public void productList(HttpServletRequest req, Model model) {
		String proKeyword = req.getParameter("proKeyword");

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

		cnt = lddao.getProductCnt(proKeyword);

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

		model.addAttribute("proKeyword", proKeyword);
		model.addAttribute("cnt", cnt);
		model.addAttribute("pageNum", pageNum);

		if (cnt > 0) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("proKeyword", proKeyword);
			map.put("start", start);
			map.put("end", end);

			List<ProductVO> list = lddao.ProductList(map);
			model.addAttribute("prolist", list);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("pageCnt", pageCnt);
			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);

		}
	}

	// 김민수 - 재고 현황(검색포함)
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

	// 김민수 - 재고 관리 상품 조회
	@Override
	public void selectProduct(HttpServletRequest req, Model model) {
		List<ProductVO> list = lddao.selectProduct();
		
		model.addAttribute("selprolist", list);
	}

	// 김민수 - 재고 관리 창고 조회
	@Override
	public void selectWarehouse(HttpServletRequest req, Model model) {
		List<WarehouseVO> list = lddao.selectWarehouse();

		model.addAttribute("selectware", list);
	}

	// 김민수 - 재고 이동 등록, 창고등록(불량품,출고대기), 수불부 내역등록
	@Override
	public void moveWareInsert(HttpServletRequest req, Model model) {
		int startwh = Integer.parseInt(req.getParameter("startwh"));
		int arrivewh = Integer.parseInt(req.getParameter("arrivewh"));
		int prod = Integer.parseInt(req.getParameter("prod"));
		int amount = Integer.parseInt(req.getParameter("amount"));
		String empid = req.getParameter("empid");
		int logscode = Integer.parseInt(req.getParameter("logscode"));

		// 재고 테이블 여부 확인
		Map<String, Object> stateMap = new HashMap<String, Object>();
		stateMap.put("arrivewh", arrivewh);
		stateMap.put("prod", prod);

		// 재고 이동시 재고테이블 없을경우 등록
		StockVO stockVo = new StockVO();
		stockVo.setSto_quantity(amount);
		stockVo.setWare_code(arrivewh);
		stockVo.setPro_code(prod);

		// 출발창고 재고변경
		Map<String, Object> minusMap = new HashMap<String, Object>();
		minusMap.put("amount", amount);
		minusMap.put("startwh", startwh);
		minusMap.put("prod", prod);

		// 도착창고 재고변경
		Map<String, Object> plusMap = new HashMap<String, Object>();
		plusMap.put("amount", amount);
		plusMap.put("arrivewh", arrivewh);
		plusMap.put("prod", prod);

		int stockBadInsert = 0;
		int stoMinusUpdate = 0;
		int stoBadMinusUpdate = 0;
		int stoPlusUpdate = 0;
		int stsuMoveInsert = 0;
		int stsuBadMoveInsert = 0;

		if (lddao.stockState(stateMap) == null) {

			stockBadInsert = lddao.stockBadWare(stockVo);
			if (stockBadInsert == 1) {
				stoBadMinusUpdate = lddao.stoMinusUpdate(minusMap);
				// 재고 이동 재고테이블 수량 가져오기
				Map<String, Object> quantityMap = new HashMap<String, Object>();
				quantityMap.put("startwh", startwh);
				quantityMap.put("prod", prod);
				String stsu_quantity = lddao.getStoQuantity(quantityMap);

				StockSupplyVO stockSupplyVO = new StockSupplyVO();
				stockSupplyVO.setStsu_quantity(Integer.parseInt(stsu_quantity));
				stockSupplyVO.setStsu_amount(amount);
				stockSupplyVO.setStsu_startwh(lddao.getStartWareName(startwh));
				stockSupplyVO.setStsu_arrivewh(lddao.getArriveWareName(arrivewh));
				stockSupplyVO.setPro_code(prod);
				stockSupplyVO.setEmp_code(empid);

				stsuBadMoveInsert = lddao.stsuMoveInsert(stockSupplyVO);
			}
		}

		else if (lddao.stockState(stateMap) != null) {
			stoMinusUpdate = lddao.stoMinusUpdate(minusMap);
			stoPlusUpdate = lddao.stoPlusUpdate(plusMap);

			// 재고 이동 재고테이블 수량 가져오기
			Map<String, Object> quantityMap = new HashMap<String, Object>();
			quantityMap.put("startwh", startwh);
			quantityMap.put("prod", prod);
			String stsu_quantity = lddao.getStoQuantity(quantityMap);

			StockSupplyVO stockSupplyVO = new StockSupplyVO();
			stockSupplyVO.setStsu_quantity(Integer.parseInt(stsu_quantity));
			stockSupplyVO.setStsu_amount(amount);
			stockSupplyVO.setStsu_startwh(lddao.getStartWareName(startwh));
			stockSupplyVO.setStsu_arrivewh(lddao.getArriveWareName(arrivewh));
			stockSupplyVO.setPro_code(prod);
			stockSupplyVO.setEmp_code(empid);

			stsuMoveInsert = lddao.stsuMoveInsert(stockSupplyVO);

			int logsShortUpdate = 0;
			int logsStateUpdate = 0;
			if (logscode != 0) {
				int logshortage = Integer.parseInt(lddao.logsShortAgeSelect(logscode));
				int shortage = logshortage - amount;

				Map<String, Object> shortMap = new HashMap<String, Object>();
				shortMap.put("shortage", shortage);
				shortMap.put("logscode", logscode);
				if (shortage == 0) {

					logsShortUpdate = lddao.logsShortAgeUpdate(shortMap);

					if (logsShortUpdate == 1) {
						logsStateUpdate = lddao.logsStateUpdate(logscode);
					}

				} else if (shortage != 0) {

					logsShortUpdate = lddao.logsShortAgeUpdate(shortMap);

				}

				model.addAttribute("logsShortUpdate", logsShortUpdate);
				model.addAttribute("logsStateUpdate", logsStateUpdate);
			}
		}
		model.addAttribute("stockBadInsert", stockBadInsert);
		model.addAttribute("stoBadMinusUpdate", stoBadMinusUpdate);
		model.addAttribute("stoMinusUpdate", stoMinusUpdate);
		model.addAttribute("stsuMoveInsert", stsuMoveInsert);
		model.addAttribute("stoPlusUpdate", stoPlusUpdate);
		model.addAttribute("stsuBadMoveInsert", stsuBadMoveInsert);
	}

	// 김민수 - 입출고 승인 - 출고 상태변경 / 재고수불부 등록
	@Override
	public void moveStockOutUpIn(HttpServletRequest req, Model model) {
		int logscode = Integer.parseInt(req.getParameter("logscode"));
		int prod = Integer.parseInt(req.getParameter("prod"));
		int amount = Integer.parseInt(req.getParameter("amount"));
		int startwh = Integer.parseInt(req.getParameter("warecode"));
		String empcode = req.getParameter("empcode");

		Map<String, Object> quantityMap = new HashMap<String, Object>();
		quantityMap.put("prod", prod);
		quantityMap.put("startwh", startwh);

		String quantity = lddao.getStoQuantity(quantityMap);
		int stsu_quantity = Integer.parseInt(quantity);
		int stsu_qu = stsu_quantity - amount;

		String arrivewh = lddao.getStartWareName(startwh);

		int updateCnt2 = 0;
		int moveStockOutIn = 0;
		int updateCnt = lddao.moveSoStateUpdate(logscode);
		if (updateCnt == 1) {

			Map<String, Object> minusMap = new HashMap<String, Object>();
			minusMap.put("amount", amount);
			minusMap.put("startwh", startwh);
			minusMap.put("prod", prod);

			updateCnt2 = lddao.stoMinusUpdate(minusMap);

			StockSupplyVO stockSupplyVO = new StockSupplyVO();
			stockSupplyVO.setStsu_quantity(stsu_qu);
			stockSupplyVO.setStsu_amount(amount);
			stockSupplyVO.setStsu_arrivewh(arrivewh);
			stockSupplyVO.setPro_code(prod);
			stockSupplyVO.setEmp_code(empcode);

			moveStockOutIn = lddao.stsuStockOutInsert(stockSupplyVO);

		}

		model.addAttribute("moveStockOutIn", moveStockOutIn);
		model.addAttribute("updateCnt", updateCnt);
		model.addAttribute("updateCnt2", updateCnt2);

	}

	// 김민수 - 조정 재고 테이블 수량 가저오기
	@Override
	public String adjGetStock(HttpServletRequest req, Model model) {
		int startwh = Integer.parseInt(req.getParameter("wareh"));
		int prod = Integer.parseInt(req.getParameter("prod"));

		Map<String, Object> quantityMap = new HashMap<String, Object>();
		quantityMap.put("startwh", startwh);
		quantityMap.put("prod", prod);

		String stsu_quantity = lddao.getStoQuantity(quantityMap);

		return stsu_quantity;
	}

	// 김민수 - 재고 조정 등록
	@Override
	public void adjNewInsert(HttpServletRequest req, Model model) {
		int prod = Integer.parseInt(req.getParameter("prod"));
		int arrivewh = Integer.parseInt(req.getParameter("arrivewh"));
		String empid = req.getParameter("empid");
		int amount = Integer.parseInt(req.getParameter("amount"));
		int quantity = Integer.parseInt(req.getParameter("quantity"));

		StockSupplyVO stockSupplyVO = new StockSupplyVO();
		stockSupplyVO.setStsu_quantity(quantity);
		stockSupplyVO.setStsu_amount(amount);
		stockSupplyVO.setStsu_arrivewh(lddao.getArriveWareName(arrivewh));
		stockSupplyVO.setPro_code(prod);
		stockSupplyVO.setEmp_code(empid);

		int updateCnt = 0;
		int insertCnt = 0;

		insertCnt = lddao.adjustmentInsert(stockSupplyVO);
		if (insertCnt == 1) {
			Map<String, Object> plusMap = new HashMap<String, Object>();
			plusMap.put("amount", amount);
			plusMap.put("arrivewh", arrivewh);
			plusMap.put("prod", prod);

			updateCnt = lddao.stoPlusUpdate(plusMap);
		}

		model.addAttribute("insertCnt", insertCnt);
		model.addAttribute("updateCnt", updateCnt);

	}

	// 김민수 - 재고 조정 내역
	@Override
	public void adjustmentList(HttpServletRequest req, Model model) {
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

		cnt = lddao.getAdjustment();

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

		model.addAttribute("cnt", cnt);
		model.addAttribute("pageNum", pageNum);

		if (cnt > 0) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);

			List<StockSupplyVO> list = lddao.adjustmentList(map);
			model.addAttribute("adjlist", list);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("pageCnt", pageCnt);
			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
		}
	}

	// 김민수 - 재고 수불부 내역
	@Override
	public void supplyList(HttpServletRequest req, Model model) {
		String start = req.getParameter("start_date");
		String end = req.getParameter("end_date");
		String proname = req.getParameter("proname");
		String pron = lddao.getProCode(proname);

		int procode = Integer.parseInt(pron);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("procode", procode);
		map.put("start", start);
		map.put("end", end);

		List<StockSupplyVO> list = lddao.stockSupplyList(map);
		model.addAttribute("suplist", list);
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("proname", proname);
		model.addAttribute("procode", procode);
	}

	// 김민수 - 부족수량 출고물류전표 조회
	@Override
	public void logsCodeShortList(HttpServletRequest req, Model model) {
		List<LogisticsStatementVO> vo = lddao.logsCodeSelectList();
		model.addAttribute("logsCodeVo", vo);
	}

	// 김민수 - 입출고내역 조회
	@Override
	public void shiRecList(HttpServletRequest req, Model model) {
		List<StockSupplyVO> vo = lddao.shiRecList();

		model.addAttribute("shiRecVo", vo);
	}

	// 최유성 - 전표관리
	@Override
	public void ldStatementManagement(HttpServletRequest req, Model model) {

		// 입고내역 미승인
		List<LogisticsStatementVO> SIlist1 = lddao.stockInOrder1();

		// 입고내역 승인
		List<LogisticsStatementVO> SIlist2 = lddao.stockInOrder2();

		// 출고내역 미승인
		List<LogisticsStatementVO> SOlist1 = lddao.stockOutOrder1();

		// 출고내역 승인
		List<LogisticsStatementVO> SOlist2 = lddao.stockOutOrder2();

		model.addAttribute("SIlist1", SIlist1);
		model.addAttribute("SOlist1", SOlist1);
		model.addAttribute("SIlist2", SIlist2);
		model.addAttribute("SOlist2", SOlist2);
	}

	// 최유성 - 물류 전표 상세페이지
	@Override
	public void ldStatementManagementContent(HttpServletRequest req, Model model) {

		int logs_code = Integer.parseInt(req.getParameter("logs_code"));

		LogisticsStatementVO vo = lddao.getLdDetail(logs_code);

		model.addAttribute("vo", vo);
	}

	// 최유성 - 입고 전표 승인 액션
	@Override
	public void stockInAction(HttpServletRequest req, Model model) {

		String emp_code = req.getParameter("emp_code"); 

		int logs_code = Integer.parseInt(req.getParameter("logs_code"));
		int sto_code = Integer.parseInt(req.getParameter("sto_code"));
		int logs_quantity = Integer.parseInt(req.getParameter("logs_quantity")); 
		int ware_code = Integer.parseInt(req.getParameter("ware_code")); 
		int pro_code = Integer.parseInt(req.getParameter("pro_code")); 

		int updateCnt = lddao.stockInAction(logs_code);

		if (updateCnt == 1) {
			if (sto_code == 0) {

				Map<String, Object> map = new HashMap<String, Object>();
				map.put("sto_quantity", logs_quantity);
				map.put("ware_code", ware_code);
				map.put("pro_code", pro_code);

				int stockInsertCnt = lddao.stockInsert(map);

				if (stockInsertCnt == 1) { 

					Map<String, Object> scsmap = new HashMap<String, Object>();
					scsmap.put("ware_code", ware_code);
					scsmap.put("pro_code", pro_code);

					int newStoCode = lddao.stockCodeSelect(scsmap);

					Map<String, Object> map2 = new HashMap<String, Object>();
					map2.put("sto_code", newStoCode);
					map2.put("stsu_quantity", logs_quantity);
					map2.put("stsu_amount", logs_quantity);
					map2.put("ware_code", ware_code);
					map2.put("pro_code", pro_code);

					map2.put("emp_code", emp_code);

					int stockSupplyInsertCnt1 = lddao.stockSupplyInsert(map2);

					if (stockSupplyInsertCnt1 == 1) {

						Map<String, Object> map3 = new HashMap<String, Object>();

						map3.put("logs_code", logs_code);
						map3.put("newStoCode", newStoCode);

						int logisticsStatementUpdateCnt = lddao.logisticsStatementUpdate(map3);
					}
				}

			} else {
				int retrunStoQuantity = lddao.retrunStoQuantity(sto_code); 

				int sto_quantity = logs_quantity + retrunStoQuantity; 

				Map<String, Object> map = new HashMap<String, Object>();
				map.put("sto_code", sto_code); 
				map.put("sto_quantity", sto_quantity); 
				map.put("ware_code", ware_code);
				map.put("pro_code", pro_code);

				int stockUpdateCnt = lddao.stockUpdate(map);

				if (stockUpdateCnt == 1) {

					Map<String, Object> map2 = new HashMap<String, Object>();
					map2.put("sto_code", sto_code);
					map2.put("stsu_quantity", sto_quantity);
					map2.put("stsu_amount", logs_quantity);
					map2.put("ware_code", ware_code);
					map2.put("pro_code", pro_code);

					map2.put("emp_code", emp_code);

					int stockSupplyInsertCnt2 = lddao.stockSupplyInsert(map2);

				}
			}
		}
		model.addAttribute("updateCnt", updateCnt);
	}

	// 최유성 - 출고 준비 완료로 상태 변경 - 양품창고에서 출고대기창고로 물품 이동
	@Override
	public void stockOutReady(HttpServletRequest req, Model model) {

		int logs_code = Integer.parseInt(req.getParameter("logs_code"));
		int sto_code = Integer.parseInt(req.getParameter("sto_code"));
		int logs_quantity = Integer.parseInt(req.getParameter("logs_quantity"));
		int logs_shortage = Integer.parseInt(req.getParameter("logs_shortage"));
		int ware_code = Integer.parseInt(req.getParameter("ware_code")); 
		int pro_code = Integer.parseInt(req.getParameter("pro_code")); 
		String emp_code = req.getParameter("emp_code"); 

		int updateCnt = 0;

		int retrunStoQuantity = lddao.retrunStoQuantity(sto_code); 

		int sto_quantity = retrunStoQuantity - logs_quantity; 

		if (sto_quantity < 0) { 
			sto_quantity = 0;
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sto_code", sto_code); 
		map.put("sto_quantity", sto_quantity); 
		map.put("ware_code", ware_code);
		map.put("pro_code", pro_code);

		int stockUpdateCnt = lddao.stockUpdate(map); 

		if (stockUpdateCnt == 1) {

			int outReadyWareCode = pddao.getWareCode(3);

			Map<String, Object> wmap = new HashMap<String, Object>();
			wmap.put("pro_code", pro_code);
			wmap.put("ware_code", outReadyWareCode); 

			StockVO vo = lddao.outReadyStockSelect(wmap);

			if (vo != null) { 

				int outReadyStoCode = vo.getSto_code();
				int outReadyStoQuantity = vo.getSto_quantity();
				outReadyWareCode = vo.getWare_code();

				int sto_quantity2 = 0; 

				if (logs_shortage > 0) { 

					sto_quantity2 = outReadyStoQuantity + retrunStoQuantity;

				} else {

					sto_quantity2 = outReadyStoQuantity + logs_quantity;

				}

				Map<String, Object> map2 = new HashMap<String, Object>();
				map2.put("sto_code", outReadyStoCode);
				map2.put("sto_quantity", sto_quantity2); 
				map2.put("ware_code", outReadyWareCode);
				map2.put("pro_code", pro_code);

				int stockUpdateCnt2 = lddao.stockUpdate(map2); 

				if (stockUpdateCnt2 == 1) { 

					Map<String, Object> map3 = new HashMap<String, Object>();
					map3.put("sto_code", outReadyStoCode);

					if (logs_shortage > 0) { 
						sto_quantity2 = 0;

						logs_quantity = retrunStoQuantity; 
					} else {
						sto_quantity2 = retrunStoQuantity - logs_quantity; 
					}

					map3.put("stsu_quantity", sto_quantity2); 
					map3.put("stsu_amount", logs_quantity);
					map3.put("ware_code", ware_code);
					map3.put("pro_code", pro_code);

					map3.put("emp_code", emp_code); 

					int outReadystockSupplyCnt = lddao.outReadystockSupplyInsert(map3);

					if (outReadystockSupplyCnt == 1) {

						Map<String, Object> map4 = new HashMap<String, Object>();

						map4.put("logs_code", logs_code);
						map4.put("sto_code", outReadyStoCode); 
						map4.put("ware_code", outReadyWareCode); 

						updateCnt = lddao.stockOutReady(map4);
					}
				}

			} else { 

				int getWareCode = pddao.getWareCode(3); 

				int modifyStoQuantity = logs_quantity;

				if (logs_shortage > 0) { 
					modifyStoQuantity = retrunStoQuantity; 
				}

				Map<String, Object> map4 = new HashMap<String, Object>();
				map4.put("sto_quantity", modifyStoQuantity);
				map4.put("ware_code", getWareCode);
				map4.put("pro_code", pro_code);

				int outStockInsertCnt = lddao.outStockInsert(map4);

				if (outStockInsertCnt == 1) { 

					Map<String, Object> scsmap2 = new HashMap<String, Object>();
					scsmap2.put("ware_code", getWareCode);
					scsmap2.put("pro_code", pro_code);

					StockVO vo2 = lddao.outStockCodeSelect(scsmap2);

					int newStoCode = vo2.getSto_code();
					getWareCode = vo2.getWare_code();

					Map<String, Object> map2 = new HashMap<String, Object>();
					map2.put("sto_code", newStoCode);

					if (logs_shortage > 0) { 
						logs_quantity = 0; 
					} else {
						logs_quantity = retrunStoQuantity - logs_quantity;
					}

					map2.put("stsu_quantity", logs_quantity);
					map2.put("stsu_amount", modifyStoQuantity);
					map2.put("ware_code", getWareCode);
					map2.put("pro_code", pro_code);

					map2.put("emp_code", emp_code);
					
					int outReadystockSupplyCnt = lddao.outReadystockSupplyInsert(map2);

					if (outReadystockSupplyCnt == 1) {

						Map<String, Object> map3 = new HashMap<String, Object>();

						map3.put("logs_code", logs_code);
						map3.put("newStoCode", newStoCode);

						int logisticsStatementUpdateCnt = lddao.logisticsStatementUpdate(map3);

						if (logisticsStatementUpdateCnt == 1) {

							Map<String, Object> map5 = new HashMap<String, Object>();

							map5.put("logs_code", logs_code); 
							map5.put("sto_code", newStoCode);
							map5.put("ware_code", getWareCode);

							updateCnt = lddao.stockOutReady(map5);
						}
					}
				}

			}
		}

		int logs_quantity3 = Integer.parseInt(req.getParameter("logs_quantity")); 

		if (logs_shortage > 0) {

			Map<String, Object> stgmap = new HashMap<String, Object>();
			int a = 3;
			stgmap.put("logs_state", a);
			stgmap.put("logs_code", logs_code);

			int sUpdateCnt = lddao.shortageLogsupdate(stgmap);
		}

		model.addAttribute("updateCnt", updateCnt);
	}

	// 김민수 - 구매팀 요청 보내기
	public void logsAction(HttpServletRequest req, Model model) {
		int logs_code = Integer.parseInt(req.getParameter("logs_code"));
		LogisticsStatementVO vo = new LogisticsStatementVO();
		vo.setLogs_state(4);
		vo.setLogs_code(logs_code);

		int updateCnt = lddao.logsupdate(vo);

		model.addAttribute("num", logs_code);
		model.addAttribute("updateCnt", updateCnt);
	}
}
