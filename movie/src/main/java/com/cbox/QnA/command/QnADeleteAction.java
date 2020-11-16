package com.cbox.QnA.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.QnA.dao.QnADAO;
import com.cbox.QnA.vo.QnAVO;
import com.cbox.common.Action;

public class QnADeleteAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		QnADAO dao = new QnADAO();
		QnAVO vo = new QnAVO();
		
		vo.setQa_no(Integer.valueOf(request.getParameter("qa_no")));
		dao.delete(vo);
		
		 try {
				response.sendRedirect(request.getContextPath()+"/QnAListForm.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		return null;
	}

}
