package com.cbox.reservation.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.cbox.common.Action;
import com.cbox.reservation.dao.MovieReservationDAO;
import com.cbox.reservation.vo.ReservSeatSearchDTO;

public class ReservSeatSearchAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String EmSeatMv = request.getParameter("EmSeatMv");
		String EmDate = request.getParameter("EmDate");
		String EmStart = request.getParameter("EmStart");
		String EmEnd = request.getParameter("EmEnd");
		int EmThNum = Integer.parseInt(request.getParameter("EmThNum"));
		
		MovieReservationDAO dao = new MovieReservationDAO();
		ReservSeatSearchDTO dto = new ReservSeatSearchDTO();
		dto.setEmSeatMv(EmSeatMv);
		dto.setEmDate(EmDate);
		dto.setEmStart(EmStart);
		dto.setEmEnd(EmEnd);
		dto.setEmThNum(EmThNum);
		List<ReservSeatSearchDTO> list = new ArrayList<>();
		list = dao.selectReservSeat(dto);
		
		
		try {
			response.getWriter().print(new JSONArray(list));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
