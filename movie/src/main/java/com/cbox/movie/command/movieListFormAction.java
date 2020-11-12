package com.cbox.movie.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;
import com.cbox.movie.dao.MovieDAO;
import com.cbox.movie.vo.MovieSearchVO;
import com.cbox.movie.vo.MovieVO;

public class movieListFormAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("movieListFormAction");

		return "jsp/user/movie/movieList.jsp";
	}

}
