package com.cbox.info.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;
import com.cbox.info.dao.infoDAO;
import com.cbox.info.vo.infoVO;

public class DetailViewAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 게시판 내용보기
		infoDAO dao = new infoDAO();
		
		
		
		List<infoVO> list = new ArrayList<infoVO>();
		
		list = dao.selectAll();
		request.setAttribute("detail", list);
		return "jsp/user/info/DetailView.jsp";
	}

}
