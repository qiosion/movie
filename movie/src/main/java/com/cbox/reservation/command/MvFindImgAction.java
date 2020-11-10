package com.cbox.reservation.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.cbox.common.Action;
import com.cbox.reservation.dao.MovieReservationDAO;
import com.cbox.reservation.vo.MvFindImgDTO;

public class MvFindImgAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		int mv_num = Integer.parseInt(request.getParameter("m_id"));//m_id 값맞음.
		MvFindImgDTO dto = new MvFindImgDTO();
		dto.setMv_num(mv_num);
		
		MovieReservationDAO dao = new MovieReservationDAO();
		List<MvFindImgDTO> list = new ArrayList<>();
		list = dao.selectMvImg(dto);
		
		try {
			response.getWriter().print(new JSONArray(list));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
