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
public class PdDAOImpl implements PdDAO {

	@Autowired
	SqlSession sqlSession;

	// 최유성 - 기초 등록 - 구매 거래처 목록
	@Override
	public List<CompanyVO> pdCompanySelect() {

		return sqlSession.selectList("com.project.UsERP.persistence.PdDAO.pdCompanySelect");
	}

	// 최유성 - 기초 등록 - 상품 목록
	@Override
	public List<ProductVO> pdProductSelect() {

		return sqlSession.selectList("com.project.UsERP.persistence.PdDAO.pdProductSelect");
	}

	// 최유성 - 기초등록 - 구매 거래처 목록 상세페이지
	public CompanyVO pdcompanyDetail(int com_code) {
		return sqlSession.selectOne("com.project.UsERP.persistence.PdDAO.pdcompanyDetail", com_code);
	}

	// 최유성 - 기초등록 - 상세 상세페이지
	@Override
	public ProductVO pdproductDetail(int pro_code) {
		return sqlSession.selectOne("com.project.UsERP.persistence.PdDAO.pdproductDetail", pro_code);
	}

	// 최유성 - 검색 재고 현황 갯수 구하기
	@Override
	public int getStockCnt(String ssKeyword) {
		return sqlSession.selectOne("com.project.UsERP.persistence.PdDAO.getStockCnt", ssKeyword);
	}

	// 최유성 - 검색 재고 현황 조회
	@Override
	public List<StockVO> StockStatusList(Map<String, Object> map) {
		return sqlSession.selectList("com.project.UsERP.persistence.PdDAO.StockStatusList", map);
	}

	// 이재홍 - 구매 현황 - 구매 내역 & 승인 내역
	@Override
	public List<AccountStatementVO> buyList() {

		return sqlSession.selectList("com.project.UsERP.persistence.PdDAO.buyList");
	}

	// 이재홍 - 구매 현황 - 구매 전표 상세 페이지
	@Override
	public AccountStatementVO pdStatementDetail(int num) {

		return sqlSession.selectOne("com.project.UsERP.persistence.PdDAO.pdStatementDetail", num);
	}

	// 이재홍 - 구매 현황 - 구매 전표 등록
	@Override
	public int insertBuyStatement(AccountStatementVO vo) {

		return sqlSession.insert("com.project.UsERP.persistence.PdDAO.insertBuyStatement", vo);
	}

	// 최유성 - 입고 현황 - 입고 내역
	@Override
	public List<LogisticsStatementVO> pdStockInOrder() {

		return sqlSession.selectList("com.project.UsERP.persistence.PdDAO.pdStockInOrder");
	}

	// 최유성 - 입고 현황 - 회계 전표 승인 내역
	@Override
	public List<AccountStatementVO> AccountStatement() {

		return sqlSession.selectList("com.project.UsERP.persistence.PdDAO.AccountStatement");
	}

	// 최유성 - 입고 현황 - 담당자명 가져오기
	@Override
	public String getEmpName(String emp_code) {

		return sqlSession.selectOne("com.project.UsERP.persistence.PdDAO.getEmpName", emp_code);
	}

	// 최유성 - 입고 현황 - 입고 전표 등록 화면에 들어갈 정보
	@Override
	public AccountStatementVO getAccountStatement(int accs_code) {

		return sqlSession.selectOne("com.project.UsERP.persistence.PdDAO.getAccountStatement", accs_code);
	}

	// 최유성 - 입고 현황 - 상품에 대한 재고코드가 존재하는지 가지고 온다
	@Override
	public Object getStock(Map<String, Object> map) {

		Object selectCnt = sqlSession.selectOne("com.project.UsERP.persistence.PdDAO.getStock", map);

		if (selectCnt == null) {
			return 0;
		}
		return selectCnt;
	}

	// 최유성 - 입고 현황 - 입고 전표 등록
	@Override
	public int logsPdInsert(LogisticsStatementVO vo) {
		return sqlSession.insert("com.project.UsERP.persistence.PdDAO.logsPdInsert", vo);
	}

	// 최유성 - 입고 현황 - 입고 전표 등록시 회계전표 상태코드 변화
	@Override
	public int updatestatement(AccountStatementVO vo) {

		return sqlSession.update("com.project.UsERP.persistence.PdDAO.updatestatement", vo);
	}

	// 최유성 - 입고 현황 - 창고코드 가져 오기
	@Override
	public int getWareCode(int ware_type) {

		return sqlSession.selectOne("com.project.UsERP.persistence.PdDAO.getWareCode", ware_type);
	}

	// 부족 수량 내역 조회
	public List<LogisticsStatementVO> logsshortage() {
		return sqlSession.selectList("com.project.UsERP.persistence.PdDAO.logsshortage");
	}

	// 부족 수량 내역 상세 조회
	@Override
	public LogisticsStatementVO logsshortageDetail(int logs_code) {

		return sqlSession.selectOne("com.project.UsERP.persistence.PdDAO.logsshortageDetail", logs_code);
	}
}