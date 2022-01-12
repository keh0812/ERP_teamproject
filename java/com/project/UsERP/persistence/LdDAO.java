package com.project.UsERP.persistence;

import java.util.List;
import java.util.Map;

import com.project.UsERP.vo.CompanyVO;
import com.project.UsERP.vo.LogisticsStatementVO;
import com.project.UsERP.vo.ProductVO;
import com.project.UsERP.vo.StockSupplyVO;
import com.project.UsERP.vo.StockVO;
import com.project.UsERP.vo.WarehouseVO;


public interface LdDAO {
	
	// 최유성 - 입고내역 미승인
	public List<LogisticsStatementVO> stockInOrder1();
	
	// 최유성 - 입고내역 승인
	public List<LogisticsStatementVO> stockInOrder2();
	
	// 최유성 - 출고내역 미승인
	public List<LogisticsStatementVO> stockOutOrder1();
	
	// 최유성 - 출고내역 승인
	public List<LogisticsStatementVO> stockOutOrder2();
	
	// 최유성 - 입고 승인 액션
	public int stockInAction(int logs_code);
	
	// 최유성 - 물류 전표 상세페이지
	public LogisticsStatementVO getLdDetail(int logs_code);
	
	// 최유성 - 재고 코드가 존재할 시 기존에 있던 재고 수량 가져오기(입출고 둘다 사용가능할 듯)
	public int retrunStoQuantity(int sto_code);
	
	// 최유성 - 재고코드가 존재하지 않을 시(새로운 재고 등록) 인서트
	public int stockInsert(Map<String, Object> map);
	
	// 최유성 - 재고코드가 존재하지 않을 시 새로 등록한 재고의 재고 코드를 가져오기
	public int stockCodeSelect(Map<String, Object> map);
	
	// 최유성 - 재고코드가 존재할 시(기존 재고 코드에 수량 업데이트)
	public int stockUpdate(Map<String, Object> map);
	
	// 최유성 - 재고전표에 널값인 재고코드에 새로 생성한 재고코드를 업데이트
	public int logisticsStatementUpdate(Map<String, Object> map);
	
	// 최유성 - 입고시 재고수불부 인서트
	public int stockSupplyInsert(Map<String, Object> map);
	
	// 최유성 - 출고 준비 완료(1)로 전표상태 변경 / 출고대기창고 관련 재고코드로 변경..
	public int stockOutReady(Map<String, Object> map);
	
	// 최유성 - 출고대기창고 관련  해당 상품에 대한 재고코드 및 재고수량 가져오기
	public StockVO outReadyStockSelect(Map<String, Object> map);
	
	// 최유성 - 출고대기창고 관련 해당 상품에 관한 재고코드가 존재하지 않을 시(새로운 재고 등록) 인서트
	public int outStockInsert(Map<String, Object> map);
	
	// 최유성 - 양품창고에서 출고대기창고로 재고수량이동 시 재구수불부 등록
	public int outReadystockSupplyInsert(Map<String, Object> map);
	
	// 최유성 - 출고대기창고 관련 해당 상품에 관한 재고코드가 존재하지 않을 시 새로 등록한 재고의 재고 코드를 가져오기
	public StockVO outStockCodeSelect(Map<String, Object> map);

	// 최유성 - 부족수량 존재시 물류전표 업데이트 
	public int shortageLogsupdate(Map<String, Object> map);
	
	// 김민수 - 양품창고 등록
	public int insertGoodWare(WarehouseVO vo);
	
	// 김민수 - 불량품창고 등록
	public int insertBadWare(WarehouseVO vo);
	
	// 김민수 - 출고대기창고 등록
	public int insertWaitWare(WarehouseVO vo);
	
	// 김민수 - 창고 목록
	public List<WarehouseVO> warehouseList();
	
	// 김민수 - 창고 상세 목록
	public WarehouseVO warehouseDetail(int ware_code);
	
