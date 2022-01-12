package com.project.UsERP.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.UsERP.vo.CompanyVO;
import com.project.UsERP.vo.LogisticsStatementVO;
import com.project.UsERP.vo.ProductVO;
import com.project.UsERP.vo.StockSupplyVO;
import com.project.UsERP.vo.StockVO;
import com.project.UsERP.vo.WarehouseVO;


@Repository
public class LdDAOImpl implements LdDAO{
	
	@Autowired
	SqlSession sqlSession;

	// 최유성 - 입고내역 미승인
	@Override
	public List<LogisticsStatementVO> stockInOrder1() {
		
		return sqlSession.selectList("com.project.UsERP.persistence.LdDAO.stockInOrder1");
	}

	// 최유성 - 입고내역 승인
	@Override
	public List<LogisticsStatementVO> stockInOrder2() {
		return sqlSession.selectList("com.project.UsERP.persistence.LdDAO.stockInOrder2");
	}
	
	// 최유성 - 출고내역 미승인
	@Override
	public List<LogisticsStatementVO> stockOutOrder1() {
		
		return sqlSession.selectList("com.project.UsERP.persistence.LdDAO.stockOutOrder1");
	}
	
	// 최유성 - 출고내역 승인
	@Override
	public List<LogisticsStatementVO> stockOutOrder2() {
		return sqlSession.selectList("com.project.UsERP.persistence.LdDAO.stockOutOrder2");
	}
	
	// 최유성 - 입고 승인 액션
	@Override
	public int stockInAction(int logs_code) {
		
		return sqlSession.update("com.project.UsERP.persistence.LdDAO.stockInAction", logs_code);
	}
	
	//재고 코드가 존재할 시 기존에 있던 재고 수량 가져오기(입출고 둘다 사용가능할듯)
	@Override
	public int retrunStoQuantity(int sto_code) {
		
		return sqlSession.selectOne("com.project.UsERP.persistence.LdDAO.retrunStoQuantity",sto_code);
	}
	
	// 최유성 - 재고코드가 존재하지 않을시(새로운 상품 입고) 재고 등록
	@Override
	public int stockInsert(Map<String, Object> map) {
		
		return sqlSession.insert("com.project.UsERP.persistence.LdDAO.stockInsert", map);
	}
	
	// 최유성 - 재고코드가 존재하지 않을 시 새로 등록한 재고의 재고 코드를 가져오기
	@Override
	public int stockCodeSelect(Map<String, Object> map) {
		
		return sqlSession.selectOne("com.project.UsERP.persistence.LdDAO.stockCodeSelect", map);
	}

	// 최유성 - 재고전표에 널값인 재고코드에 새로 생성한 재고코드를 업데이트
	@Override
	public int logisticsStatementUpdate(Map<String, Object> map) {
		
		return sqlSession.update("com.project.UsERP.persistence.LdDAO.logisticsStatementUpdate", map);
	}
	
	// 최유성 - 재고코드가 존재할 시(기존 재고 코드에 수량 업데이트)
	@Override
	public int stockUpdate(Map<String, Object> map) {
		
		return sqlSession.update("com.project.UsERP.persistence.LdDAO.stockUpdate", map);
	}
	
	// 최유성 - 재고코드가 존재할 시 재고수불코드 인서트
	@Override
	public int stockSupplyInsert(Map<String, Object> map) {
		
		return sqlSession.insert("com.project.UsERP.persistence.LdDAO.stockSupplyInsert", map);
	}
	
	// 최유성 - 출고 준비 완료로 상태 변경 - 양품창고에서 출고대기창고로 수량이동
	@Override
	public int stockOutReady(Map<String, Object> map) {
		
		return sqlSession.update("com.project.UsERP.persistence.LdDAO.stockOutReady", map);
	}
	
	// 최유성 - 출고대기창고 관련  해당 상품에 대한 재고코드 및 재고수량 가져오기
	@Override
	public StockVO outReadyStockSelect(Map<String, Object> map) {
		
		return sqlSession.selectOne("com.project.UsERP.persistence.LdDAO.outReadyStockSelect", map);
	}
	
	// 최유성 - 양품창고에서 출고대기창고로 재고수량이동 시 재구수불부 등록
	@Override
	public int outReadystockSupplyInsert(Map<String, Object> map) {
		
		return sqlSession.insert("com.project.UsERP.persistence.LdDAO.outReadystockSupplyInsert", map);
	}
	
	// 최유성 - 출고대기창고 관련 해당 상품에 관한 재고코드가 존재하지 않을 시(새로운 재고 등록) 인서트
	@Override
	public int outStockInsert(Map<String, Object> map) {
		
		return sqlSession.insert("com.project.UsERP.persistence.LdDAO.outStockInsert", map);
	}
	
	// 최유성 - 출고대기창고 관련 해당 상품에 관한 재고코드가 존재하지 않을 시 새로 등록한 재고의 재고 코드를 가져오기
	@Override
	public StockVO outStockCodeSelect(Map<String, Object> map) {
		
		return sqlSession.selectOne("com.project.UsERP.persistence.LdDAO.outStockCodeSelect", map);
	}

