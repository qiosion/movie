package com.cbox.reservation.vo;

public class UserReservVO {
	private int tc_num;
	private String mv_title;
	private String tt_scr_date;
	private String tt_start;
	private String tc_st_num;
	private String th_name;
	private int mbr_no;
	private Integer first;
	private Integer last;
	
	public UserReservVO() {
		
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
	
}
