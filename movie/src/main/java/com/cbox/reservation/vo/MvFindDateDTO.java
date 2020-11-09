package com.cbox.reservation.vo;

public class MvFindDateDTO {
	int m_id; //클릭한 영화 id
	String m_date; // 클릭한 영화 data
	String tt_start; // 상영시작시간
	String tt_end; // 상영종료시간
	int th_max; //총좌석
	String th_name; //상영관명
	int tt_empty; //좐여좌석
	
	public MvFindDateDTO() {}
	
	
	public MvFindDateDTO(int m_id, String m_date, String tt_start, String tt_end, int th_max, String th_name,
			int tt_empty) {
		super();
		this.m_id = m_id;
		this.m_date = m_date;
		this.tt_start = tt_start;
		this.tt_end = tt_end;
		this.th_max = th_max;
		this.th_name = th_name;
		this.tt_empty = tt_empty;
	}


	public int getM_id() {
		return m_id;
	}


	public void setM_id(int m_id) {
		this.m_id = m_id;
	}


	public String getM_date() {
		return m_date;
	}


	public void setM_date(String m_date) {
		this.m_date = m_date;
	}


	public String getTt_start() {
		return tt_start;
	}


	public void setTt_start(String tt_start) {
		this.tt_start = tt_start;
	}


	public String getTt_end() {
		return tt_end;
	}


	public void setTt_end(String tt_end) {
		this.tt_end = tt_end;
	}


	public int getTh_max() {
		return th_max;
	}


	public void setTh_max(int th_max) {
		this.th_max = th_max;
	}


	public String getTh_name() {
		return th_name;
	}


	public void setTh_name(String th_name) {
		this.th_name = th_name;
	}


	public int getTt_empty() {
		return tt_empty;
	}


	public void setTt_empty(int tt_empty) {
		this.tt_empty = tt_empty;
	}


	
	
	
	
}
