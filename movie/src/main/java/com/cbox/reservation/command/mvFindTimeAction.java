package com.cbox.reservation.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.cbox.common.Action;
import com.cbox.reservation.dao.MovieReservationDAO;
import com.cbox.reservation.vo.MvFindDateDTO;

public class mvFindTimeAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//쿼리조회할 파라미터 값 받아오고
		int m_id = Integer.parseInt(request.getParameter("m_id"));
		String m_date = request.getParameter("m_date");
		MovieReservationDAO dao = new MovieReservationDAO();
		//System.out.println(id+" "+ date); //예매하려는 영화의 영화번호, 예매 날짜가 넘어온다.
		//받아온 파라미터값 dto 에 저장.
		MvFindDateDTO dto = new MvFindDateDTO();
		dto.setM_id(m_id);
		dto.setM_date(m_date);
		
		List<MvFindDateDTO> list = new ArrayList<>(); //한행에 여러값이 들어갈경우 list 생성
		list = dao.selectMvTime(dto);
		
		
		
		
		try {
			response.getWriter().print(new JSONArray(list));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
