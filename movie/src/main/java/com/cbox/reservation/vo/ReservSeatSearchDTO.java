package com.cbox.reservation.vo;

public class ReservSeatSearchDTO {
	//요청받은값
	String EmSeatMv;
	String EmDate;
	String EmStart;
	String EmEnd;
	int EmThNum;
	
	//요청해줄값
	int tt_num;
	String tc_st_num;
	
	
	public ReservSeatSearchDTO() {}


	public ReservSeatSearchDTO(String emSeatMv, String emDate, String emStart, String emEnd, int emThNum, int tt_num,
			String tc_st_num) {
		super();
		EmSeatMv = emSeatMv;
		EmDate = emDate;
		EmStart = emStart;
		EmEnd = emEnd;
		EmThNum = emThNum;
		this.tt_num = tt_num;
		this.tc_st_num = tc_st_num;
	}


	public String getEmSeatMv() {
		return EmSeatMv;
	}


	public void setEmSeatMv(String emSeatMv) {
		EmSeatMv = emSeatMv;
	}


	public String getEmDate() {
		return EmDate;
	}


	public void setEmDate(String emDate) {
		EmDate = emDate;
	}


	public String getEmStart() {
		return EmStart;
	}


	public void setEmStart(String emStart) {
		EmStart = emStart;
	}


	public String getEmEnd() {
		return EmEnd;
	}


	public void setEmEnd(String emEnd) {
		EmEnd = emEnd;
	}


	public int getEmThNum() {
		return EmThNum;
	}


	public void setEmThNum(int emThNum) {
		EmThNum = emThNum;
	}


	public int getTt_num() {
		return tt_num;
	}


	public void setTt_num(int tt_num) {
		this.tt_num = tt_num;
	}


	public String getTc_st_num() {
		return tc_st_num;
	}


	public void setTc_st_num(String tc_st_num) {
		this.tc_st_num = tc_st_num;
	}
	
	
}
