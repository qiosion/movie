package com.cbox.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cbox.common.Action;
import com.cbox.member.dao.MemberDAO;
import com.cbox.member.vo.MemberVO;

public class loginAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
										   
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		
		HttpSession session = request.getSession(false);
		
		vo.setMbr_id(request.getParameter("mbr_id"));
		vo.setMbr_pw(request.getParameter("mbr_pw"));
		vo = dao.select(vo);
  
		session.setAttribute("mbr_id", vo.getMbr_id());
		session.setAttribute("mbr_pw", vo.getMbr_pw());
		session.setAttribute("mbr_author", vo.getMbr_author());
		
		request.setAttribute("vo", vo);
		return "main.jsp";
	}
}