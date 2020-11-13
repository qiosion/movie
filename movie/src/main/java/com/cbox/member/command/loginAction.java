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
		int check = dao.loginCheck(vo);
		String msg;
		
		if(check == 1) { // 로그인 성공
			// 세션에 현재 아이디 세팅
            dao = new MemberDAO();
            vo = dao.login(vo);
		
            session.setAttribute("mbr_id", vo.getMbr_id());
            session.setAttribute("mbr_nm", vo.getMbr_nm());
            session.setAttribute("mbr_pw", vo.getMbr_pw());
            session.setAttribute("mbr_no", vo.getMbr_no());
            session.setAttribute("mbr_author", vo.getMbr_author());
            request.setAttribute("vo", vo);
            msg = "main.jsp";
        } else if(check == 0) { // 비밀번호가 틀릴경우
        	msg = "loginForm.do?msg=0";
        } else { // 아이디가 틀릴경우
        	msg = "loginForm.do?msg=-1";
        }
		return msg;
	}
}