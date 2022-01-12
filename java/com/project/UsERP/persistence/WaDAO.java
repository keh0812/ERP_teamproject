package com.project.UsERP.persistence;

import java.util.List;
import java.util.Map;

import com.project.UsERP.vo.CommuteVO;
import com.project.UsERP.vo.EmployeeVO;
import com.project.UsERP.vo.HrCodeVO;
import com.project.UsERP.vo.WorkRecordVO;

public interface WaDAO {
	
	// 김은희 - 출퇴근 조회
	public List<CommuteVO> commuteList();
	
	// 김은희 - 근태 조회
	public List<WorkRecordVO> waList();
	
	// 김은희 - 근태 신청 사원 확인
	public EmployeeVO empComfirm(String emp_code);
	
	// 김은희 - 출근 버튼 클릭
	public int waStartClick(Map<String, Object> map);
	
	// 김은희 - 퇴근 처리 업데이트
	public int waEndAction(Map<String, Object> map);
	
	// 김은희 - 퇴근 처리 가져오기
	public CommuteVO waEndSelect(String emp_code);
	
	// 김은희 - 야근 버튼 클릭
	public int waNightClick(Map<String, Object> map);
	
	// 김은희 - 인사 코드 조회 - 근태유형
	public List<HrCodeVO> waCodeTyList();
	
	// 김은희 - 근태 신청 
	public int waAppInsert(Map<String, Object> map);
	
	// 김은희 - 근태 신청 조회
	public List<WorkRecordVO> waAppSelect();
	
	// 김은희 - 근태 신청 승인 상세페이지
	public WorkRecordVO waDetail(String emp_code);
	
	// 김은희 - 근태 신청 승인 처리
	public int waConfirmAction(String emp_code);
	
	// 김은희 - 근태 신청 철회 처리
	public int waDeleteAction(String emp_code);
	
	// 김은희 - 출근신청 비교하기
	public int getcmdate(Map<String, Object> map);
	
}
