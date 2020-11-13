package com.cbox.QnA.command;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.QnA.dao.QnADAO;
import com.cbox.QnA.vo.QnAVO;
import com.cbox.common.Action;

public class QnAInsertAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		QnADAO dao = new QnADAO();
		QnAVO vo = new QnAVO();
		
		vo.setQa_title(request.getParameter("qa_title"));
		vo.setQa_type(request.getParameter("qa_type"));
		vo.setQa_name(request.getParameter("qa_name"));
		vo.setQa_date(Date.valueOf(request.getParameter("qa_date")));
		vo.setQa_cont(request.getParameter("qa_cont"));
		
		dao.insert(vo);
		
		try {
			response.sendRedirect(request.getContextPath()+"/QnAListForm.do");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

}
