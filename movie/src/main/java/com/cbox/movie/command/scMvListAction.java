package com.cbox.movie.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.cbox.common.Action;
import com.cbox.movie.dao.ScreenMvDAO;
import com.cbox.movie.vo.ScreenMvVO;

public class scMvListAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		List<ScreenMvVO> list = new ArrayList<ScreenMvVO>();
		ScreenMvDAO dao = new ScreenMvDAO();
		
		list = dao.getScreenList();
//		request.setAttribute("screenList", list);
		
		try {
			response.getWriter().print(new JSONArray(list));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
