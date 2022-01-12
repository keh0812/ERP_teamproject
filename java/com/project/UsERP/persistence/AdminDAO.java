package com.project.UsERP.persistence;

import java.util.Map;

import com.project.UsERP.vo.EmployeeVO;


public interface AdminDAO {

	// 강재현 - 중복확인 처리
	public int idCheck(String strId);

	// 강재현 - 로그인 처리
	public String pwdCheck(String strId);

	// 강재현 - 관리자 or 게스트 확인
	public int gradeCheck(String strId);

	// 조명재 - 회원 정보를 반환한다
	public EmployeeVO getUsersInfo(String emp_code);
	
	// 김은희 - 내 정보 수정 페이지
	public EmployeeVO myPageDetail(String emp_code);
	
	// 김은희 - 내 정보 수정 처리
	public int mypageUpdateAction(EmployeeVO vo);

	// 조명재 - 비밀번호를 생성한다
	public int signinPro(Map<String, Object> map);


}
