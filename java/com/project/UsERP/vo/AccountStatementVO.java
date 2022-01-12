package com.project.UsERP.vo;

import java.util.Date;

// 회계전표
public class AccountStatementVO {
	
	private int accs_code;			// 전표번호
	private int accs_type;			// 전표유형		
	private String accs_content;	// 상세내용
	private int accs_price;			// 단가
	private int accs_quantity; 		// 수량
	private Date accs_reg_date; 	// 발행일
	private Date accs_rpm_date;		// 상환일
	private Date accs_update_date; 	// 최근수정일자
	private int accs_sum;			// 총액
	private int accs_state;			// 승인상태
	private String emp_code;		// 사원번호
	private int bank_code;			// 계좌코드
	private int acco_code;			// 계정번호
	private int pro_code;			// 상품코드
	private int com_code;			// 거래처코드
	EmployeeVO employee;
	BankVO bank;
	AccountVO account;
	ProductVO product;
	CompanyVO company;
	
	public int getAccs_code() {
		return accs_code;
	}
	public void setAccs_code(int accs_code) {
		this.accs_code = accs_code;
	}
	public int getAccs_type() {
		return accs_type;
	}
	public void setAccs_type(int accs_type) {
		this.accs_type = accs_type;
	}
	public String getAccs_content() {
		return accs_content;
	}
	public void setAccs_content(String accs_content) {
		this.accs_content = accs_content;
	}
	public int getAccs_price() {
		return accs_price;
	}
	public void setAccs_price(int accs_price) {
		this.accs_price = accs_price;
	}
	public int getAccs_quantity() {
		return accs_quantity;
	}
	public void setAccs_quantity(int accs_quantity) {
		this.accs_quantity = accs_quantity;
	}
	public Date getAccs_reg_date() {
		return accs_reg_date;
	}
	public void setAccs_reg_date(Date accs_reg_date) {
		this.accs_reg_date = accs_reg_date;
	}
	public Date getAccs_rpm_date() {
		return accs_rpm_date;
	}
	public void setAccs_rpm_date(Date accs_rpm_date) {
		this.accs_rpm_date = accs_rpm_date;
	}
	public Date getAccs_update_date() {
		return accs_update_date;
	}
	public void setAccs_update_date(Date accs_update_date) {
		this.accs_update_date = accs_update_date;
	}
	public int getAccs_sum() {
		return accs_sum;
	}
	public void setAccs_sum(int accs_sum) {
		this.accs_sum = accs_sum;
	}
	public int getAccs_state() {
		return accs_state;
	}
	public void setAccs_state(int accs_state) {
		this.accs_state = accs_state;
	}
	public String getEmp_code() {
		return emp_code;
	}
	public void setEmp_code(String emp_code) {
		this.emp_code = emp_code;
	}
	public int getBank_code() {
		return bank_code;
	}
	public void setBank_code(int bank_code) {
		this.bank_code = bank_code;
	}
	public int getAcco_code() {
		return acco_code;
	}
	public void setAcco_code(int acco_code) {
		this.acco_code = acco_code;
	}
	public int getPro_code() {
		return pro_code;
	}
	public void setPro_code(int pro_code) {
		this.pro_code = pro_code;
	}
	public int getCom_code() {
		return com_code;
	}
	public void setCom_code(int com_code) {
		this.com_code = com_code;
	}
	public EmployeeVO getEmployee() {
		return employee;
	}
	public void setEmployee(EmployeeVO employee) {
		this.employee = employee;
	}
	public BankVO getBank() {
		return bank;
	}
	public void setBank(BankVO bank) {
		this.bank = bank;
	}
	public AccountVO getAccount() {
		return account;
	}
	public void setAccount(AccountVO account) {
		this.account = account;
	}
	public ProductVO getProduct() {
		return product;
	}
	public void setProduct(ProductVO product) {
		this.product = product;
	}
	public CompanyVO getCompany() {
		return company;
	}
	public void setCompany(CompanyVO company) {
		this.company = company;
	}
	
}	