package com.cbox.reservation.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;
import com.cbox.reservation.dao.UserReservDAO;

public class ReservDeleteAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String ReservNo = request.getParameter("ReservNo");
		
		UserReservDAO dao = new UserReservDAO();
		dao.reservDelete(ReservNo);
		
		return null;
	}

}
