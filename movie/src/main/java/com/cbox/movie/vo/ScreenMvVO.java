package com.cbox.movie.vo;

public class ScreenMvVO {
	private int ttNum; // 상영 번호
	private int mvNum; // 영화 번호 FK
	private int thNum; // 상영관 번호 FK
	private String ttScrDate; // 상영일
	private String ttStart; // 상영 시작 시간
	private String ttEnd; // 상영 종료 시간
	
	private String mvTitle;	// 영화 제목
	private String thName;	// 상영관명

	public int getTtNum() {
		return ttNum;
	}

	public void setTtNum(int ttNum) {
		this.ttNum = ttNum;
	}

	public int getMvNum() {
		return mvNum;
	}

	public void setMvNum(int mvNum) {
		this.mvNum = mvNum;
	}

	public int getThNum() {
		return thNum;
	}

	public void setThNum(int thNum) {
		this.thNum = thNum;
	}

	public String getTtScrDate() {
		return ttScrDate;
	}

	public void setTtScrDate(String ttScrDate) {
		this.ttScrDate = ttScrDate;
	}

	public String getTtStart() {
		return ttStart;
	}

	public void setTtStart(String ttStart) {
		this.ttStart = ttStart;
	}

	public String getTtEnd() {
		return ttEnd;
	}

	public void setTtEnd(String ttEnd) {
		this.ttEnd = ttEnd;
	}

	public String getMvTitle() {
		return mvTitle;
	}

	public void setMvTitle(String mvTitle) {
		this.mvTitle = mvTitle;
	}

	public String getThName() {
		return thName;
	}

	public void setThName(String thName) {
		this.thName = thName;
	}

}
