package com.project.UsERP.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.UsERP.persistence.AdminDAO;
import com.project.UsERP.vo.EmployeeVO;


@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDAO dao;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	// 조명재 - 사원확인 - 사원번호를 확인한다
	@Override
	public void confirm(HttpServletRequest req, Model model) {
		String emp_code = req.getParameter("emp_code");

		EmployeeVO vo = dao.getUsersInfo(emp_code);

		int selectCnt = 0;
		if (vo != null)
			selectCnt = 1;

		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("vo", vo);
		model.addAttribute("emp_code", emp_code);
	}

	// 조명재 - 사원 정보가 일치하는지 확인다
	@Override
	public void signinPro(HttpServletRequest req, Model model) {
		String emp_code = req.getParameter("emp_code");
		String emp_pwd = req.getParameter("emp_pwd");
		String emp_jumin = req.getParameter("emp_jumin");

		EmployeeVO vo = dao.getUsersInfo(emp_code);

		int enabled = 0;
		boolean check = false;

		if(vo.getEmp_enabled().equals("1")) {
			enabled = 1;
		} else {
			if(emp_jumin.equals(vo.getEmp_jumin())) check = true;
		}
		
		int updateCnt = 0;
		if(check) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("emp_code", emp_code);
			map.put("emp_pwd", passwordEncoder.encode(emp_pwd));
			
			updateCnt = dao.signinPro(map);
		}
		model.addAttribute("enabled", enabled);
		model.addAttribute("updateCnt", updateCnt);
		model.addAttribute("emp_name", vo.getEmp_name());
	}
	
	// 김은희 - 내 정보 수정 페이지
	@Override
	public void myPageDetail(HttpServletRequest req, Model model) {
		String emp_code = (String)req.getSession().getAttribute("mem_id");
		
		EmployeeVO vo = dao.myPageDetail(emp_code);
		
		model.addAttribute("vo", vo);
			
		}
	
	
	// 김은희 - 내 정보 수정 처리
	@Override
	public void mypageUpdateAction(MultipartHttpServletRequest req, Model model) {
		
		// * 경로 바꿔주세요
		 String uploadPath = "C:\\Dev76\\workspace\\upload\\";
		
//		String uploadPath = "C:\\eclipse-workspace\\UsERP\\src\\main\\webapp\\resources\\images\\";
		
		MultipartFile image = req.getFile("emp_photo");
		String emp_photo = image.getOriginalFilename();
		
		String emp_code = req.getParameter("emp_code");
		String emp_name = req.getParameter("emp_name");
		int dep_code = Integer.parseInt(req.getParameter("dep_code"));
		int hr_code = Integer.parseInt(req.getParameter("hr_code"));
		long emp_cos = Integer.parseInt(req.getParameter("emp_cos"));
		String emp_jumin = req.getParameter("emp_jumin");
		String address = "";
		String addcode = req.getParameter("addcode");
		String add1 = req.getParameter("add1");
		String add2 = req.getParameter("add2");
		
		address = addcode + "-" + add1 + "-" + add2;
		String emp_tel = req.getParameter("emp_tel");
		String emp_phone = req.getParameter("emp_phone");
		String emp_email = req.getParameter("emp_email");
		String emp_port_no = req.getParameter("emp_port_no");
		String emp_account = req.getParameter("emp_account");
		String emp_bank = req.getParameter("emp_bank");
		
		try {
			// null값과 공백 방지
			if(image.getOriginalFilename() == null || image.getOriginalFilename().trim().equals("")) {
				emp_photo = "avatar.jpg";
			}
		
			image.transferTo(new File(uploadPath + image));
			
			EmployeeVO vo = new EmployeeVO();
			
			vo.setHr_code(hr_code);
			vo.setEmp_code(emp_code);
			vo.setEmp_name(emp_name);	
			vo.setEmp_cos(emp_cos);
			vo.setEmp_photo(emp_photo);
			vo.setEmp_jumin(emp_jumin);
			vo.setEmp_address(address);
			vo.setEmp_tel(emp_tel);
			vo.setEmp_phone(emp_phone);
			vo.setEmp_email(emp_email);
			vo.setEmp_port_no(emp_port_no);
			vo.setEmp_bank(emp_bank);
			vo.setEmp_account(emp_account);
			vo.setDep_code(dep_code);
		
			int updateCnt = dao.mypageUpdateAction(vo);
			
			model.addAttribute("updateCnt", updateCnt);
				
		} catch(Exception e) {
			e.printStackTrace();
		}
				
	}
	
	// 김은희 - 파이썬 날씨 정보 위젯 
	@Override
	public void weatherWidget(HttpServletRequest req, Model model) {
		
          ProcessBuilder pb = new ProcessBuilder("python", "C:/Dev76/workspace_python/source/weather.py");
          Process p = null;
          
          try {
             p = pb.start();
             
          } catch (IOException e) {
             e.printStackTrace();
             
          } BufferedReader br;
          
       try {
          br = new BufferedReader(new InputStreamReader(p.getInputStream(),"euc-kr"));
          String line = "";
          StringBuilder sb = new StringBuilder();
          
          try {
             while((line =br.readLine()) != null) {
                sb.append(line + "\n");  // 출력
             }
             
          } catch (IOException e1) {
             e1.printStackTrace();
          }
          
          String weatherWidget = sb.toString();
          model.addAttribute("weatherWidget", weatherWidget);   
          
          try {
             br.close();
             
          } catch (IOException e) {
             e.printStackTrace();
          }
          
       } catch (UnsupportedEncodingException e2) {
          e2.printStackTrace();
          
       }
	
	
    }

}
