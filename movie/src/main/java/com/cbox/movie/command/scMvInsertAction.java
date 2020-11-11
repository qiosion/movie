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
		ScreenMvVO vo = new ScreenMvVO();
		vo.setMvNum(Integer.parseInt(request.getParameter("mvNum")));
		vo.setTtScrDate(request.getParameter("ttScrDate"));
		vo.setTtStart(request.getParameter("ttStart"));
		vo.setTtEnd(request.getParameter("ttEnd"));
		vo.setThNum(Integer.parseInt(request.getParameter("thNum")));

		// 영화 -> 날짜 -> 시간(상영관)이 모두 같은 데이터가 없는지 확인하기
		// 있으면 중복이라 등록 불가
		ScreenMvDAO dao = new ScreenMvDAO();
		String result = dao.checkDupl(vo);
		
		if(result.equals("N")) {
			dao = new ScreenMvDAO();
			dao.insertScreenMv(vo);
			try {
				response.getWriter().print("{\"result\":true}");
//				response.getWriter().print(new JSONObject(vo));
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			// 등록할 수 없다.
			try {
				response.getWriter().print("{\"result\":false}");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return null;
	}
}
