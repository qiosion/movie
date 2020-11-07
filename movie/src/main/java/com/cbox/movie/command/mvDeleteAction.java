package com.cbox.movie.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.movie.vo.MovieVO;
import com.cbox.common.Action;
import com.cbox.movie.dao.MovieDAO;

public class mvDeleteAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		MovieDAO dao = new MovieDAO();
		MovieVO vo = new MovieVO();

		vo.setMvNum(Integer.parseInt(request.getParameter("mvNum")));
		dao.movieDelete(vo);

		try {
			response.getWriter().print("{\"result\":true}");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}

}