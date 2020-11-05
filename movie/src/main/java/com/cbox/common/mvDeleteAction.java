package com.cbox.common;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.movie.vo.MovieVO;

import com.cbox.movie.dao.MovieDAO;

public class mvDeleteAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		MovieDAO dao = new MovieDAO();
		MovieVO vo = new MovieVO();

		System.out.println("삭제할 번호 : " + request.getParameter("mvNum"));
		vo.setMvNum(Integer.parseInt(request.getParameter("mvNum")));
		dao.movieDelete(vo);
		
		try {
			response.sendRedirect("mvList.do");
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}

}