package com.cbox.movie.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.cbox.common.Action;
import com.cbox.movie.dao.ScreenMvDAO;
import com.cbox.movie.vo.ScreenMvVO;

public class scMvInsertAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("scMvInsertAction");
		ScreenMvVO vo = new ScreenMvVO();
		System.out.println("1: "+request.getParameter("mvNum"));
		System.out.println("2: "+request.getParameter("ttScrDate"));
		System.out.println("3: "+request.getParameter("ttStart"));
		System.out.println("4: "+request.getParameter("ttEnd"));
		System.out.println("5: "+request.getParameter("thNum"));
		vo.setMvNum(Integer.parseInt(request.getParameter("mvNum")));
		vo.setTtScrDate(request.getParameter("ttScrDate"));
		vo.setTtStart(request.getParameter("ttStart"));
		vo.setTtEnd(request.getParameter("ttEnd"));
		vo.setThNum(Integer.parseInt(request.getParameter("thNum")));

		ScreenMvDAO dao = new ScreenMvDAO();
		dao.insertScreenMv(vo);

		try {
			response.getWriter().print(new JSONObject(vo));
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}
}
