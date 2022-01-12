package com.project.UsERP.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.UsERP.service.AndroidService;
import com.project.UsERP.vo.EmployeeVO;
import com.project.UsERP.vo.SalaryVO;
import com.project.UsERP.vo.StockSupplyVO;
import com.project.UsERP.vo.StockVO;

@Controller
public class AndroidController {
   
   private static final Logger logger = LoggerFactory.getLogger(AndroidController.class);
   
   @Autowired
   AndroidService service;
   
   // 조명재 - 안드로이드 로그인
   @ResponseBody
   @RequestMapping("android/androidLogin")
   public Map<String, String> androidLogin(HttpServletRequest req) {
      logger.info("url: 안드로이드 로그인");
      
      Map<String, String> map = service.androidLogin(req);
      
      return map;
   }
   
   // 김민수 - 안드로이드 재고수불부
   @ResponseBody
   @RequestMapping("android/androidSupply")
   public List<StockSupplyVO> androidSupply(HttpServletRequest req) {
      logger.info("url : 안드로이드 재고 수불부");
      
//      List<StockSupplyVO> supplyvo = service.androidSupply(req);
      
      return service.androidSupply(req);
   }
   
   // 최유성 - 재고현황
   @ResponseBody
   @RequestMapping("android/androidStock")
   public List<StockVO> androidStock(HttpServletRequest req) {
         logger.info("url: 안드로이드 재고현황");
         
         List<StockVO> stoList = service.androidStock(req);
         
         return stoList;
   }
   
   // 김은희 - 인사카드조회
   @ResponseBody
   @RequestMapping("android/androidEmployee")
   public List<EmployeeVO> androidEmployee(HttpServletRequest req) {
      logger.info("url: 안드로이드 인사카드조회");
      
      List<EmployeeVO> empList = service.androidEmployee(req);
      
      return empList;
   }
   
   // 조명재 - 급여내역조회
   @ResponseBody
   @RequestMapping("android/androidSalary")
   public List<SalaryVO> androidSalary(HttpServletRequest req) {
      logger.info("url: 안드로이드 급여내역");
      
      List<SalaryVO> salList = service.androidSalary(req);
      
      return salList;
   }
   
   // 강재현 - 재무상태표
   @ResponseBody
   @RequestMapping("android/androidBS")
   public Map<String, String> androidBS(HttpServletRequest req) {
      logger.info("url: 안드로이드 재무상태표");
      
      Map<String, String> map = service.androidBS(req);
      
      return map;
   }
   
   // 이재홍 - 손익계산서
   @ResponseBody
   @RequestMapping("android/androidIS")
   public Map<String, String> androidIS(HttpServletRequest req) {
      logger.info("url: 안드로이드 손익계산서");
      
      Map<String, String> map = service.androidIS(req);
      
      return map;
   }

   
}