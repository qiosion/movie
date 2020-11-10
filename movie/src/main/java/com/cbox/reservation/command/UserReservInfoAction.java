package com.cbox.reservation.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.cbox.common.Action;
import com.cbox.reservation.dao.UserReservDAO;
import com.cbox.reservation.vo.UserReservVO;

public class UserReservInfoAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		UserReservDAO dao = new UserReservDAO();
		UserReservVO vo = new UserReservVO();

		System.out.println("확인 : "+request.getParameter("tc_no"));
		
		vo.setTc_num(Integer.parseInt(request.getParameter("tc_no")));
		System.out.println(">> "+vo.getTc_num());
		vo = dao.userReservOne(vo.getTc_num());
		request.setAttribute("vo", vo);
		return "/jsp/user/reservation/UserReservInfo.jsp";
	}

}
