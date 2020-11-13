package com.cbox.reservation.vo;

import java.sql.Date;

public class UserReservVO {
	private int tc_num;
	private Date tc_date;
	private String mv_title;
	private int mv_num;
	private String mv_age;
	private String tt_scr_date;
	private String tt_start;
	private String tt_end;
	private String tc_st_num;
	private String th_name;
	private int mbr_no;
	private Integer first;
	private Integer last;
	
	public UserReservVO() {
		
	}

	public int getMv_num() {
		return mv_num;
	}

	public void setMv_num(int mv_num) {
		this.mv_num = mv_num;
	}

	public String getMv_age() {
		return mv_age;
	}

	public void setMv_age(String mv_age) {
		this.mv_age = mv_age;
	}

	public String getTt_end() {
		return tt_end;
	}

	public void setTt_end(String tt_end) {
		this.tt_end = tt_end;
	}

	public Date getTc_date() {
		return tc_date;
	}

	public void setTc_date(Date tc_date) {
		this.tc_date = tc_date;
	}

	public int getTc_num() {
		return tc_num;
	}

	public void setTc_num(int tc_num) {
		this.tc_num = tc_num;
	}

	public String getMv_title() {
		return mv_title;
	}

	public void setMv_title(String mv_title) {
		this.mv_title = mv_title;
	}

	public String getTt_scr_date() {
		return tt_scr_date;
	}

	public void setTt_scr_date(String tt_scr_date) {
		this.tt_scr_date = tt_scr_date;
	}

	public String getTt_start() {
		return tt_start;
	}

	public void setTt_start(String tt_start) {
		this.tt_start = tt_start;
	}

	public String getTc_st_num() {
		return tc_st_num;
	}

	public void setTc_st_num(String tc_st_num) {
		this.tc_st_num = tc_st_num;
	}

	public String getTh_name() {
		return th_name;
	}

	public void setTh_name(String th_name) {
		this.th_name = th_name;
	}

	public int getMbr_no() {
		return mbr_no;
	}

	public void setMbr_no(int mbr_no) {
		this.mbr_no = mbr_no;
	}

	public Integer getFirst() {
		return first;
	}

	public void setFirst(Integer first) {
		this.first = first;
	}

	public Integer getLast() {
		return last;
	}

	public void setLast(Integer last) {
		this.last = last;
	}

	public UserReservVO(int tc_num, String mv_title, String tt_scr_date, String tt_start, String tc_st_num,
			String th_name, int mbr_no, Integer first, Integer last) {
		super();
		this.tc_num = tc_num;
		this.mv_title = mv_title;
		this.tt_scr_date = tt_scr_date;
		this.tt_start = tt_start;
		this.tc_st_num = tc_st_num;
		this.th_name = th_name;
		this.mbr_no = mbr_no;
		this.first = first;
		this.last = last;
	}

	public UserReservVO(int tc_num, String mv_title, String tt_scr_date, String tt_start, String tc_st_num,
			String th_name, int mbr_no) {
		super();
		this.tc_num = tc_num;
		this.mv_title = mv_title;
		this.tt_scr_date = tt_scr_date;
		this.tt_start = tt_start;
		this.tc_st_num = tc_st_num;
		this.th_name = th_name;
		this.mbr_no = mbr_no;
	}

	public UserReservVO(int tc_num, Date tc_date, String mv_title, String mv_age, String tt_scr_date, String tt_start,
			String tt_end, String tc_st_num, String th_name, int mbr_no) {
		super();
		this.tc_num = tc_num;
		this.tc_date = tc_date;
		this.mv_title = mv_title;
		this.mv_age = mv_age;
		this.tt_scr_date = tt_scr_date;
		this.tt_start = tt_start;
		this.tt_end = tt_end;
		this.tc_st_num = tc_st_num;
		this.th_name = th_name;
		this.mbr_no = mbr_no;
	}
	
}
