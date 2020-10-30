package com.cbox.reservation.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;
import com.cbox.movie.dao.MovieDAO;
import com.cbox.movie.vo.MovieVO;

public class ReservationForm implements Action {
    //action servelt상속받음
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		MovieDAO dao = new MovieDAO();//DB 액세스 객체		
		List<MovieVO> list = new ArrayList<MovieVO>();
		
		list = dao.selectAll(); //moive 전체 조회 리스트
		request.setAttribute("movies", list); //list값들을 request속성값 movies로 지정
		return "jsp/user/reservation/reservationForm.jsp";
	}

}
