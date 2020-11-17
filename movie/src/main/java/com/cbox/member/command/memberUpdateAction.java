package com.cbox.member.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cbox.common.Action;
import com.cbox.member.dao.MemberDAO;
import com.cbox.member.vo.MemberVO;

public class memberUpdateAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		String sid = (String) session.getAttribute("mbr_id");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		
		vo.setMbr_id(sid);
		vo.setMbr_pw(request.getParameter("mbr_pw"));
		vo.setMbr_email(request.getParameter("mbr_email"));
		vo.setMbr_phone(request.getParameter("mbr_phone"));
		vo.setMbr_e_yn(request.getParameter("mbr_e_yn"));
		int n = dao.update(vo);

		if (n != 0) { // n이 0이면 입력실패. 0이 아니면 insert 성공.
			try {
				PrintWriter out = response.getWriter();
				out.println("<script>alert('수정되었습니다');</script>");
				out.println("<script>location.href='memberInfo.do';</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				PrintWriter out = response.getWriter();
				out.println("<script>alert('수정에 실패하였습니다');</script>");
				out.println("<script>location.href='memberInfo.do';</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

}
