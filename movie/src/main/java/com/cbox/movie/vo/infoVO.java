package com.cbox.movie.vo;

import java.sql.Date;

public class infoVO {
	private int infoNum;
	private String infoTitle;
	private String infoCategory;
	private Date infoDate;
	private int infoChk;
	private String infoCont;
	
	public infoVO() {
		this.infoNum=infoNum;
	}

	public int getInfoNum() {
		return infoNum;
	}

	public void setInfoNum(int infoNum) {
		this.infoNum = infoNum;
	}

	public String getInfoTitle() {
		return infoTitle;
	}

	public void setInfoTitle(String infoTitle) {
		this.infoTitle = infoTitle;
	}

	public String getInfoCategory() {
		return infoCategory;
	}

	public void setInfoCategory(String infoCategory) {
		this.infoCategory = infoCategory;
	}

	public Date getInfoDate() {
		return infoDate;
	}

	public void setInfoDate(Date infoDate) {
		this.infoDate = infoDate;
	}

	public int getInfoChk() {
		return infoChk;
	}

	public void setInfoChk(int infoChk) {
		this.infoChk = infoChk;
	}

	public String getInfoCont() {
		return infoCont;
	}

	public void setInfoCont(String infoCont) {
		this.infoCont = infoCont;
	}
	
	
}



