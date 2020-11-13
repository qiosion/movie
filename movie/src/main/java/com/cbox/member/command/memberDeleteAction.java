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
		String pchk = request.getParameter("pchk"); // 입력 비밀번호
		//String pchk = (String) request.getAttribute("pwchk");
		if (pchk == null || pchk == "" ) {
			request.setAttribute("pwnull", "pw is null");
			try {
				PrintWriter out = response.getWriter();
				out.println("<script>alert('비밀번호를 입력하세요');</script>");
				out.println("<script>location.href='memberInfo.do';</script>");
				//response.sendRedirect("memberInfo.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else if (!spw.equals(pchk)) {
			request.setAttribute("pwwrong", "pw is wrong");
			try {
				PrintWriter out = response.getWriter();
				out.println("<script>alert('비밀번호가 틀렸습니다');</script>");
				out.println("<script>location.href='memberInfo.do';</script>");
				//response.sendRedirect("memberInfo.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			dao.delete(vo);
			try {
				session.invalidate();
				PrintWriter out = response.getWriter();
				out.println("<script>alert('탈퇴되었습니다');</script>");
				out.println("<script>location.href='main.do';</script>");
				//response.sendRedirect("main.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
}
