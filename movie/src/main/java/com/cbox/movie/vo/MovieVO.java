package com.cbox.movie.vo;

import java.sql.Date;

public class MovieVO {

	private int mvNum; // 영화번호
	private String mvTitle; // 제목
	private String mvDir; // 감독
	private String mvCha; // 등장인물
	private Date strdate; // 개봉일
	private Date findate; // 종료일
	private String mvSum; // 줄거리
	private String mvType; // 장르
	private String mvCont; // 설명
	private String mvImg; // 이미지
	private String mvTeaser; // 티저영상
	private Double mvRank; // 평균 평점
	private String mvPost; // 포스터 이미지
	private String mvAge;	// 관람연령
	
	private int rowNum;

	private Integer first;
	private Integer last;

	public MovieVO() {

	}

	public MovieVO(int mvNum, String mvTitle, String mvDir, String mvCha, Date strdate, Date findate,
			String mvSum, String mvType, String mvCont, String mvImg, String mvTeaser, Double mvRank, String mvAge) {
		super();
		this.mvNum = mvNum;
		this.mvTitle = mvTitle;
		this.mvDir = mvDir;
		this.mvCha = mvCha;
		this.strdate = strdate;
		this.findate = findate;
		this.mvSum = mvSum;
		this.mvType = mvType;
		this.mvCont = mvCont;
		this.mvImg = mvImg;
		this.mvTeaser = mvTeaser;
		this.mvRank = mvRank;
		this.mvAge = mvAge;
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
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

	public String getMvDir() {
		return mvDir;
	}

	public void setMvDir(String mvDir) {
		this.mvDir = mvDir;
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

	public Double getMvRank() {
		return mvRank;
	}

	public void setMvRank(Double mvRank) {
		this.mvRank = mvRank;
	}

	public Integer getFirst() {
		return first;
	}

	public void setFirst(Integer first) {
		this.first = first;
	}

	public Integer getLast() {
		return last;
	}

	public void setLast(Integer last) {
		this.last = last;
	}

	public String getMvAge() {
		return mvAge;
	}

	public void setMvAge(String mvAge) {
		this.mvAge = mvAge;
	}
}
