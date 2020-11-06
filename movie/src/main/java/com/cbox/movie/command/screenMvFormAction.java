package com.cbox.movie.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;
import com.cbox.movie.dao.MovieDAO;
import com.cbox.movie.dao.ScreenMvDAO;
import com.cbox.movie.vo.MovieVO;
import com.cbox.movie.vo.TheaterVO;

public class screenMvFormAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		List<MovieVO> mvList = new ArrayList<MovieVO>();
		ScreenMvDAO dao = new ScreenMvDAO();
		
		System.out.println("screenMvFormAction");
		mvList = dao.selectIng();
		request.setAttribute("mvList", mvList);
		
		List<TheaterVO> thList = new ArrayList<TheaterVO>();
		dao = new ScreenMvDAO();
		thList = dao.selectTheater();
		request.setAttribute("thList", thList);
		
		
		return "jsp/admin/screenMv/screenMvList.jsp";
	}

}
