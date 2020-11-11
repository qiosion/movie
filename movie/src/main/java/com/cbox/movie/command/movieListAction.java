package com.cbox.movie.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;
import com.cbox.movie.dao.MovieDAO;
import com.cbox.movie.vo.MovieSearchVO;
import com.cbox.movie.vo.MovieVO;

public class movieListAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("movieListAction");
		MovieDAO dao = new MovieDAO();
		List<MovieVO> list = new ArrayList<MovieVO>();
		
		MovieSearchVO searchVO = new MovieSearchVO();
		searchVO.setType(request.getParameter("searchType"));
		searchVO.setKeyword(request.getParameter("keyword"));
		
		list = dao.selectAll(searchVO);
		request.setAttribute("movies", list);

		return "jsp/user/movie/movieList.jsp";
	}
}