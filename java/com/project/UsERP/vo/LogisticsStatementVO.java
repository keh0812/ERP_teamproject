package com.project.UsERP.vo;

import java.util.Date;

// 물류전표
public class LogisticsStatementVO {
	
	private int logs_code;			// 전표번호
	private int logs_type;			// 유형
	private Date logs_reg_date;		// 발행일
	private Date logs_update_date;	// 최근수정일자
	private int logs_state;			// 상태
	private int logs_quantity;		// 수량
	private int logs_shortage;		// 부족수량
	private int com_code;			// 거래처코드
	private int sto_code;			// 재고코드
	private int pro_code;			// 상품코드
	private String emp_code;		// 사원번호
	private int ware_code;			// 창고번호
	CompanyVO company;
	StockVO stock;
	ProductVO product;
	EmployeeVO employee;
	WarehouseVO warehouse;
	
	public int getLogs_code() {
		return logs_code;
	}
	public void setLogs_code(int logs_code) {
		this.logs_code = logs_code;
	}
	public int getLogs_type() {
		return logs_type;
	}
	public void setLogs_type(int logs_type) {
		this.logs_type = logs_type;
	}
	public Date getLogs_reg_date() {
		return logs_reg_date;
	}
	public void setLogs_reg_date(Date logs_reg_date) {
		this.logs_reg_date = logs_reg_date;
	}
	public Date getLogs_update_date() {
		return logs_update_date;
	}
	public void setLogs_update_date(Date logs_update_date) {
		this.logs_update_date = logs_update_date;
	}
	public int getLogs_state() {
		return logs_state;
	}
	public void setLogs_state(int logs_state) {
		this.logs_state = logs_state;
	}
	public int getLogs_quantity() {
		return logs_quantity;
	}
	public void setLogs_quantity(int logs_quantity) {
		this.logs_quantity = logs_quantity;
	}
	public int getLogs_shortage() {
		return logs_shortage;
	}
	public void setLogs_shortage(int logs_shortage) {
		this.logs_shortage = logs_shortage;
	}
	public int getCom_code() {
		return com_code;
	}
	public void setCom_code(int com_code) {
		this.com_code = com_code;
	}
	public int getSto_code() {
		return sto_code;
	}
	public void setSto_code(int sto_code) {
		this.sto_code = sto_code;
	}
	public int getPro_code() {
		return pro_code;
	}
	public void setPro_code(int pro_code) {
		this.pro_code = pro_code;
	}
	public String getEmp_code() {
		return emp_code;
	}
	public void setEmp_code(String emp_code) {
		this.emp_code = emp_code;
	}
	public int getWare_code() {
		return ware_code;
	}
	public void setWare_code(int ware_code) {
		this.ware_code = ware_code;
	}
	public CompanyVO getCompany() {
		return company;
	}
	public void setCompany(CompanyVO company) {
		this.company = company;
	}
	public StockVO getStock() {
		return stock;
	}
	public void setStock(StockVO stock) {
		this.stock = stock;
	}
	public ProductVO getProduct() {
		return product;
	}
	public void setProduct(ProductVO product) {
		this.product = product;
	}
	public EmployeeVO getEmployee() {
		return employee;
	}
	public void setEmployee(EmployeeVO employee) {
		this.employee = employee;
	}
	public WarehouseVO getWarehouse() {
		return warehouse;
	}
	public void setWarehouse(WarehouseVO warehouse) {
		this.warehouse = warehouse;
	}
	
}
