package com.project.UsERP.vo;

// 급여
public class SalaryVO {
	
	private int sal_code;		// 급여코드
	private int sal_basic;		// 기본급
	private int sal_over;		// 초과근로수당
	private int sal_bonus;		// 상여금
	private int sal_meal;		// 식대
	private int sal_vehicle;	// 차량유지비
	private int sal_worktax;	// 갑근세
	private int sal_resident;	// 주민세
	private int sal_hire;		// 고용보험
	private int sal_pension;	// 국민연금
	private int sal_health;		// 건강보험
	
	public int getSal_basic() {
		return sal_basic;
	}
	
	public void setSal_basic(int sal_basic) {
		this.sal_basic = sal_basic;
	}

	public int getSal_code() {
		return sal_code;
	}

	public void setSal_code(int sal_code) {
		this.sal_code = sal_code;
	}

	public int getSal_over() {
		return sal_over;
	}

	public void setSal_over(int sal_over) {
		this.sal_over = sal_over;
	}

	public int getSal_bonus() {
		return sal_bonus;
	}

	public void setSal_bonus(int sal_bonus) {
		this.sal_bonus = sal_bonus;
	}

	public int getSal_meal() {
		return sal_meal;
	}

	public void setSal_meal(int sal_meal) {
		this.sal_meal = sal_meal;
	}

	public int getSal_vehicle() {
		return sal_vehicle;
	}

	public void setSal_vehicle(int sal_vehicle) {
		this.sal_vehicle = sal_vehicle;
	}

	public int getSal_worktax() {
		return sal_worktax;
	}

	public void setSal_worktax(int sal_worktax) {
		this.sal_worktax = sal_worktax;
	}

	public int getSal_resident() {
		return sal_resident;
	}

	public void setSal_resident(int sal_resident) {
		this.sal_resident = sal_resident;
	}

	public int getSal_hire() {
		return sal_hire;
	}

	public void setSal_hire(int sal_hire) {
		this.sal_hire = sal_hire;
	}

	public int getSal_pension() {
		return sal_pension;
	}

	public void setSal_pension(int sal_pension) {
		this.sal_pension = sal_pension;
	}

	public int getSal_health() {
		return sal_health;
	}

	public void setSal_health(int sal_health) {
		this.sal_health = sal_health;
	}
	
}