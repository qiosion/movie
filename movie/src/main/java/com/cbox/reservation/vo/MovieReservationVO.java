package com.cbox.reservation.vo;

public class MovieReservationVO {
	String mv_title;        //영화제목
	String tt_scr_date;     //상영일자
	String tt_start;        //상영 시작시간
	String th_name;         //상영관
	int th_max;             //상영관 총좌석수
	String tt_empty;        //잔여좌석
	
	public MovieReservationVO(String mv_title, String tt_scr_date, String tt_start, String th_name, int th_max,
			String tt_empty) {
		super();
		this.mv_title = mv_title;
		this.tt_scr_date = tt_scr_date;
		this.tt_start = tt_start;
		this.th_name = th_name;
		this.th_max = th_max;
		this.tt_empty = tt_empty;
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

	public String getTh_name() {
		return th_name;
	}

	public void setTh_name(String th_name) {
		this.th_name = th_name;
	}

	public int getTh_max() {
		return th_max;
	}

	public void setTh_max(int th_max) {
		this.th_max = th_max;
	}

	public String getTt_empty() {
		return tt_empty;
	}

	public void setTt_empty(String tt_empty) {
		this.tt_empty = tt_empty;
	}
	
	
	
	
}
