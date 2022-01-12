package com.project.UsERP.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.UsERP.vo.CommuteVO;
import com.project.UsERP.vo.EmployeeVO;
import com.project.UsERP.vo.HrCodeVO;
import com.project.UsERP.vo.WorkRecordVO;

@Repository
public class WaDAOImpl implements WaDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	// 김은희 - 출퇴근 조회
	@Override
	public List<CommuteVO> commuteList() {
		return sqlSession.selectList("com.project.UsERP.persistence.WaDAO.commuteList");
	}
	
	// 김은희 - 근태 조회
	@Override
	public List<WorkRecordVO> waList() {
		return sqlSession.selectList("com.project.UsERP.persistence.WaDAO.waList");
	}
	
	// 김은희 - 근태 신청 사원 확인
	@Override
	public EmployeeVO empComfirm(String emp_code) {
		return sqlSession.selectOne("com.project.UsERP.persistence.WaDAO.empComfirm", emp_code);
	}
	
	// 김은희 - 근태 신청 
	@Override
	public int waAppInsert(Map<String, Object> map) {
		return sqlSession.insert("com.project.UsERP.persistence.WaDAO.waAppInsert", map);
	}
	
	// 김은희 - 출근 버튼 클릭
	@Override
	public int waStartClick(Map<String, Object> map) {
		return sqlSession.insert("com.project.UsERP.persistence.WaDAO.waStartClick", map);
	}
	
	// 김은희 - 퇴근 처리 업데이트
	public int waEndAction(Map<String, Object> map) {
		return sqlSession.update("com.project.UsERP.persistence.WaDAO.waEndAction", map);
	}
	
	// 김은희 - 퇴근 처리 가져오기
	@Override
	public CommuteVO waEndSelect(String emp_code) {
		return sqlSession.selectOne("com.project.UsERP.persistence.WaDAO.waEndSelect", emp_code);
	}
	
	// 김은희 - 퇴근 처리 업데이트
	@Override
	public int waNightClick(Map<String, Object> map) {
		return sqlSession.update("com.project.UsERP.persistence.WaDAO.waNightClick", map);
	}
	
	// 김은희 - 인사 코드 조회 - 근태유형
	public List<HrCodeVO> waCodeTyList() {
		return sqlSession.selectList("com.project.UsERP.persistence.WaDAO.waCodeTyList");
	}
	
	// 김은희 - 근태 신청 조회
	@Override
	public List<WorkRecordVO> waAppSelect() {
		return sqlSession.selectList("com.project.UsERP.persistence.WaDAO.waAppSelect");
	}
	
	// 김은희 - 근태 신청 승인 상세페이지
	@Override
	public WorkRecordVO waDetail(String emp_code) {
		return sqlSession.selectOne("com.project.UsERP.persistence.WaDAO.waDetail", emp_code);
	}
	
	// 김은희 - 근태 신청 승인 처리
	@Override
	public int waConfirmAction(String emp_code) {
		return sqlSession.update("com.project.UsERP.persistence.WaDAO.waConfirmAction", emp_code);
	}
	
	// 김은희 - 근태 신청 철회 처리
	@Override
	public int waDeleteAction(String emp_code) {
		return sqlSession.delete("com.project.UsERP.persistence.WaDAO.waDeleteAction", emp_code);
	}
	
	// 김은희 - 출근신청 비교하기 
	@Override
	public int getcmdate(Map<String, Object> map) {
		return sqlSession.update("com.project.UsERP.persistence.WaDAO.getcmdate", map);
	}
	
	
	
	
}
