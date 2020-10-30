package com.cbox.common;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.movie.dao.MovieDAO;
import com.cbox.movie.vo.MovieVO;

public class movieListAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		MovieDAO dao = new MovieDAO();
		List<MovieVO> list = new ArrayList<MovieVO>();
		list = dao.selectAll();
		request.setAttribute("movies", list);

		return "jsp/user/movie/movieList.jsp";
	}
}