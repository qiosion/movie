package com.cbox.member.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.cbox.common.Action;
import com.cbox.member.dao.MemberDAO;
import com.cbox.member.vo.MemberVO;

public class memberDeleteAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		
		HttpSession session = request.getSession();
		String sid = (String)session.getAttribute("mbr_id");
		vo.setMbr_id(sid); // 세션아이디를 vo에 담는다
		
		String spw = (String)session.getAttribute("mbr_pw"); // 세션 비밀번호
		String pwchk = request.getParameter("pwchk"); // 입력 비밀번호
		//String pwchk = (String) request.getAttribute("pwchk");
		if (pwchk == null || pwchk == "" ) {
			request.setAttribute("pwnull", "pw is null");
			try {
				response.sendRedirect("memberInfo.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else if (!spw.equals(pwchk)) {
			request.setAttribute("pwwrong", "pw is wrong");
			try {
				response.sendRedirect("memberInfo.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			dao.delete(vo);
			try {
				session.invalidate();
				response.sendRedirect("main.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
}
