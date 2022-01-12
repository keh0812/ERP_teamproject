package com.project.UsERP.vo;

import java.util.Date;

// 거래처
public class CompanyVO {
	
	private int com_code;			// 거래처코드
	private int com_type;			// 유형
	private String com_name;		// 거래처명
    private String com_ceo_name;	// 대표자명
    private int com_reg_no;			// 사업자번호
    private String com_address;		// 주소
    private Date com_reg_date;		// 거래처등록일
    
	public int getCom_code() {
		return com_code;
	}
	public void setCom_code(int com_code) {
		this.com_code = com_code;
	}
	public int getCom_type() {
		return com_type;
	}
	public void setCom_type(int com_type) {
		this.com_type = com_type;
	}
	public String getCom_name() {
		return com_name;
	}
	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}
	public String getCom_ceo_name() {
		return com_ceo_name;
	}
	public void setCom_ceo_name(String com_ceo_name) {
		this.com_ceo_name = com_ceo_name;
	}
	public int getCom_reg_no() {
		return com_reg_no;
	}
	public void setCom_reg_no(int com_reg_no) {
		this.com_reg_no = com_reg_no;
	}
	public String getCom_address() {
		return com_address;
	}
	public void setCom_address(String com_address) {
		this.com_address = com_address;
	}
	public Date getCom_reg_date() {
		return com_reg_date;
	}
	public void setCom_reg_date(Date com_reg_date) {
		this.com_reg_date = com_reg_date;
	}
    
}  