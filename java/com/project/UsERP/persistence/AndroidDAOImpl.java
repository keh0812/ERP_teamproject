package com.project.UsERP.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.UsERP.vo.EmployeeVO;
import com.project.UsERP.vo.SalaryVO;
import com.project.UsERP.vo.StockSupplyVO;
import com.project.UsERP.vo.StockVO;

@Repository
public class AndroidDAOImpl implements AndroidDAO {
   
   @Autowired
   SqlSession sqlSession;
   
   // 조명재 - 사원정보를 반환한다
   @Override
   public EmployeeVO getEmpInfo(String emp_code) {
      AndroidDAO dao = sqlSession.getMapper(AndroidDAO.class);
      return dao.getEmpInfo(emp_code);
   }

   // 김민수 - 재고수불부 내역
   @Override
   public List<StockSupplyVO> getSupplyList() {
      return sqlSession.selectList("com.project.UsERP.persistence.AndroidDAO.getSupplyList");
   }
   
   // 최유성 - 재고현황정보를 반환한다
   @Override
   public List<StockVO> getStoInfo() {
      
      return sqlSession.selectList("com.project.UsERP.persistence.AndroidDAO.getStoInfo");
   }

   // 김은희 - 인사카드정보를 반환한다
   @Override
   public List<EmployeeVO> getEmployeeInfo() {
      
      return sqlSession.selectList("com.project.UsERP.persistence.AndroidDAO.getEmployeeInfo");
   }
   
   // 조명재 - 급여내역정보를 반환한다
   @Override
   public List<SalaryVO> getSalInfo() {
      
      return sqlSession.selectList("com.project.UsERP.persistence.AndroidDAO.getSalInfo");
   }

// 강재현 - 회계보고서 - 재무상태표 상품
   @Override
   public int get1() {
      AdDAO dao = sqlSession.getMapper(AdDAO.class);
      return dao.get1();
      // return sqlSession.selectOne("com.project.UsERP.persistence.AdDAO.get1");
   }

   // 강재현 - 회계보고서 - 재무상태표 외상매출금
   @Override
   public int get2() {
      return sqlSession.selectOne("com.project.UsERP.persistence.AdDAO.get2");
   }

   // 강재현 - 회계보고서 - 재무상태표
   @Override
   public int get3() {
      return sqlSession.selectOne("com.project.UsERP.persistence.AdDAO.get3");
   }

   // 강재현 - 회계보고서 - 재무상태표 외상매입금
   @Override
   public int get4() {
      return sqlSession.selectOne("com.project.UsERP.persistence.AdDAO.get4");
   }

   // 이재홍 : 회계보고서 - 손익계산서 매출액
   @Override
   public int sum() {
      return sqlSession.selectOne("com.project.UsERP.persistence.AdDAO.sum");
   }

   // 이재홍 : 회계보고서 - 손익계산서 매출원가
   @Override
   public int sum1() {
      return sqlSession.selectOne("com.project.UsERP.persistence.AdDAO.sum1");
   }

   // 이재홍 - 회계보고서 - 손익계산서 판매비와 관리비
   @Override
   public int sum2() {
      return sqlSession.selectOne("com.project.UsERP.persistence.AdDAO.sum2");
   }
   
}