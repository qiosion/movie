package com.cbox.info.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;
import com.cbox.info.dao.infoDAO;
import com.cbox.info.vo.infoVO;

public class infoDeleteAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 
		infoDAO dao = new infoDAO();
		infoVO vo = new infoVO();
	
		vo.setInfo_Num(Integer.valueOf(request.getParameter("info_Num")));
		
		
		
		request.setAttribute("vo", vo);
		
		
		
		return null;
	}

}
