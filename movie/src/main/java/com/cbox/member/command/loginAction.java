package com.cbox.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;
import com.cbox.member.dao.MemberDAO;
import com.cbox.member.vo.MemberVO;

public class loginAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		
		vo.setMbr_id(request.getParameter("mbr_id"));
		vo.setMbr_pw(request.getParameter("mbr_pw"));
		vo = dao.select(vo);
		request.setAttribute("vo", vo);
		return "main.jsp";
	}

}
