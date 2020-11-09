package com.cbox.coupon.vo;

import java.sql.Date;

public class couponVO {
	private int cp_no;
	private String cp_nm;
	private Date cp_valid_date;
	private String cp_type;
	private int cp_discount;
	
	
	public int getCp_no() {
		return cp_no;
	}
	public void setCp_no(int cp_no) {
		this.cp_no = cp_no;
	}
	public String getCp_nm() {
		return cp_nm;
	}
	public void setCp_nm(String cp_nm) {
		this.cp_nm = cp_nm;
	}
	
	public Date getCp_valid_date() {
		return cp_valid_date;
	}
	public void setCp_valid_date(Date cp_valid_date) {
		this.cp_valid_date = cp_valid_date;
	}
	public String getCp_type() {
		return cp_type;
	}
	public void setCp_type(String cp_type) {
		this.cp_type = cp_type;
	}
	public int getCp_discount() {
		return cp_discount;
	}
	public void setCp_discount(int cp_discount) {
		this.cp_discount = cp_discount;
	}

}
