package com.cbox.reservation.command;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;
import com.cbox.reservation.dao.UserReservDAO;
import com.cbox.reservation.vo.UserReservVO;

public class UserReservInfoAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		UserReservDAO dao = new UserReservDAO();
		UserReservVO vo = new UserReservVO();

		vo.setTc_num(request.getParameter("tc_no"));
		vo = dao.userReservOne(vo.getTc_num());
		request.setAttribute("infoData", vo);
		return "/jsp/user/reservation/UserReservInfo.jsp";
	}

}
