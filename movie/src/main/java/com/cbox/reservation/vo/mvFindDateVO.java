package com.cbox.reservation.vo;

public class mvFindDateVO {
	int mv_num;
	String tt_scr_date;
	
	public mvFindDateVO() {
		
	}
	public mvFindDateVO(int mv_num) {
		this.mv_num = mv_num;
	}
	

	public int getId() {
		return mv_num;
	}
	public void setId(int mv_num) {
		this.mv_num = mv_num;
	}
	public String getTt_scr_date() {
		return tt_scr_date;
	}
	public void setTt_scr_date(String tt_scr_date) {
		this.tt_scr_date = tt_scr_date;
	}
	
	
}
