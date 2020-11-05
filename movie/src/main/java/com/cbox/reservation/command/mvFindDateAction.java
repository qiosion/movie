package com.cbox.reservation.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.cbox.common.Action;
import com.cbox.reservation.dao.MovieReservationDAO;
import com.cbox.reservation.vo.mvFindDateVO;

public class mvFindDateAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//해당 영화 id값에 해당하는 상영일자를 가지고 오는 페이지.
			
		int mvid = Integer.parseInt(request.getParameter("m_id")); // 예매하고싶은 영화 id값 받아온다.
		mvFindDateVO vo = new mvFindDateVO(mvid);
		List<mvFindDateVO> list = new ArrayList<>();
		MovieReservationDAO dao = new MovieReservationDAO();
		list = dao.selectMvDate(vo);
		
		
		
		try {
			response.getWriter().print(new JSONArray(list)); //ajax 에 결과값 떤져준다.
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return null;
	}

}
