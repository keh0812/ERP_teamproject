package com.project.UsERP.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.project.UsERP.vo.EmployeeVO;
import com.project.UsERP.vo.SalaryVO;
import com.project.UsERP.vo.StockSupplyVO;
import com.project.UsERP.vo.StockVO;

public interface AndroidService {
   
   // 조명재 - 안드로이드 로그인
   public Map<String, String> androidLogin(HttpServletRequest req);
   
   // 김민수 - 안드로이드 재고수불부
   public List<StockSupplyVO> androidSupply(HttpServletRequest req);
   
   // 최유성 - 재고현황
   public List<StockVO> androidStock(HttpServletRequest req);
   
   // 김은희 - 인사카드
   public List<EmployeeVO> androidEmployee(HttpServletRequest req);
   
   // 조명재 - 급여내역
   public List<SalaryVO> androidSalary(HttpServletRequest req);
   
   // 강재현 - 재무상태표
   public Map<String, String> androidBS(HttpServletRequest req); 
   
   // 이재홍 - 손익계산서
   public Map<String, String> androidIS(HttpServletRequest req);
   
}