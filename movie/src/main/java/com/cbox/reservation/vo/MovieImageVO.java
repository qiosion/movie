package com.cbox.reservation.vo;

public class MovieImageVO {
	int mv_id;
	String mv_title;
	String mv_img;
	
	public MovieImageVO(int mv_id) {
		super();
		this.mv_id = mv_id;
	}
	public MovieImageVO(String mv_title) {
		super();
		this.mv_title = mv_title;
	}
	
	public int getMv_id() {
		return mv_id;
	}
	public void setMv_id(int mv_id) {
		this.mv_id = mv_id;
	}
	public String getMv_title() {
		return mv_title;
	}
	public void setMv_title(String mv_title) {
		this.mv_title = mv_title;
	}
	public String getMv_img() {
		return mv_img;
	}
	public void setMv_img(String mv_img) {
		this.mv_img = mv_img;
	}
	
	
}
