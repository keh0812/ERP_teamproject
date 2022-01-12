package com.project.UsERP.persistence;

import java.util.List;

import com.project.UsERP.vo.EmployeeVO;
import com.project.UsERP.vo.SalaryVO;
import com.project.UsERP.vo.StockSupplyVO;
import com.project.UsERP.vo.StockVO;

public interface AndroidDAO {
   
   // 조명재 - 사원정보를 반환한다
   public EmployeeVO getEmpInfo(String emp_code);
   
   // 김민수 - 재고수불부 내역
   public List<StockSupplyVO> getSupplyList();
   
   // 최유성 - 재고현황정보를 반환한다
   public List<StockVO> getStoInfo();
   
   // 김은희 - 인사카드정보를 반환한다
   public List<EmployeeVO> getEmployeeInfo();
   
   // 조명재 - 급여내역정보를 반환한다
   public List<SalaryVO> getSalInfo();
   
   // 강재현 - 회계보고서 - 재무상태표 상품
   public int get1();

   // 강재현 - 회계보고서 - 재무상태표 외상매출금
   public int get2();

   // 강재현 - 회계보고서 - 재무상태표
   public int get3();

   // 강재현 - 회계보고서 - 재무상태표 외상매입금
   public int get4();

   // 이재홍 - 회계보고서 - 손익계산서 매출액
   public int sum();

   // 이재홍 - 회계보고서 - 손익계산서 매출원가
   public int sum1();

   // 이재홍 - 회계보고서 - 손익계산서 판매비와 관리비
   public int sum2();
   
}