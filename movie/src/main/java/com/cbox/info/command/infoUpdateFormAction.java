package com.cbox.info.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;
import com.cbox.info.dao.infoDAO;
import com.cbox.info.vo.infoVO;

public class infoUpdateFormAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 수정페이지로 이동
		
		infoDAO dao = new infoDAO();
		infoVO vo = new infoVO();
	
		vo.setInfo_Num(Integer.valueOf(request.getParameter("info_Num")));
		
		vo = dao.select(vo);
		

		request.setAttribute("vo", vo);
		
		return "jsp/admin/info/DetailViewUpdate.jsp";
	}

}
