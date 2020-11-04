package com.cbox.info.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cbox.common.Action;
import com.cbox.info.dao.infoDAO;
import com.cbox.info.vo.infoVO;

public class DetailViewAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 게시판 내용보기
		infoDAO dao = new infoDAO();
		infoVO vo = new infoVO();
	
		vo.setInfo_Num(Integer.valueOf(request.getParameter("info_Num")));
		
		vo = dao.select(vo);

		request.setAttribute("vo", vo);
		return "jsp/user/info/DetailView.jsp";
	}

}
