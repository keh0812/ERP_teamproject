package com.project.UsERP.persistence;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.UsERP.vo.AccountStatementVO;
import com.project.UsERP.vo.CompanyVO;
import com.project.UsERP.vo.LogisticsStatementVO;
import com.project.UsERP.vo.ProductVO;
import com.project.UsERP.vo.StockVO;

@Repository
public class StDAOImpl implements StDAO {

	@Autowired
	SqlSession sqlSession;

	// 강재현 - 기초등록 - 판매 거래처 목록
	@Override
	public List<CompanyVO> salesCompanySelect() {
		return sqlSession.selectList("com.project.UsERP.persistence.StDAO.salesCompanySelect");
	}

	// 강재현 - 기초등록 - 판매 거래처 목록 상세페이지
	public CompanyVO companyDetail(int com_code) {
		return sqlSession.selectOne("com.project.UsERP.persistence.StDAO.companyDetail", com_code);
	}

	// 강재현 - 기초등록 - 상품 목록
	@Override
	public List<ProductVO> salesProductSelect() {
		return sqlSession.selectList("com.project.UsERP.persistence.StDAO.salesProductSelect");
	}

	// 강재현 - 재고 현황
	@Override
	public int getStockCnt(String ssKeyword) {
		return sqlSession.selectOne("com.project.UsERP.persistence.StDAO.getStockCnt", ssKeyword);
	}

	// 강재현 - 재고 현황 - 검색 재고 현황 조회
	@Override
	public List<StockVO> StockStatusList(Map<String, Object> map) {
		return sqlSession.selectList("com.project.UsERP.persistence.StDAO.StockStatusList", map);
	}

	// 이재홍 - 판매 현황 - 판매 내역 & 승인 내역
	@Override
	public List<AccountStatementVO> salesList() {
		return sqlSession.selectList("com.project.UsERP.persistence.StDAO.salesList");
	}

	// 이재홍 - 판매 현황 - 판매 전표 상세 페이지
	@Override
	public AccountStatementVO stStatementDetail(int num) {
		return sqlSession.selectOne("com.project.UsERP.persistence.StDAO.stStatementDetail", num);
	}

	// 이재홍 - 판매 현황 - 판매 전표 등록
	@Override
	public int insertSalesStatement(AccountStatementVO vo) {
		return sqlSession.insert("com.project.UsERP.persistence.StDAO.insertSalesStatement", vo);
	}

	// 강재현 - 출고현황 - 출고 내역
	@Override
	public List<LogisticsStatementVO> logisticsList() {
		return sqlSession.selectList("com.project.UsERP.persistence.StDAO.logisticsList");
	}

	// 강재현 - 판매 현황 - 회계 전표 내역
	@Override
	public List<AccountStatementVO> stList() {
		return sqlSession.selectList("com.project.UsERP.persistence.StDAO.stList");
	}

	// 강재현 - 출고 현황 - 출고 전표 등록 - 회계 전표 내역 상세
	@Override
	public AccountStatementVO insertList(int accs_code) {
		return sqlSession.selectOne("com.project.UsERP.persistence.StDAO.insertList", accs_code);
	}

	// 강재현 - 출고 현황 - 상품에 대한 재고코드가 존재하는지 가지고 온다
	@Override
	public StockVO getStock(Map<String, Object> map) {
		return sqlSession.selectOne("com.project.UsERP.persistence.StDAO.getStock", map);
	}

	// 강재현 - 출고현황 - 출고 전표 등록
	@Override
	public int insertLogsStatement(LogisticsStatementVO vo) {
		return sqlSession.insert("com.project.UsERP.persistence.StDAO.insertLogsStatement", vo);
	}

	// 강재현 - 출고현황 - 출고 전표 등록시 회계전표 상태코드 변화
	@Override
	public int updatestatement(AccountStatementVO vo1) {
		return sqlSession.update("com.project.UsERP.persistence.StDAO.updatestatement", vo1);
	}

}
