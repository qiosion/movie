package com.cbox.movie.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;
import com.cbox.movie.dao.MovieDAO;
import com.cbox.movie.dao.ScreenMvDAO;
import com.cbox.movie.vo.MovieVO;

public class mvDeleteAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		MovieDAO dao = new MovieDAO();
		MovieVO vo = new MovieVO();

		vo.setMvNum(Integer.parseInt(request.getParameter("mvNum")));
		// 삭제하기 전에 해당 영화에 배정된 상영 시간이 있는지 확인
		ScreenMvDAO scdao = new ScreenMvDAO();
		String result = scdao.regiChk(vo);

		if (result.equals("N")) {
			dao.movieDelete(vo);
			try {
				response.getWriter().print("{\"result\":true}");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			// 삭제할 수 없다.
			try {
				response.getWriter().print("{\"result\":false}");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return null;
	}

}
