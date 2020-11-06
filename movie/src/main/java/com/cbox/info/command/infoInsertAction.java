package com.cbox.info.command;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;
import com.cbox.info.dao.infoDAO;
import com.cbox.info.vo.infoVO;

public class infoInsertAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//글추가
		infoDAO dao = new infoDAO();
		infoVO vo = new infoVO();
		
		
		vo.setInfo_Title(request.getParameter("info_Title"));
		vo.setInfo_Date(Date.valueOf(request.getParameter("info_Date")));
		vo.setInfo_Category(request.getParameter("info_Category"));
		vo.setInfo_Cont(request.getParameter("info_Cont"));
		

		dao.insert(vo);
		
		try {
			response.sendRedirect(request.getContextPath()+"/infoList.do");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

}
