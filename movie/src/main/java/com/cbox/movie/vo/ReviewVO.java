package com.cbox.movie.vo;

import java.sql.Date;

public class ReviewVO {
	private int rvNum;
	private double rvRank;
	private String rvCont;
	private Date rvDate;
	
	private int mvNum;
	private int mbrNum;
	
	private String mvTitle;
	private String mbrId;
	
	public ReviewVO() {
		
	}
	
	public int getRvNum() {
		return rvNum;
	}
	public void setRvNum(int rvNum) {
		this.rvNum = rvNum;
	}
	public double getRvRank() {
		return rvRank;
	}
	public void setRvRank(double rvRank) {
		this.rvRank = rvRank;
	}
	public String getRvCont() {
		return rvCont;
	}
	public void setRvCont(String rvCont) {
		this.rvCont = rvCont;
	}
	public Date getRvDate() {
		return rvDate;
	}
	public void setRvDate(Date rvDate) {
		this.rvDate = rvDate;
	}
	public int getMvNum() {
		return mvNum;
	}
	public void setMvNum(int mvNum) {
		this.mvNum = mvNum;
	}
	public int getMbrNum() {
		return mbrNum;
	}
	public void setMbrNum(int mbrNum) {
		this.mbrNum = mbrNum;
	}
	public String getMvTitle() {
		return mvTitle;
	}
	public void setMvTitle(String mvTitle) {
		this.mvTitle = mvTitle;
	}
	public String getMbrId() {
		return mbrId;
	}
	public void setMbrId(String mbrId) {
		this.mbrId = mbrId;
	}
}
