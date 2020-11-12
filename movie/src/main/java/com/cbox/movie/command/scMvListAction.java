package com.cbox.movie.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.cbox.common.Action;
import com.cbox.common.Paging;
import com.cbox.movie.dao.ScreenMvDAO;
import com.cbox.movie.vo.MovieSearchVO;
import com.cbox.movie.vo.ScreenMvVO;

public class scMvListAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		ScreenMvDAO dao = new ScreenMvDAO();
		List<ScreenMvVO> list = new ArrayList<ScreenMvVO>();

		MovieSearchVO searchVO = new MovieSearchVO();
		searchVO.setType(request.getParameter("searchType"));
		searchVO.setKeyword(request.getParameter("keyword"));

		list = dao.getScreenList(searchVO);

		try {
			response.getWriter().print(new JSONArray(list));
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}
}
