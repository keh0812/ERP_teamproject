package com.project.UsERP.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.project.UsERP.persistence.AdminDAO;
import com.project.UsERP.vo.EmployeeVO;
import com.project.UsERP.vo.UserVO;

// 로그인이 성공한 경우 자동으로 실행
public class UserLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public UserLoginSuccessHandler(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 로그인이 성공한 경우에 실행한 코드
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {

//		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
//
//		String authority = dao.getAuthority(authentication.getName());
//
//		int gradeCnt = 0;
//		if (authority.equals("ROLE_USER")) {
//			gradeCnt = 1;
//		} else {
//			gradeCnt = 0;
//		}
//
//		UserVO vo = dao.getUsersInfo(authentication.getName());
//		String msg = vo.getUsername() + "님 반갑습니다.";
//
//		request.setAttribute("msg", msg);
//		request.getSession().setAttribute("userId", authentication.getName());
//		request.getSession().setAttribute("userState", gradeCnt);
//		request.getSession().setAttribute("userName", vo.getUsername());

		UserVO vo = (UserVO)authentication.getPrincipal();
		System.out.println("UserVO==> " + vo);
		
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		EmployeeVO vo2 = dao.getUsersInfo(authentication.getName());
		
		String msg = vo2.getEmp_name() + "님 환영합니다.";
		System.out.println("아이디 ==> " + authentication.getName());
		
		String grade = sqlSession.selectOne("com.project.UsERP.persistence.AdminDAO.gradeCheck", authentication.getName());
		int gradeCnt = 0;
		
		if(grade.equals("ROLE_USER")) {
			gradeCnt = 1;
		}else {
			gradeCnt = 0;
		}
		
		request.setAttribute("msg", msg);
		request.getSession().setAttribute("mem_id", authentication.getName());
		request.getSession().setAttribute("grade", gradeCnt);
		request.getSession().setAttribute("mem_name", vo2.getEmp_name());

		RequestDispatcher rd = request.getRequestDispatcher("/main");

		rd.forward(request, response);
	}

}
