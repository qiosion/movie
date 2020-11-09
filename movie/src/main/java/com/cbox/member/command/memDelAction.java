package com.cbox.member.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;
import com.cbox.member.dao.MemberDAO;
import com.cbox.member.vo.MemberVO;

public class memDelAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		
		String user = request.getParameter("hdn");
		vo.setMbr_id(user);
		dao.delete(vo);
		try {
			response.sendRedirect("memberList.do");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

}