	// 김민수 - 창고 정보 수정
	public int warehouseModify(WarehouseVO vo);
	
	// 김민수 - 검색 거래처 갯수 구하기
	public int getCompanyCnt(String compKeyword);
	
	// 김민수 - 검색 거래처 조회
	public List<CompanyVO> CompanyList(Map<String, Object> map);
	
	// 김민수 - 거래처 상세 페이지
	public CompanyVO companyDetail(int com_code);
	
	// 김민수 - 검색 상품 갯수 구하기
	public int getProductCnt(String proKeyword);
	
	// 김민수 - 검색 상품 조회
	public List<ProductVO> ProductList(Map<String, Object> map);
	
	// 김민수 - 검색 재고 현황 갯수 구하기
	public int getStockCnt(String ssKeyword);
	
	// 김민수 - 검색 재고 현황 조회(페이징)
	public List<StockVO> StockStatusList(Map<String, Object> map);
	
	// 김민수 - 재고 관리 상품 조회
	public List<ProductVO> selectProduct();
	
	// 김민수 - 재고 관리 창고 조회
	public List<WarehouseVO> selectWarehouse();
	
	// 김민수 - 재고 이동 재고테이블 가져오기
	public StockVO stockDefaultList();
	
	// 김민수 - 재고 이동 재고테이블 여부 확인
	public StockVO stockState (Map<String, Object> stateMap);
	
	// 김민수 - 재고 이동 재고 테이블 불량품 창고 등록
	public int stockBadWare(StockVO stockVo);
	
	// 김민수 - 재고 이동 출발창고 수량 변경
	public int stoMinusUpdate(Map<String, Object> minusMap);
	
	// 김민수 - 재고 이동 도착창고 수량 변경
	public int stoPlusUpdate(Map<String, Object> plusMap);
	
	// 김민수 - 재고 이동 재고테이블 수량 가져오기
	public String getStoQuantity(Map<String, Object> quantityMap);
	
	// 김민수 - 재고 이동 출발창고이름 가져오기
	public String getStartWareName(int startwh);
	
	// 김민수 - 재고 이동 도착창고이름 가져오기
	public String getArriveWareName(int arrivewh);
	
	// 김민수 - 재고 이동 재고수불부 등록
	public int stsuMoveInsert(StockSupplyVO stockSupplyVO);
	
	// 김민수 - 재고 이동 출고전표 상태 변경
	public int moveSoStateUpdate(int logscode);
	
	// 김민수 - 재고 이동 출고내역 재고수불부 등록
	public int stsuStockOutInsert(StockSupplyVO stockSupplyVO);
	
	// 김민수 - 재고 조정 등록
	public int adjustmentInsert(StockSupplyVO stockSupplyVO);
	
	// 김민수 - 재고 조정 갯수 구하기
	public int getAdjustment();
	
	// 김민수 - 재고 조정 내역 조회
	public List<StockSupplyVO> adjustmentList(Map<String, Object> map);
	
	// 김민수 - 재고 수불부 상품 코드 가져오기
	public String getProCode(String proname);
	
	// 김민수 - 재고 수불부 내역 조회
	public List<StockSupplyVO> stockSupplyList(Map<String, Object> map);
	
	// 김민수 - 부족수량 출고물류전표 가져오기
	public List<LogisticsStatementVO> logsCodeSelectList();
	
	// 김민수 - 물류출고전표(부족수량) 부족수량 불러오기
	public String logsShortAgeSelect(int logscode);
	
	// 김민수 - 물류출고전표(부족수량) 부족수량 변경
	public int logsShortAgeUpdate(Map<String, Object> shortMap);
	
	// 김민수 - 물류출고전표(부족수량) 출고준비상태로 변경
	public int logsStateUpdate(int logscode);
	
	// 김민수 - 입출고 내역 조회
	public List<StockSupplyVO> shiRecList();
	
	// 구매팀 요청 보내기 
	public int logsupdate(LogisticsStatementVO vo);
}