	// 최유성 - 물류 전표 상세페이지
	@Override
	public LogisticsStatementVO getLdDetail(int logs_code) {
		return sqlSession.selectOne("com.project.UsERP.persistence.LdDAO.getLdDetail", logs_code);
	}
	
	// 최유성 - 부족수량 존재시 물류전표 업데이트
    @Override
    public int shortageLogsupdate(Map<String, Object> map) {
      
       return sqlSession.update("com.project.UsERP.persistence.LdDAO.shortageLogsupdate",map);
    }
	
	// 김민수 - 양품창고 등록
	@Override
	public int insertGoodWare(WarehouseVO vo) {
		return sqlSession.insert("com.project.UsERP.persistence.LdDAO.insertGoodWare", vo);
	}

	// 김민수 - 불량품창고 등록
	@Override
	public int insertBadWare(WarehouseVO vo) {
		return sqlSession.insert("com.project.UsERP.persistence.LdDAO.insertBadWare", vo);
	}

	// 김민수 - 출고대기창고 등록
	@Override
	public int insertWaitWare(WarehouseVO vo) {
		return sqlSession.insert("com.project.UsERP.persistence.LdDAO.insertWaitWare", vo);
	}

	// 김민수 - 창고 목록
	@Override
	public List<WarehouseVO> warehouseList() {
		return sqlSession.selectList("com.project.UsERP.persistence.LdDAO.warehouseList");
	}

	// 김민수 - 창고 상세 목록
	@Override
	public WarehouseVO warehouseDetail(int ware_code) {
		return sqlSession.selectOne("com.project.UsERP.persistence.LdDAO.warehouseDetail", ware_code);
	}
	
	// 김민수 - 창고 정보 수정
	@Override
	public int warehouseModify(WarehouseVO vo) {
		return sqlSession.update("com.project.UsERP.persistence.LdDAO.warehouseModify", vo);
	}
	
	// 김민수 - 검색 거래처 갯수 구하기
	@Override
	public int getCompanyCnt(String compKeyword) {
		return sqlSession.selectOne("com.project.UsERP.persistence.LdDAO.getCompanyCnt", compKeyword);
	}
	
	// 김민수 - 검색 거래처 조회
	@Override
	public List<CompanyVO> CompanyList(Map<String, Object> map) {
		return sqlSession.selectList("com.project.UsERP.persistence.LdDAO.CompanyList", map);
	}
	
	// 김민수 - 거래처 상세 페이지
	@Override
	public CompanyVO companyDetail(int com_code) {
		return sqlSession.selectOne("com.project.UsERP.persistence.LdDAO.companyDetail", com_code);
	}
	
	// 김민수 - 검색 상품 갯수 구하기
	@Override
	public int getProductCnt(String proKeyword) {
		return sqlSession.selectOne("com.project.UsERP.persistence.LdDAO.getProductCnt", proKeyword);
	}
	
	// 김민수 - 검색 상품 조회
	@Override
	public List<ProductVO> ProductList(Map<String, Object> map) {
		return sqlSession.selectList("com.project.UsERP.persistence.LdDAO.ProductList", map);
	}

	// 김민수 - 검색 재고 현황 갯수 구하기
	@Override
	public int getStockCnt(String ssKeyword) {
		return sqlSession.selectOne("com.project.UsERP.persistence.LdDAO.getStockCnt", ssKeyword);
	}

	// 김민수 - 검색 재고 현황 조회(페이징)
	@Override
	public List<StockVO> StockStatusList(Map<String, Object> map) {
		return sqlSession.selectList("com.project.UsERP.persistence.LdDAO.StockStatusList", map);
	}

	// 김민수 - 재고 관리 상품 조회
	@Override
	public List<ProductVO> selectProduct() {
		return sqlSession.selectList("com.project.UsERP.persistence.LdDAO.selectProduct");
	}
	
	// 김민수 - 재고 관리 창고 조회
	@Override
	public List<WarehouseVO> selectWarehouse() {
		return sqlSession.selectList("com.project.UsERP.persistence.LdDAO.selectWarehouse");
	}
	
	// 김민수 - 재고 이동 재고테이블 가져오기
	@Override
	public StockVO stockDefaultList() {
		return sqlSession.selectOne("com.project.UsERP.persistence.LdDAO.stockDefaultList");
	}
	
	// 김민수 - 재고 이동 재고테이블 여부 확인
	@Override
	public StockVO stockState(Map<String, Object> stateMap) {
		return sqlSession.selectOne("com.project.UsERP.persistence.LdDAO.stockState", stateMap);
	}
	
	// 김민수 - 재고 이동 재고 테이블 불량품 창고 등록
	@Override
	public int stockBadWare(StockVO stockVo) {
		return sqlSession.insert("com.project.UsERP.persistence.LdDAO.stockBadWare", stockVo);
	}
	
