package com.cbox.movie.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;
import com.cbox.movie.dao.MovieDAO;
import com.cbox.movie.vo.MovieVO;
import com.cbox.movie.vo.ReviewVO;

public class movieDetailAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		MovieDAO dao = new MovieDAO();
		MovieVO vo = new MovieVO();
		String seq = request.getParameter("seq");
		vo.setMvNum(Integer.parseInt(seq));	
		vo = dao.getMovieDetail(vo);
		request.setAttribute("vo", vo);
		
		List<ReviewVO> list = new ArrayList<ReviewVO>();
		dao = new MovieDAO();
		System.out.println("mvNum: " +vo.getMvNum());
		list = dao.getReviewDetail(vo);
		request.setAttribute("rvList", list);
		
		return "jsp/user/movie/movieDetail.jsp";
	}
}
