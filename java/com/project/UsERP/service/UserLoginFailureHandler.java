package com.project.UsERP.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

// 로그인이 실패한 경우 자동으로 실행
public class UserLoginFailureHandler implements AuthenticationFailureHandler {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	public UserLoginFailureHandler(SqlSessionTemplate sqlSession, BCryptPasswordEncoder passwordEncoder ) {
		this.sqlSession = sqlSession;
		this.passwordEncoder = passwordEncoder;
	}
	
	// 로그인이 실패할 경우 자동으로 실행되는 코드 
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
	
		System.out.println("실패 ");
		String strId =  request.getParameter("emp_code");
		String strPwd = request.getParameter("emp_pwd");
		
		int cnt = sqlSession.selectOne("com.project.UsERP.persistence.AdminDAO.idCheck", strId);
		if(cnt!=0) {
			
			String pwd = sqlSession.selectOne("com.project.UsERP.persistence.AdminDAO.pwdCheck", strId);
			System.out.println(strPwd);
			System.out.println(pwd);
			System.out.println(passwordEncoder.matches(strPwd, pwd));
			
			if(!passwordEncoder.matches(strPwd, pwd)) request.setAttribute("msg", "등록되지 않은 계정이거나, 사원번호 또는 비밀번호를 잘못 입력하셨습니다. \n확인 후 다시 시도해 주십시오.");
			
		}	else {
			request.setAttribute("msg", "등록되지 않은 계정이거나, 사원번호 또는 비밀번호를 잘못 입력하셨습니다. \n확인 후 다시 시도해 주십시오.");
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/main.jsp");
		rd.forward(request, response);
	}

}
