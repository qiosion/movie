package com.cbox.movie.vo;

import java.sql.Date;

public class MovieVO {

	private int mvNum; // 영화번호
	private String mvTitle; // 제목
	private String mvDiv; // 감독
	private String mvCom; // 배급사
	private String mvCha; // 등장인물
	private Date strdate; // 개봉일
	private Date findate; // 종료일
	private String mvSum; // 줄거리
	private String mvType; // 장르
	private String mvCont; // 설명
	private String mvPost; // 포스터 이미지
	private String mvImg; // 이미지
	private String mvTeaser; // 티저영상
	private int mvRank; // 평균 평점

	public MovieVO() {

	}

	
	public MovieVO(int mvNum, String mvTitle, String mvDiv, String mvCom, String mvCha, Date strdate, Date findate,
			String mvSum, String mvType, String mvCont, String mvImg, String mvTeaser, int mvRank) {
		super();
		this.mvNum = mvNum;
		this.mvTitle = mvTitle;
		this.mvDiv = mvDiv;
		this.mvCom = mvCom;
		this.mvCha = mvCha;
		this.strdate = strdate;
		this.findate = findate;
		this.mvSum = mvSum;
		this.mvType = mvType;
		this.mvCont = mvCont;
		this.mvImg = mvImg;
		this.mvTeaser = mvTeaser;
		this.mvRank = mvRank;
	}


	public int getMvNum() {
		return mvNum;
	}

	public void setMvNum(int mvNum) {
		this.mvNum = mvNum;
	}

	public String getMvTitle() {
		return mvTitle;
	}

	public void setMvTitle(String mvTitle) {
		this.mvTitle = mvTitle;
	}

	public String getMvDiv() {
		return mvDiv;
	}

	public void setMvDiv(String mvDiv) {
		this.mvDiv = mvDiv;
	}

	public String getMvCom() {
		return mvCom;
	}

	public void setMvCom(String mvCom) {
		this.mvCom = mvCom;
	}

	public String getMvCha() {
		return mvCha;
	}

	public void setMvCha(String mvCha) {
		this.mvCha = mvCha;
	}

	public Date getStrdate() {
		return strdate;
	}

	public void setStrdate(Date strdate) {
		this.strdate = strdate;
	}

	public Date getFindate() {
		return findate;
	}

	public void setFindate(Date findate) {
		this.findate = findate;
	}

	public String getMvSum() {
		return mvSum;
	}

	public void setMvSum(String mvSum) {
		this.mvSum = mvSum;
	}

	public String getMvType() {
		return mvType;
	}

	public void setMvType(String mvType) {
		this.mvType = mvType;
	}

	public String getMvCont() {
		return mvCont;
	}

	public void setMvCont(String mvCont) {
		this.mvCont = mvCont;
	}

	public String getMvPost() {
		return mvPost;
	}

	public void setMvPost(String mvPost) {
		this.mvPost = mvPost;
	}

	public String getMvImg() {
		return mvImg;
	}

	public void setMvImg(String mvImg) {
		this.mvImg = mvImg;
	}

	public String getMvTeaser() {
		return mvTeaser;
	}

	public void setMvTeaser(String mvTeaser) {
		this.mvTeaser = mvTeaser;
	}

	public int getMvRank() {
		return mvRank;
	}

	public void setMvRank(int mvRank) {
		this.mvRank = mvRank;
	}
}
