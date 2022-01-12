package com.project.UsERP.persistence;

import java.util.List;

import java.util.Map;



import com.project.UsERP.vo.AppointHistoryVO;
import com.project.UsERP.vo.DepartmentVO;
import com.project.UsERP.vo.EmployeeVO;
import com.project.UsERP.vo.HrCodeGroupVO;
import com.project.UsERP.vo.HrCodeVO;
import com.project.UsERP.vo.SalaryStatementVO;

public interface HrDAO {

	// 김은희 - 인사 코드 그룹 조회
	public List<HrCodeGroupVO> hrCgList();
	
	// 김은희 - 인사 코드 그룹 조회 상세페이지
	public List<HrCodeVO> hrRegDetail(int hcg_code);

	// 김은희 - 인사 코드 조회
	public List<HrCodeVO> hrCList();

	// 조명재 - 부서 조회
	public List<DepartmentVO> depList();
	
	// 조명재 - 인사 코드 조회 - 직급
	public List<HrCodeVO> hrCodePosList();
	
	// 김은희 - 인사 코드 등록
	public int hrCodeInsert(HrCodeVO vo);
	
	// 김은희 - 인사 코드 중복확인
	public int hrCodeCheck(int hr_code);
	
	// 김은희 - 인사 코드명 중복확인
	public int hrConfirmHrName(String hr_code_name);
	
	// 조명재 - 인사 발령 목록 갯수
	public int getAppointmentCnt();
	
	// 조명재 - 인사 발령(중메뉴) - 인사 발령 조회
	public List<AppointHistoryVO> appointmentList(Map<String, Object> map);
	
	// 조명재 - 인사 발령(중메뉴) - 사원번호 확인
	public EmployeeVO hrConfirmAppoint(String emp_code);
	
	// 조명재 - 인사 발령(중메뉴) - 현재 부서를 반환한다
	public String getDepName(int dep_code);
	
	// 조명재 - 인사 발령(중메뉴) - 현재 직급을 반환한다
	public String getCodeName(int hr_code);
	
	// 조명재 - 인사 발령(중메뉴) - 인사 발령
	public int hrAppointmentPro(AppointHistoryVO vo);
	
	// 김은희 - 인사카드 조회
	public List<EmployeeVO> hrCardList();

	// 김은희 - 인사카드 상세페이지 조회
	public EmployeeVO hrCardDetail(String emp_code);
	
	// 조명재 - 휴직 퇴직 부서 조회
	public List<DepartmentVO> notdepList();
	
	// 김은희 - 인사카드 등록
	public int hrCardInsert(Map<String, Object> map);
	
	// 김은희 - 인사 카드 사번 중복확인
	public int codeCheck(String emp_code);

	// 조명재 - 휴직자 조회
	public List<AppointHistoryVO> hrLeaveList();

	// 조명재 - 퇴직자 조회
	public List<AppointHistoryVO> hrRetireList();
	
	// 조명재 - 급여 내역
	public List<SalaryStatementVO> hrSalaryList();
	
	// 조명재 - 야근 유무를 확인한다
	public int getOverCnt(Map<String, Object> map);
	
	// 조명재 - 야근 시간을 반환한다
	public int getOverTimes(Map<String, Object> map);
	
	// 조명재 - 급여 세부사항 등록
	public int salaryDetailIns(Map<String, Object> map);
	
	// 조명재 - 급여 전표 등록
	public int salaryStatement(Map<String, Object> map);
	
}
