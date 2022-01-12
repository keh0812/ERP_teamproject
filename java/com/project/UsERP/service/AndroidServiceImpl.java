package com.project.UsERP.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.project.UsERP.persistence.AndroidDAO;
import com.project.UsERP.vo.EmployeeVO;
import com.project.UsERP.vo.SalaryVO;
import com.project.UsERP.vo.StockSupplyVO;
import com.project.UsERP.vo.StockVO;

@Service
public class AndroidServiceImpl implements AndroidService {
   
   @Autowired
   AndroidDAO dao;
   
   @Autowired
   BCryptPasswordEncoder passwordEncoder;
   
   // 조명재 - 안드로이드 로그인
   @Override
   public Map<String, String> androidLogin(HttpServletRequest req) {
      // 안드로이드에서 전달한 값
      String emp_code = req.getParameter("id");
      String pwd = req.getParameter("pwd");
      
      // 로그인 처리
      EmployeeVO vo = dao.getEmpInfo(emp_code);
      
      boolean check = false;
      if(passwordEncoder.matches(pwd, vo.getEmp_pwd())) check = true;
      
      // 웹에서 안드로이드로 전달할 값
      Map<String, String> map = new HashMap<String, String>();
      if(check) {
         map.put("emp_name", vo.getEmp_name());
      } else {
         map.put("emp_name", null);
      }
      
      return map;
   }

   // 김민수 - 안드로이드 재고수불부
   @Override
   public List<StockSupplyVO> androidSupply(HttpServletRequest req) {
      List<StockSupplyVO> supplyvo = dao.getSupplyList();
      
      return supplyvo;
   }
   
   // 최유성 - 재고현황
   @Override
   public List<StockVO> androidStock(HttpServletRequest req) {
      
      List<StockVO> stoList = dao.getStoInfo();
      
      return stoList;
   }

   // 김은희  - 인사카드
   @Override
   public List<EmployeeVO> androidEmployee(HttpServletRequest req) {
      
      List<EmployeeVO> empList = dao.getEmployeeInfo();
      
      return empList;
   }
   
   // 조명재 - 급여내역
   @Override
   public List<SalaryVO> androidSalary(HttpServletRequest req) {
      
      List<SalaryVO> salList = dao.getSalInfo();
      
      return salList;
   }
   
   // 강재현 - 재무상태표
   @Override
   public Map<String, String> androidBS(HttpServletRequest req) {
      
      String get1 = String.valueOf(dao.get1()); //재무상태표 상품
      String get2 = String.valueOf(dao.get2()); //재무상태표 외상매출금
      String get3 = String.valueOf(dao.get3()); //
      String get4 = String.valueOf(dao.get4()); //재무상태표 외상매입금

      String get5 = String.valueOf(10000000 + dao.get1() + dao.get2());
      
      get1 = get1.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
      get2 = get2.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
      get3 = get3.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
      get4 = get4.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
      get5 = get5.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
      
      // 웹에서 안드로이드로 전달할 값
      Map<String, String> map = new HashMap<String, String>();
      
      map.put("get1",get1); //재무상태표 상품
      map.put("get2",get2); //재무상태표 외상매출금
      map.put("get3",get3);
      map.put("get4",get4); //재무상태표 외상매입금
      map.put("get5", get5);
      
      return map;
   }

   // 이재홍 - 손익계산서
   @Override
   public Map<String, String> androidIS(HttpServletRequest req) {
      
      String sum = String.valueOf(dao.sum()); //매출액
      String sum1 = String.valueOf(dao.sum1()); //매출원가
      String sum2 = String.valueOf(dao.sum2()); //판매비와 관리비
      //매출 총이익
      String sum3 = String.valueOf(dao.sum() - dao.sum1());
      //영업 이익
      String sum4 = String.valueOf(dao.sum() - dao.sum1() - dao.sum2());
      
      sum = sum.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
      sum1 = sum1.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
      sum2 = sum2.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
      sum3 = sum3.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
      sum4 = sum4.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
      
      // 웹에서 안드로이드로 전달할 값
      Map<String, String> map = new HashMap<String, String>();
      
      map.put("sum",sum); // 손익계산서 매출액
      map.put("sum1",sum1); // 손익계산서 매출원가
      map.put("sum2",sum2); // 손익계산서 판매비와 관리비
      map.put("sum3",sum3); // 손익계산서 매출 총이익
      map.put("sum4",sum4); // 손익계산서 영업 이익
      
      return map;
   }
   
}