package com.cbox.reservation.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;

public class ReservInsertAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
			String id = request.getParameter("ReservNo");
		
		
		return null;
	}

}
