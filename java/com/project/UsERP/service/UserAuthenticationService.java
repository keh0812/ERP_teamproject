package com.project.UsERP.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.project.UsERP.vo.EmployeeVO;
import com.project.UsERP.vo.UserVO;


// UserDetailService : 스프링 프레임웍에 내장된 인터페이스
// UserDetailService : users 테이블의 정보를 가지고 인증처리를 위해 사용자 상세정보를 제공하는 인터페이스 

public class UserAuthenticationService implements UserDetailsService {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	BCryptPasswordEncoder PasswordEncoder;
	
	public UserAuthenticationService(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public UserDetails loadUserByUsername(String emp_code) throws UsernameNotFoundException {
		
		EmployeeVO vo = sqlSession.selectOne("com.project.UsERP.persistence.AdminDAO.readMember", emp_code);
		
		if(vo == null) {
			throw new UsernameNotFoundException(emp_code);
		}
		
		List<GrantedAuthority> authority = new ArrayList<GrantedAuthority>();
		authority.add(new SimpleGrantedAuthority(vo.getEmp_authority()));		

		return new UserVO(vo.getEmp_code(),vo.getEmp_pwd(),vo.getEmp_enabled().equals("1"),
				true,true,true,authority);
	}

}
