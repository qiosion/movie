package com.cbox.member.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;
import com.cbox.member.dao.MemberDAO;
import com.cbox.member.vo.MemberVO;

public class memberInsertAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		
		vo.setMbr_id(request.getParameter("mbr_id"));
		vo.setMbr_pw(request.getParameter("mbr_pw"));
		vo.setMbr_nm(request.getParameter("mbr_nm"));
		vo.setMbr_birth(Date.valueOf(request.getParameter("mbr_birth")));
		vo.setMbr_phone(request.getParameter("mbr_phone"));
		vo.setMbr_email(request.getParameter("mbr_email"));
		vo.setMbr_e_yn(request.getParameter("mbr_e_yn"));
		System.out.println(request.getParameter("mbr_e_yn"));
		int n = dao.insert(vo);
		
		String page;
		if (n != 0) { // n이 0이 아니면 성공
			page = "main.jsp";
		} else { // n이 0이면 실패
			page = "jsp/user/member/memberForm.jsp";
//			response.setContentType("text/html; charset=UTF-8");
//			PrintWriter out;
//			try {
//				out = response.getWriter(); // 이걸 왜.. try - catch 해줘야하지
//				out.println("<script>alert('회원가입에 실패하였습니다');");
//				out.flush();
//			} catch (IOException e) {
//				e.printStackTrace();
//			} 
		}
		return page;
	}
}
