package com.cbox.reservation.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;
import com.cbox.reservation.dao.UserReservDAO;
import com.cbox.reservation.vo.UserReservVO;

public class ShowReservInfoAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// dao랑 vo
		UserReservDAO dao = new UserReservDAO();
		UserReservVO vo = new UserReservVO();
		String tcN = request.getParameter("tc_num");
		vo.setTc_num(Integer.parseInt(tcN));
		//vo = 
		return null;
	}

}
