package com.cbox.reservation.command;

import java.io.IOException;

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

		System.out.println("확인");
		//String tcn = (String) request.getAttribute("tcNum");
		//int tcn = Integer.parseInt((String) request.getAttribute("tc_no"));
		
		// vo.setTc_num(Integer.parseInt(request.getAttribute("tc_no")));
		try {
			response.getWriter().print("{\"result\":true}");
		} catch (IOException e) {
			e.printStackTrace();
		}
		// System.out.println("tcn 제발" + tcn);
		//vo = dao.userReservOne(tcn);
		//request.setAttribute("showReserv", vo);
		return null; // "jsp/user/reservation/UserReservList.jsp";
	}

}
