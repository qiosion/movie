package com.cbox.reservation.vo;

public class ReservInsertDTO {
	String ReservNo; //예매번호
	int ttNum; //상영번호
	int MemberNo; //회원번호
	String payMethod; //결제방법
	String ReservDay; //예매일시
	int ReservNum; //예매인원
	String ReservMvSeat; //예매좌석번호
	int ReservPrice; //예매가격
	
	
	public ReservInsertDTO() {}


	public ReservInsertDTO(String reservNo, int ttNum, int memberNo, String payMethod, String reservDay, int reservNum,
			String reservMvSeat, int reservPrice) {
		super();
		ReservNo = reservNo;
		this.ttNum = ttNum;
		MemberNo = memberNo;
		this.payMethod = payMethod;
		ReservDay = reservDay;
		ReservNum = reservNum;
		ReservMvSeat = reservMvSeat;
		ReservPrice = reservPrice;
	}


	public String getReservNo() {
		return ReservNo;
	}


	public void setReservNo(String reservNo) {
		ReservNo = reservNo;
	}


	public int getTtNum() {
		return ttNum;
	}


	public void setTtNum(int ttNum) {
		this.ttNum = ttNum;
	}


	public int getMemberNo() {
		return MemberNo;
	}


	public void setMemberNo(int memberNo) {
		MemberNo = memberNo;
	}


	public String getPayMethod() {
		return payMethod;
	}


	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}


	public String getReservDay() {
		return ReservDay;
	}


	public void setReservDay(String reservDay) {
		ReservDay = reservDay;
	}


	public int getReservNum() {
		return ReservNum;
	}


	public void setReservNum(int reservNum) {
		ReservNum = reservNum;
	}


	public String getReservMvSeat() {
		return ReservMvSeat;
	}


	public void setReservMvSeat(String reservMvSeat) {
		ReservMvSeat = reservMvSeat;
	}


	public int getReservPrice() {
		return ReservPrice;
	}


	public void setReservPrice(int reservPrice) {
		ReservPrice = reservPrice;
	}
	
	
	
	
}
