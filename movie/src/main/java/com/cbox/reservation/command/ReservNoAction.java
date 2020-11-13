package com.cbox.reservation.command;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;
import com.cbox.reservation.vo.ReservNoVO;

public class ReservNoAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		Date d = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
		String no = "0";
		System.out.println(date.format(d)+"-"+no);
		ReservNoVO vo = new ReservNoVO() ;
		vo.setReservNo(date.format(d)+"-"+no);
		return null;
	}

}
