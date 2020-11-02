package com.cbox.info.command;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;
import com.cbox.info.dao.infoDAO;
import com.cbox.info.vo.infoVO;

public class infoInsertAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		infoDAO dao = new infoDAO();
		infoVO vo = new infoVO();
		
		vo.setInfo_Num(Integer.valueOf(request.getParameter("info_Num")));
		vo.setInfo_Title(request.getParameter("info_Title"));
		vo.setInfo_Category(request.getParameter("info_Category"));
		vo.setInfo_Cont(request.getParameter("info_Cont"));
		vo.setInfo_Date(Date.valueOf(request.getParameter("info_Date")));
		
		
		int n = dao.insert(vo);
		
		return null;
	}

}
