package com.cbox.member.vo;

import java.sql.Date;

public class MemberVO {
	private int mbr_no;
	private String mbr_id;
	private String mbr_pw;
	private String mbr_nm;
	private Date mbr_birth;
	private String mbr_email;
	private String mbr_phone;
	private Date mbr_regi_date;
	private int mbr_point;
	private String mbr_e_yn;
	private String mbr_author;
	
	public MemberVO() {
	}
	
	public int getMbr_no() {
		return mbr_no;
	}
	public void setMbr_no(int mbr_no) {
		this.mbr_no = mbr_no;
	}
	public String getMbr_id() {
		return mbr_id;
	}
	public void setMbr_id(String mbr_id) {
		this.mbr_id = mbr_id;
	}
	public String getMbr_pw() {
		return mbr_pw;
	}
	public void setMbr_pw(String mbr_pw) {
		this.mbr_pw = mbr_pw;
	}
	public String getMbr_nm() {
		return mbr_nm;
	}
	public void setMbr_nm(String mbr_nm) {
		this.mbr_nm = mbr_nm;
	}
	public Date getMbr_birth() {
		return mbr_birth;
	}
	public void setMbr_birth(Date mbr_birth) {
		this.mbr_birth = mbr_birth;
	}
	public String getMbr_email() {
		return mbr_email;
	}
	public void setMbr_email(String mbr_email) {
		this.mbr_email = mbr_email;
	}
	public String getMbr_phone() {
		return mbr_phone;
	}
	public void setMbr_phone(String mbr_phone) {
		this.mbr_phone = mbr_phone;
	}
	public Date getMbr_regi_date() {
		return mbr_regi_date;
	}
	public void setMbr_regi_date(Date mbr_regi_date) {
		this.mbr_regi_date = mbr_regi_date;
	}
	public int getMbr_point() {
		return mbr_point;
	}
	public void setMbr_point(int mbr_point) {
		this.mbr_point = mbr_point;
	}
	public String getMbr_e_yn() {
		return mbr_e_yn;
	}
	public void setMbr_e_yn(String mbr_e_yn) {
		this.mbr_e_yn = mbr_e_yn;
	}
	public String getMbr_author() {
		return mbr_author;
	}
	public void setMbr_author(String mbr_author) {
		this.mbr_author = mbr_author;
	}
	
}
