package com.cbox.reservation.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;

public class mvFindDateAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String mvid = request.getParameter("param_id");
		
		//해당 영화 id값에 해당하는 상영일자를 가지고온다.
		
		return null;
	}

}
