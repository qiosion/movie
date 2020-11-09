package com.cbox.movie.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.cbox.common.Action;
import com.cbox.movie.dao.ScreenMvDAO;
import com.cbox.movie.vo.ScreenMvVO;

public class scMvDeleteAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		int ttNum = Integer.parseInt(request.getParameter("ttNum"));
		ScreenMvVO vo = new ScreenMvVO(ttNum);
		ScreenMvDAO dao = new ScreenMvDAO();
		dao.deleteScreenMv(vo);

		try {
			response.getWriter().print(new JSONObject(vo));
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}
}
