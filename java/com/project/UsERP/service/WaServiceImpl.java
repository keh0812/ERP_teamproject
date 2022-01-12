package com.project.UsERP.service;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.UsERP.persistence.WaDAO;
import com.project.UsERP.vo.CommuteVO;
import com.project.UsERP.vo.EmployeeVO;
import com.project.UsERP.vo.HrCodeVO;
import com.project.UsERP.vo.WorkRecordVO;

@Service
public class WaServiceImpl implements WaService {
	
	@Autowired
	WaDAO waDao;
	
	// 김은희 - 출퇴근 조회
	@Override
	public void commuteList(HttpServletRequest req, Model model) {
		List<CommuteVO> list = waDao.commuteList();
	      
	    model.addAttribute("list", list);
	}
	
	// 김은희 - 근태 조회
	@Override
	public void waList(HttpServletRequest req, Model model) {
		List<WorkRecordVO> list2 = waDao.waList();
	      
	    model.addAttribute("list2", list2);
	}

	// 김은희 - 근태 신청 사원 확인
	@Override
	public void empComfirm(HttpServletRequest req, Model model) {
		String emp_code = req.getParameter("emp_code");
		
		EmployeeVO vo = waDao.empComfirm(emp_code);
		
		int selectCnt = 0;
		if(vo != null) selectCnt = 1;
		
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("vo", vo);
		model.addAttribute("emp_code", emp_code);
	}
	
	// 김은희 - 근태 신청 
	@Override
	public void waAppInsert(HttpServletRequest req, Model model) {
		String emp_code = req.getParameter("emp_code");
		int hr_code = Integer.parseInt(req.getParameter("hr_code"));
		String wr_va_start = req.getParameter("wr_va_start");
		String wr_va_end = req.getParameter("wr_va_end");
		String wr_va_reason = req.getParameter("wr_va_reason");
		int dep_code = Integer.parseInt(req.getParameter("dep_code"));
		
		WorkRecordVO vo = new WorkRecordVO();
		
		vo.setHr_code(hr_code);
		vo.setWr_state(0); // 상태 - 0: 미승인
		vo.setWr_va_reason(wr_va_reason);
		vo.setEmp_code(emp_code);
		vo.setDep_code(dep_code);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("vo",vo);
		map.put("wr_va_start",wr_va_start);
		map.put("wr_va_end",wr_va_end);
		
		int insertCnt = waDao.waAppInsert(map);
		
		model.addAttribute("insertCnt", insertCnt);
		
	}
	
	// 김은희 - 출근 버튼 클릭
	@Override
	public void waStartClick(HttpServletRequest req, Model model) {
		
		int selectCnt = 0;
		int insertCnt = 0;
		
		String emp_code = (String)req.getSession().getAttribute("mem_id");
		
		Date date = new Date();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("emp_code",emp_code);
		map.put("date",date);
		
		CommuteVO vo = waDao.waEndSelect(emp_code);
		
		if(vo != null) selectCnt = 1;
		
		if(selectCnt == 0) {
			insertCnt = waDao.waStartClick(map);
		}
		
		model.addAttribute("insertCnt", insertCnt);
		model.addAttribute("selectCnt", selectCnt);
	}
	
	// 김은희 - 퇴근 처리
	@Override
	public void waEndAction(HttpServletRequest req, Model model) {
		int updateCnt = 0;
		int selectCnt = 0;
		
		String emp_code = (String)req.getSession().getAttribute("mem_id");
		Date date = new Date();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("emp_code",emp_code);
		map.put("date",date);
		
		CommuteVO vo = waDao.waEndSelect(emp_code);
		
		if(vo != null) {
			selectCnt = 1;
			updateCnt = waDao.waEndAction(map);
		}
		
		model.addAttribute("updateCnt", updateCnt);
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("vo", vo);
		
	}
	
	// 김은희 - 야근 버튼 클릭
	@Override
	public void waNightClick(HttpServletRequest req, Model model) {
		int updateCnt = 0;
		int selectCnt = 0;
		
		String emp_code = (String)req.getSession().getAttribute("mem_id");
		int cm_night_time = Integer.parseInt(req.getParameter("cm_night_time"));
		Date date = new Date();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("emp_code",emp_code);
		map.put("cm_night_time",cm_night_time);
		
		
		CommuteVO vo = waDao.waEndSelect(emp_code);
		
		if(vo != null) {
			selectCnt = 1;
			updateCnt = waDao.waNightClick(map);
		}
		
		model.addAttribute("updateCnt", updateCnt);
		
	}
	
	// 김은희 - 인사 코드 조회 - 근태유형
	@Override
	public void waCodeTyList(HttpServletRequest req, Model model) {
		List<HrCodeVO> list4 = waDao.waCodeTyList();
		
		model.addAttribute("list4", list4);
		
	}
	
	// 김은희 - 근태 신청 조회
	@Override
	public void waAppSelect(HttpServletRequest req, Model model) {
		List<WorkRecordVO> list5 = waDao.waAppSelect();
	      
	    model.addAttribute("list5", list5);
		
	}
	
	// 김은희 - 근태 신청 승인 상세페이지
	@Override
	public void waDetail(HttpServletRequest req, Model model) {
		String emp_code = req.getParameter("emp_code");
		
		WorkRecordVO vo = waDao.waDetail(emp_code);
		
		model.addAttribute("vo", vo);
	}
	
	// 김은희 - 근태 신청 승인 처리
	@Override
	public void waConfirmAction(HttpServletRequest req, Model model) {
		int updateCnt = 0;
		
		String emp_code = req.getParameter("emp_code");
		
		updateCnt = waDao.waConfirmAction(emp_code);
		
		model.addAttribute("updateCnt", updateCnt);
		
	}
	
	// 김은희 - 근태 신청 철회 처리
	@Override
	public void waDeleteAction(HttpServletRequest req, Model model) {
		int deleteCnt = 0;
		
		String emp_code = req.getParameter("emp_code");
		
		deleteCnt = waDao.waDeleteAction(emp_code);
		
		model.addAttribute("deleteCnt", deleteCnt);
	}
	

}
