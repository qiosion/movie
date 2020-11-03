package com.cbox.movie.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;
import com.cbox.movie.dao.MovieDAO;
import com.cbox.movie.vo.MovieSearchVO;
import com.cbox.movie.vo.MovieVO;

public class movieExpectListAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		MovieDAO dao = new MovieDAO();
		List<MovieVO> list = new ArrayList<MovieVO>();	// 상영 예정작
		
		MovieSearchVO searchVO = new MovieSearchVO();
		searchVO.setType(request.getParameter("searchType"));
		searchVO.setKeyword(request.getParameter("keyword"));
		
		list = dao.selectExpect(searchVO);
		request.setAttribute("exMovies", list);
		return "jsp/user/movie/listTab2.jsp";
	}

}