	// 김민수 - 재고 이동 출발창고 수량 변경
	@Override
	public int stoMinusUpdate(Map<String, Object> minusMap) {
		return sqlSession.update("com.project.UsERP.persistence.LdDAO.stoMinusUpdate", minusMap);
	}
	
	// 김민수 - 재고 이동 도착창고 수량 변경
	@Override
	public int stoPlusUpdate(Map<String, Object> plusMap) {
		return sqlSession.update("com.project.UsERP.persistence.LdDAO.stoPlusUpdate", plusMap);
	}
	
	// 김민수 - 재고 이동 재고테이블 수량 가져오기
	@Override
	public String getStoQuantity(Map<String, Object> quantityMap) {
		return sqlSession.selectOne("com.project.UsERP.persistence.LdDAO.getStoQuantity", quantityMap);
	}

	// 김민수 - 재고 이동 출발창고이름 가져오기
	@Override
	public String getStartWareName(int startwh) {
		return sqlSession.selectOne("com.project.UsERP.persistence.LdDAO.getStartWareName", startwh);
	}
	
	// 김민수 - 재고 이동 도착창고이름 가져오기
	@Override
	public String getArriveWareName(int arrivewh) {
		return sqlSession.selectOne("com.project.UsERP.persistence.LdDAO.getArriveWareName", arrivewh);
	}
	
	// 김민수 - 재고 이동 재고수불부 등록
	@Override
	public int stsuMoveInsert(StockSupplyVO stockSupplyVO) {
		return sqlSession.insert("com.project.UsERP.persistence.LdDAO.stsuMoveInsert", stockSupplyVO);
	}
	
	// 김민수 - 재고 이동 출고전표 상태 변경
	@Override
	public int moveSoStateUpdate(int logscode) {
		return sqlSession.update("com.project.UsERP.persistence.LdDAO.moveSoStateUpdate", logscode);
	}
	
	// 김민수 - 재고 이동 출고내역 재고수불부 등록
	@Override
	public int stsuStockOutInsert(StockSupplyVO stockSupplyVO) {
		return sqlSession.insert("com.project.UsERP.persistence.LdDAO.stsuStockOutInsert", stockSupplyVO);
	}
	
	// 김민수 - 재고 조정 등록
	@Override
	public int adjustmentInsert(StockSupplyVO stockSupplyVO) {
		return sqlSession.insert("com.project.UsERP.persistence.LdDAO.adjustmentInsert", stockSupplyVO);
	}
	
	// 김민수 - 재고 조정 갯수 구하기
	@Override
	public int getAdjustment() {
		return sqlSession.selectOne("com.project.UsERP.persistence.LdDAO.getAdjustment");
	}
	
	// 김민수 - 재고 조정 내역 조회
	@Override
	public List<StockSupplyVO> adjustmentList(Map<String, Object> map) {
		return sqlSession.selectList("com.project.UsERP.persistence.LdDAO.adjustmentList", map);
	}
	
	// 김민수 - 재고 수불부 상품 코드 가져오기
	@Override
	public String getProCode(String proname) {
		return sqlSession.selectOne("com.project.UsERP.persistence.LdDAO.getProCode", proname);
	}
	
	// 김민수 - 재고 수불부 내역 조회
	@Override
	public List<StockSupplyVO> stockSupplyList(Map<String, Object> map) {
		return sqlSession.selectList("com.project.UsERP.persistence.LdDAO.stockSupplyList", map);
	}

	// 김민수 - 부족수량 출고물류전표 가져오기
	@Override
	public List<LogisticsStatementVO> logsCodeSelectList() {
		return sqlSession.selectList("com.project.UsERP.persistence.LdDAO.logsCodeSelectList");
	}

	// 김민수 - 물류출고전표(부족수량) 부족수량 불러오기
	@Override
	public String logsShortAgeSelect(int logscode) {
		return sqlSession.selectOne("com.project.UsERP.persistence.LdDAO.logsShortAgeSelect", logscode);
	}

	// 김민수 - 물류출고전표(부족수량) 부족수량 변경
	@Override
	public int logsShortAgeUpdate(Map<String, Object> shortMap) {
		return sqlSession.update("com.project.UsERP.persistence.LdDAO.logsShortAgeUpdate", shortMap);
	}

	// 김민수 - 물류출고전표(부족수량) 출고준비상태로 변경
	@Override
	public int logsStateUpdate(int logscode) {
		
		return sqlSession.update("com.project.UsERP.persistence.LdDAO.logsStateUpdate", logscode);
		
	}

	@Override
	public List<StockSupplyVO> shiRecList() {
		return sqlSession.selectList("com.project.UsERP.persistence.LdDAO.shiRecList");
	}

	// 구매팀 요청 보내기 
	public int logsupdate(LogisticsStatementVO vo) {
		
		return sqlSession.update("com.project.UsERP.persistence.LdDAO.logsupdate",vo);
		
	}
}
