package com.cbox.QnA.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.QnA.dao.QnADAO;
import com.cbox.QnA.vo.QnAVO;
import com.cbox.common.Action;

public class QnAReplyFormAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		QnADAO dao = new QnADAO();
		QnAVO vo = new QnAVO();
		
		vo.setQa_no(Integer.valueOf(request.getParameter("qa_no")));
		
		vo = dao.select(vo);
		
		request.setAttribute("vo", vo);
		
		
		return "jsp/user/QnA/QnAReplyForm.jsp";
	}

}
