package com.cbox.reservation.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.cbox.common.Action;
import com.cbox.reservation.dao.MovieReservationDAO;
import com.cbox.reservation.vo.ReservInsertDTO;

public class ReservInsertAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
			String ReservNo = request.getParameter("ReservNo");
			int ttNum = Integer.parseInt(request.getParameter("ttNum"));
			int MemberNo = Integer.parseInt(request.getParameter("MemberNo"));
			String payMethod = request.getParameter("payMethod");
			String ReservDay = request.getParameter("ReservDay");
			int ReservNum = Integer.parseInt(request.getParameter("ReservNum"));
			String ReservMvSeat = request.getParameter("ReservMvSeat");
			int ReservPrice = Integer.parseInt(request.getParameter("ReservPrice"));
			
			//받아온 파라미터값 DTO에 담기
			ReservInsertDTO dto = new ReservInsertDTO();
			dto.setReservNo(ReservNo);
			dto.setTtNum(ttNum);
			dto.setMemberNo(MemberNo);
			dto.setPayMethod(payMethod);
			dto.setReservDay(ReservDay);
			dto.setReservNum(ReservNum);
			dto.setReservMvSeat(ReservMvSeat);
			dto.setReservPrice(ReservPrice);
			
			//등록처리
			MovieReservationDAO dao = new MovieReservationDAO();
			dao.insertMvReserv(dto);
			
			try {
				response.getWriter().print(new JSONObject(dto));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return null;
	}

}
