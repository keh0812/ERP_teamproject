package com.project.UsERP.persistence;


import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.UsERP.vo.EmployeeVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	SqlSession sqlSession;

	// 강재현 - 중복확인 처리
	@Override
	public int idCheck(String strId) {
		return sqlSession.selectOne("com.project.UsERP.persistence.AdminDAO.idCheck", strId);
	}

	// 강재현 - 로그인 처리
	@Override
	public String pwdCheck(String strId) {
		return sqlSession.selectOne("com.project.UsERP.persistence.AdminDAO.pwdCheck", strId);
	}

	// 강재현 - 관리자 or 게스트 확인
	@Override
	public int gradeCheck(String strId) {
		String grade = sqlSession.selectOne("com.project.UsERP.persistence.AdminDAO.gradeCheck", strId);

		int gradeCnt = 0;

		if (grade.equals("ROLE_USER")) {
			gradeCnt = 1;
		} else {
			gradeCnt = 0;
		}

		return gradeCnt;
	}

	// 조명재 - 회원 정보를 반환한다
	@Override
	public EmployeeVO getUsersInfo(String emp_code) {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.getUsersInfo(emp_code);
	}
	
	// 김은희 - 내 정보 수정 페이지
	@Override
	public EmployeeVO myPageDetail(String emp_code) {
		return sqlSession.selectOne("com.project.UsERP.persistence.AdminDAO.myPageDetail", emp_code);
	}
	
	// 김은희 - 내 정보 수정 처리
	@Override
	public int mypageUpdateAction(EmployeeVO vo) {
		return sqlSession.update("com.project.UsERP.persistence.AdminDAO.mypageUpdateAction", vo);
	}

	// 조명재 - 비밀번호를 생성한다
	@Override
	public int signinPro(Map<String, Object> map) {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.signinPro(map);
	}
	
}
