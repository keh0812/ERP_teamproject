package com.project.UsERP.vo;

import java.util.Date;

// 출퇴근기록
public class CommuteVO {
	
	private int cm_code;			// 출퇴근코드
	private Date cm_date;			// 일자
	private Date cm_start;			// 출근시간
	private Date cm_end;			// 퇴근시간
	private int cm_night_time;		// 야근시간
	private Date cm_over_time;		// 특근시간
	private String cm_address;		// MAC주소
	private String emp_code;		// 사원번호
	EmployeeVO employee;
	
	public int getCm_code() {
		return cm_code;
	}
	
	public void setCm_code(int cm_code) {
		this.cm_code = cm_code;
	}
	
	public Date getCm_date() {
		return cm_date;
	}
	
	public void setCm_date(Date cm_date) {
		this.cm_date = cm_date;
	}
	
	public Date getCm_start() {
		return cm_start;
	}
	
	public void setCm_start(Date cm_start) {
		this.cm_start = cm_start;
	}
	
	public Date getCm_end() {
		return cm_end;
	}
	
	public void setCm_end(Date cm_end) {
		this.cm_end = cm_end;
	}
	
	public int getCm_night_time() {
		return cm_night_time;
	}
	
	public void setCm_night_time(int cm_night_time) {
		this.cm_night_time = cm_night_time;
	}
	
	public Date getCm_over_time() {
		return cm_over_time;
	}
	
	public void setCm_over_time(Date cm_over_time) {
		this.cm_over_time = cm_over_time;
	}
	
	public String getCm_address() {
		return cm_address;
	}
	
	public void setCm_address(String cm_address) {
		this.cm_address = cm_address;
	}
	
	public String getEmp_code() {
		return emp_code;
	}
	
	public void setEmp_code(String emp_code) {
		this.emp_code = emp_code;
	}
	
	public EmployeeVO getEmployee() {
		return employee;
	}
	
	public void setEmployee(EmployeeVO employee) {
		this.employee = employee;
	}
	
}
