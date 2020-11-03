package com.cbox.member.command;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;
import com.cbox.member.dao.MemberDAO;
import com.cbox.member.vo.MemberVO;

public class memberUpdateAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		request.setCharacterEncoding("utf-8");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		
		vo.setMbr_pw(request.getParameter("mbr_pw")); // 여기 id는 form에서 설정해준 id
		vo.setMbr_email(request.getParameter("mbr_email"));
		vo.setMbr_phone(request.getParameter("mbr_phone"));
		vo.setMbr_e_yn(request.getParameter("mbr_e_yn"));
		int n = dao.update(vo);

		String page;
		if (n != 0) { // n이 0이면 입력실패. 0이 아니면 insert 성공.
			page = "jsp/member/memberInfo.jsp";
		} else {
			page = "jsp/member/insertFail.jsp";
		}
		// 입력 성공하든 실패하든 페이지로 넘겨준다
		return page;
	}

}
