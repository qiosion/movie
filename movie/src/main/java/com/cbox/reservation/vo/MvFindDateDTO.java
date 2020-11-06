package com.cbox.reservation.vo;

public class MvFindDateDTO {
	int m_id; //클릭한 영화 id
	String m_date; // 클릭한 영화 data
	String tt_start; // 상영시작시간
	String tt_end; // 상영종료시간
	
	public MvFindDateDTO() {}
	public MvFindDateDTO(int m_id, String m_date, String tt_start, String tt_end) {
		super();
		this.m_id = m_id;
		this.m_date = m_date;
		this.tt_start = tt_start;
		this.tt_end = tt_end;
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
	
	
	
	
}
