package com.project.UsERP.persistence;

import java.util.List;
import java.util.Map;

import com.project.UsERP.vo.AccountStatementVO;
import com.project.UsERP.vo.CompanyVO;
import com.project.UsERP.vo.LogisticsStatementVO;
import com.project.UsERP.vo.ProductVO;
import com.project.UsERP.vo.StockVO;

public interface PdDAO {

	// 최유성 - 기초 등록 - 구매 거래처 목록
	public List<CompanyVO> pdCompanySelect();

	// 최유성 - 기초 등록 - 상품 목록
	public List<ProductVO> pdProductSelect();

	// 최유성 - 기초등록 - 구매 거래처 목록 상세페이지
	public CompanyVO pdcompanyDetail(int com_code);

	// 최유성 - 기초등록 - 상품 상세 상세페이지
	public ProductVO pdproductDetail(int pro_code);

	// 최유성 - 검색 재고 현황 갯수 구하기
	public int getStockCnt(String ssKeyword);

	// 최유성 - 검색 재고 현황 조회
	public List<StockVO> StockStatusList(Map<String, Object> map);

	// 이재홍 - 구매 현황 - 구매 내역 & 승인 내역
	public List<AccountStatementVO> buyList();

	// 이재홍 - 구매 현황 - 구매 전표 상세 페이지
	public AccountStatementVO pdStatementDetail(int num);

	// 이재홍 - 구매 현황 - 구매 전표 등록
	public int insertBuyStatement(AccountStatementVO vo);

	// 최유성 - 입고 현황 - 입고 내역
	public List<LogisticsStatementVO> pdStockInOrder();

	// 최유성 - 입고 현황 - 회계 전표 승인 내역
	public List<AccountStatementVO> AccountStatement();

	// 최유성 - 입고 현황 - 담당자명 가져오기
	public String getEmpName(String emp_code);

	// 최유성 - 입고 현황 - 입고 전표 등록 화면에 들어갈 정보
	public AccountStatementVO getAccountStatement(int accs_code);

	// 최유성 - 입고 현황 - 상품에 대한 재고코드가 존재하는지 가지고 온다
	public Object getStock(Map<String, Object> map);

	// 최유성 - 입고 현황 - 입고 전표 등록
	public int logsPdInsert(LogisticsStatementVO vo);

	// 최유성 - 입고 현황 - 입고 전표 등록시 회계전표 상태코드 변화
	public int updatestatement(AccountStatementVO vo);

	// 최유성 - 입고 현황 - 창고코드 가져 오기
	public int getWareCode(int ware_type);

	// 부족 수량 내역 조회
	public List<LogisticsStatementVO> logsshortage();

	// 부족 수량 내역 상세 조회
	public LogisticsStatementVO logsshortageDetail(int logs_code);
}