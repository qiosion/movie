package com.cbox.movie.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.cbox.common.Action;
import com.cbox.movie.dao.MovieDAO;
import com.cbox.movie.vo.MovieSearchVO;
import com.cbox.movie.vo.MovieVO;

public class movieListAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		MovieDAO dao = new MovieDAO();
		List<MovieVO> list = new ArrayList<MovieVO>();

		MovieSearchVO searchVO = new MovieSearchVO();
		searchVO.setType(request.getParameter("searchType"));
		searchVO.setKeyword(request.getParameter("keyword"));

		list = dao.selectAll(searchVO);
		
//		request.setAttribute("movies", list);
		try {
			response.getWriter().print(new JSONArray(list));
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}
}