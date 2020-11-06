package com.cbox.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;
import com.cbox.member.dao.MemberDAO;
import com.cbox.member.vo.MemberVO;

public class idChkAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		
		int cnt = dao.idC(request.getParameter("mbr_id"));
		System.out.println("아이디체크 : " + cnt);
		if (cnt == 0) {
			
		}
		return "jsp/user/member/idChk.jsp";
	}
}
