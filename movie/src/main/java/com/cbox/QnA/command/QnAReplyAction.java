package com.cbox.QnA.command;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.QnA.dao.QnADAO;
import com.cbox.QnA.vo.QnAVO;
import com.cbox.common.Action;

public class QnAReplyAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		QnADAO dao = new QnADAO();
		QnAVO vo = new QnAVO();
		
		vo.setQa_no(Integer.parseInt(request.getParameter("qa_no")));
		vo.setQa_name(request.getParameter("qa_name"));
		vo.setQa_ad_comment(request.getParameter("qa_ad_comment"));
		
		
		dao.update(vo);
		
		
		try {
			response.sendRedirect(request.getContextPath()+"/QnAListForm.do");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

}
