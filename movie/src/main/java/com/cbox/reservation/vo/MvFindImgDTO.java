package com.cbox.reservation.vo;

public class MvFindImgDTO {
	int mv_num;
	String mv_title;
	String mv_post;
	
	public MvFindImgDTO() {};
	public MvFindImgDTO(int mv_num, String mv_title, String mv_post) {
		super();
		this.mv_num = mv_num;
		this.mv_title = mv_title;
		this.mv_post = mv_post;
	}
	
	public int getMv_num() {
		return mv_num;
	}
	public void setMv_num(int mv_num) {
		this.mv_num = mv_num;
	}
	public String getMv_title() {
		return mv_title;
	}
	public void setMv_title(String mv_title) {
		this.mv_title = mv_title;
	}
	public String getMv_post() {
		return mv_post;
	}
	public void setMv_post(String mv_post) {
		this.mv_post = mv_post;
	}
	
	
	
}
