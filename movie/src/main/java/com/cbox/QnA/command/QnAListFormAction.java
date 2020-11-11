package com.cbox.QnA.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.QnA.dao.QnADAO;
import com.cbox.QnA.vo.QnAVO;
import com.cbox.common.Action;

public class QnAListFormAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		QnADAO dao = new QnADAO();
		List<QnAVO> list = new ArrayList<QnAVO>(); 
		
		list = dao.selectAll();
		request.setAttribute("qnaList", list);
		return "jsp/user/QnA/QnAList.jsp";
	}

}
