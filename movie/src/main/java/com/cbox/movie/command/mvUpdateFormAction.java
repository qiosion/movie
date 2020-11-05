package com.cbox.movie.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;
import com.cbox.movie.dao.MovieDAO;
import com.cbox.movie.vo.MovieVO;

public class mvUpdateFormAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("mvUpdateAction");
		MovieDAO dao = new MovieDAO();
		MovieVO vo = new MovieVO();
		String seq = request.getParameter("seq");
		vo.setMvNum(Integer.parseInt(seq));	
		
		vo = dao.getMovieDetail(vo);
		request.setAttribute("vo", vo);
		return "jsp/admin/movie/movieUpdate.jsp";
	}
}
